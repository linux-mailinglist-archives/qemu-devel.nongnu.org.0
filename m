Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BE69F302
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhM-0006Dz-7w; Wed, 22 Feb 2023 05:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhK-0006DY-Ac
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:06 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhI-0000Nr-FV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:05 -0500
Received: by mail-lf1-x12c.google.com with SMTP id s20so9165030lfb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8S0U5V42lAJ1VaUnnI/f4KTWonB/VsLXYMV/tVWy4zI=;
 b=n7gv/zj8PT4ZV75c9mwkFHavFgQq5PJnjdKmvyC3IRM+AwJow4TthAe1P4qINcHPP1
 E4ZKHZY9BvdWFBo2X1LqcQkcTGWIglBZQ4WRwI3tCXg+JaPWefzEeKvzkZ50EWaWYyCO
 LBQJF38S36tyAlN9luwCD5w/IiKEHLX7n+VwzEs6otYyY8PEfA//KQf0OKu3iFsk4vY4
 YeoHAdsrUMz0cEY2ShzwrzSmJAhZ2zEr/S9c9LrJ8cJ6XkocN6684cqW84GmV/Q+B1mQ
 Rt2e8YK7ppIP4PysuCJX+1mBhd1vICWsGwXYZOH86xTzZaRdiSsxPKRSVEGitUn+ANOm
 SueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8S0U5V42lAJ1VaUnnI/f4KTWonB/VsLXYMV/tVWy4zI=;
 b=z7p9x4+NsLTSvO1RiBIlGbsuwFCZMoGP+WMG2C/p34/zEOJfUEYGCTRMq3+WzQTq8k
 sywtd9zoZgmitniYoOb2sah//PghY64PsEq8dfp+GASe1LVeC+lIbTpU6MHfxnI23O65
 layVArrBd8ePp4gHgVdqPeDcHdZAkKTUzowqNsK4w7o0T1SqG84x1h96VZhglCVz4MoG
 44mPqczDluj5uT8HI1NIa/NxFZiYEFucPuOlLzvsIxPCF4WLum4nyvVjmtidjL5sE+gu
 JzqBHTH5fd5iZPrXTBGnlM6q59941roD3xpLSPi7TMAH5+APv+MqO22VD60LD2emv67W
 V03w==
X-Gm-Message-State: AO0yUKW2UAUXeQX5EscPf3eUyO7OftTkWOvohdRca6Fj5saCCweemrBE
 1ODJX6/e04ilf09ZIIwUhkejHjHxmUyjCb5pkzo=
X-Google-Smtp-Source: AK7set+0bZdxFOOmojysPypW/YChbRWzYS+8T3KFHuvkEgCVr/moAeRScvp3tQC+L7ScB1ukUSaVsMCA3w7z2SOjtWw=
X-Received: by 2002:ac2:51da:0:b0:4d5:ca43:7042 with SMTP id
 u26-20020ac251da000000b004d5ca437042mr2627724lfm.5.1677063002729; Wed, 22 Feb
 2023 02:50:02 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-6-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-6-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:50 +0400
Message-ID: <CAJ+F1CLnqy7TjQNUar8qjNJPYtE7Zs89Uv8dMwBKGxr7jyux9A@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] audio: rename variables in audio_pcm_sw_write()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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
> The audio_pcm_sw_write() function uses a lot of very unspecific
> variable names. Rename them for better readability.
>
> ret =3D> total_in
> total =3D> total_out
> size =3D> buf_len
> hwsamples =3D> hw->mix_buf.size
> samples =3D> frames_in_max
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 45 ++++++++++++++++++++++-----------------------
>  1 file changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 8f1c0e77b0..cd10f1ec10 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -706,56 +706,55 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *s=
w,
>      }
>  }
>
> -static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
> +static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_l=
en)
>  {
> -    size_t hwsamples, samples, live, dead;
> -    size_t hw_free;
> -    size_t ret, total;
> -
> -    hwsamples =3D sw->hw->mix_buf.size;
> +    HWVoiceOut *hw =3D sw->hw;
> +    size_t live, dead, hw_free;
> +    size_t frames_in_max, total_in, total_out;
>
>      live =3D sw->total_hw_samples_mixed;
> -    if (audio_bug(__func__, live > hwsamples)) {
> -        dolog("live=3D%zu hw->mix_buf.size=3D%zu\n", live, hwsamples);
> +    if (audio_bug(__func__, live > hw->mix_buf.size)) {
> +        dolog("live=3D%zu hw->mix_buf.size=3D%zu\n", live, hw->mix_buf.s=
ize);
>          return 0;
>      }
>
> -    if (live =3D=3D hwsamples) {
> +    if (live =3D=3D hw->mix_buf.size) {
>  #ifdef DEBUG_OUT
>          dolog ("%s is full %zu\n", sw->name, live);
>  #endif
>          return 0;
>      }
>
> -    dead =3D hwsamples - live;
> -    hw_free =3D audio_pcm_hw_get_free(sw->hw);
> +    dead =3D hw->mix_buf.size - live;
> +    hw_free =3D audio_pcm_hw_get_free(hw);
>      hw_free =3D hw_free > live ? hw_free - live : 0;
> -    samples =3D ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
> -    samples =3D MIN(samples, size / sw->info.bytes_per_frame);
> -    if (samples) {
> -        sw->conv(sw->resample_buf.buffer, buf, samples);
> +    frames_in_max =3D ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
> +    frames_in_max =3D MIN(frames_in_max, buf_len / sw->info.bytes_per_fr=
ame);
> +    if (frames_in_max) {
> +        sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
>
>          if (!sw->hw->pcm_ops->volume_out) {
> -            mixeng_volume(sw->resample_buf.buffer, samples, &sw->vol);
> +            mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->v=
ol);
>          }
>      }
>
> -    audio_pcm_sw_resample_out(sw, samples, MIN(dead, hw_free), &ret, &to=
tal);
> +    audio_pcm_sw_resample_out(sw, frames_in_max, MIN(dead, hw_free),
> +                              &total_in, &total_out);
>
> -    sw->total_hw_samples_mixed +=3D total;
> +    sw->total_hw_samples_mixed +=3D total_out;
>      sw->empty =3D sw->total_hw_samples_mixed =3D=3D 0;
>
>  #ifdef DEBUG_OUT
>      dolog (
> -        "%s: write size %zu ret %zu total sw %zu\n",
> -        SW_NAME (sw),
> -        size / sw->info.bytes_per_frame,
> -        ret,
> +        "%s: write size %zu written %zu total mixed %zu\n",
> +        SW_NAME(sw),
> +        buf_len / sw->info.bytes_per_frame,
> +        total_in,
>          sw->total_hw_samples_mixed
>          );
>  #endif
>
> -    return ret * sw->info.bytes_per_frame;
> +    return total_in * sw->info.bytes_per_frame;
>  }
>
>  #ifdef DEBUG_AUDIO
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

