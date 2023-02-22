Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40F69F2F1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhF-0006C4-Et; Wed, 22 Feb 2023 05:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhD-0006BV-1n
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:59 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhB-0000LI-BX
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:58 -0500
Received: by mail-lj1-x234.google.com with SMTP id h3so1282284lja.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hs58NAJ59jbIOYsmbwbYY1DETBU6nBe6ta0JvC6qkqs=;
 b=bNRAkIYKk9JbxYlqfqi+5heO51xVkIs1NcTc/sVoy3ho3Xe3WQWgcm0JmqbqjmLjVa
 vsxy/nnFQEkSg0mrJQc/lfD3vNPyo5NLQOCeMPaqdi0/2ufOuSRzwZnFbv81ABGepu4j
 8gRarAfpF2Gf53OypInzOGsobatddlqlUbF1wRWW/W/+qwnfOfbp/enoooaz/3mzbwqp
 wrN0NOASbfdX1CJUIUZFtUbyuygySYv0q9qR5m3gv9MGO/VuR9/sKF7DXG5Sv6RB+i8C
 8eI96JZ2NCWVWD/1MZoWYxEixtU2GaiNrjTM/luZDxA8gRlBKOoTON/j0gwGhl3reTzJ
 QHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hs58NAJ59jbIOYsmbwbYY1DETBU6nBe6ta0JvC6qkqs=;
 b=qbNkvtlo0eFZtNzoQxQNDsMlb1pXNYCUebC+QYhbEZ1pU4zHFay6BkJPj5xAsIpcgH
 oOiEV15VeUM2W/YPS81Sm/QXOHqZdm280evBdnP0ZnB3G6xYFFGy8K+BRAbZX4ctxa/j
 k4qWR7ipmlTHviGM/yUwsJuWMJQuo1gKL1RP+0IQK/lIILjDC33ZzyrOUlLeN5qIyX8D
 BXXzKsMI4vOne+g0Esa9bLvrlRHpFPIbot1EBed3Bv375G9E0UtdBJgV7X/5ytDmf8qh
 XSQjzrIsjEaeCHmth/LFuaU0JivwNgWcNVp3ScIx32HC0ZM4AzyKJPBgIy8qmTbjEoM1
 /TgQ==
X-Gm-Message-State: AO0yUKWCH4x0qI6QmJFeQX10VFaGxNwTS1xD9hEiTh8w+56Csu/Wy0wM
 +cypRktaIpEFouRpBpwB7eXgNwrQ3wiuY2bWQys=
X-Google-Smtp-Source: AK7set9Q6urt4EmbR9Guw+iIW47/JgBO8Wrhg8hTPO/vy+TSNOjuTMlk8CNglyDHghtS6roGM3R6ojFC6OvzEaFh7rY=
X-Received: by 2002:a2e:b538:0:b0:293:2d7e:acd8 with SMTP id
 z24-20020a2eb538000000b002932d7eacd8mr2556954ljm.4.1677062995488; Wed, 22 Feb
 2023 02:49:55 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-4-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-4-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:42 +0400
Message-ID: <CAJ+F1C+oee5XoJRhVpZpwahaaBanca3sVGfux7Gtn2BvmAOXsQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] audio: replace the resampling loop in
 audio_pcm_sw_write()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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
> Replace the resampling loop in audio_pcm_sw_write() with the new
> function audio_pcm_sw_resample_out(). Unlike the old resample
> loop the new function will try to consume input frames even if
> the output buffer is full. This is necessary when downsampling
> to avoid reading less audio frames than calculated in advance.
> The loop was unrolled to avoid complicated loop control conditions
> in this case.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

lgtm
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 63 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 27 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index a399147486..4412b5fad8 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -673,11 +673,44 @@ static void audio_pcm_hw_clip_out(HWVoiceOut *hw, v=
oid *pcm_buf, size_t len)
>  /*
>   * Soft voice (playback)
>   */
> +static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
> +    size_t frames_in_max, size_t frames_out_max,
> +    size_t *total_in, size_t *total_out)
> +{
> +    HWVoiceOut *hw =3D sw->hw;
> +    struct st_sample *src, *dst;
> +    size_t live, wpos, frames_in, frames_out;
> +
> +    live =3D sw->total_hw_samples_mixed;
> +    wpos =3D (hw->mix_buf.pos + live) % hw->mix_buf.size;
> +
> +    /* write to mix_buf from wpos to end of buffer */
> +    src =3D sw->resample_buf.buffer;
> +    frames_in =3D frames_in_max;
> +    dst =3D hw->mix_buf.buffer + wpos;
> +    frames_out =3D MIN(frames_out_max, hw->mix_buf.size - wpos);
> +    st_rate_flow_mix(sw->rate, src, dst, &frames_in, &frames_out);
> +    wpos +=3D frames_out;
> +    *total_in =3D frames_in;
> +    *total_out =3D frames_out;
> +
> +    /* write to mix_buf from start of buffer if there are input frames l=
eft */
> +    if (frames_in_max - frames_in > 0 && wpos =3D=3D hw->mix_buf.size) {
> +        src +=3D frames_in;
> +        frames_in =3D frames_in_max - frames_in;
> +        dst =3D hw->mix_buf.buffer;
> +        frames_out =3D frames_out_max - frames_out;
> +        st_rate_flow_mix(sw->rate, src, dst, &frames_in, &frames_out);
> +        *total_in +=3D frames_in;
> +        *total_out +=3D frames_out;
> +    }
> +}
> +
>  static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
>  {
> -    size_t hwsamples, samples, isamp, osamp, wpos, live, dead, left, blc=
k;
> +    size_t hwsamples, samples, live, dead;
>      size_t hw_free;
> -    size_t ret =3D 0, pos =3D 0, total =3D 0;
> +    size_t ret, total;
>
>      if (!sw) {
>          return size;
> @@ -698,8 +731,6 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void=
 *buf, size_t size)
>          return 0;
>      }
>
> -    wpos =3D (sw->hw->mix_buf.pos + live) % hwsamples;
> -
>      dead =3D hwsamples - live;
>      hw_free =3D audio_pcm_hw_get_free(sw->hw);
>      hw_free =3D hw_free > live ? hw_free - live : 0;
> @@ -713,29 +744,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, voi=
d *buf, size_t size)
>          }
>      }
>
> -    while (samples) {
> -        dead =3D hwsamples - live;
> -        left =3D hwsamples - wpos;
> -        blck =3D MIN (dead, left);
> -        if (!blck) {
> -            break;
> -        }
> -        isamp =3D samples;
> -        osamp =3D blck;
> -        st_rate_flow_mix (
> -            sw->rate,
> -            sw->resample_buf.buffer + pos,
> -            sw->hw->mix_buf.buffer + wpos,
> -            &isamp,
> -            &osamp
> -            );
> -        ret +=3D isamp;
> -        samples -=3D isamp;
> -        pos +=3D isamp;
> -        live +=3D osamp;
> -        wpos =3D (wpos + osamp) % hwsamples;
> -        total +=3D osamp;
> -    }
> +    audio_pcm_sw_resample_out(sw, samples, MIN(dead, hw_free), &ret, &to=
tal);
>
>      sw->total_hw_samples_mixed +=3D total;
>      sw->empty =3D sw->total_hw_samples_mixed =3D=3D 0;
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

