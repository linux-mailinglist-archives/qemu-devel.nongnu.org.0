Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DB69F2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhq-0006Td-3e; Wed, 22 Feb 2023 05:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhn-0006Sq-HR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:35 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhl-0000kB-OV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:35 -0500
Received: by mail-lf1-x12e.google.com with SMTP id n2so6185115lfb.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHu1mnMXxR7pE6zGW6WBBXUatz8QXz+1vxwkS4H54kQ=;
 b=mqRQVM27s7a0xI2TdUaT3YAEUWWFqwuJJo2WuW235+dTy2H1jQ9ss8ilS9nk48ZtO3
 6Bl4wnVP0jfgUrGzARWcaNcvhyERSM184zPh3ryvTJHykHJfoIe+ZKLni8razsAScm28
 YBF+iEKN0iX03lRnG2MlfU5+o0DeKQeVkoDZ3Wn4kqgmqGRAbzj7sMiuasDoPnf+arjZ
 qWi2XQENg3Pp+RKuvURYnGga2FodXy8K29NbAVB3LXqVh3RmLTiILVKaU6Juqu3xAl6f
 5I2EdKKBLe1YCz+jLXgQQ6G/ltzWQkd7ufukyxcnY+x9icN9B77KLScUWsWP5kUcT4T5
 4OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHu1mnMXxR7pE6zGW6WBBXUatz8QXz+1vxwkS4H54kQ=;
 b=SUP2gG/OVQ/QwgXHlBi5+Vq6LN/SxQ3erOZC0zty3Bi0C1kSBZ+vo1w0bXY0ZJ7Hke
 9Sa0aSYTTsNdyFC2Vkif4Jd3CTZxtsYGyb/XxYz91q2c2ri8ch2Tleo6wdWWV9avqniv
 Bvdc8rI+j2ZsidfAHs4+QxLVYwmLAJbPSLvAKfwLDgsY8RAHZpzHwISFpsB7HwE+F0Ht
 77bZoEOJhXH8lOXk84TGZg7DEBfNMfaVhncbThSmPLJKXue+c77iUCRCPJw6xtcVBETI
 /TmqUHaFNx5GXBR8RHBa3axa1Gi4m9iu/ItX2p3MxghKYNeJBlEYMnDkWfpSsS2/7yir
 Aubg==
X-Gm-Message-State: AO0yUKXSDYHEFZBU0V+VmQK55bJSZR1Xgb2RvjnpxMIN6cCUQXM907la
 PNSzTjMcMjfV4MVVAqPfc+Eh3/FD9qMJ0i7gYkg=
X-Google-Smtp-Source: AK7set9VzYmUThCfXSoNsBmRo8IFCycl/gqpwMmFKb03ygRXGycw//8DaW+2AnrFYgbVRMbXwfRI7KoZMxZyKuBjZac=
X-Received: by 2002:a19:c208:0:b0:4d9:8773:7d6c with SMTP id
 l8-20020a19c208000000b004d987737d6cmr2733553lfc.5.1677063032185; Wed, 22 Feb
 2023 02:50:32 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-15-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-15-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:19 +0400
Message-ID: <CAJ+F1CL+w+V8w=etysJzAAmuRsVowE_P5eJsP9bs78D1j-Pagw@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] audio: handle leftover audio frame from
 upsampling
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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
> Upsampling may leave one remaining audio frame in the input
> buffer. The emulated audio playback devices are currently
> resposible to write this audio frame again in the next write
> cycle. Push that task down to audio_pcm_sw_write.
>
> This is another step towards an audio callback interface that
> guarantees that when audio frontends are told they can write
> n audio frames, they can actually do so.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c          | 34 ++++++++++++++++++++++++++++------
>  audio/audio_template.h |  6 ++++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index dad17e59b8..4836ab8ca8 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -731,16 +731,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, vo=
id *buf, size_t buf_len)
>      hw_free =3D hw_free > live ? hw_free - live : 0;
>      frames_out_max =3D MIN(dead, hw_free);
>      sw_max =3D st_rate_frames_in(sw->rate, frames_out_max);
> -    fe_max =3D MIN(buf_len / sw->info.bytes_per_frame, sw->resample_buf.=
size);
> +    fe_max =3D MIN(buf_len / sw->info.bytes_per_frame + sw->resample_buf=
.pos,
> +                 sw->resample_buf.size);
>      frames_in_max =3D MIN(sw_max, fe_max);
>
>      if (!frames_in_max) {
>          return 0;
>      }
>
> -    sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
> -    if (!sw->hw->pcm_ops->volume_out) {
> -        mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
> +    if (frames_in_max > sw->resample_buf.pos) {
> +        sw->conv(sw->resample_buf.buffer + sw->resample_buf.pos,
> +                 buf, frames_in_max - sw->resample_buf.pos);
> +        if (!sw->hw->pcm_ops->volume_out) {
> +            mixeng_volume(sw->resample_buf.buffer + sw->resample_buf.pos=
,
> +                          frames_in_max - sw->resample_buf.pos, &sw->vol=
);
> +        }
>      }
>
>      audio_pcm_sw_resample_out(sw, frames_in_max, frames_out_max,
> @@ -749,6 +754,22 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, voi=
d *buf, size_t buf_len)
>      sw->total_hw_samples_mixed +=3D total_out;
>      sw->empty =3D sw->total_hw_samples_mixed =3D=3D 0;
>
> +    /*
> +     * Upsampling may leave one audio frame in the resample buffer. Decr=
ement
> +     * total_in by one if there was a leftover frame from the previous r=
esample
> +     * pass in the resample buffer. Increment total_in by one if the cur=
rent
> +     * resample pass left one frame in the resample buffer.
> +     */
> +    if (frames_in_max - total_in =3D=3D 1) {
> +        /* copy one leftover audio frame to the beginning of the buffer =
*/
> +        *sw->resample_buf.buffer =3D *(sw->resample_buf.buffer + total_i=
n);
> +        total_in +=3D 1 - sw->resample_buf.pos;
> +        sw->resample_buf.pos =3D 1;
> +    } else if (total_in >=3D sw->resample_buf.pos) {
> +        total_in -=3D sw->resample_buf.pos;
> +        sw->resample_buf.pos =3D 0;
> +    }
> +
>  #ifdef DEBUG_OUT
>      dolog (
>          "%s: write size %zu written %zu total mixed %zu\n",
> @@ -1155,8 +1176,9 @@ static void audio_run_out (AudioState *s)
>                  } else {
>                      free =3D 0;
>                  }
> -                if (free > 0) {
> -                    free =3D MIN(free, sw->resample_buf.size);
> +                if (free > sw->resample_buf.pos) {
> +                    free =3D MIN(free, sw->resample_buf.size)
> +                           - sw->resample_buf.pos;
>                      sw->callback.fn(sw->callback.opaque,
>                                      free * sw->info.bytes_per_frame);
>                  }
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index a0b653f52c..0d8aab6fad 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -138,6 +138,12 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE=
) (SW *sw)
>          return -1;
>      }
>
> +    /*
> +     * Allocate one additional audio frame that is needed for upsampling
> +     * if the resample buffer size is small. For large buffer sizes take
> +     * care of overflows.
> +     */
> +    samples =3D samples < INT_MAX ? samples + 1 : INT_MAX;
>      sw->resample_buf.buffer =3D g_new0(st_sample, samples);
>      sw->resample_buf.size =3D samples;
>      sw->resample_buf.pos =3D 0;
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

