Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229D5BEC5E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahPO-0006ZE-Rm
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oadWK-0002wp-2t; Tue, 20 Sep 2022 09:42:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:27332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oadWG-0005hY-88; Tue, 20 Sep 2022 09:42:38 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KDGCsn012051;
 Tue, 20 Sep 2022 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=qk2eUGGj4YJYP5WUeUWDhqbpZAYKxz0Xq66hrR3pg3Q=;
 b=G+cbVO3qNZLHUofDdoOo9mveBRLw2XMU35sK3Zk4ZNZSiAO37V8zD3Jq3KEypkveTjIt
 FAbbqfWqs4Ze+PzT512OSvmZGewX0D7bmuqytWZ+ncIk97lZVjNMc9N0SrQYEpoxCAYQ
 qBX8vnXfxnw8TZmPnSSqDmsRynKAo2CDOK9LMyDA8weTmC5u6cDYU+9LI7ecE+qbyb9b
 eqFggAokT4pRGfaLUv6djf7sg01iCoi350YeaG0uUstgjixUTXrrAILrzHlKutT3VYyk
 C+n7Qh8JTJKmIRWGHiQ2vAdamssujG0/GAGKf30/DuchGrRGXkxraOT4+tNFL0UajbSi cQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jqa1k8sxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 13:42:32 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28KDfaMk009863; 
 Tue, 20 Sep 2022 13:42:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3jnqmj1c6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 13:42:31 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KDgVxL010640;
 Tue, 20 Sep 2022 13:42:31 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 28KDgVEX010639
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 13:42:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 3943A4DD1; Tue, 20 Sep 2022 10:42:31 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org
Subject: [PATCH] checkpatch: ignore target/hexagon/imported/* files
Date: Tue, 20 Sep 2022 10:42:28 -0300
Message-Id: <e3b6a345a88807a1c4daa45f638b2a90af538fd5.1663681339.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TI7EEx4XLMDbRf0iyU4m6uDlFsHyKEZq
X-Proofpoint-ORIG-GUID: TI7EEx4XLMDbRf0iyU4m6uDlFsHyKEZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=683
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200080
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These files come from an external project (the hexagon archlib), so they
deliberately do not follow QEMU's coding style. To avoid false positives
from checkpatch.pl, let's disable the checking for those.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d900d18048..e3e3b43076 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1667,6 +1667,7 @@ sub process {
 # some scripts we imported from other projects.
 		next if ($realfile =~ /\.(s|S)$/);
 		next if ($realfile =~ /(checkpatch|get_maintainer)\.pl$/);
+		next if ($realfile =~ /^target\/hexagon\/imported\/*/);
 
 		if ($rawline =~ /^\+.*\t/) {
 			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
-- 
2.37.2


