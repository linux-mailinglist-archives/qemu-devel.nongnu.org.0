Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10569F2F9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhl-0006Lw-Oe; Wed, 22 Feb 2023 05:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhY-0006Gj-3v
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:20 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhU-0000ZE-PX
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:19 -0500
Received: by mail-lj1-x235.google.com with SMTP id b13so8290579ljf.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVpCmAin9tJ8fSiIrlkOeLh9eNaGIkQQ1xPj3tqqbYA=;
 b=dGJ9XKydlK6/SFwYOheU1f93sT75C162pWXaaomiifYY6irdRGja/rsysABdPlMCSh
 VOqiHK3cWwYFthKljZ3Cr3py2oYAkzlnO9Ju8LNtSVomvLl9eQ2CPw6ECBkWkXWER3F+
 g660YOElluqmLOK9JFczltOST9slWxDbLnZ3zo3fAqy3J+uUT5SR/JIJrDNqueerx5b/
 WWhyay7AbQzo0xoJK6Uvrtlk2O2+CGSRDK/wMdBgZsckbnCdfS7tAtl1P3YZRywFfet8
 W83aJbMqhnFzaN8WVd6CKcCDyt3bCQUVJDrCcvVnnkRaFCNwIGbLCUej/xbUCr+GnYBR
 l/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVpCmAin9tJ8fSiIrlkOeLh9eNaGIkQQ1xPj3tqqbYA=;
 b=HAKxH6+00gGpuGg9B6Sj6DwCJ5a44nwqoegufYMCazlS6ZmpwkI4gYsbKuYb37kf8D
 Z1GwWqct0ARrgfC04jQqDYs2U4oL114r/RvsFbkmA+72oGc6VsOceGQ8ravj6He9Kh21
 mGPdauBENNXf50jpxQ72jvTRI5/ozyz+09UdF2yggn1+BTftz1hzmb+MbPw1OHfavLtZ
 UbgQrKVc3G/u76zapB/IuKc6A6HpefPqjwZGoY+hHwU+e1Q7cC/vVnAZ+vMxJR0TMFbQ
 fZupJ6K5AvmBFNDMAM7hkZogBtxEuVzjdAW6Rj4umS1UddHS9DGO6+CbbjNi2e/5IRRf
 rciQ==
X-Gm-Message-State: AO0yUKWKzqNMC3a2Bos4L0XL399PPeOxosGYyAqclp6tO/guKsPajYM3
 g5RRZzMcg0cjtgK6eBasO/sbg/oBoPxYuIOSNXC88eKwjfc=
X-Google-Smtp-Source: AK7set/guWuFG51brb0MlFaY2AywgnqGBaXcF/kQ8wItaivJqRTRBHUdgVRiybLCJ+AGnOI84VU2ppPxRz18cwrizLQ=
X-Received: by 2002:a2e:b4bb:0:b0:294:6f14:2365 with SMTP id
 q27-20020a2eb4bb000000b002946f142365mr2617341ljm.4.1677063015464; Wed, 22 Feb
 2023 02:50:15 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-9-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-9-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:03 +0400
Message-ID: <CAJ+F1CJ-FYXrzXNbDEU_6yOoHJo-36Pe+Dw4H_G72LnRcqVxJQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] audio/mixeng: calculate number of input frames
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi

On Mon, Feb 6, 2023 at 10:52 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Calculate the exact number of audio input frames needed to get
> a given number of audio output frames. The exact number of
> frames depends only on the difference of opos - ipos and the
> number of output frames. When downsampling, this function
> returns the maximum number of input frames needed.
>
> This function will later replace the audio_frontend_frames_out()
> function, which calculates the average number of input frames
> rounded down to the nearest integer.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

We usually introduce functions with their usage, but ok
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/mixeng.c | 36 ++++++++++++++++++++++++++++++++++++
>  audio/mixeng.h |  1 +
>  2 files changed, 37 insertions(+)
>
> diff --git a/audio/mixeng.c b/audio/mixeng.c
> index fe454e0725..6bb3d54f77 100644
> --- a/audio/mixeng.c
> +++ b/audio/mixeng.c
> @@ -440,6 +440,42 @@ void st_rate_stop (void *opaque)
>      g_free (opaque);
>  }
>
> +/**
> + * st_rate_frames_in() - returns the number of frames needed to
> + * get frames_out frames after resampling
> + *
> + * @opaque: pointer to struct rate
> + * @frames_out: number of frames
> + */
> +uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out)
> +{
> +    struct rate *rate =3D opaque;
> +    uint64_t opos_start, opos_end;
> +    uint32_t ipos_start, ipos_end;
> +
> +    if (rate->opos_inc =3D=3D 1ULL << 32) {
> +        return frames_out;
> +    }
> +
> +    if (frames_out) {
> +        opos_start =3D rate->opos;
> +        ipos_start =3D rate->ipos;
> +    } else {
> +        uint64_t offset;
> +
> +        /* add offset =3D ceil(opos_inc) to opos and ipos to avoid an un=
derflow */
> +        offset =3D (rate->opos_inc + (1ULL << 32) - 1) & ~((1ULL << 32) =
- 1);
> +        opos_start =3D rate->opos + offset;
> +        ipos_start =3D rate->ipos + (offset >> 32);
> +    }
> +    /* last frame written was at opos_start - rate->opos_inc */
> +    opos_end =3D opos_start - rate->opos_inc + rate->opos_inc * frames_o=
ut;
> +    ipos_end =3D (opos_end >> 32) + 1;
> +
> +    /* last frame read was at ipos_start - 1 */
> +    return ipos_end + 1 > ipos_start ? ipos_end + 1 - ipos_start : 0;
> +}
> +
>  void mixeng_clear (struct st_sample *buf, int len)
>  {
>      memset (buf, 0, len * sizeof (struct st_sample));
> diff --git a/audio/mixeng.h b/audio/mixeng.h
> index 2dcd6df245..64c1e231cc 100644
> --- a/audio/mixeng.h
> +++ b/audio/mixeng.h
> @@ -52,6 +52,7 @@ void st_rate_flow(void *opaque, st_sample *ibuf, st_sam=
ple *obuf,
>  void st_rate_flow_mix(void *opaque, st_sample *ibuf, st_sample *obuf,
>                        size_t *isamp, size_t *osamp);
>  void st_rate_stop (void *opaque);
> +uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out);
>  void mixeng_clear (struct st_sample *buf, int len);
>  void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume=
 *vol);
>
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

