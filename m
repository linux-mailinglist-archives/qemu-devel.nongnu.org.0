Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A84B6D4F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:24:15 +0100 (CET)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxoT-0007Fj-EG
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJxj6-00055n-Nc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:18:40 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJxj4-0004Hz-2i
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=A1flev7o+cIm+o4uFXx9aGLmgq4nIDdNSIqaqsMFMv4=; b=nbR//rTYptmt/9W6qurewI2NZI
 6kmAt6yGuNYoEviqZeoh67bKDcUO7VzxidN/p9ZhJwDzYsusF0K4ksxVlIMQelHSunalW+CCLbeHn
 pPyM+MICk3Nq/OunukbI+xfR3yHZmY04m94kLUfrp6l4vatF/x2Y479UtZoO0NgcwcsaFPDbGDn1B
 d84A4i1U0ELtxvPA5srh9c2PdtT7waSsbqJFKvgXB+FG5Bmz+3JAeb0z0opw2Qo03CdW7inprpoal
 UmmKLTe7/8CKT/tRaQSyJuzcoMBp6jvPWDW6JjJm7Jc2k9/5aRqp/YXUSY63Jw8O7hmWcs0x7ApMi
 BAzPjD9w3SLck42II9TpmNtaLhj8ZFGWhiEI4wbfE60YlcDnRCLzdm7eb6o3RLjdtQugvk8Xm+gvJ
 CC62CtkFUR4sTU8ZQkRl9PiICej5SsnFjphZOeMLGCbVz7aJv7vyBB5BmwzvdwVH9Jhy4Bhy6Dqfm
 fz9Rfcl4E6fCUn1pNdwH3BNTvDPSXq16SutF8l04Op+I+eL7EthyFnOTWgcgxLi1JayuJRX40Cwq/
 otJ6L/d87QsyHcndktVPPSb4CNu0664627GPh2El/ZDXwlCQZ+9elajNzJK137LqzOY87kRfX5naQ
 FipPSM6m8MeW44WEj0OqaSwxH3eopTgj+kS+9fXRU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
Date: Tue, 15 Feb 2022 14:18:32 +0100
Message-ID: <5430167.XuPm0vUgvV@silver>
In-Reply-To: <20220215120625.64711-5-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 15. Februar 2022 13:06:25 CET Philippe Mathieu-Daud=E9 via wro=
te:
> We globally ignore the 'initializer overrides' warnings in C code
> since commit c1556a812a ("configure: Disable (clang)
> initializer-overrides warnings"). Unfortunately the ${gcc_flags}
> variable is not propagated to Objective-C flags ($OBJCFLAGS).
> Instead of reworking the configure script to test all supported
> C flags in Objective-C and sanitize them, ignore the warning
> locally with the GCC diagnostic #pragma (Clang ignores it).
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

What about this instead:

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce0..df9b9be999 100644
=2D-- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -652,9 +652,7 @@ QemuCocoaView *cocoaView;
=20
     /* translates Macintosh keycodes to QEMU's keysym */
=20
=2D    int without_control_translation[] =3D {
=2D        [0 ... 0xff] =3D 0,   // invalid key
=2D
+    int without_control_translation[256] =3D {
         [kVK_UpArrow]       =3D QEMU_KEY_UP,
         [kVK_DownArrow]     =3D QEMU_KEY_DOWN,
         [kVK_RightArrow]    =3D QEMU_KEY_RIGHT,
@@ -667,9 +665,7 @@ QemuCocoaView *cocoaView;
         [kVK_Delete]        =3D QEMU_KEY_BACKSPACE,
     };
=20
=2D    int with_control_translation[] =3D {
=2D        [0 ... 0xff] =3D 0,   // invalid key
=2D
+    int with_control_translation[256] =3D {
         [kVK_UpArrow]       =3D QEMU_KEY_CTRL_UP,
         [kVK_DownArrow]     =3D QEMU_KEY_CTRL_DOWN,
         [kVK_RightArrow]    =3D QEMU_KEY_CTRL_RIGHT,

That warning should only be raised on overlapping designated initializations
which strictly is undefined behaviour. Because which order defines the
precedence of overlapping initializers, is it the order of the designated
intializer list, or rather the memory order?

See also:
https://stackoverflow.com/questions/40920714/is-full-followed-by-partial-in=
itialization-of-a-subobject-undefined-behavior

So I have my doubts whether this warning suppression should be used in QEMU=
 at
all.

Best regards,
Christian Schoenebeck



