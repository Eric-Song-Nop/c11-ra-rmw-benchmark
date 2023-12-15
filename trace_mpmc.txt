**60** is the read
40 appears in both Arm and xhb
34 appears only in Arm

**94** is the read
76 appears in both Arm and xhb
40 appears only in Arm

------------------------------------------------------------------------------------
#    t    Action type     MO       Location         Value               Rf  CV
------------------------------------------------------------------------------------
2    1    thread start    seq_cst  thread_1   0xdeadbeef
4    1    atomic write    seq_cst  m_rdwr   0
6    1    atomic write    seq_cst  m_read   0
8    1    atomic write    seq_cst  m_written   0
10   1    atomic read     acquire  m_rdwr   0                   4
12   1    atomic rmw      acq_rel  m_rdwr   0
14   1    atomic read     acquire  m_read   0                   6
16   1    atomic rmw      relaxed  m_written   0
18   1    pthread create  seq_cst  thread_b   0x7ffdde06cdb0
20   2    thread start    seq_cst  thread_2   0xdeadbeef
22   1    pthread create  seq_cst  thread_b   0x7ffdde06cdb0
                                                                                                                    24   3    thread start    seq_cst  thread_3   0xdeadbeef
26   2    atomic read     acquire  m_rdwr   0x1                 12
28   2    atomic rmw      acq_rel  m_rdwr   0x1
                                                                                                                    30   3    atomic read     acquire  m_rdwr   0x2                 28
32   2    atomic read     acquire  m_read   0                   6
                                                                                                                    *34*   3    atomic rmw      acq_rel  m_rdwr   0x2               28
36   2    atomic rmw      relaxed  m_written   0x1
38   2    atomic read     acquire  m_rdwr   0x3                 34
*40*   2    atomic rmw      acquire  m_rdwr   0x3                 34
42   2    atomic read     acquire  m_written   0x2                 36
44   2    thread yield    seq_cst  thread_2   0xdeadbeef
46   2    atomic read     acquire  m_written   0x2                 36
48   2    thread yield    seq_cst  thread_2   0xdeadbeef
                                                                                                                    50   3    atomic read     acquire  m_read   0                   6
52   2    atomic read     acquire  m_written   0x2                 36
                                                                                                                    54   3    atomic rmw      relaxed  m_written   0x2
56   2    thread yield    seq_cst  thread_2   0xdeadbeef
58   2    atomic read     acquire  m_written   0x2                 36
                                                                                                                    **60**   3    atomic read     acquire  m_rdwr   0x10003             40
62   2    thread yield    seq_cst  thread_2   0xdeadbeef
64   2    atomic read     acquire  m_written   0x2                 36
                                                                                                                    66   3    atomic rmw      acquire  m_rdwr   0x10003
                                                                                                                    68   3    atomic read     acquire  m_written   0x3                 54
70   2    thread yield    seq_cst  thread_2   0xdeadbeef
                                                                                                                    72   3    atomic rmw      release  m_read   0
                                                                                                                    74   3    atomic read     acquire  m_rdwr   0x20003
                                                                                                                    *76*   3    atomic rmw      acquire  m_rdwr   0x20003
78   2    atomic read     acquire  m_written   0x2
80   2    thread yield    seq_cst  thread_2   0xdeadbeef
                                                                                                                    82   3    atomic read     acquire  m_written   0x3
                                                                                                                    84   3    atomic rmw      release  m_read   0x1
                                                                                                                    86   3    atomic read     acquire  m_rdwr   0x30003
                                                                                                                    88   3    thread finish   seq_cst  thread_3   0xdeadbeef
90   2    atomic read     acquire  m_written   0x3
92   2    atomic rmw      release  m_read   0x2
**94**   2    atomic read     acquire  m_rdwr   0x30003
96   2    thread finish   seq_cst  thread_2   0xdeadbeef
98   1    pthread join    seq_cst  thread_2   0x2
100  1    pthread join    seq_cst  thread_3   0x3
102  1    thread finish   seq_cst  thread_1   0xdeadbeef