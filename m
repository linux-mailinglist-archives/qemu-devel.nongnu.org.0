Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E02669F300
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmho-0006TC-EA; Wed, 22 Feb 2023 05:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhk-0006NK-0O
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:32 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhi-0000jU-7e
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:31 -0500
Received: by mail-lf1-x12d.google.com with SMTP id m6so9529264lfq.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMeeGk3vTuDHHiY/4UnGWE21JWe1SWpO2OKTZfDTziY=;
 b=AbZ9Gldco0P3g5j0CkRMpsr7xlZ/KU13i2AmNw21jqq3b1tvJd7v/xh3FYkoI4IR8F
 qlu2cG2DTSuKmUb26riGjm4noLQgKpHzt6MWLYDm8d8Nejgp3kFOWYqvvkycQJ+MLumX
 7wL5Pn9iS73qXcXzVba+Hfhz6/eTxC4bHNPmU8TeJXjHc7yhODWbP/78Pf9kJTKlfUFi
 j4rabrTNk2uactf1tWdNPXO6uReMrwZ++YFg3SlAOJRdfhSbfafZRak6IUVjy122gnft
 7D3iYT0bZGTGoq9F2U18lf3FBNpee8I0FazndkLC0kR4dFfa5IO2SLAMPw8zKW7UgLmi
 z2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tMeeGk3vTuDHHiY/4UnGWE21JWe1SWpO2OKTZfDTziY=;
 b=03Elnl/EN0dqfFU9hmwdb7r/0PR2vRLW6G50ryCdeCVkvNNMKrtEZm72pW8d9HbC8l
 jt1rfrb+MQd/eeZdO/rbX77Tli4mhCLJ7mARr3nDAbWslXVL5SUG1Wwch38tybQvOn+J
 I7gBweZwKXtKNLQw66VZc8ix0gH6ob+AE97kpWltizNPlmsF+BpgErO1FYnbHZ/m+IGa
 jVXxZNJB8b/BloPhiOEXbTCWo8HTOq/mTewKUABWBS2y00VtFc6z9Om7NrT++WbQXmw7
 HzwyDr1FOjOxbNhmVw85o2qZR4yqWG/kSaJQRA1phZQQ/J3IlOAMElUGJc6jFTPDB1E6
 OgmA==
X-Gm-Message-State: AO0yUKUezm0Jc1Vbetgb+bpUF1tn1EtgAPxDskgcKL6wocr3QXuD2nCW
 PXf7Cg5ozYaP3KVzqPoxf0IfN5iTHjgGh39/OH8=
X-Google-Smtp-Source: AK7set+wkpWEma5DRjXjrMHt5URdZHDW4glZ2x3GQO+EBklk+llTHWeQH7DgMgUwwWP+zPgg/TbyG0Uq0k0fq8g/l6c=
X-Received: by 2002:ac2:560e:0:b0:4db:1999:67a4 with SMTP id
 v14-20020ac2560e000000b004db199967a4mr2589637lfd.5.1677063028593; Wed, 22 Feb
 2023 02:50:28 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-14-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-14-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:16 +0400
Message-ID: <CAJ+F1CKRP3JaNxiCnXVs0BbyAcayyENg_9z+rbhOfzb8hJaobA@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] audio: wire up st_rate_frames_out()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

On Mon, Feb 6, 2023 at 10:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Wire up the st_rate_frames_out() function and replace
> audio_frontend_frames_in() to make audio packet length
> calculation exact.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Same comments as st_rate_frames_in patches.


> ---
>  audio/audio.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 22c36d6660..dad17e59b8 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -579,7 +579,7 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
>  static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len=
)
>  {
>      HWVoiceIn *hw =3D sw->hw;
> -    size_t live, frames_out_max, swlim, total_in, total_out;
> +    size_t live, frames_out_max, total_in, total_out;
>
>      live =3D hw->total_samples_captured - sw->total_hw_samples_acquired;
>      if (!live) {
> @@ -590,12 +590,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t buf_len)
>          return 0;
>      }
>
> -    frames_out_max =3D buf_len / sw->info.bytes_per_frame;
> +    frames_out_max =3D MIN(buf_len / sw->info.bytes_per_frame,
> +                         sw->resample_buf.size);
>
> -    swlim =3D (live * sw->ratio) >> 32;
> -    swlim =3D MIN(swlim, frames_out_max);
> -
> -    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
> +    audio_pcm_sw_resample_in(sw, live, frames_out_max, &total_in, &total=
_out);
>
>      if (!hw->pcm_ops->volume_in) {
>          mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
> @@ -979,18 +977,6 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
>      }
>  }
>
> -/**
> - * audio_frontend_frames_in() - returns the number of frames the resampl=
ing
> - * code generates from frames_in frames
> - *
> - * @sw: audio recording frontend
> - * @frames_in: number of frames
> - */
> -static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
> -{
> -    return (int64_t)frames_in * sw->ratio >> 32;
> -}
> -
>  static size_t audio_get_avail (SWVoiceIn *sw)
>  {
>      size_t live;
> @@ -1007,9 +993,9 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      }
>
>      ldebug (
> -        "%s: get_avail live %zu frontend frames %zu\n",
> +        "%s: get_avail live %zu frontend frames %u\n",
>          SW_NAME (sw),
> -        live, audio_frontend_frames_in(sw, live)
> +        live, st_rate_frames_out(sw->rate, live)
>          );
>
>      return live;
> @@ -1314,8 +1300,9 @@ static void audio_run_in (AudioState *s)
>                  size_t sw_avail =3D audio_get_avail(sw);
>                  size_t avail;
>
> -                avail =3D audio_frontend_frames_in(sw, sw_avail);
> +                avail =3D st_rate_frames_out(sw->rate, sw_avail);
>                  if (avail > 0) {
> +                    avail =3D MIN(avail, sw->resample_buf.size);
>                      sw->callback.fn(sw->callback.opaque,
>                                      avail * sw->info.bytes_per_frame);
>                  }
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

