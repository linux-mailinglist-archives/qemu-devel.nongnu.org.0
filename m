Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF164EA41
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 16:09:48 +0200 (CEST)
Received: from localhost ([::1]:35372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heKEc-00064y-Ri
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 10:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56451)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1heJph-0007If-SV
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1heJpf-00048T-HF
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:44:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55206)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1heJpf-0003xq-6X; Fri, 21 Jun 2019 09:43:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBF14308222E;
 Fri, 21 Jun 2019 13:43:55 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 118145C221;
 Fri, 21 Jun 2019 13:43:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 15:43:38 +0200
Message-Id: <20190621134338.8425-4-david@redhat.com>
In-Reply-To: <20190621134338.8425-1-david@redhat.com>
References: <20190621134338.8425-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 21 Jun 2019 13:43:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 3/3] s390x/cpumodel: Prepend
 KDSA features with "KDSA"
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's handle it just like for other crypto features.

Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu_features_def.inc.h | 30 ++++++++++++++---------------
 target/s390x/gen-features.c         | 30 ++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_featu=
res_def.inc.h
index 5dffff65fa..c20c780f2e 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -339,21 +339,21 @@ DEF_FEAT(KMA_GCM_EAES_192, "kma-gcm-eaes-192", KMA,=
 27, "KMA GCM-Encrypted-AES-1
 DEF_FEAT(KMA_GCM_EAES_256, "kma-gcm-eaes-256", KMA, 28, "KMA GCM-Encrypt=
ed-AES-256")
=20
 /* Features exposed via the KDSA instruction. */
-DEF_FEAT(ECDSA_VERIFY_P256, "kdsa-ecdsa-verify-p256", KDSA, 1, "KDSA ECD=
SA-Verify-P256")
-DEF_FEAT(ECDSA_VERIFY_P384, "kdsa-ecdsa-verify-p384", KDSA, 2, "KDSA ECD=
SA-Verify-P384")
-DEF_FEAT(ECDSA_VERIFY_P512, "kdsa-ecdsa-verify-p521", KDSA, 3, "KDSA ECD=
SA-Verify-P521")
-DEF_FEAT(ECDSA_SIGN_P256, "kdsa-ecdsa-sign-p256", KDSA, 9, "KDSA ECDSA-S=
ign-P256")
-DEF_FEAT(ECDSA_SIGN_P384, "kdsa-ecdsa-sign-p384", KDSA, 10, "KDSA ECDSA-=
Sign-P384")
-DEF_FEAT(ECDSA_SIGN_P512, "kdsa-ecdsa-sign-p521", KDSA, 11, "KDSA ECDSA-=
Sign-P521")
-DEF_FEAT(EECDSA_SIGN_P256, "kdsa-eecdsa-sign-p256", KDSA, 17, "KDSA Encr=
ypted-ECDSA-Sign-P256")
-DEF_FEAT(EECDSA_SIGN_P384, "kdsa-eecdsa-sign-p384", KDSA, 18, "KDSA Encr=
ypted-ECDSA-Sign-P384")
-DEF_FEAT(EECDSA_SIGN_P512, "kdsa-eecdsa-sign-p521", KDSA, 19, "KDSA Encr=
ypted-ECDSA-Sign-P521")
-DEF_FEAT(EDDSA_VERIFY_ED25519, "kdsa-eddsa-verify-ed25519", KDSA, 32, "K=
DSA EdDSA-Verify-Ed25519")
-DEF_FEAT(EDDSA_VERIFY_ED448, "kdsa-eddsa-verify-ed448", KDSA, 36, "KDSA =
EdDSA-Verify-Ed448")
-DEF_FEAT(EDDSA_SIGN_ED25519, "kdsa-eddsa-sign-ed25519", KDSA, 40, "KDSA =
EdDSA-Sign-Ed25519")
-DEF_FEAT(EDDSA_SIGN_ED448, "kdsa-eddsa-sign-ed448", KDSA, 44, "KDSA EdDS=
A-Sign-Ed448")
-DEF_FEAT(EEDDSA_SIGN_ED25519, "kdsa-eeddsa-sign-ed25519", KDSA, 48, "KDS=
A Encrypted-EdDSA-Sign-Ed25519")
-DEF_FEAT(EEDDSA_SIGN_ED448, "kdsa-eeddsa-sign-ed448", KDSA, 52, "KDSA En=
crypted-EdDSA-Sign-Ed448")
+DEF_FEAT(KDSA_ECDSA_VERIFY_P256, "kdsa-ecdsa-verify-p256", KDSA, 1, "KDS=
A ECDSA-Verify-P256")
+DEF_FEAT(KDSA_ECDSA_VERIFY_P384, "kdsa-ecdsa-verify-p384", KDSA, 2, "KDS=
A ECDSA-Verify-P384")
+DEF_FEAT(KDSA_ECDSA_VERIFY_P512, "kdsa-ecdsa-verify-p521", KDSA, 3, "KDS=
A ECDSA-Verify-P521")
+DEF_FEAT(KDSA_ECDSA_SIGN_P256, "kdsa-ecdsa-sign-p256", KDSA, 9, "KDSA EC=
DSA-Sign-P256")
+DEF_FEAT(KDSA_ECDSA_SIGN_P384, "kdsa-ecdsa-sign-p384", KDSA, 10, "KDSA E=
CDSA-Sign-P384")
+DEF_FEAT(KDSA_ECDSA_SIGN_P512, "kdsa-ecdsa-sign-p521", KDSA, 11, "KDSA E=
CDSA-Sign-P521")
+DEF_FEAT(KDSA_EECDSA_SIGN_P256, "kdsa-eecdsa-sign-p256", KDSA, 17, "KDSA=
 Encrypted-ECDSA-Sign-P256")
+DEF_FEAT(KDSA_EECDSA_SIGN_P384, "kdsa-eecdsa-sign-p384", KDSA, 18, "KDSA=
 Encrypted-ECDSA-Sign-P384")
+DEF_FEAT(KDSA_EECDSA_SIGN_P512, "kdsa-eecdsa-sign-p521", KDSA, 19, "KDSA=
 Encrypted-ECDSA-Sign-P521")
+DEF_FEAT(KDSA_EDDSA_VERIFY_ED25519, "kdsa-eddsa-verify-ed25519", KDSA, 3=
2, "KDSA EdDSA-Verify-Ed25519")
+DEF_FEAT(KDSA_EDDSA_VERIFY_ED448, "kdsa-eddsa-verify-ed448", KDSA, 36, "=
KDSA EdDSA-Verify-Ed448")
+DEF_FEAT(KDSA_EDDSA_SIGN_ED25519, "kdsa-eddsa-sign-ed25519", KDSA, 40, "=
KDSA EdDSA-Sign-Ed25519")
+DEF_FEAT(KDSA_EDDSA_SIGN_ED448, "kdsa-eddsa-sign-ed448", KDSA, 44, "KDSA=
 EdDSA-Sign-Ed448")
+DEF_FEAT(KDSA_EEDDSA_SIGN_ED25519, "kdsa-eeddsa-sign-ed25519", KDSA, 48,=
 "KDSA Encrypted-EdDSA-Sign-Ed25519")
+DEF_FEAT(KDSA_EEDDSA_SIGN_ED448, "kdsa-eeddsa-sign-ed448", KDSA, 52, "KD=
SA Encrypted-EdDSA-Sign-Ed448")
=20
 /* Features exposed via the SORTL instruction. */
 DEF_FEAT(SORTL_SFLR, "sortl-sflr", SORTL, 1, "SORTL SFLR")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index dc320a06c2..af06be3e3b 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -216,21 +216,21 @@
=20
 #define S390_FEAT_GROUP_MSA_EXT_9 \
     S390_FEAT_MSA_EXT_9, \
-    S390_FEAT_ECDSA_VERIFY_P256, \
-    S390_FEAT_ECDSA_VERIFY_P384, \
-    S390_FEAT_ECDSA_VERIFY_P512, \
-    S390_FEAT_ECDSA_SIGN_P256, \
-    S390_FEAT_ECDSA_SIGN_P384, \
-    S390_FEAT_ECDSA_SIGN_P512, \
-    S390_FEAT_EECDSA_SIGN_P256, \
-    S390_FEAT_EECDSA_SIGN_P384, \
-    S390_FEAT_EECDSA_SIGN_P512, \
-    S390_FEAT_EDDSA_VERIFY_ED25519, \
-    S390_FEAT_EDDSA_VERIFY_ED448, \
-    S390_FEAT_EDDSA_SIGN_ED25519, \
-    S390_FEAT_EDDSA_SIGN_ED448, \
-    S390_FEAT_EEDDSA_SIGN_ED25519, \
-    S390_FEAT_EEDDSA_SIGN_ED448, \
+    S390_FEAT_KDSA_ECDSA_VERIFY_P256, \
+    S390_FEAT_KDSA_ECDSA_VERIFY_P384, \
+    S390_FEAT_KDSA_ECDSA_VERIFY_P512, \
+    S390_FEAT_KDSA_ECDSA_SIGN_P256, \
+    S390_FEAT_KDSA_ECDSA_SIGN_P384, \
+    S390_FEAT_KDSA_ECDSA_SIGN_P512, \
+    S390_FEAT_KDSA_EECDSA_SIGN_P256, \
+    S390_FEAT_KDSA_EECDSA_SIGN_P384, \
+    S390_FEAT_KDSA_EECDSA_SIGN_P512, \
+    S390_FEAT_KDSA_EDDSA_VERIFY_ED25519, \
+    S390_FEAT_KDSA_EDDSA_VERIFY_ED448, \
+    S390_FEAT_KDSA_EDDSA_SIGN_ED25519, \
+    S390_FEAT_KDSA_EDDSA_SIGN_ED448, \
+    S390_FEAT_KDSA_EEDDSA_SIGN_ED25519, \
+    S390_FEAT_KDSA_EEDDSA_SIGN_ED448, \
     S390_FEAT_PCC_SCALAR_MULT_P256, \
     S390_FEAT_PCC_SCALAR_MULT_P384, \
     S390_FEAT_PCC_SCALAR_MULT_P512, \
--=20
2.21.0


