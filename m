Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C9650CC0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:40:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GM1-00076W-OB; Mon, 19 Dec 2022 08:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7GM0-00075g-C5
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:38:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7GLx-0007GK-UV
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=1ROKiUwso4b8E0pfMPBoFAGaG7jPyuy1zk9X341TMgA=; b=Pl/kEknGQirdV9+Bka3w1HAdzz
 XC6e3iWCxxFIgDH+JuKokP5WC6Z0W/UyMfQqr1Ciiqr45SJEV6lpoIA8GCzWr/Z6/h3QemQ8VQ8qT
 +yqqvv0d+TtHTmWlQP20yt34GJ+PhWKl4MAoeD35mBNfhuclxybquR013C9QK8reddxqgiPiTlmst
 qx7TlTf1/USJ74gZMkJBuniAEBS5lPKqIcQ+vKVGFjE4DP6Ddw4yy04EsXu2wtrwjAHde3sGg6rI4
 Pd8PDsEpBKEMYhxV3rq/2G+rNbm/Wukp8kVB3pHZ7wmZulmIGYz7xQqm5gyz2wIRi30og+DFArF3X
 XYXFwO2LoNDq6YNequ2c/4Uwtky8wtgX6WBrXI0lFBHbIGDnTqcwdVNy6CZ6K/MDtyVO2j3W1Gl/g
 p0bvs0smiVZRBKZG8I33I963T3P3Rd2Ixj2Kq31aY8xr/zWzrV4OPOVXgvbU57hxtciQ0FI4mEGVL
 6nXOlfT4lmyPzExhm1Gzn183K1ueca6ht4rGqS79pVIwUtxi7TXNwErTklXrsscvLMz8HosDoRgaH
 Se5RPm4QACKldM3uhrgEUIG+MYNSDo/pGTdvp88ee0jh7yGlJ+wqiqNBoowPjG6Sdt7Lj3NofVmF9
 VeiYAflwvgShTjWiwH/6YpFmmOjtvIV5/2AjrJqEk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 01/11] audio: log unimplemented audio device sample rates
Date: Mon, 19 Dec 2022 14:38:46 +0100
Message-ID: <11528774.0ijYQ6xrNh@silver>
In-Reply-To: <69c72205-b6cc-9e07-a15e-ae7491d7e0c5@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <3246935.mafvd9ugAF@silver>
 <69c72205-b6cc-9e07-a15e-ae7491d7e0c5@t-online.de>
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

On Monday, December 19, 2022 8:22:25 AM CET Volker R=FCmelin wrote:
> Am 18.12.22 um 21:26 schrieb Christian Schoenebeck:
> > On Sunday, December 18, 2022 6:15:29 PM CET Volker R=FCmelin wrote:
> >> Some emulated audio devices allow guests to select very low
> >> sample rates that the audio subsystem doesn't support. The lowest
> >> supported sample rate depends on the audio backend used and in
> >> most cases can be changed with various -audiodev arguments. Until
> >> now, the audio_bug function emits an error message similar to the
> >> following error message
> >>
> >> A bug was just triggered in audio_calloc
> >> Save all your work and restart without audio
> >> I am sorry
> >> Context:
> >> audio_pcm_sw_alloc_resources_out passed invalid arguments to
> >>   audio_calloc
> >> nmemb=3D0 size=3D16 (len=3D0)
> >> audio: Could not allocate buffer for `ac97.po' (0 samples)
> >>
> >> and the audio subsystem continues without sound for the affected
> >> device.
> >>
> >> The fact that the selected sample rate is not supported is not a
> >> guest error. Instead of displaying an error message, the missing
> >> audio support is now logged. Simply continuing without sound is
> >> correct, since the audio stream won't transport anything
> >> reasonable at such high resample ratios anyway.
> >>
> >> The AUD_open_* functions return NULL like before. The opened
> >> audio device will not be registered in the audio subsystem and
> >> consequently the audio frontend callback functions will not be
> >> called. The AUD_read and AUD_write functions return early in this
> >> case. This is necessary because, for example, the Sound Blaster 16
> >> emulation calls AUD_write from the DMA callback function.
> >>
> >> Signed-off-by: Volker R=FCmelin<vr_qemu@t-online.de>
> >> ---
> >>   audio/audio.c          |  1 +
> >>   audio/audio_template.h | 13 +++++++++++++
> >>   2 files changed, 14 insertions(+)
> >>
> >> diff --git a/audio/audio.c b/audio/audio.c
> >> index d849a94a81..f6b420688d 100644
> >> --- a/audio/audio.c
> >> +++ b/audio/audio.c
> >> @@ -31,6 +31,7 @@
> >>   #include "qapi/qobject-input-visitor.h"
> >>   #include "qapi/qapi-visit-audio.h"
> >>   #include "qemu/cutils.h"
> >> +#include "qemu/log.h"
> >>   #include "qemu/module.h"
> >>   #include "qemu/help_option.h"
> >>   #include "sysemu/sysemu.h"
> >> diff --git a/audio/audio_template.h b/audio/audio_template.h
> >> index 720a32e57e..bfa94b4d22 100644
> >> --- a/audio/audio_template.h
> >> +++ b/audio/audio_template.h
> >> @@ -115,6 +115,19 @@ static int glue (audio_pcm_sw_alloc_resources_, T=
YPE) (SW *sw)
> >>   #else
> >>       samples =3D (int64_t)sw->HWBUF->size * sw->ratio >> 32;
> >>   #endif
> >> +    if (samples =3D=3D 0) {
> >> +        HW *hw =3D sw->hw;
> >> +        size_t f_fe_min;
> >> +
> >> +        /* f_fe_min =3D ceil(1 [frames] * f_be [Hz] / size_be [frames=
]) */
> >> +        f_fe_min =3D (hw->info.freq + HWBUF->size - 1) / HWBUF->size;
> >> +        qemu_log_mask(LOG_UNIMP,
> >> +                      AUDIO_CAP ": The guest selected a " NAME " samp=
le rate"
> >> +                      " of %d Hz for %s. Only sample rates >=3D %zu H=
z are"
> >> +                      " supported.\n",
> >> +                      sw->info.freq, sw->name, f_fe_min);
> >> +        return -1;
> > You probably want to `sw->buf =3D NULL;` before returning here, or adju=
st the
> > condition for the error message below.
>=20
> sw->buf is always NULL here. In the audio_pcm_create_voice_pair_*()=20
> functions we have sw =3D audio_calloc(__func__, 1, sizeof(*sw)) (after=20
> patch 08/11 sw =3D g_new0(SW, 1)) and the audio_pcm_sw_free_resources_*()=
=20
> functions also set sw->buf =3D NULL after freeing sw->buf.

OK

> > The other thing that puzzles me, in error case these template functions=
 return
> > -1, which would then be feed to g_malloc*()?
>=20
> Sorry, I can't see where -1 would be fed to g_malloc*().
>=20
> On error the audio_pcm_sw_alloc_resources_*() functions return error=20
> code -1, and that error code propagates up to the AUD_open_*() functions=
=20
> or the audio_pcm_create_voice_pair_*() functions which return NULL.

I thought about patch 7 where you do:

=2D    hw =3D audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
+    hw =3D g_malloc0(glue(drv->voice_size_, TYPE));

But I just realized that it is using audio_pcm_hw_add_new_, which not retur=
ns
a negative value anywhere, so fine as well:

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>=20
> >> +    }
> >>  =20
> >>       sw->buf =3D audio_calloc(__func__, samples, sizeof(struct st_sam=
ple));
> >>       if (!sw->buf) {
> >>
>=20
>=20
>=20




