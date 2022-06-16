Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79B54D6C2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:08:43 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1e02-0007zl-3q
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dxA-0005h6-G4
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:44 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:20600
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx8-0006B7-Tr
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:44 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25FLpmSi003637
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=kuvJ8lrUMWXw92FcIL6LJKE9GUEqx7TLn/iEjCM07co=;
 b=jEqQAlwbMQppNkaVHQohbgVA/Sasvfae4DR32SDreUAibpHufKfK9F9SmGKgNQWPyYH+
 mQ9L6FdQcqUG4/GRx8ez90ku1uLjDZ8R/lZL7sHAI3wrzetWnyccbOZ5MVxOx4Hl7Ytr
 JedWIjpkujdX7lv/xvK9q6Vj7gwbhg+vGvg= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gpr0eht9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:41 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Jun 2022 18:05:39 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 0806C8092C5E; Wed, 15 Jun 2022 18:05:28 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <samuel.thibault@ens-lyon.org>, <jasowang@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 2/4] slirp: Update SlirpConfig version to 5
Date: Wed, 15 Jun 2022 18:05:24 -0700
Message-ID: <20220616010526.1895564-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616010526.1895564-1-pdel@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Gy2XHAWDCJ6sw9qZoZUuqrG9emzo8N2o
X-Proofpoint-GUID: Gy2XHAWDCJ6sw9qZoZUuqrG9emzo8N2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_17,2022-06-15_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7166425211=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think we probably need a new Slirp release
(4.8.0) and a switch statement here instead, right?

So that we can preserve the behavior for 4.7.0?

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 net/slirp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 8679be6444..75e5ccafd9 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -617,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
=20
     s =3D DO_UPCAST(SlirpState, nc, nc);
=20
-    cfg.version =3D SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;
+    cfg.version =3D SLIRP_CHECK_VERSION(4, 7, 0) ? 5 : 1;
     cfg.restricted =3D restricted;
     cfg.in_enabled =3D ipv4;
     cfg.vnetwork =3D net;
--=20
2.30.2


