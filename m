Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3A14B6DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:41:16 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJy4x-0005ZA-C0
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJy1s-0001Sl-CB
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:38:06 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJy1p-0007CU-3E
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=LLAWcYtveHMRgWalcR29Yxd9srv1rMnKHJsTVkm2u/s=; b=HoyITk2LDauBpDpRYM14m+4elQ
 qacV6gaiUGBfp5gY/CTVJfytePAnRgxG7bbpCLvIQHTcLzI4/1AvQSZWP65HPgNwIOPcDirH3iBiP
 slCJhPDUpekIDKNLuDsbQz3VeJbPnjO2SiCq/sfjAk84jcdB6QdHWpS1SbU5qB6ofESgGwsMtnxA+
 Gs02su8rZZbOfVryhQwNOq/PyN+GKKwOyGqWPwY1X99+kCgmVGzNCb304tuitosE/rhiNHfFcb5ck
 rExaoeXzsr2baa2Ql9oYy7rhXtdF7tYj0WzyMtbQqae2Ox+/IczK5U2F8NJ53K3jE2s8YteSlFyIQ
 rQdYnjEoqrJgp5E2QNqrLfLoC5cHBQ1b4dKeIlLxeuKDY3J8e+Uzn42knc2t1kvnaURh3h53o7hyr
 cH5veRduNBz2X/Y1fw1HacHDlG+NsunJzXLjQEMKLoGcIOzf1g6v8wkn+w8/1wT7MqdOjjkxHT491
 bhs+ljx70f4QN9i2JAXJar3BmNdPephassyA6QeNkII+gVzvz7ZOv+osBF2EQPNEVblVEEC/dSLOl
 wsM+HaxfgOF1DIYbXHgDyLPfRlQzOxAW65KtGZjpS67N94SxPIovKJfS0AG6eLdbIEJ5tVuqc3UB7
 /nYL9eDnnA0dPcmGkMcfgO56mwJxx5ndNSCACPQAA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [RFC PATCH 3/4] audio: Rename coreaudio extension to use
 Objective-C compiler
Date: Tue, 15 Feb 2022 14:37:56 +0100
Message-ID: <3890080.xqXnxpx7Oq@silver>
In-Reply-To: <20220215120625.64711-4-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-4-f4bug@amsat.org>
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

On Dienstag, 15. Februar 2022 13:06:24 CET Philippe Mathieu-Daud=E9 via wro=
te:
> The coreaudio library includes Objective-C declarations (using the
> caret '^' symbol to declare block references [*]). When building
> with a C compiler we get:
>=20
>   [175/839] Compiling C object libcommon.fa.p/audio_coreaudio.c.o
>     In file included from
> /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Fram=
ew
> orks/CoreAudio.framework/Headers/CoreAudio.h:18, from
> ../../audio/coreaudio.c:26:
>   =20
> /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Fram=
ew
> orks/CoreAudio.framework/Headers/AudioHardware.h:162:2: error: expected
> identifier or '(' before '^' token 162 |
> (^AudioObjectPropertyListenerBlock)(    UInt32                           =
 =20
> inNumberAddresses,
>           |  ^
>=20
>     FAILED: libcommon.fa.p/audio_coreaudio.c.o
>=20
> Rename the file to use the Objective-C default extension (.m) so
> meson calls the correct compiler.
>=20
> [*]
> https://developer.apple.com/library/archive/documentation/Cocoa/Conceptua=
l/
> ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

We already had a similar discussion before [1] whether to use .c and add
required compiler flags or using .m. I find this solution more appropriate.

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

[1] https://lore.kernel.org/all/7053351.4JHWUSIRgT@silver/

Best regards,
Christian Schoenebeck

>  audio/{coreaudio.c =3D> coreaudio.m} | 0
>  audio/meson.build                  | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename audio/{coreaudio.c =3D> coreaudio.m} (100%)
>=20
> diff --git a/audio/coreaudio.c b/audio/coreaudio.m
> similarity index 100%
> rename from audio/coreaudio.c
> rename to audio/coreaudio.m
> diff --git a/audio/meson.build b/audio/meson.build
> index d9b295514f..94dab16891 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -7,7 +7,7 @@ softmmu_ss.add(files(
>    'wavcapture.c',
>  ))
>=20
> -softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.c'))
> +softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.m'))
>  softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c',
> 'audio_win_int.c'))
>=20
>  audio_modules =3D {}



