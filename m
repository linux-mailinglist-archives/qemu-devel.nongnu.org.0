Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7369F2FE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhm-0006Pn-Jr; Wed, 22 Feb 2023 05:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhf-0006La-Ph
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:28 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhc-0000M5-5X
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:26 -0500
Received: by mail-lj1-x231.google.com with SMTP id f16so7273879ljq.10
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pRJbK22rS8rbLnPEErXBo1oy28BZ/TjV63kf2UAhFY=;
 b=nai/yAX22zyqHSg4oZpJ32oH0v4HL5PIpUXi3kQF2xZkZaf8Mc+HTfEFO/JNWDMjCh
 vcMoJdL7q6FEVddMMmMI50ZNMskVJ7YJAfPRq12kdrTxJHMnfi3i5/lWIEhnmPP1rrYx
 JwvpsCLWnWutxAGbyouIZVboPbCh7QnDvMlefY3+ohhSkjk+HWQZgKSHVIjW9+yc44nV
 CcJAlwASHSDqNOVE7IZKIZ8gMGHc2xEoWuKgGIe4Vj/Wrr4EdpyDpOBQy+MLwvD0SHD8
 Fmpkpd/dVeTlWafW6qIFth5ET8DLu1f3P5JOe5G3MftXk0dUiqMxkr5D7UMPuwDQ9mFz
 NloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pRJbK22rS8rbLnPEErXBo1oy28BZ/TjV63kf2UAhFY=;
 b=z32fJOTAYX4Uk8Y1YKD2mHpFUi/BItCLlbj1EQUWEpqa0KI+QyMlaNIm1FI98fcDBB
 0XgKKVq2RSCeKK3a1ZL55z3Eo5aLM8qcb0iGcNZVrwOLaeuwgLcbRRdoshWpPU+lLfMp
 o8ihXC5xEF6ZLgSHgDFrBcJx0sw2it5NOldpZ0Whyt/j4lQqZpK8HnNu0Xz7hJh01kZD
 UwpsxTpvnenYpsg63Snh+S1MfXaYyBk09iKlgWMm+CfIXr/1yo/LDTfXB6i987HnFxQ7
 B3RVdbalZ6TdeN+BCnykMLux60I1oyELKyOS4dxJHZvzuaqNrPJ6pvJ4iAubb08AAF6F
 /zSg==
X-Gm-Message-State: AO0yUKU0rXHUVPYXXc6KclnUggE8oBk9Ye+neuSAQwhlotAbzrrZ6fFi
 aY3wFmTqQ1NN2V0bkGtVvGyY9FpdbunDcF+aaXY=
X-Google-Smtp-Source: AK7set8x49CME5sFMUWghj/WpMNvnSetDYz7bWpVRa/c/MgrWTQQ9z0nxtLhjJWSFiwnXzzyZkH+z0KZ6O4TTkeOKPM=
X-Received: by 2002:a05:651c:2320:b0:295:9a96:a5c7 with SMTP id
 bi32-20020a05651c232000b002959a96a5c7mr292388ljb.4.1677063023150; Wed, 22 Feb
 2023 02:50:23 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-11-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-11-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:10 +0400
Message-ID: <CAJ+F1CLau-19vm85iyWNrn5o_j9KrJrFsxNjXM46WhS7rnE-Fw@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] audio: replace the resampling loop in
 audio_pcm_sw_read()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

On Mon, Feb 6, 2023 at 10:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Replace the resampling loop in audio_pcm_sw_read() with the new
> function audio_pcm_sw_resample_in(). Unlike the old resample
> loop the new function will try to consume input frames even if
> the output buffer is full. This is necessary when downsampling
> to avoid reading less audio frames than calculated in advance.
> The loop was unrolled to avoid complicated loop control conditions
> in this case.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 59 ++++++++++++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 24 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index e18b5e98c5..9e9c03a42e 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -543,11 +543,43 @@ static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, v=
oid *pcm_buf, size_t samples)
>  /*
>   * Soft voice (capture)
>   */
> +static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
> +    size_t frames_in_max, size_t frames_out_max,
> +    size_t *total_in, size_t *total_out)
> +{
> +    HWVoiceIn *hw =3D sw->hw;
> +    struct st_sample *src, *dst;
> +    size_t live, rpos, frames_in, frames_out;
> +
> +    live =3D hw->total_samples_captured - sw->total_hw_samples_acquired;
> +    rpos =3D audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
> +
> +    /* resample conv_buf from rpos to end of buffer */
> +    src =3D hw->conv_buf.buffer + rpos;
> +    frames_in =3D MIN(frames_in_max, hw->conv_buf.size - rpos);
> +    dst =3D sw->resample_buf.buffer;
> +    frames_out =3D frames_out_max;
> +    st_rate_flow(sw->rate, src, dst, &frames_in, &frames_out);
> +    rpos +=3D frames_in;
> +    *total_in =3D frames_in;
> +    *total_out =3D frames_out;
> +
> +    /* resample conv_buf from start of buffer if there are input frames =
left */
> +    if (frames_in_max - frames_in && rpos =3D=3D hw->conv_buf.size) {
> +        src =3D hw->conv_buf.buffer;
> +        frames_in =3D frames_in_max - frames_in;
> +        dst +=3D frames_out;
> +        frames_out =3D frames_out_max - frames_out;
> +        st_rate_flow(sw->rate, src, dst, &frames_in, &frames_out);
> +        *total_in +=3D frames_in;
> +        *total_out +=3D frames_out;
> +    }
> +}
> +
>  static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
>  {
>      HWVoiceIn *hw =3D sw->hw;
> -    size_t samples, live, ret =3D 0, swlim, isamp, osamp, rpos, total =
=3D 0;
> -    struct st_sample *src, *dst =3D sw->resample_buf.buffer;
> +    size_t samples, live, ret, swlim, total;
>
>      live =3D hw->total_samples_captured - sw->total_hw_samples_acquired;
>      if (!live) {
> @@ -558,33 +590,12 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t size)
>          return 0;
>      }
>
> -    rpos =3D audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
> -
>      samples =3D size / sw->info.bytes_per_frame;
>
>      swlim =3D (live * sw->ratio) >> 32;
>      swlim =3D MIN (swlim, samples);
>
> -    while (swlim) {
> -        src =3D hw->conv_buf.buffer + rpos;
> -        if (hw->conv_buf.pos > rpos) {
> -            isamp =3D hw->conv_buf.pos - rpos;
> -        } else {
> -            isamp =3D hw->conv_buf.size - rpos;
> -        }
> -
> -        if (!isamp) {
> -            break;
> -        }
> -        osamp =3D swlim;
> -
> -        st_rate_flow (sw->rate, src, dst, &isamp, &osamp);
> -        swlim -=3D osamp;
> -        rpos =3D (rpos + isamp) % hw->conv_buf.size;
> -        dst +=3D osamp;
> -        ret +=3D osamp;
> -        total +=3D isamp;
> -    }
> +    audio_pcm_sw_resample_in(sw, live, swlim, &total, &ret);
>
>      if (!hw->pcm_ops->volume_in) {
>          mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

