Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D869F2FB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmi4-00070Z-J0; Wed, 22 Feb 2023 05:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhw-0006ZR-NR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:46 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmht-0000m5-3q
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:43 -0500
Received: by mail-lj1-x233.google.com with SMTP id t14so4603750ljd.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phuLM9ub2oVsAoQaBWssCE1BilCa8rIcu0coBJumMiI=;
 b=W3pmqe/f9p1qOMyjUMpqCxq3Tfjl/PJTIG55I7sdEkB/I4C3NIVRKqJyb0omLZsDxo
 Oto2SmWJQk8E9FZq4L8qAnspY1u/SfKny4c6Jykxe0HiaFCOaPQUl6jqLfkeov5IyCQQ
 e3MiG9dtbE6PvyfNpoalD9XhhDuSv0z2PfmlXoQoc/hjOnqXMNiblCnD00suab2jviw2
 0hEfe8Q/2yPjvAilRNHhgDFsFeLlQmIJN6tCj2NI8QNX8ImacL9QSfR6ZHrqdvcnGIoT
 M21Dim5AYlBAULxm9cMsEzNmjBoVK1YCgfuybRaMhuq68qNoMEg2dyBhYQjNIY/YdOoB
 yN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phuLM9ub2oVsAoQaBWssCE1BilCa8rIcu0coBJumMiI=;
 b=4E6UiSQGPxmkHXDLSuhqobAgCChMXe6TcS/pOrGzge0zr1Xmy2wRjI1lDGgcFoTyHz
 UR2x+A8MuQ92trrDzjOkpv9cB9VF//FxWuYnchYysxS5bBtV0vi1Zk3ApPFY32c1arRz
 I6Bic0nfEgv/vNY/Uwga1dmaF2z5/4zBrMzWdyq5nhSYGeHrM/ypi4eSjCaylFtEvjvv
 JbviyhuZDG87UMXLW9DcC9g/hbllhyewRiPj5cw7Emrb4aC2ZFNFLq0hi6BM01yqwK66
 wM90vLWE83Zuw0RrN1enmJYcgbLkoe9CSFQHGFYlITtZ75AXcR/6ebWJ7bhViqkjGcki
 NIaQ==
X-Gm-Message-State: AO0yUKVI1EDja57/z2fMn6q9/TQNdUhiBIRGN6KKvPoT3g9YKigRJ5nJ
 niIQ5jHOmbEcaBGSODE/nbzpCMfZwWn7lVEDk2A=
X-Google-Smtp-Source: AK7set8yr2Jh6GFdxTmVwt13l+17brZzq6qyFnhcq1MhWTYKF9DtXjdauvUybrhY/BOFNABWu2Czn/tIlHKs+RidLDA=
X-Received: by 2002:a05:651c:2320:b0:295:9a96:a5c7 with SMTP id
 bi32-20020a05651c232000b002959a96a5c7mr292634ljb.4.1677063039513; Wed, 22 Feb
 2023 02:50:39 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-17-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-17-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:26 +0400
Message-ID: <CAJ+F1CLohZf742R3vaYm5cvBDdo-GVrG2-0UVW5Od4o6Os+jrw@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] audio: remove sw->ratio
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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
> Simplify the resample buffer size calculation.
>
> For audio playback we have
> sw->ratio =3D ((int64_t)sw->hw->info.freq << 32) / sw->info.freq;
> samples =3D ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
>
> This can be simplified to
> samples =3D muldiv64(sw->HWBUF.size, sw->info.freq, sw->hw->info.freq);
>
> For audio recording we have
> sw->ratio =3D ((int64_t)sw->info.freq << 32) / sw->hw->info.freq;
> samples =3D (int64_t)sw->HWBUF.size * sw->ratio >> 32;
>
> This can be simplified to
> samples =3D muldiv64(sw->HWBUF.size, sw->info.freq, sw->hw->info.freq);
>
> With hw =3D sw->hw this becomes in both cases
> samples =3D muldiv64(HWBUF.size, sw->info.freq, hw->info.freq);
>
> Now that sw->ratio is no longer needed, remove sw->ratio.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c          |  1 -
>  audio/audio_int.h      |  2 --
>  audio/audio_template.h | 30 +++++++++---------------------
>  3 files changed, 9 insertions(+), 24 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 4836ab8ca8..70b096713c 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -478,7 +478,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
>          sw->info =3D hw->info;
>          sw->empty =3D 1;
>          sw->active =3D hw->enabled;
> -        sw->ratio =3D ((int64_t) hw_cap->info.freq << 32) / sw->info.fre=
q;
>          sw->vol =3D nominal_volume;
>          sw->rate =3D st_rate_start (sw->info.freq, hw_cap->info.freq);
>          QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 8b163e1759..d51d63f08d 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -108,7 +108,6 @@ struct SWVoiceOut {
>      AudioState *s;
>      struct audio_pcm_info info;
>      t_sample *conv;
> -    int64_t ratio;
>      STSampleBuffer resample_buf;
>      void *rate;
>      size_t total_hw_samples_mixed;
> @@ -126,7 +125,6 @@ struct SWVoiceIn {
>      AudioState *s;
>      int active;
>      struct audio_pcm_info info;
> -    int64_t ratio;
>      void *rate;
>      size_t total_hw_samples_acquired;
>      STSampleBuffer resample_buf;
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 7e116426c7..e42326c20d 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -108,32 +108,23 @@ static void glue (audio_pcm_sw_free_resources_, TYP=
E) (SW *sw)
>  static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>  {
>      HW *hw =3D sw->hw;
> -    int samples;
> +    uint64_t samples;
>
>      if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
>          return 0;
>      }
>
> -#ifdef DAC
> -    samples =3D ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
> -#else
> -    samples =3D (int64_t)sw->HWBUF.size * sw->ratio >> 32;
> -#endif
> -    if (audio_bug(__func__, samples < 0)) {
> -        dolog("Can not allocate buffer for `%s' (%d samples)\n",
> -              SW_NAME(sw), samples);
> -        return -1;
> -    }
> -
> +    samples =3D muldiv64(HWBUF.size, sw->info.freq, hw->info.freq);
>      if (samples =3D=3D 0) {
> -        size_t f_fe_min;
> +        uint64_t f_fe_min;
> +        uint64_t f_be =3D (uint32_t)hw->info.freq;
>
>          /* f_fe_min =3D ceil(1 [frames] * f_be [Hz] / size_be [frames]) =
*/
> -        f_fe_min =3D (hw->info.freq + HWBUF.size - 1) / HWBUF.size;
> +        f_fe_min =3D (f_be + HWBUF.size - 1) / HWBUF.size;
>          qemu_log_mask(LOG_UNIMP,
>                        AUDIO_CAP ": The guest selected a " NAME " sample =
rate"
> -                      " of %d Hz for %s. Only sample rates >=3D %zu Hz a=
re"
> -                      " supported.\n",
> +                      " of %d Hz for %s. Only sample rates >=3D %" PRIu6=
4 " Hz"
> +                      " are supported.\n",
>                        sw->info.freq, sw->name, f_fe_min);
>          return -1;
>      }
> @@ -141,9 +132,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>      /*
>       * Allocate one additional audio frame that is needed for upsampling
>       * if the resample buffer size is small. For large buffer sizes take
> -     * care of overflows.
> +     * care of overflows and truncation.
>       */
> -    samples =3D samples < INT_MAX ? samples + 1 : INT_MAX;
> +    samples =3D samples < SIZE_MAX ? samples + 1 : SIZE_MAX;
>      sw->resample_buf.buffer =3D g_new0(st_sample, samples);
>      sw->resample_buf.size =3D samples;
>      sw->resample_buf.pos =3D 0;
> @@ -170,11 +161,8 @@ static int glue (audio_pcm_sw_init_, TYPE) (
>      sw->hw =3D hw;
>      sw->active =3D 0;
>  #ifdef DAC
> -    sw->ratio =3D ((int64_t) sw->hw->info.freq << 32) / sw->info.freq;
>      sw->total_hw_samples_mixed =3D 0;
>      sw->empty =3D 1;
> -#else
> -    sw->ratio =3D ((int64_t) sw->info.freq << 32) / sw->hw->info.freq;
>  #endif
>
>      if (sw->info.is_float) {
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

