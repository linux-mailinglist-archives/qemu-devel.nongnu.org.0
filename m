Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6FA6FB6A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GP-0007GD-Kf; Mon, 08 May 2023 15:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GM-0007Fc-TR
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:10 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GI-00043e-2z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573061; i=lukasstraub2@web.de;
 bh=RMPaB96clX712MJVaf16l7dBlsMK+Puiiaf/vcCDJIw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=K287YoeBj1St36rKkXvZ7A0eKGLaFOtlyk1vVLaSAjZPUZdfrWljGef2ybaJy6S4J
 39CzJxny799tPoiGMZjqwnvuyw47PCncJRwumHCOpLwT2qloUhN2cqYIi2/BAusFFN
 p5nk83MfEF3dGZQopKEAHO6+4CxqSoFcRKQnvhj4Wy9vszxQYUr7DHH9maBLmr7NC5
 mERlu77r4ZwklbJb5QfJ9EvMOa1AeCizjaHadTujlQuDUevvTTyMu4NEx4c4Lujm07
 0KTHbqEEpAMSuBXitcW7JDtKoUzGNO8IjFLJsD1/ALUdNMN/b1lQPTsrg7JFrOjRDr
 g7cERqDEVDn+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MV2KQ-1povFT1JPK-00S7IC; Mon, 08
 May 2023 21:11:01 +0200
Date: Mon, 8 May 2023 21:11:00 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 3/6] multifd: Introduce multifd-internal.h
Message-ID: <613b971dbdd71a7719667ae3fd607b8542afefe2.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PcMPtxVuBfCBIDCEEech__b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:eWpObQv2KgCUZM1/uuYwN/9RChh6RUHRoQmw9NDk5ps753hZySC
 05NoM1g0JbfJCk98yWjquxRuxVB6I9bHDmXbcKQ1eZ92JSddE0uz8/KVr7L8onx9xJT87LV
 7to8nnX3Its6+J/jprcfgWOcrlAz+4BFtRDif1mGa1oZpRVtToKxoh39jMRDwopCeMmc9GH
 1lfHz4j0QFHID0Gn2j9cg==
UI-OutboundReport: notjunk:1;M01:P0:GaatC1caZas=;roL9yCczVF7we35eoBYUugV46cM
 FU4LxnOwT14HkTvQCRjrPuzwBwTuZ3jlic6N6miMSFdlJrhuxZpRDNpgfpMwl1oZkFywGLG+S
 /Qcam6WtlD0Co54xre46yWzP6pjVAj6n++yKyZWf6ViVa7rP5iJL3N//hKDmj3iNfRNSqeydN
 Zzw1EgnTl0AuQPX4QoxDU9KhGuxe9MIGNgv4IxqjP9S1/8Trt0kogXQHdf/AqjsXafX8cgf9P
 hhWtmZinercDqkhnZn4mCaMNs8hvXmXwHn66/aXhzcVMntJJb8YyIURH1lME6HRP9+o7VdxSI
 Q8K8krXskxkmd/hjkKHXkmee2NZ0YUsFYIoXYOWGLa5BxcNq2SRby23FpH/npNV71OD4lv5ag
 HNZyP9wHVu2nkDvJdpD8rYzlD0K8omgjKNx8/xOnH8x7Qfed2pETc3pYOGCsKTPT2C/IbCCpB
 ax2FW0IH4e6f6m7/zOBcZgC+oCzqJ4A5ljNXkcsrQXsjnG+4IldMceezeSBMl14v4F32clMxn
 zzUBsXPVlfiwuTesZBObajLVb137ItbVuvATZfWtv/660BMu727yBUyUA8BVxnxS2SCjMnLCh
 xPslMcbIA5zcoHVWwCWxX+m/7R4RVY1SCnqWLnT/XQH2N9dbbkvQees57tKxwq+0AhnZ3hojB
 lUmnoDBuh4hb5EbGts/9d7UxVnW5Ms/0AALzR0XxBFiVedJVBk/VotNJ39Ez766eUxhybq8B/
 kRe32MFb9Cn9JyIIiLLNIQNW7KNyrMHj2PD0BjeqCuf5utoO84VeaYVrjY6LwX/r6/t66Gd/6
 qsl5SBGKxQ3ehwIPmcBUoyPwTc7LCDjhuXPy2e79wJ6nnPEF2TONAYYoajP3YSeupoE2g//YZ
 QJyXrHrCoI8vz1w0+64a622G/N7ksJTl+P/KLTeBKyc5C3P6F6bEQJcbxlPI7tdVFieJez0mT
 v12Ww/gP4QCSmlwGq3Op0fPsbV8=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/PcMPtxVuBfCBIDCEEech__b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Introduce multifd-internal.h so code that would normally go into
multifd.c can go into an extra file. This way, multifd.c hopefully
won't grow to 4000 lines like ram.c

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/multifd-internal.h | 34 ++++++++++++++++++++++++++++++++++
 migration/multifd.c          | 15 ++++-----------
 2 files changed, 38 insertions(+), 11 deletions(-)
 create mode 100644 migration/multifd-internal.h

diff --git a/migration/multifd-internal.h b/migration/multifd-internal.h
new file mode 100644
index 0000000000..6eeaa028e7
--- /dev/null
+++ b/migration/multifd-internal.h
@@ -0,0 +1,34 @@
+/*
+ * Internal Multifd header
+ *
+ * Copyright (c) 2019-2020 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifdef QEMU_MIGRATION_MULTIFD_INTERNAL_H
+#error Only include this header directly
+#endif
+#define QEMU_MIGRATION_MULTIFD_INTERNAL_H
+
+#ifndef MULTIFD_INTERNAL
+#error This header is internal to multifd
+#endif
+
+struct MultiFDRecvState {
+    MultiFDRecvParams *params;
+    /* number of created threads */
+    int count;
+    /* syncs main thread and channels */
+    QemuSemaphore sem_sync;
+    /* global number of generated multifd packets */
+    uint64_t packet_num;
+    /* multifd ops */
+    MultiFDMethods *ops;
+};
+
+extern struct MultiFDRecvState *multifd_recv_state;
diff --git a/migration/multifd.c b/migration/multifd.c
index 4e71c19292..f6bad69b6c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -31,6 +31,9 @@
 #include "io/channel-socket.h"
 #include "yank_functions.h"
=20
+#define MULTIFD_INTERNAL
+#include "multifd-internal.h"
+
 /* Multiple fd's */
=20
 #define MULTIFD_MAGIC 0x11223344U
@@ -967,17 +970,7 @@ int multifd_save_setup(Error **errp)
     return 0;
 }
=20
-struct {
-    MultiFDRecvParams *params;
-    /* number of created threads */
-    int count;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
-    /* global number of generated multifd packets */
-    uint64_t packet_num;
-    /* multifd ops */
-    MultiFDMethods *ops;
-} *multifd_recv_state;
+struct MultiFDRecvState *multifd_recv_state;
=20
 static void multifd_recv_terminate_threads(Error *err)
 {
--=20
2.39.2


--Sig_/PcMPtxVuBfCBIDCEEech__b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSUQACgkQNasLKJxd
sliE7g//fJtRadI8lcD68K3JYmkdggUNsuElcFJNiZor/xkTHyCKfUN+63UUfX77
VD/l8Ehz9XR2wdqOAs7RWwio7kWQFZXIf2KKa1hbmDMQdcoNRQH9smXMdwXVhuxu
Cw0KTDk0fx5QvZQZ+eVOA5u7uwgXzTy7jy5w0EilBEb9RyUMIwqUC787mpoujt2O
JXzdqEZwd6+4s0WZCKAr2AAPt80fqtQDL/sujXJVKprnaMcmQRcP5XJde1yTgicE
bbx6FgT3xnNiTEMgQqU4yrqECxHsf8vW0OjwC36l7jVIr3B3A5L1tOS9NYmILSV/
lAZLfrn4w1orr70qIdjwgq4eYoJFBI8MbgizifLM8CHrZZFLHctrLyY2afcZNGw+
OaXi7bWOohQFDCT2yrjBHmwt/A/ptrHzelhGbpG1sTUE9q78XX1yJQJofMbGYV8R
u9tLOiKbg08PGpI9g2FbTI5IjZOVQyNR8vv8jURyepImx64IEJYFDTqa8eeQf/No
T9O+2QJJqAVvp0xKpCngeP9kb+nqz7aIpLD9HQM2JQ3qSCQYgTZyW7ZdSY5RX0XC
tRdNuthQ4sxHAriFZOS5FAbeUx6NNwcaoa1AJsnpV3rFfFSOpDSPR0AyknIpOA6n
MhHVpEG/5VSq8aWQoz4nDxcG/tZjQ5Gp9eyPGiCBoU1/b8/6U20=
=yYQq
-----END PGP SIGNATURE-----

--Sig_/PcMPtxVuBfCBIDCEEech__b--

