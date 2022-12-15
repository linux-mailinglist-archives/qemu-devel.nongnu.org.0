Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A748D64D928
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 11:00:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5l1E-0000P8-To; Thu, 15 Dec 2022 04:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p5l16-0000CD-4F
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:59:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p5l14-0002bm-9N
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:59:03 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BF8owbJ015699; Thu, 15 Dec 2022 09:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=84HYkONoHeufDU7vJAQo+l07NNObIDVkBJLzJXtKi/o=;
 b=bV8z9XzelwAciPG3gmofXC7d3q7IvHPvko5yyi1BPyWWCbJ5pMFUPxJPyxkZNhImhIp5
 InfYYBTK5tH4Ftk5Q3NCQbBKND0oUCxzpy3eD8OrkNY2W5madBfFCSNDPrj6oapjw9TQ
 EUZTlD9mCc8vsVy01CW0lFNXySt7H60BOwgFWpXX+C9aOhtEJGH+LLbiTQTY5UKwgfeh
 OK0dSumQEkTvmpDjaJIadrJzbmGcPpFQE7OD5siExOFcaoTeTvRS1woM2bjh+G87eff1
 wHnmwvriSj4GtvoP1yXAg6zGHVDC3V/7FV3bI/P1MBlhuF1JuoLtJRTVE4anltW281w9 sQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfxse8c2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 09:58:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF9wv4B028909
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 09:58:57 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 15 Dec 2022 01:58:54 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>,
 <richard.henderson@linaro.org>, <bcain@quicinc.com>,
 <quic_mathbern@quicinc.com>
CC: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH] tests/tcg/multiarch: remove unused variable in linux-test
Date: Thu, 15 Dec 2022 15:28:20 +0530
Message-ID: <20221215095820.13374-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0GiVCAoF9aHJoIp4_YRYwGAqfuMMQDKu
X-Proofpoint-GUID: 0GiVCAoF9aHJoIp4_YRYwGAqfuMMQDKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

LLVM 15.0.0 has improved diagnostics for the
'nounused-but-set-variable' warning and now warns when
a variable is modified using pre/post increment/decrement
operators but is otherwise never read.

linux-tests.c has such an unused variable 'wcount' and since
TCG tests are compiled with -Wall -Werror, this is causing
'make check-tcg' to fail when using LLVM 15.0.0 and above:

```
qemu/tests/tcg/multiarch/linux/linux-test.c:335:9:
error: variable 'wcount' set but not used [-Werror,-Wunused-but-set-variable]
    int wcount, rcount;
        ^
1 error generated.
Makefile:119: recipe for target 'linux-test' failed
```

This patch simply removes the 'wcount' variable as it
doesn't appear to impact the semantics of the test.
The WCOUNT_MAX constant is also renamed to RCOUNT_MAX to
better reflect the usage.
---
 tests/tcg/multiarch/linux/linux-test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index 5a2a4f2258..35540dc357 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -325,19 +325,18 @@ static void test_socket(void)
     chk_error(close(server_fd));
 }
 
-#define WCOUNT_MAX 512
+#define RCOUNT_MAX 512
 
 static void test_pipe(void)
 {
     fd_set rfds, wfds;
     int fds[2], fd_max, ret;
     uint8_t ch;
-    int wcount, rcount;
+    int rcount;
 
     chk_error(pipe(fds));
     chk_error(fcntl(fds[0], F_SETFL, O_NONBLOCK));
     chk_error(fcntl(fds[1], F_SETFL, O_NONBLOCK));
-    wcount = 0;
     rcount = 0;
     for(;;) {
         FD_ZERO(&rfds);
@@ -354,13 +353,12 @@ static void test_pipe(void)
             if (FD_ISSET(fds[0], &rfds)) {
                 chk_error(read(fds[0], &ch, 1));
                 rcount++;
-                if (rcount >= WCOUNT_MAX)
+                if (rcount >= RCOUNT_MAX)
                     break;
             }
             if (FD_ISSET(fds[1], &wfds)) {
                 ch = 'a';
                 chk_error(write(fds[1], &ch, 1));
-                wcount++;
             }
         }
     }
-- 
2.17.1


