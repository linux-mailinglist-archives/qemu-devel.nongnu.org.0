Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AEF376572
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:47:49 +0200 (CEST)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leztU-00089o-6b
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbZ-0000u6-GW
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbX-0001Ym-0g
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:17 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CEDuY126682;
 Fri, 7 May 2021 12:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=jwSUd3eBPptGZN8xtVowoLPdImw26KI32p0lOJ+9RV0=;
 b=YvdTn1NQECvzAIsI1TaLU078RbV0h6G4ZeiKJfwdxFX338tABtrj+BchO0a0/TwP/UZw
 W3CvSBzixqKmlst0Zh57Q8ah9AVCdEd04O3kdnk2PUBdq6nokC7Ld0HpxP+zZd7ZjZ7D
 UF+X8Kn9xBlZikOJX5Z1dZLRbCSPQdn9PYDS5OzlSn3KZdnfu8KW3deu6yR6SfJaX6a+
 ZwTDrwMgJqWIH1ju+bO/NuvFOvu3A4/XjehnZ82UvCIo9U7N+kd3w6IJqnIMmAn7t8P2
 FDILMB9t7plVTk8wCVXzkK91HKaV7Bd/snD8KHeAzVbvtauFWDey8uAyC7xLwM4sDaBh yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 38ctjv1cc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGQA9173756;
 Fri, 7 May 2021 12:29:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb6ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:11 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CNPDV005557;
 Fri, 7 May 2021 12:29:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38csrtb6cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:10 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CT76v016467;
 Fri, 7 May 2021 12:29:08 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:07 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 21/22] cpr: maintainers
Date: Fri,  7 May 2021 05:25:19 -0700
Message-Id: <1620390320-301716-22-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 9eA8Rol-ji44VjzrGSrqn2n0UnFKW-p0
X-Proofpoint-GUID: 9eA8Rol-ji44VjzrGSrqn2n0UnFKW-p0
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the maintainers for cpr related files.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f1..b69bbf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2843,6 +2843,17 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: hw/vfio/cpr.c
+F: include/migration/cpr.h
+F: migration/cpr.c
+F: qapi/cpr.json
+F: include/qemu/env.h
+F: util/env.c
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
-- 
1.8.3.1


