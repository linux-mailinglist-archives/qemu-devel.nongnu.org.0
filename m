Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159565049F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 21:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p70Eu-0007uh-Ib; Sun, 18 Dec 2022 15:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p70Es-0007uY-Q5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:26:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p70En-00021Q-TY
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=oSu+RlPyrXjm+dRA7Glj2OvNw2MlpFb1gRkV17jtRMg=; b=cRk6W4CQ1B/bWVourvm4D/cNqM
 04WV0n+NN8BENKWMOjAlxZqX2ruHvilFvj66DJDNMaG2GylWRvxuewBqScl3xT8gg6mdeQaRkU9Pi
 psDz/xTGvEe1N18LF5GvHv1acJHHgx26tN9jewEKDdOsrcsuWoe/iQhhj+Ry9peYgdTmqAp4cBM/o
 /oOC9aU6xVYl/WMPga+lqDRiLyW8hnbAr3DeYGeB3CvnpGTWZbAC2JVKBLnEjOgOp43gDBnfKfxjC
 ap7BwrREpMV1iHz4rF7lBFQpTjjV/1z4bZCU4I3jgahDklcNI35kr2Jockkz56izPkGnTjkr/mpfG
 dCxpNy0EsE3vRI82V7ad9G9Cd3Q32y9ww6NGwrSWOCZqO5SG0uvtntQOzlBK47DEfIMkYBTIRSyAV
 CCMYpvdA6Hldd4BUjmUmrxphGPsW7nBJ+geV6YsT8B5ok/9P04CnnZ5ohvU7xY65myHGx8FUajVmE
 AkpNaUrkXcE+nJ35JYNx56AFKHVWt4cxi08gsk46ReCl88VIq0cvPg/EO8ZgNSqHR1m5dOnPGsNvL
 DZzr+l87Umbv5kEedvmVF5OKcsmH4KGt/MbLxlNyYcrTyCUsIwbjCLmF4UCSSDajy6TOIQ52iWo3G
 wH52WkknazNNN764SzzqelThfoBjI991wg1ibLAng=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 01/11] audio: log unimplemented audio device sample rates
Date: Sun, 18 Dec 2022 21:26:16 +0100
Message-ID: <3246935.mafvd9ugAF@silver>
In-Reply-To: <20221218171539.11193-1-vr_qemu@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-1-vr_qemu@t-online.de>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sunday, December 18, 2022 6:15:29 PM CET Volker R=FCmelin wrote:
> Some emulated audio devices allow guests to select very low
> sample rates that the audio subsystem doesn't support. The lowest
> supported sample rate depends on the audio backend used and in
> most cases can be changed with various -audiodev arguments. Until
> now, the audio_bug function emits an error message similar to the
> following error message
>=20
> A bug was just triggered in audio_calloc
> Save all your work and restart without audio
> I am sorry
> Context:
> audio_pcm_sw_alloc_resources_out passed invalid arguments to
>  audio_calloc
> nmemb=3D0 size=3D16 (len=3D0)
> audio: Could not allocate buffer for `ac97.po' (0 samples)
>=20
> and the audio subsystem continues without sound for the affected
> device.
>=20
> The fact that the selected sample rate is not supported is not a
> guest error. Instead of displaying an error message, the missing
> audio support is now logged. Simply continuing without sound is
> correct, since the audio stream won't transport anything
> reasonable at such high resample ratios anyway.
>=20
> The AUD_open_* functions return NULL like before. The opened
> audio device will not be registered in the audio subsystem and
> consequently the audio frontend callback functions will not be
> called. The AUD_read and AUD_write functions return early in this
> case. This is necessary because, for example, the Sound Blaster 16
> emulation calls AUD_write from the DMA callback function.
>=20
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> ---
>  audio/audio.c          |  1 +
>  audio/audio_template.h | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/audio/audio.c b/audio/audio.c
> index d849a94a81..f6b420688d 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qapi-visit-audio.h"
>  #include "qemu/cutils.h"
> +#include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/help_option.h"
>  #include "sysemu/sysemu.h"
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 720a32e57e..bfa94b4d22 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -115,6 +115,19 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE=
) (SW *sw)
>  #else
>      samples =3D (int64_t)sw->HWBUF->size * sw->ratio >> 32;
>  #endif
> +    if (samples =3D=3D 0) {
> +        HW *hw =3D sw->hw;
> +        size_t f_fe_min;
> +
> +        /* f_fe_min =3D ceil(1 [frames] * f_be [Hz] / size_be [frames]) =
*/
> +        f_fe_min =3D (hw->info.freq + HWBUF->size - 1) / HWBUF->size;
> +        qemu_log_mask(LOG_UNIMP,
> +                      AUDIO_CAP ": The guest selected a " NAME " sample =
rate"
> +                      " of %d Hz for %s. Only sample rates >=3D %zu Hz a=
re"
> +                      " supported.\n",
> +                      sw->info.freq, sw->name, f_fe_min);
> +        return -1;

You probably want to `sw->buf =3D NULL;` before returning here, or adjust t=
he
condition for the error message below.

The other thing that puzzles me, in error case these template functions ret=
urn
=2D1, which would then be feed to g_malloc*()?

> +    }
> =20
>      sw->buf =3D audio_calloc(__func__, samples, sizeof(struct st_sample)=
);
>      if (!sw->buf) {
>=20




