 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Read responsible:
48   3    atomic read     acquire  head($)->next   0xdeadbeef          ?   ([ 0, 0], [ 0, 6], [32,32], [42 ,22])
count  ([ 0, 0], [ 0, 4], [32,32], [42,22])
head($)->next  ([ 0, 0], [ 0, 6], [ 0, 0], [24, 0])
 Printing XHB RF set thread wise
18   2    atomic write    release  head($)->next   0x7f4438000b20          ([ 0, 0], [ 0, 6], [ 0,16], [24 ,22])
head($)->next  ([ 0, 0], [ 0, 6], [ 0, 0], [24, 0])
count  ([ 0, 0], [ 0, 4], [ 0, 0], [22,22])
00007F4438000B20  ([ 0, 0], [ 0, 0], [ 0,16])
 Printing ARM RF set thread wise
6    1    atomic write    seq_cst  head($)->next   0                       ([ 0, 0], [ 0, 4])
count  ([ 0, 0], [ 0, 4])
18   2    atomic write    release  head($)->next   0x7f4438000b20          ([ 0, 0], [ 0, 6], [ 0,16], [24 ,22])
head($)->next  ([ 0, 0], [ 0, 6], [ 0, 0], [24, 0])
count  ([ 0, 0], [ 0, 4], [ 0, 0], [22,22])
00007F4438000B20  ([ 0, 0], [ 0, 0], [ 0,16])
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

48 is the read
18 in both
6 in only arm

------------------------------------------------------------------------------------
#    t    Action type     MO       Location         Value               Rf  CV
------------------------------------------------------------------------------------
2    1    thread start    seq_cst  thread_1   0xdeadbeef              ([ 0, 0], [ 0, 0])
4    1    atomic write    seq_cst  count   0                       ([ 0, 0], [ 0, 0])
_6_    1    atomic write    seq_cst  head($)->next   0                       ([ 0, 0], [ 0, 4])
8    1    pthread create  seq_cst  thread   0x7ffec2df4580          ([ 0, 0], [ 0, 6])
10   2    thread start    seq_cst  thread_2   0xdeadbeef              ([ 0, 0], [ 0, 6], [ 0, 0])
12   1    pthread create  seq_cst  thread   0x7ffec2df4580          ([ 0, 0], [ 0, 6])
                                                                                                                                14   3    thread start    seq_cst  thread_3   0xdeadbeef              ([ 0, 0], [ 0, 6], [ 0, 0], [ 0, 0])
                                                                    16   2    atomic write    seq_cst  00007F4438000B20   0                       ([ 0, 0], [ 0, 6], [ 0, 0])
                                                                    *18*   2    atomic write    release  head($)->next   0x7f4438000b20          ([ 0, 0], [ 0, 6], [ 0,16], [24 ,22])
                                                                                                                                20   3    atomic read     acquire  head($)->next   0                   6   ([ 0, 0], [ 0, 6], [ 0, 0], [ 0, 0])
                                                                                                                                22   3    atomic rmw      seq_cst  count   0                 (80000000)  4   ([ 0, 0], [ 0, 6], [0, 0], [20， 0])
                                                                                                                                24   3    atomic read     acquire  head($)->next   0                   6   ([ 0, 0], [ 0, 6], [ 0, 0], [22 ,22])
                                                                    26   2    atomic read     relaxed  count   0x80000000          22  ([ 0, 0], [ 0, 6], [ 0, 0], [22 ,22])
                                                                    28   2    lock            seq_cst  guard   0xdeadbeef              ([ 0, 0], [ 0, 6], [26 ,18], [24 ,22])
                                                                                                                                30   3    atomic read     seq_cst  count   0x80000000          22  ([ 0, 0], [ 0, 6], [ 0, 0], [24 ,22])
                                                                    32   2    atomic rmw      relaxed  count   0x80000000        (1)  22  ([ 0, 0], [ 0, 6], [26,18], [24, 22])
                                                                    34   2    unlock          seq_cst  guard   0xdeadbeef              ([ 0, 0], [ 0, 6], [32,32], [24 ,22])
                                                                    36   2    thread finish   seq_cst  thread_2   0xdeadbeef              ([ 0, 0], [ 0, 6], [32,32], [24 ,22])
38   1    pthread join    seq_cst  thread_2   0x2                     ([ 0, 0], [ 0, 6])
                                                                                                                                40   3    lock            seq_cst  guard   0xdeadbeef              ([ 0, 0], [ 0, 6], [ 0, 0], [30 ,22])
                                                                                                                                42   3    atomic read     seq_cst  count   0x1                 32  ([ 0, 0], [ 0, 6], [32,32], [30 ,22])
                                                                                                                                44   3    unlock          seq_cst  guard   0xdeadbeef              ([ 0, 0], [ 0, 6], [32,32], [42 ,22])
                                                                                                                                46   3    unlock          seq_cst  guard   0xdeadbeef              ([ 0, 0], [ 0, 6], [32,32], [42 ,22])
                                                                                                                                **48**   3    atomic read     acquire  head($)->next   0xdeadbeef          ?   ([ 0, 0], [ 0, 6], [32,32], [42, 22])
                                                                                                                                50   3    thread finish   seq_cst  thread_3   0xdeadbeef              ([ 0, 0], [ 0, 6], [32,32], [48 ,22])
52   1    pthread join    seq_cst  thread_3   0x3                     ([ 0, 0], [ 0, 6])
54   1    thread finish   seq_cst  thread_1   0xdeadbeef              ([ 0, 0], [ 0, 6])


------------------------------------------------------------------------------------
#    t    Action type     MO       Location         Value               Rf  CV
------------------------------------------------------------------------------------
2    1    thread start    seq_cst  thread_1   0xdeadbeef
4    1    atomic write    seq_cst  count   0
_6_    1    atomic write    seq_cst  head($)->next   0
8    1    pthread create  seq_cst  thread   0x7ffec2df4580
10   2    thread start    seq_cst  thread_2   0xdeadbeef
12   1    pthread create  seq_cst  thread   0x7ffec2df4580
                                                                                                                                14   3    thread start    seq_cst  thread_3   0xdeadbeef
                                                                    16   2    atomic write    seq_cst  00007F4438000B20   0
                                                                    *18*   2    atomic write    release  head($)->next   0x7f4438000b20
                                                                                                                                20   3    atomic read     acquire  head($)->next   0                   6
                                                                                                                                22   3    atomic rmw      seq_cst  count   0
                                                                                                                                24   3    atomic read     acquire  head($)->next   0                   6
                                                                    26   2    atomic read     relaxed  count   0x80000000          22
                                                                    28   2    lock            seq_cst  guard   0xdeadbeef
                                                                                                                                30   3    atomic read     seq_cst  count   0x80000000          22
                                                                    32   2    atomic rmw      relaxed  count   0x80000000
                                                                    34   2    unlock          seq_cst  guard   0xdeadbeef
                                                                    36   2    thread finish   seq_cst  thread_2   0xdeadbeef
38   1    pthread join    seq_cst  thread_2   0x2
                                                                                                                                40   3    lock            seq_cst  guard   0xdeadbeef
                                                                                                                                42   3    atomic read     seq_cst  count   0x1                 32
                                                                                                                                44   3    unlock          seq_cst  guard   0xdeadbeef
                                                                                                                                46   3    unlock          seq_cst  guard   0xdeadbeef
                                                                                                                                **48**   3    atomic read     acquire  head($)->next   0xdeadbeef          ?
                                                                                                                                50   3    thread finish   seq_cst  thread_3   0xdeadbeef
52   1    pthread join    seq_cst  thread_3   0x3
54   1    thread finish   seq_cst  thread_1   0xdeadbeef
