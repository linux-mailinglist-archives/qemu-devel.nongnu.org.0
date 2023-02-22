Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19169F304
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhn-0006SV-Rn; Wed, 22 Feb 2023 05:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhh-0006Lm-OW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:29 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhg-0000im-4w
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:29 -0500
Received: by mail-lj1-x22b.google.com with SMTP id h9so7221264ljq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUSCbDCt4cJYv612KeAqyuv8q6v6Z3tEzSlReBytZnk=;
 b=Tqy5JbLQ5ngMbFk2LCUxwVuIjlyI61/KrbRYOXIwZkAqvojfW/+wVcImzzyy66QyqZ
 JrAz3JemsXX4634zWQ+bPwxykWRzGiQdflVAxsXlVE9FaQPYoEzNy+mxjeg7Rerv401x
 CoHJuJRbNX9MDIemxmLXPZum6mi1/XEzm4gPfIVbztmhI+Nd0uT6cZTS8HoBnNxemPGD
 u0u7uDmSgwVm7pX4VxGKxqNZ30y6IvYl/6vMlxHEfSWPucNeDHyeRCpFp1OrvWri8SaR
 EVJqzHQPjh3zpom93T1Stp2JXX+GTrfJIlaFxT626uKKBbukCUmVUiuL8M4jN/FxYjtu
 /C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUSCbDCt4cJYv612KeAqyuv8q6v6Z3tEzSlReBytZnk=;
 b=4H0rgkGZ0Zt14RwZCl77tqxk4qGDU8733+AZEqDV7cfiLil02lTyXTg2rYH/BVriog
 nf4od2X6NYOQgcLhi0yLBM4c1pl+unvQWCI4qPxGwg4JorEyEy46ExNJuVBtqHy8yIET
 +vRfgDB33hNYCJhK7MY9tZso/FeCtCBli3PX6LRs3dwkKQybyDruacf8XxUBZdPMgFWx
 OicIyCk7kyYH+KmY3FzIyfrAyBHbWfKCotDPPNJfIbbZs8B413n8TxaWVWnnCIEAYnOp
 H7HDpVfEjklkejckt9QXItgIq0PrIiG6ZAaR9Nhjfw11wiCJgL7OBMWoKwgVAr2i3wQZ
 lhkA==
X-Gm-Message-State: AO0yUKWR/1sYKpcSB7NDQ5x0Hv3UYp1SlJqifFKc7icf6F+66R/VNEfh
 Ns2tXMO9fuDxyLDc8kPT++/x5zK2C3TTXCc3STk=
X-Google-Smtp-Source: AK7set9Ef6AfXpyVPSBCfLk+7xfrEj9oMQxXYjJhDYdoPMrjAhpIZtDYpWXp1+CU4FNXrslJzuZR5EgngU99+CvECys=
X-Received: by 2002:a05:651c:2005:b0:294:6de5:e638 with SMTP id
 s5-20020a05651c200500b002946de5e638mr2572664ljo.4.1677063025845; Wed, 22 Feb
 2023 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-12-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-12-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:13 +0400
Message-ID: <CAJ+F1C+4EXBWxwAYdVhmuvgA6Q2fXwbg4GMyGQ5sueXdCoV5uQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] audio: rename variables in audio_pcm_sw_read()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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
> The audio_pcm_sw_read() function uses a few very unspecific
> variable names. Rename them for better readability.
>
> ret =3D> total_out
> total =3D> total_in
> size =3D> buf_len
> samples =3D> frames_out_max
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 9e9c03a42e..22c36d6660 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -576,10 +576,10 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
>      }
>  }
>
> -static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
> +static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len=
)
>  {
>      HWVoiceIn *hw =3D sw->hw;
> -    size_t samples, live, ret, swlim, total;
> +    size_t live, frames_out_max, swlim, total_in, total_out;
>
>      live =3D hw->total_samples_captured - sw->total_hw_samples_acquired;
>      if (!live) {
> @@ -590,20 +590,20 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t size)
>          return 0;
>      }
>
> -    samples =3D size / sw->info.bytes_per_frame;
> +    frames_out_max =3D buf_len / sw->info.bytes_per_frame;
>
>      swlim =3D (live * sw->ratio) >> 32;
> -    swlim =3D MIN (swlim, samples);
> +    swlim =3D MIN(swlim, frames_out_max);
>
> -    audio_pcm_sw_resample_in(sw, live, swlim, &total, &ret);
> +    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
>
>      if (!hw->pcm_ops->volume_in) {
> -        mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
> +        mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
>      }
> +    sw->clip(buf, sw->resample_buf.buffer, total_out);
>
> -    sw->clip(buf, sw->resample_buf.buffer, ret);
> -    sw->total_hw_samples_acquired +=3D total;
> -    return ret * sw->info.bytes_per_frame;
> +    sw->total_hw_samples_acquired +=3D total_in;
> +    return total_out * sw->info.bytes_per_frame;
>  }
>
>  /*
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

