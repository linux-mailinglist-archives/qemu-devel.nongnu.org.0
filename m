Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC023648A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 21:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYbPp-0002FU-N2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 15:17:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYbNv-0001TD-RX
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 15:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYbNs-0004KC-K6
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 15:15:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lidong.chen@oracle.com>)
	id 1hYbNs-0004IP-Bi
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 15:15:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x55JEun4039844; Wed, 5 Jun 2019 19:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id : in-reply-to : references : in-reply-to :
	references : mime-version : content-type : content-transfer-encoding;
	s=corp-2018-07-02; bh=NkXgzSdPzOVUZDNJyEcRjrNqZpjA81OtuuhO4YYVHbc=;
	b=YGG6teis/KCvQyw8gTpF3l1Z2bktSGhQ2yP1hnQKH51B8hJxgysp1v3MtLbQl6L4g5BC
	jcFXZM5Zrrb3OeT9UBp5VqAOu1rEIkhKy3vZeApmIrO6lIzqSd+Yo5rEu+b1WpuVyXU5
	91LUodkxB7XWBqA3OPrC6J4O3oXMZ0vRHHMNVj6VMqCabZT3IzlL343OqWpIkkcagzz8
	ZYjyRJqjaF9jBX3n/LTypY/QWuvU83Le4Bait68xERoiLufn8h+9FUld2iXlp1a8Itvl
	Oo1UMX8IxdDmT8CNMvFH4R+97L3xFm27KbLQ1E3YPvndp9znNdP1SMGFT4boVmNAtgkx
	dQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2suj0qmgat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 19:15:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x55JEeGa005960; Wed, 5 Jun 2019 19:15:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2swnhac6ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 19:15:34 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x55JFWvK017421;
	Wed, 5 Jun 2019 19:15:32 GMT
Received: from ca-virt2-2.us.oracle.com (/10.211.11.112)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 05 Jun 2019 12:15:32 -0700
From: Lidong Chen <lidong.chen@oracle.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:15:20 -0400
Message-Id: <6b19cb7359a10a6bedc3ea0fce22fed3ef93c102.1559761541.git.lidong.chen@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1559761541.git.lidong.chen@oracle.com>
References: <cover.1559761541.git.lidong.chen@oracle.com>
In-Reply-To: <cover.1559761541.git.lidong.chen@oracle.com>
References: <cover.1559761541.git.lidong.chen@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906050120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906050120
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2120.oracle.com id
	x55JEun4039844
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [Qemu-devel PATCH v2 1/2] sd: Fix out-of-bounds
 assertions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, berrange@redhat.com, liran.alon@oracle.com,
	liq3ea@gmail.com, armbru@redhat.com, lidong.chen@oracle.com,
	darren.kenny@oracle.com, marcandre.lureau@gmail.com,
	amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to an off-by-one error, the assert statements allow an
out-of-bound array access.

Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index aaab15f..818f86c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -144,7 +144,7 @@ static const char *sd_state_name(enum SDCardStates st=
ate)
     if (state =3D=3D sd_inactive_state) {
         return "inactive";
     }
-    assert(state <=3D ARRAY_SIZE(state_name));
+    assert(state < ARRAY_SIZE(state_name));
     return state_name[state];
 }
=20
@@ -165,7 +165,7 @@ static const char *sd_response_name(sd_rsp_type_t rsp=
)
     if (rsp =3D=3D sd_r1b) {
         rsp =3D sd_r1;
     }
-    assert(rsp <=3D ARRAY_SIZE(response_name));
+    assert(rsp < ARRAY_SIZE(response_name));
     return response_name[rsp];
 }
=20
--=20
1.8.3.1


