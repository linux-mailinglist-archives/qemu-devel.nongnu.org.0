Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF47356ED
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 08:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYPJl-0001g7-Nj
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 02:22:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYPIh-0001PQ-La
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYPId-0005LE-Ua
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:21:29 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lidong.chen@oracle.com>)
	id 1hYPIb-0005AT-Su
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:21:27 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x556IiNV186969; Wed, 5 Jun 2019 06:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id : in-reply-to : references : in-reply-to :
	references : mime-version : content-type : content-transfer-encoding;
	s=corp-2018-07-02; bh=NkXgzSdPzOVUZDNJyEcRjrNqZpjA81OtuuhO4YYVHbc=;
	b=e5udcJiJqjdnqCIOybFr8nLvyNyPtPjKyYF7VBTQ+RheehAciPLUmcUEDr9e1OyUcaHQ
	7ELEhbMFAh/JPMMm3kGee7NGZ09xhxiYFsjVtxn3vCffacX/RVmMjEfxxHusrQzY/9mF
	Bo02Voud93YAtNuFBa+WrYadgwhnJCTJjU2Jg6AlQUVl3J2DjfcI4zDicrSSv6cHnrN8
	HnYSG6GI6x8E6/pbKTvMqrdDFtZzj8cHXq5mgm/3zkwhHUDPqENnZpLr9RILm1QNG7r2
	UV3jHo58E+rMZQuI9Jtvu2ddTuJ+P8CzJOGHGO9kxm3XuWtZ5F+GdfNvl3nbzMw4+AHw
	bQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2sugstgx9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 06:21:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x556Ju3R181522; Wed, 5 Jun 2019 06:21:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2swnghrbe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 06:21:20 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x556LJZq003993;
	Wed, 5 Jun 2019 06:21:19 GMT
Received: from ca-virt2-2.us.oracle.com (/10.211.11.112)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 04 Jun 2019 23:21:18 -0700
From: Lidong Chen <lidong.chen@oracle.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 02:21:05 -0400
Message-Id: <6b19cb7359a10a6bedc3ea0fce22fed3ef93c102.1559710447.git.lidong.chen@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1559710447.git.lidong.chen@oracle.com>
References: <cover.1559710447.git.lidong.chen@oracle.com>
In-Reply-To: <cover.1559710447.git.lidong.chen@oracle.com>
References: <cover.1559710447.git.lidong.chen@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906050040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906050040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2130.oracle.com id
	x556IiNV186969
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
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


