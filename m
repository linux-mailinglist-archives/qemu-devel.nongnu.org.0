Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA736E945E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTSH-0006Yn-0f; Thu, 20 Apr 2023 08:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSE-0006Wb-Hd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSB-0002pZ-NY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:02 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KApZIh009074; Thu, 20 Apr 2023 12:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=CUNJmq0hA3+qeGUHIE7BngJonahWHDH2CrP1xo7sZls=;
 b=fOexkTcXqc17KNIHHmFSdv17vLjM/IHSw9Y67ptqESYqyL4Mn9Qhca1lTXzt+srylGu4
 zQlTYcCimfmyuzLcstVR0s/7Ynj/MD63N+YRXOR1pIoHb2MlhQmZKAQfHSuEeVgbRzYs
 PGPpSiwoOoIKONafWzwxM/3TWXFiylP0zS2mk0RsU/NuYPzpgai/0ie50kRiDUydS/vx
 s5du6gVRoKZ1d7oZDBtLkwbxt8VRq7plSTX6+VjBr3lG8w3nojivvzMYBVG1P6QOUhyN
 CWUWwSsrnEwcefUOGZTJa0It56BVQ9IcKw6XIHWaLwmZdUcLHc9o/HpiYwXjAZhmWl5f nQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2nn822n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCVj2I029160
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:45 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:31:42 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>
Subject: [PATCH v2 RESEND 0/7] Hexagon: add lldb support
Date: Thu, 20 Apr 2023 09:31:21 -0300
Message-ID: <cover.1681993775.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: npXfXmNIHoP3YL8cthi25DprpmYqSmlT
X-Proofpoint-GUID: npXfXmNIHoP3YL8cthi25DprpmYqSmlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=466
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series allows hexagon programs to be debugged under qemu user-mode
through LLDB and qemu's gdbstub. LLDB implements the GDB remote serial
protocol, so most of the necessary changes are in the Hexagon part itself.
However, one fix is needed at the arch-independent side too.

Changes in v2:
- Rebased on current master
- Added Taylor's Reviewed-by at patch 5

v1: https://lore.kernel.org/qemu-devel/cover.1680808943.git.quic_mathbern@quicinc.com/

Brian Cain (3):
  gdbstub: add support for the qRegisterInfo query
  Hexagon: support qRegisterInfo at gdbstub
  Hexagon (gdbstub): fix p3:0 read and write via stub

Matheus Tavares Bernardino (2):
  gdbstub: only send stop-reply packets when allowed to
  gdbstub: add test for untimely stop-reply packets

Taylor Simpson (2):
  Hexagon (gdbstub): add HVX support
  Hexagon (linux-user/hexagon): handle breakpoints

 gdbstub/internals.h                           |   5 +
 include/hw/core/cpu.h                         |   4 +
 target/hexagon/gdb_qreginfo.h                 | 124 ++++++++++++++++++
 gdbstub/gdbstub.c                             |  64 +++++++--
 gdbstub/softmmu.c                             |  13 +-
 gdbstub/user.c                                |  17 ++-
 linux-user/hexagon/cpu_loop.c                 |  10 ++
 target/hexagon/cpu.c                          |   3 +
 target/hexagon/gdbstub.c                      |  76 +++++++++++
 tests/guest-debug/run-test.py                 |  16 ++-
 .../multiarch/system/Makefile.softmmu-target  |  16 ++-
 11 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 target/hexagon/gdb_qreginfo.h

-- 
2.39.1


