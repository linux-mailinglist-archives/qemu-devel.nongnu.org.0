Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834C6C0D4B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBoj-0004TW-VM; Mon, 20 Mar 2023 05:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1peBof-0004TA-9K
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:28:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1peBod-000093-Hm
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:28:33 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K8OLpL019526; Mon, 20 Mar 2023 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=TG/SVGu6tJBMzchPlR8sP6B/mtK2brVFUkwfbuZA7e4=;
 b=QFNi1j5uK2qsq6NhOqUGIKxC8mdsjWucaj/7NlLZQijD44HpAPQaYUwWyLR0UShhosbL
 zSjLUSCCyXmjPw8K8VPm/ecigMrowuVlWjlKuJcGCdAMn1byx27alAqcYScCgRQ9v7iW
 FGKUU8xomp5S9pYT1ex4q6zZtQpoAagAZgi+bJAS8F7fq5MIyiKhiLc+NK7eAyscf0zJ
 KXFT6FUANibDDzCB1HMlb9HgMI3ogm9XTgHQ5CVCKseyAqDd5SqJQPoXy0S689y9Ud+U
 IA/ewRYVMNzpLX/oSEZGfc5Qw/vra+s7xAhBjdpJuCfj2UCXxiKosS1wva7xlVbhxXwA 3w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pd4w8vd26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:28:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32K9SP7T004147
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:28:25 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 02:28:25 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Markus
 Armbruster" <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marco Liebel <quic_mliebel@quicinc.com>
Subject: [PATCH v3 0/2] Use f-strings and black code style
Date: Mon, 20 Mar 2023 02:25:31 -0700
Message-ID: <20230320092533.2859433-1-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bjDZYr1_hwEhRCqMKp-vZ2ZIRrFP2wFt
X-Proofpoint-ORIG-GUID: bjDZYr1_hwEhRCqMKp-vZ2ZIRrFP2wFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 mlxlogscore=407
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200080
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Replaces python 2 format strings with f-strings and applies black code
style to all python files in target/hexagon.

Marco Liebel (2):
  Use f-strings in python scripts
  Use black code style for python scripts

 target/hexagon/dectree.py               | 396 +++++++------
 target/hexagon/gen_analyze_funcs.py     | 226 ++++----
 target/hexagon/gen_helper_funcs.py      | 364 ++++++------
 target/hexagon/gen_helper_protos.py     | 169 +++---
 target/hexagon/gen_idef_parser_funcs.py |  83 +--
 target/hexagon/gen_op_attribs.py        |  10 +-
 target/hexagon/gen_op_regs.py           |  77 +--
 target/hexagon/gen_opcodes_def.py       |   6 +-
 target/hexagon/gen_printinsn.py         |  82 +--
 target/hexagon/gen_shortcode.py         |  17 +-
 target/hexagon/gen_tcg_func_table.py    |  16 +-
 target/hexagon/gen_tcg_funcs.py         | 729 +++++++++++++-----------
 target/hexagon/hex_common.py            | 181 +++---
 13 files changed, 1290 insertions(+), 1066 deletions(-)

-- 
2.25.1


