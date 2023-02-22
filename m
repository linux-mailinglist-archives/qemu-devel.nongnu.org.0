Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F869F2F6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmh7-0006As-MG; Wed, 22 Feb 2023 05:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmh4-0006A6-2S
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:50 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmh1-0000K9-Rb
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:49 -0500
Received: by mail-lf1-x12f.google.com with SMTP id f18so9465055lfa.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEX4uYQ2JnMsIZeku0S1olZm9VLKewoVx5f5dy212vk=;
 b=n1ZVVKNhYaXfmvqB75BpjOn7bhgoZthMXQSxen9IkZaGor264Y9BfA2EqjIaVilDh+
 cpqw3n7DHW4LOYiP4lTN/oKv496SRqjJ4r3j7iHejZIAH7WzEF5XreBw/1sJbglgOgf4
 p8T2ZqX+2tLeXbvXqYWnTUVQue+xsG6GyJMoS8NLDXlogMne01P16wLMI1+YYLfB6/fc
 XNu+shE5If1GzefrF7lN7kSSGqkmHXihqqAKVkbAIqEKEsYY6zRav/W8AMLS8Zelx+aQ
 1+DsRDpGscBui9bG1sYuePoAFNNMItOUPb/KeTncHlGKpwjk+mCqmx6qbpsi6YXDN6eX
 S2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEX4uYQ2JnMsIZeku0S1olZm9VLKewoVx5f5dy212vk=;
 b=Bdgrkd5G3kUpDbnoX7gYe5dhl6cie/Bvx6K3Kob22E9IMyKSNed+2WhmtPBbzQWAWG
 Yf9HlOLsRmpmuHX5xTVppV74tva1ttD6iONFVmdcehcP+EHX6mdpE0c31J9kG0YTNSlw
 aH0LZveQpWr68aVMCKAy50n/4magZEhvFRLVnfo5+mhCg5a+zzvQ6Fm46QQ31f4rT5rt
 TSiy0CFBu3ldlFSzW2A5UIx6va9xaEz190pPl5Eu6HeOHL8YyvQoPP9rdR/hhNKv+pbp
 RIqB7xXP48wulewGyHFZZM6DzQpHrJF5OFZGMmQfYbNTdBFwqniN9JNRBXOifjBsFZNA
 4ovA==
X-Gm-Message-State: AO0yUKUaYcLGlNdqF0ZMZTTGPgkM3GWtxsZeWf73ZTOTrGD+97kspdUx
 CWz+As+rwuvzUkjMCsZK0yuClEwznTb8ZXLgoN4=
X-Google-Smtp-Source: AK7set/lOtOCrAG93eq2pFR1txU6OorgQGULd9UqQ5vYgMyemN2KZuw0ueLan18KiAzWlD1YSZcX1pSIhwHlCrVH+ko=
X-Received: by 2002:a05:6512:4c8:b0:4db:1ae1:318b with SMTP id
 w8-20020a05651204c800b004db1ae1318bmr2572464lfq.5.1677062985778; Wed, 22 Feb
 2023 02:49:45 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-2-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-2-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:32 +0400
Message-ID: <CAJ+F1C+sy82oG8WqJcuHBhr2j-z0qvmBZaSuKDMQRCR1jXP8uA@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] audio: change type and name of the resample
 buffer
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

On Mon, Feb 6, 2023 at 10:52 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Change the type of the resample buffer from struct st_sample *
> to STSampleBuffer. Also change the name from buf to resample_buf
> for better readability.
>
> The new variables resample_buf.size and resample_buf.pos will be
> used after the next patches. There is no functional change.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  audio/audio.c          | 15 ++++++++-------
>  audio/audio_int.h      |  4 ++--
>  audio/audio_template.h | 10 ++++++----
>  3 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index a0b54e4a2e..a399147486 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -555,7 +555,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *=
buf, size_t size)
>  {
>      HWVoiceIn *hw =3D sw->hw;
>      size_t samples, live, ret =3D 0, swlim, isamp, osamp, rpos, total =
=3D 0;
> -    struct st_sample *src, *dst =3D sw->buf;
> +    struct st_sample *src, *dst =3D sw->resample_buf.buffer;
>
>      live =3D hw->total_samples_captured - sw->total_hw_samples_acquired;
>      if (!live) {
> @@ -595,10 +595,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t size)
>      }
>
>      if (!hw->pcm_ops->volume_in) {
> -        mixeng_volume (sw->buf, ret, &sw->vol);
> +        mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
>      }
>
> -    sw->clip (buf, sw->buf, ret);
> +    sw->clip(buf, sw->resample_buf.buffer, ret);
>      sw->total_hw_samples_acquired +=3D total;
>      return ret * sw->info.bytes_per_frame;
>  }
> @@ -706,10 +706,10 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, vo=
id *buf, size_t size)
>      samples =3D ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
>      samples =3D MIN(samples, size / sw->info.bytes_per_frame);
>      if (samples) {
> -        sw->conv(sw->buf, buf, samples);
> +        sw->conv(sw->resample_buf.buffer, buf, samples);
>
>          if (!sw->hw->pcm_ops->volume_out) {
> -            mixeng_volume(sw->buf, samples, &sw->vol);
> +            mixeng_volume(sw->resample_buf.buffer, samples, &sw->vol);
>          }
>      }
>
> @@ -724,7 +724,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void=
 *buf, size_t size)
>          osamp =3D blck;
>          st_rate_flow_mix (
>              sw->rate,
> -            sw->buf + pos,
> +            sw->resample_buf.buffer + pos,
>              sw->hw->mix_buf.buffer + wpos,
>              &isamp,
>              &osamp
> @@ -1061,7 +1061,8 @@ static void audio_capture_mix_and_clear(HWVoiceOut =
*hw, size_t rpos,
>                  size_t bytes =3D to_write * hw->info.bytes_per_frame;
>                  size_t written;
>
> -                sw->buf =3D hw->mix_buf.buffer + rpos2;
> +                sw->resample_buf.buffer =3D hw->mix_buf.buffer + rpos2;
> +                sw->resample_buf.size =3D to_write;
>                  written =3D audio_pcm_sw_write (sw, NULL, bytes);
>                  if (written - bytes) {
>                      dolog("Could not mix %zu bytes into a capture "
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 061845dcc2..8b163e1759 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -109,7 +109,7 @@ struct SWVoiceOut {
>      struct audio_pcm_info info;
>      t_sample *conv;
>      int64_t ratio;
> -    struct st_sample *buf;
> +    STSampleBuffer resample_buf;
>      void *rate;
>      size_t total_hw_samples_mixed;
>      int active;
> @@ -129,7 +129,7 @@ struct SWVoiceIn {
>      int64_t ratio;
>      void *rate;
>      size_t total_hw_samples_acquired;
> -    struct st_sample *buf;
> +    STSampleBuffer resample_buf;
>      f_sample *clip;
>      HWVoiceIn *hw;
>      char *name;
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index dd87170cbd..a0b653f52c 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -95,13 +95,13 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)=
(HW *hw)
>
>  static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
>  {
> -    g_free (sw->buf);
> +    g_free(sw->resample_buf.buffer);
> +    sw->resample_buf.buffer =3D NULL;
> +    sw->resample_buf.size =3D 0;
>
>      if (sw->rate) {
>          st_rate_stop (sw->rate);
>      }
> -
> -    sw->buf =3D NULL;
>      sw->rate =3D NULL;
>  }
>
> @@ -138,7 +138,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>          return -1;
>      }
>
> -    sw->buf =3D g_new0(st_sample, samples);
> +    sw->resample_buf.buffer =3D g_new0(st_sample, samples);
> +    sw->resample_buf.size =3D samples;
> +    sw->resample_buf.pos =3D 0;
>
>  #ifdef DAC
>      sw->rate =3D st_rate_start (sw->info.freq, sw->hw->info.freq);
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

