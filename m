Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE164D1A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 22:00:17 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlIlE-0005GP-GM
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 16:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hlIjn-0003PM-UI
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 15:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hlIjl-0002pH-Ut
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 15:58:47 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1hlIjl-0002o9-Nr
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 15:58:45 -0400
Received: by mail-wr1-x441.google.com with SMTP id n4so3763954wrs.3
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M18SR3ppwlXdf2Quxs2k7zQhKs/qguAuWaFYsF2rI4U=;
 b=tuUFjT9+sgLGi86EnuQMEJRVosj68tAza3o1gp0QTHUtxu2AhQvyonCRDct0GrlZP4
 fi6YH6VCnTiUO4H0hC2lF1Nd+PUmN7WyT5Zk9awUuuQN4RWf4xMfpVWGIV3BFWmWBfpP
 zLURaJJ7d0ueC0nikVrIDWZvjcDYLKDIIdmfhyXkTY7zuYQSqZAGfxuDSlwolXklay1s
 78E3MJc7Wybk+e16qn49nV4oTTJmy5o393iR6v4SIDA7gtCmZQG8O0BR7y8XYkg0n9gf
 VLhPkgHgBmbEOeOz14zN4OsHabxj05cMCewGGerjaTOk/jgacnAVj9szw2m72x76hviW
 z/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M18SR3ppwlXdf2Quxs2k7zQhKs/qguAuWaFYsF2rI4U=;
 b=DVnC3jcY1HjoWOMNJzENvAUmZJ3vQCNnERsMSO/Xz+qhygOSo/27Q10huuSX8k9HW2
 PJ1UZWQ0p2Vwvjdr69UKVZjHow4UJOS7+8rgiS3y2f8o0rhn+N94y8YRL2iUWNmu8xMd
 UKjc1o/vEvbRMgTWP9EUoe8NdDb4B4lLHK3x1OzrAY8qMRpQjjUgT0oGKt+LlXTGe/u4
 DXP/Fq4YK/LiqqkWno2CMrGEXVXs4WI23XQBZpJmgnNXjvaMBY68UqWj/4AUYSisug5r
 mNAI/NORC0um4wtXOgaq5TXgZI0vvJms9qsNh2s47brYpyLB7y/p3uQgZO0eMRs1IrqB
 KMPw==
X-Gm-Message-State: APjAAAUl1bE+h9V73vlbPOVc6AAVf774ueYHE+YohhVdB/7fDRxck9Sy
 F+D+PwPIEpI+UkPUt8rZVoMZQGmxQEDSyb5wks0=
X-Google-Smtp-Source: APXvYqyS4EXnyRk74O77fbShG0nGWjjOv6Umdue83VD8AnL7EIdJr1yxhlNCBdZQ8f4OWQATitHo6gz06YY/dE0xnq8=
X-Received: by 2002:adf:eac4:: with SMTP id o4mr27043342wrn.290.1562788724826; 
 Wed, 10 Jul 2019 12:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562695780.git.DirtY.iCE.hu@gmail.com>
 <02a720bfd7c6bb09c9cedb505516f07f0b395838.1562695780.git.DirtY.iCE.hu@gmail.com>
In-Reply-To: <02a720bfd7c6bb09c9cedb505516f07f0b395838.1562695780.git.DirtY.iCE.hu@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 10 Jul 2019 23:58:32 +0400
Message-ID: <CAJ+F1CJPZKij3dOKV2EzzW0WSuVqy5iw_s8ky+P4SS3zOYKzrg@mail.gmail.com>
To: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 06/11] paaudio: properly disconnect streams
 in fini_*
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 9, 2019 at 10:53 PM K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.i=
ce.hu@gmail.com> wrote:
>
> Currently this needs a workaround due to bug #247 in pulseaudio.
>
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
> ---
>  audio/paaudio.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/audio/paaudio.c b/audio/paaudio.c
> index 24d98b344a..490bcd770e 100644
> --- a/audio/paaudio.c
> +++ b/audio/paaudio.c
> @@ -685,6 +685,27 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsett=
ings *as, void *drv_opaque)
>      return -1;
>  }
>
> +static void qpa_simple_disconnect(PAConnection *c, pa_stream *stream)
> +{
> +    int err;
> +
> +    pa_threaded_mainloop_lock(c->mainloop);
> +    /*
> +     * wait until actually connects. workaround pa bug #247
> +     * https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/247
> +     */
> +    while (pa_stream_get_state(stream) =3D=3D PA_STREAM_CREATING) {
> +        pa_threaded_mainloop_wait(c->mainloop);
> +    }
> +
> +    err =3D pa_stream_disconnect(stream);
> +    if (err !=3D 0) {
> +        dolog("Failed to dissconnect! err=3D%d\n", err);

disconnect

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> +    }
> +    pa_stream_unref(stream);
> +    pa_threaded_mainloop_unlock(c->mainloop);
> +}
> +
>  static void qpa_fini_out (HWVoiceOut *hw)
>  {
>      void *ret;
> @@ -696,7 +717,7 @@ static void qpa_fini_out (HWVoiceOut *hw)
>      audio_pt_join(&pa->pt, &ret, __func__);
>
>      if (pa->stream) {
> -        pa_stream_unref (pa->stream);
> +        qpa_simple_disconnect(pa->g->conn, pa->stream);
>          pa->stream =3D NULL;
>      }
>
> @@ -716,7 +737,7 @@ static void qpa_fini_in (HWVoiceIn *hw)
>      audio_pt_join(&pa->pt, &ret, __func__);
>
>      if (pa->stream) {
> -        pa_stream_unref (pa->stream);
> +        qpa_simple_disconnect(pa->g->conn, pa->stream);
>          pa->stream =3D NULL;
>      }
>
> --
> 2.22.0
>
>


--
Marc-Andr=C3=A9 Lureau

