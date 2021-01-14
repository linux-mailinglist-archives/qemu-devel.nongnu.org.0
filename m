Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF12F6214
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:36:09 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02nI-0007SV-LI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l02Xq-0002KJ-IL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:20:10 -0500
Received: from mout.web.de ([212.227.15.14]:43301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l02Xm-0006px-Rw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610630402;
 bh=iBB/t/fPQQ+UKEXvBU7c6xk9RdnOEsaOvbHznPLgdSU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=s8mJXQfkR6UKmeypTq3eq3FhAwiQB0PhTHDt8b0ppZNdjiHRTbnJ1gI6JNuMOEq13
 IHNSKFo6HvMnfZRtv3bwmKGIkBME0CDa0DAzkifLbeLCSLfo196187kTZHg1qJCFjO
 7gc9nQI/h92S3I19SsPYI4JaRIhNZRV8tAqgo31M=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.5]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MTxth-1lQg763Njt-00QhkM; Thu, 14
 Jan 2021 14:20:01 +0100
Date: Thu, 14 Jan 2021 14:19:18 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] Fix build with new yank feature by adding stubs
Message-ID: <20210114141918.5201cc9c@gecko.fritz.box>
In-Reply-To: <87r1mnlr0a.fsf@linaro.org>
References: <87r1mnlr0a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7c8zCCNDCqNrSaKii0WZ0_.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:IpU4P9N64pKBRtMvE1EPIHLpJR0s0tFC68Y/kEO/W6gU/xRdlqK
 J03QD0H8BY2TLp8cMPuu/FETw5oVJFfAGgjjLN6jFEjldsMdDjEzoNnTIew1LRiP40JnDNs
 JYP0tzwBaYeZEbOVImXdbrzr/r6J/f6cqAp7oTkAudlDEAiLNRNLzKKrwnKrhtakSb4enkX
 iMpEWDpKkyVM5mdX1osvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gFzGBV5rEgg=:g4VOYoBxra0Mtu4bY8eaVM
 vNHVR7/t0yuE4pPpauFGNvUxQzYpGxkpdEnfVzjKFXStso8vXaiYxJRybtCx1bD49hQ21SwmS
 bSDzDM2liExKivuowwTF5xGldSCkg0Rv6DgK3DYByunuAP0uNIDd37FsNM07UDP5Jn05B5jx8
 GU2rcjZ8XTWk/+M4O6OMgYGC662qwDGbpHaaXfPy3YODd0y2OjUGBVfJfIt4bAX3Z+60sz5RB
 MrZBtMZpW3bKFxZogPtEuZdqazDqi1TIvgJeTPwZcAdfHak40DqsrmXuY/7ukQNhlA/EsRGuF
 m0HesnjJfN1UD/SGozrJUelbKoUGfF/2Y5rpjPPMyPumOuxuGt2i5pbunKeSymHhVMq4BWyjO
 W7Ln6s1SsJoaYt+1c10eRY21NZ1CGXQX/9JFbzI2bnYcuT3Wb85/DTjTrqHw01IReaCD2q+lt
 RhRAXyqBkxZ00JuRhGqCLeaOCFEYDmWX1aleecUEsuTSSfCwh45ax7hso8ucsbN29IoDx39fp
 9pPI1tSGkQo/FL+ef+nJXpz4TAFget/BhJ/JwZTsaFg7WKJXLrz34w3xNShPfT9r60aJ0Od2/
 xXJl99fVz9T2uVcPfE5dlUCzxrDk2/jEWNW/tPYGdnM4yXgJxGxghkB3dy07Oqyiv70rgRWQ/
 TJfC3tNHPqAD4oZmp7QvWZrTgiql28ZdDB9DoarrFwnVxw0dhyclwqf21lzLBACZbT0kcwHr5
 ElUsd6BfaevAycfMs7lex4Erf2bKdXwiEOLZY7wEBlaJouiNaNldlmAiqeqTNvtXN7WBUzs4e
 nD4v6PXGVEykEo3GajZeZJgVRkQe90JmEi02z63iR+zbDalLuTlPDK7nL7Btw5nk629ccVQlc
 6zby6VCjZPnYLCHO3XbA==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/7c8zCCNDCqNrSaKii0WZ0_.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 stubs/meson.build |  1 +
 stubs/yank.c      | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 stubs/yank.c

diff --git a/stubs/meson.build b/stubs/meson.build
index 80b1d81a31..1a656cd070 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
 if have_block
+  stub_ss.add(files('yank.c'))
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
diff --git a/stubs/yank.c b/stubs/yank.c
new file mode 100644
index 0000000000..6090416065
--- /dev/null
+++ b/stubs/yank.c
@@ -0,0 +1,29 @@
+#include "qemu/osdep.h"
+#include "qemu/yank.h"
+
+bool yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    return true;
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+}
+
+void yank_generic_iochannel(void *opaque)
+{
+}
+
+
--=20
2.29.2

--Sig_/7c8zCCNDCqNrSaKii0WZ0_.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAARNYACgkQNasLKJxd
slg/HQ//SLUzulmvZzLPbGbVvy4OpBOgqCSW9ETHBA89Tbkzz+LHE1La2SxlCsV0
NnGsuyvq700LWGTS39yGF1iJKozu2OnfVareuov1uZdzyuSNUgpu5rZ1d2wVoscn
xS4FMNAUZOLsqjBH4/O9VMiRxUEEz7AHSNx8ch4CmqSplTIK0BQlFDSSmEe4IIks
yBdIvdmForMHnVkxb4nyhr93Od+6CicFVw1RaGTn3yRqxJF/q9n2NTwVJ8L2Gjug
9iIuP2aFttRIFNEHkKcnw590S3Jc5mJQrXAvjUVCbavUqcZM6Cnl8h/czTd+WIPv
PA6yVJw6H0mX3clTr5SdN0j+YQ/DkYTQRHOtksrnViMmOZbMmSCAZIHjcWOsExZC
ui2ejV/YlLMa+qHbthgoGtWTr8Ch6yJ2czmMNuRH9RGl7RaE4/oNTmHYR2J7+sJa
R5IBPbXDqVAGT11HF1SuO4RYbAqdIm6zhoCkpCa0ZL9qyGfcHyF7pnmVWV9gzeBx
pgPftgaEpphEAoHX47b5Fv0Z6PBFZfBLHPy/ZF8O/R+yJHIgg7B+Q725gCKM1iVS
aEfa0WrzL1dZM4eT6Fu0x8g9q2yq10B33I4GD3H6aW0pERM2sat1BpNpOcFOI+bk
eVjb7MjVZwPfcl4TWmU31o0LvAjd7QL7YYFJ/ZChNrH4Qbn7AK8=
=xhMe
-----END PGP SIGNATURE-----

--Sig_/7c8zCCNDCqNrSaKii0WZ0_.--

