Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B001369F2FC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhl-0006Ku-NJ; Wed, 22 Feb 2023 05:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmha-0006H6-E5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:22 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhY-0000ZE-GB
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:22 -0500
Received: by mail-lj1-x235.google.com with SMTP id b13so8290808ljf.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6XZl+G4MncGYD34v2pfHhpTsEgc8Dd9oCNBGY+NWdQ=;
 b=NKlz5Zcxx94nZ6ucMT0UexkqSIU0qsnc0JVhK0otBYkWjaiS63e3N9gba8XjhJ5Bzu
 WaA3rZTNdl5PkWGApm5oLhLA7C9nYgshdUI+MqctJAoSH68w9tjw3Lw1vloSsR88drou
 4lGC7vreGTO/8BVtusHrCkFj4qz18y1qsuZlIZyfdKp5CZDWwQJJwlvX2McLl12X849K
 UKC56J5b8q6h0OJDDjy719ylDDPjK0UAk4zUac25coHMd7NenvUYVphiT/bCASaMQFZy
 baoUAWqgSz22xm4cuVbANUMFZPSREqfDm4KVxs41l/rI5elypnj2Imtu7+IAf5diumAH
 u/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6XZl+G4MncGYD34v2pfHhpTsEgc8Dd9oCNBGY+NWdQ=;
 b=viJkav0xd/0iV6ydCx3BBpUJoP+yKKnEV4brbnBDvrSFjA8EpqFb+SPPYL1ekr+NxZ
 G3PsOWGQWR99S9xt0gnAwXAhTRlY7IsqNLfnDbHFWwI1l7emvwHQYjw9wHzWoVukN5Ru
 swaywxEwJZzkBPTlv0mBoXSmuHngFHtvZrJyvvVdJVucPT7kPYQTwr6s4iLuYkvbtYtP
 saGFGRxyFf3RSKDj6nN7i+yrBMEjGwTR4jPQMSbY2Tn/XAx/CskmYDz+Tx7AZBV3s9wN
 +SSHuFr9Y79PaEte5EDGz+rL7egvTNDkTEbd7Z1Fm5kYY852uEGMDGrSXfqJqzGRbEs0
 IlhQ==
X-Gm-Message-State: AO0yUKXq+QSC23cM4wkXDMTTAxuvLJYGElf7gJA/gD1OJIj+4VzsMj5f
 LrZWl1AFLx+vgT40Nm9mzlNwAUh63HzSS6IupDc=
X-Google-Smtp-Source: AK7set/NoUtPhWzm8fXZz38ilT0ZjNbSdlUzpJLgp+6bLE/Ypezkp26BJ41quIYq+t6jY+w2qKHJeProNVgYFXD84Mc=
X-Received: by 2002:a05:651c:2320:b0:295:9a96:a5c7 with SMTP id
 bi32-20020a05651c232000b002959a96a5c7mr292336ljb.4.1677063019810; Wed, 22 Feb
 2023 02:50:19 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-10-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-10-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:06 +0400
Message-ID: <CAJ+F1CJkkPbJRy2JjZaBGo5SvyP+hsm_kAMc5FEMxYpKVw1YoQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] audio: wire up st_rate_frames_in()
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

On Mon, Feb 6, 2023 at 10:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Wire up the st_rate_frames_in() function and replace
> audio_frontend_frames_out() to make audio packet length
> calculation exact. When upsampling, it's still possible that
> the audio frontends can't write the last audio frame. This will
> be fixed later.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

I think you should squash it with the previous patch and detail the
differences of computation (the code comment of the functions should
reflect the change, that would help ;)


> ---
>  audio/audio.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 556696b095..e18b5e98c5 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -701,8 +701,8 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
>  static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_l=
en)
>  {
>      HWVoiceOut *hw =3D sw->hw;
> -    size_t live, dead, hw_free;
> -    size_t frames_in_max, total_in, total_out;
> +    size_t live, dead, hw_free, sw_max, fe_max;
> +    size_t frames_in_max, frames_out_max, total_in, total_out;
>
>      live =3D sw->total_hw_samples_mixed;
>      if (audio_bug(__func__, live > hw->mix_buf.size)) {
> @@ -720,17 +720,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, vo=
id *buf, size_t buf_len)
>      dead =3D hw->mix_buf.size - live;
>      hw_free =3D audio_pcm_hw_get_free(hw);
>      hw_free =3D hw_free > live ? hw_free - live : 0;
> -    frames_in_max =3D ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
> -    frames_in_max =3D MIN(frames_in_max, buf_len / sw->info.bytes_per_fr=
ame);
> -    if (frames_in_max) {
> -        sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
> +    frames_out_max =3D MIN(dead, hw_free);
> +    sw_max =3D st_rate_frames_in(sw->rate, frames_out_max);
> +    fe_max =3D MIN(buf_len / sw->info.bytes_per_frame, sw->resample_buf.=
size);
> +    frames_in_max =3D MIN(sw_max, fe_max);
>
> -        if (!sw->hw->pcm_ops->volume_out) {
> -            mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->v=
ol);
> -        }
> +    if (!frames_in_max) {
> +        return 0;
>      }
>
> -    audio_pcm_sw_resample_out(sw, frames_in_max, MIN(dead, hw_free),
> +    sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
> +    if (!sw->hw->pcm_ops->volume_out) {
> +        mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
> +    }
> +
> +    audio_pcm_sw_resample_out(sw, frames_in_max, frames_out_max,
>                                &total_in, &total_out);
>
>      sw->total_hw_samples_mixed +=3D total_out;
> @@ -1000,18 +1004,6 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      return live;
>  }
>
> -/**
> - * audio_frontend_frames_out() - returns the number of frames needed to
> - * get frames_out frames after resampling
> - *
> - * @sw: audio playback frontend
> - * @frames_out: number of frames
> - */
> -static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_ou=
t)
> -{
> -    return ((int64_t)frames_out << 32) / sw->ratio;
> -}
> -
>  static size_t audio_get_free(SWVoiceOut *sw)
>  {
>      size_t live, dead;
> @@ -1031,8 +1023,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
>      dead =3D sw->hw->mix_buf.size - live;
>
>  #ifdef DEBUG_OUT
> -    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
> -          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
> +    dolog("%s: get_free live %zu dead %zu frontend frames %u\n",
> +          SW_NAME(sw), live, dead, st_rate_frames_in(sw->rate, dead));
>  #endif
>
>      return dead;
> @@ -1161,12 +1153,13 @@ static void audio_run_out (AudioState *s)
>                  size_t free;
>
>                  if (hw_free > sw->total_hw_samples_mixed) {
> -                    free =3D audio_frontend_frames_out(sw,
> +                    free =3D st_rate_frames_in(sw->rate,
>                          MIN(sw_free, hw_free - sw->total_hw_samples_mixe=
d));
>                  } else {
>                      free =3D 0;
>                  }
>                  if (free > 0) {
> +                    free =3D MIN(free, sw->resample_buf.size);
>                      sw->callback.fn(sw->callback.opaque,
>                                      free * sw->info.bytes_per_frame);
>                  }
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

