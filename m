Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE269F2FF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmh4-0006A9-No; Wed, 22 Feb 2023 05:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmh1-00069v-9W
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:47 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmgx-0000JU-O9
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:47 -0500
Received: by mail-lj1-x229.google.com with SMTP id y14so200336ljq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jP0kiHi9GQJ4r4rL8jSSCegm0/MlNS4jdTuqo4vddxU=;
 b=APmaFNpAl0LQclj4dXDa+KeJ+c1FSUFIeoCvHQye4tlTPumRW38L8QjzJO5o0OQoFP
 M/bAfrvNDypF6PE0JRYAuxBKCGVdSwmkpdWMFcAig4LzNLS/bXH8/vHxeG4+GxVjXOB8
 lVojB9nUvz9uKTDIhZMJxd/tyt36CWzXRzzVwg0nuF/5qaSAVyv2ybKn4HuVN2gPfxpT
 DwfywbEzc4xrU4qFXo4XqsC5R1Kxb+1pidR025hAlJAYGwFu6vw+NCcUicBKoEUipco/
 0KxSJNiV9/zWE3K8OGgNUsF28WVFIDkWzPiYrZIH/u97kkPa+2qcMbMqU28tr4yTCf8t
 QIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jP0kiHi9GQJ4r4rL8jSSCegm0/MlNS4jdTuqo4vddxU=;
 b=GG+ZSsiIYeioUCGk2Krd31a46PTrhhQj8JXky7SKioKt5IBNva8x8UhvdjeVT3WY69
 lnisE9nZR99+KTnp0K/TAwWIAZTclEB3MHLDXm/Mq79RmV+kE/rkkwcORvc11r2QHgaH
 +khZFQphz9bydtxTDRfhvGLmlUbG5jVGekDanAYSY/RV5GvKjhWwU6NFuN1+DYW1Tubl
 gF4DEef7Rj0ysrvwS4gWNjj6TSAMiiV+4fH2N3Cw6QkNOBVl+7HMLNQZyjD/6va1sLhK
 AddXisgvhinCnlofLWao1Pm1jGhFmNdqITTdcb5B4iHXcgGTW0eShttR3QRDkAqMczMc
 LYWA==
X-Gm-Message-State: AO0yUKXgsjX1Jc7APxvkwz1stzLVfsgHb+S2OOnIdCRMdayzdGEBGITJ
 ptAVItneZAyO2YLAxpkTtYgRcexo5pNjYBN/ct8=
X-Google-Smtp-Source: AK7set9yFWbBPwIBl4EYKfXDnZR9vq46sWLggmDBm3DunY0X5HVSOog2B+KQZDIXeaHthxsZv8X1h7DGCNZV1PLBmiQ=
X-Received: by 2002:a2e:b4bb:0:b0:294:6f14:2365 with SMTP id
 q27-20020a2eb4bb000000b002946f142365mr2616739ljm.4.1677062980839; Wed, 22 Feb
 2023 02:49:40 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-1-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:28 +0400
Message-ID: <CAJ+F1C+ctPCVDDw43GM_hfU4XDsHYD1tepPcr18-esQsSauJCg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] audio: change type of mix_buf and conv_buf
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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
> Change the type of mix_buf in struct HWVoiceOut and conv_buf
> in struct HWVoiceIn from STSampleBuffer * to STSampleBuffer.
> However, a buffer pointer is still needed. For this reason in
> struct STSampleBuffer samples[] is changed to *buffer.
>
> This is a preparation for the next patch. The next patch will
> add this line, which is not possible with the current struct
> STSampleBuffer definition.
>
> +        sw->resample_buf.buffer =3D hw->mix_buf.buffer + rpos2;
>
> There are no functional changes.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  audio/audio.c          | 106 ++++++++++++++++++++---------------------
>  audio/audio_int.h      |   6 +--
>  audio/audio_template.h |  19 ++++----
>  3 files changed, 67 insertions(+), 64 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 772c3cc320..a0b54e4a2e 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -523,8 +523,8 @@ static size_t audio_pcm_hw_find_min_in (HWVoiceIn *hw=
)
>  static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
>  {
>      size_t live =3D hw->total_samples_captured - audio_pcm_hw_find_min_i=
n (hw);
> -    if (audio_bug(__func__, live > hw->conv_buf->size)) {
> -        dolog("live=3D%zu hw->conv_buf->size=3D%zu\n", live, hw->conv_bu=
f->size);
> +    if (audio_bug(__func__, live > hw->conv_buf.size)) {
> +        dolog("live=3D%zu hw->conv_buf.size=3D%zu\n", live, hw->conv_buf=
.size);
>          return 0;
>      }
>      return live;
> @@ -533,13 +533,13 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *h=
w)
>  static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t =
samples)
>  {
>      size_t conv =3D 0;
> -    STSampleBuffer *conv_buf =3D hw->conv_buf;
> +    STSampleBuffer *conv_buf =3D &hw->conv_buf;
>
>      while (samples) {
>          uint8_t *src =3D advance(pcm_buf, conv * hw->info.bytes_per_fram=
e);
>          size_t proc =3D MIN(samples, conv_buf->size - conv_buf->pos);
>
> -        hw->conv(conv_buf->samples + conv_buf->pos, src, proc);
> +        hw->conv(conv_buf->buffer + conv_buf->pos, src, proc);
>          conv_buf->pos =3D (conv_buf->pos + proc) % conv_buf->size;
>          samples -=3D proc;
>          conv +=3D proc;
> @@ -561,12 +561,12 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t size)
>      if (!live) {
>          return 0;
>      }
> -    if (audio_bug(__func__, live > hw->conv_buf->size)) {
> -        dolog("live_in=3D%zu hw->conv_buf->size=3D%zu\n", live, hw->conv=
_buf->size);
> +    if (audio_bug(__func__, live > hw->conv_buf.size)) {
> +        dolog("live_in=3D%zu hw->conv_buf.size=3D%zu\n", live, hw->conv_=
buf.size);
>          return 0;
>      }
>
> -    rpos =3D audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size=
);
> +    rpos =3D audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
>
>      samples =3D size / sw->info.bytes_per_frame;
>
> @@ -574,11 +574,11 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void=
 *buf, size_t size)
>      swlim =3D MIN (swlim, samples);
>
>      while (swlim) {
> -        src =3D hw->conv_buf->samples + rpos;
> -        if (hw->conv_buf->pos > rpos) {
> -            isamp =3D hw->conv_buf->pos - rpos;
> +        src =3D hw->conv_buf.buffer + rpos;
> +        if (hw->conv_buf.pos > rpos) {
> +            isamp =3D hw->conv_buf.pos - rpos;
>          } else {
> -            isamp =3D hw->conv_buf->size - rpos;
> +            isamp =3D hw->conv_buf.size - rpos;
>          }
>
>          if (!isamp) {
> @@ -588,7 +588,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *=
buf, size_t size)
>
>          st_rate_flow (sw->rate, src, dst, &isamp, &osamp);
>          swlim -=3D osamp;
> -        rpos =3D (rpos + isamp) % hw->conv_buf->size;
> +        rpos =3D (rpos + isamp) % hw->conv_buf.size;
>          dst +=3D osamp;
>          ret +=3D osamp;
>          total +=3D isamp;
> @@ -636,8 +636,8 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *=
hw, int *nb_live)
>      if (nb_live1) {
>          size_t live =3D smin;
>
> -        if (audio_bug(__func__, live > hw->mix_buf->size)) {
> -            dolog("live=3D%zu hw->mix_buf->size=3D%zu\n", live, hw->mix_=
buf->size);
> +        if (audio_bug(__func__, live > hw->mix_buf.size)) {
> +            dolog("live=3D%zu hw->mix_buf.size=3D%zu\n", live, hw->mix_b=
uf.size);
>              return 0;
>          }
>          return live;
> @@ -654,17 +654,17 @@ static size_t audio_pcm_hw_get_free(HWVoiceOut *hw)
>  static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t =
len)
>  {
>      size_t clipped =3D 0;
> -    size_t pos =3D hw->mix_buf->pos;
> +    size_t pos =3D hw->mix_buf.pos;
>
>      while (len) {
> -        st_sample *src =3D hw->mix_buf->samples + pos;
> +        st_sample *src =3D hw->mix_buf.buffer + pos;
>          uint8_t *dst =3D advance(pcm_buf, clipped * hw->info.bytes_per_f=
rame);
> -        size_t samples_till_end_of_buf =3D hw->mix_buf->size - pos;
> +        size_t samples_till_end_of_buf =3D hw->mix_buf.size - pos;
>          size_t samples_to_clip =3D MIN(len, samples_till_end_of_buf);
>
>          hw->clip(dst, src, samples_to_clip);
>
> -        pos =3D (pos + samples_to_clip) % hw->mix_buf->size;
> +        pos =3D (pos + samples_to_clip) % hw->mix_buf.size;
>          len -=3D samples_to_clip;
>          clipped +=3D samples_to_clip;
>      }
> @@ -683,11 +683,11 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, vo=
id *buf, size_t size)
>          return size;
>      }
>
> -    hwsamples =3D sw->hw->mix_buf->size;
> +    hwsamples =3D sw->hw->mix_buf.size;
>
>      live =3D sw->total_hw_samples_mixed;
>      if (audio_bug(__func__, live > hwsamples)) {
> -        dolog("live=3D%zu hw->mix_buf->size=3D%zu\n", live, hwsamples);
> +        dolog("live=3D%zu hw->mix_buf.size=3D%zu\n", live, hwsamples);
>          return 0;
>      }
>
> @@ -698,7 +698,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void=
 *buf, size_t size)
>          return 0;
>      }
>
> -    wpos =3D (sw->hw->mix_buf->pos + live) % hwsamples;
> +    wpos =3D (sw->hw->mix_buf.pos + live) % hwsamples;
>
>      dead =3D hwsamples - live;
>      hw_free =3D audio_pcm_hw_get_free(sw->hw);
> @@ -725,7 +725,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void=
 *buf, size_t size)
>          st_rate_flow_mix (
>              sw->rate,
>              sw->buf + pos,
> -            sw->hw->mix_buf->samples + wpos,
> +            sw->hw->mix_buf.buffer + wpos,
>              &isamp,
>              &osamp
>              );
> @@ -989,9 +989,9 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      }
>
>      live =3D sw->hw->total_samples_captured - sw->total_hw_samples_acqui=
red;
> -    if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
> -        dolog("live=3D%zu sw->hw->conv_buf->size=3D%zu\n", live,
> -              sw->hw->conv_buf->size);
> +    if (audio_bug(__func__, live > sw->hw->conv_buf.size)) {
> +        dolog("live=3D%zu sw->hw->conv_buf.size=3D%zu\n", live,
> +              sw->hw->conv_buf.size);
>          return 0;
>      }
>
> @@ -1026,13 +1026,13 @@ static size_t audio_get_free(SWVoiceOut *sw)
>
>      live =3D sw->total_hw_samples_mixed;
>
> -    if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
> -        dolog("live=3D%zu sw->hw->mix_buf->size=3D%zu\n", live,
> -              sw->hw->mix_buf->size);
> +    if (audio_bug(__func__, live > sw->hw->mix_buf.size)) {
> +        dolog("live=3D%zu sw->hw->mix_buf.size=3D%zu\n", live,
> +              sw->hw->mix_buf.size);
>          return 0;
>      }
>
> -    dead =3D sw->hw->mix_buf->size - live;
> +    dead =3D sw->hw->mix_buf.size - live;
>
>  #ifdef DEBUG_OUT
>      dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
> @@ -1056,12 +1056,12 @@ static void audio_capture_mix_and_clear(HWVoiceOu=
t *hw, size_t rpos,
>
>              n =3D samples;
>              while (n) {
> -                size_t till_end_of_hw =3D hw->mix_buf->size - rpos2;
> +                size_t till_end_of_hw =3D hw->mix_buf.size - rpos2;
>                  size_t to_write =3D MIN(till_end_of_hw, n);
>                  size_t bytes =3D to_write * hw->info.bytes_per_frame;
>                  size_t written;
>
> -                sw->buf =3D hw->mix_buf->samples + rpos2;
> +                sw->buf =3D hw->mix_buf.buffer + rpos2;
>                  written =3D audio_pcm_sw_write (sw, NULL, bytes);
>                  if (written - bytes) {
>                      dolog("Could not mix %zu bytes into a capture "
> @@ -1070,14 +1070,14 @@ static void audio_capture_mix_and_clear(HWVoiceOu=
t *hw, size_t rpos,
>                      break;
>                  }
>                  n -=3D to_write;
> -                rpos2 =3D (rpos2 + to_write) % hw->mix_buf->size;
> +                rpos2 =3D (rpos2 + to_write) % hw->mix_buf.size;
>              }
>          }
>      }
>
> -    n =3D MIN(samples, hw->mix_buf->size - rpos);
> -    mixeng_clear(hw->mix_buf->samples + rpos, n);
> -    mixeng_clear(hw->mix_buf->samples, samples - n);
> +    n =3D MIN(samples, hw->mix_buf.size - rpos);
> +    mixeng_clear(hw->mix_buf.buffer + rpos, n);
> +    mixeng_clear(hw->mix_buf.buffer, samples - n);
>  }
>
>  static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, size_t live)
> @@ -1103,7 +1103,7 @@ static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, =
size_t live)
>
>          live -=3D proc;
>          clipped +=3D proc;
> -        hw->mix_buf->pos =3D (hw->mix_buf->pos + proc) % hw->mix_buf->si=
ze;
> +        hw->mix_buf.pos =3D (hw->mix_buf.pos + proc) % hw->mix_buf.size;
>
>          if (proc =3D=3D 0 || proc < decr) {
>              break;
> @@ -1174,8 +1174,8 @@ static void audio_run_out (AudioState *s)
>              live =3D 0;
>          }
>
> -        if (audio_bug(__func__, live > hw->mix_buf->size)) {
> -            dolog("live=3D%zu hw->mix_buf->size=3D%zu\n", live, hw->mix_=
buf->size);
> +        if (audio_bug(__func__, live > hw->mix_buf.size)) {
> +            dolog("live=3D%zu hw->mix_buf.size=3D%zu\n", live, hw->mix_b=
uf.size);
>              continue;
>          }
>
> @@ -1203,13 +1203,13 @@ static void audio_run_out (AudioState *s)
>              continue;
>          }
>
> -        prev_rpos =3D hw->mix_buf->pos;
> +        prev_rpos =3D hw->mix_buf.pos;
>          played =3D audio_pcm_hw_run_out(hw, live);
>          replay_audio_out(&played);
> -        if (audio_bug(__func__, hw->mix_buf->pos >=3D hw->mix_buf->size)=
) {
> -            dolog("hw->mix_buf->pos=3D%zu hw->mix_buf->size=3D%zu played=
=3D%zu\n",
> -                  hw->mix_buf->pos, hw->mix_buf->size, played);
> -            hw->mix_buf->pos =3D 0;
> +        if (audio_bug(__func__, hw->mix_buf.pos >=3D hw->mix_buf.size)) =
{
> +            dolog("hw->mix_buf.pos=3D%zu hw->mix_buf.size=3D%zu played=
=3D%zu\n",
> +                  hw->mix_buf.pos, hw->mix_buf.size, played);
> +            hw->mix_buf.pos =3D 0;
>          }
>
>  #ifdef DEBUG_OUT
> @@ -1290,10 +1290,10 @@ static void audio_run_in (AudioState *s)
>
>          if (replay_mode !=3D REPLAY_MODE_PLAY) {
>              captured =3D audio_pcm_hw_run_in(
> -                hw, hw->conv_buf->size - audio_pcm_hw_get_live_in(hw));
> +                hw, hw->conv_buf.size - audio_pcm_hw_get_live_in(hw));
>          }
> -        replay_audio_in(&captured, hw->conv_buf->samples, &hw->conv_buf-=
>pos,
> -                        hw->conv_buf->size);
> +        replay_audio_in(&captured, hw->conv_buf.buffer, &hw->conv_buf.po=
s,
> +                        hw->conv_buf.size);
>
>          min =3D audio_pcm_hw_find_min_in (hw);
>          hw->total_samples_captured +=3D captured - min;
> @@ -1326,14 +1326,14 @@ static void audio_run_capture (AudioState *s)
>          SWVoiceOut *sw;
>
>          captured =3D live =3D audio_pcm_hw_get_live_out (hw, NULL);
> -        rpos =3D hw->mix_buf->pos;
> +        rpos =3D hw->mix_buf.pos;
>          while (live) {
> -            size_t left =3D hw->mix_buf->size - rpos;
> +            size_t left =3D hw->mix_buf.size - rpos;
>              size_t to_capture =3D MIN(live, left);
>              struct st_sample *src;
>              struct capture_callback *cb;
>
> -            src =3D hw->mix_buf->samples + rpos;
> +            src =3D hw->mix_buf.buffer + rpos;
>              hw->clip (cap->buf, src, to_capture);
>              mixeng_clear (src, to_capture);
>
> @@ -1341,10 +1341,10 @@ static void audio_run_capture (AudioState *s)
>                  cb->ops.capture (cb->opaque, cap->buf,
>                                   to_capture * hw->info.bytes_per_frame);
>              }
> -            rpos =3D (rpos + to_capture) % hw->mix_buf->size;
> +            rpos =3D (rpos + to_capture) % hw->mix_buf.size;
>              live -=3D to_capture;
>          }
> -        hw->mix_buf->pos =3D rpos;
> +        hw->mix_buf.pos =3D rpos;
>
>          for (sw =3D hw->sw_head.lh_first; sw; sw =3D sw->entries.le_next=
) {
>              if (!sw->active && sw->empty) {
> @@ -1903,7 +1903,7 @@ CaptureVoiceOut *AUD_add_capture(
>
>          audio_pcm_init_info (&hw->info, as);
>
> -        cap->buf =3D g_malloc0_n(hw->mix_buf->size, hw->info.bytes_per_f=
rame);
> +        cap->buf =3D g_malloc0_n(hw->mix_buf.size, hw->info.bytes_per_fr=
ame);
>
>          if (hw->info.is_float) {
>              hw->clip =3D mixeng_clip_float[hw->info.nchannels =3D=3D 2];
> @@ -1955,7 +1955,7 @@ void AUD_del_capture (CaptureVoiceOut *cap, void *c=
b_opaque)
>                      sw =3D sw1;
>                  }
>                  QLIST_REMOVE (cap, entries);
> -                g_free (cap->hw.mix_buf);
> +                g_free(cap->hw.mix_buf.buffer);
>                  g_free (cap->buf);
>                  g_free (cap);
>              }
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 5028f2354a..061845dcc2 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -58,7 +58,7 @@ typedef struct SWVoiceCap SWVoiceCap;
>
>  typedef struct STSampleBuffer {
>      size_t pos, size;
> -    st_sample samples[];
> +    st_sample *buffer;
>  } STSampleBuffer;
>
>  typedef struct HWVoiceOut {
> @@ -71,7 +71,7 @@ typedef struct HWVoiceOut {
>      f_sample *clip;
>      uint64_t ts_helper;
>
> -    STSampleBuffer *mix_buf;
> +    STSampleBuffer mix_buf;
>      void *buf_emul;
>      size_t pos_emul, pending_emul, size_emul;
>
> @@ -93,7 +93,7 @@ typedef struct HWVoiceIn {
>      size_t total_samples_captured;
>      uint64_t ts_helper;
>
> -    STSampleBuffer *conv_buf;
> +    STSampleBuffer conv_buf;
>      void *buf_emul;
>      size_t pos_emul, pending_emul, size_emul;
>
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 980e1f4bd0..dd87170cbd 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -71,8 +71,9 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioStat=
e *s,
>  static void glue (audio_pcm_hw_free_resources_, TYPE) (HW *hw)
>  {
>      g_free(hw->buf_emul);
> -    g_free (HWBUF);
> -    HWBUF =3D NULL;
> +    g_free(HWBUF.buffer);
> +    HWBUF.buffer =3D NULL;
> +    HWBUF.size =3D 0;
>  }
>
>  static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
> @@ -83,10 +84,12 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)=
(HW *hw)
>              dolog("Attempted to allocate empty buffer\n");
>          }
>
> -        HWBUF =3D g_malloc0(sizeof(STSampleBuffer) + sizeof(st_sample) *=
 samples);
> -        HWBUF->size =3D samples;
> +        HWBUF.buffer =3D g_new0(st_sample, samples);
> +        HWBUF.size =3D samples;
> +        HWBUF.pos =3D 0;
>      } else {
> -        HWBUF =3D NULL;
> +        HWBUF.buffer =3D NULL;
> +        HWBUF.size =3D 0;
>      }
>  }
>
> @@ -111,9 +114,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>      }
>
>  #ifdef DAC
> -    samples =3D ((int64_t) sw->HWBUF->size << 32) / sw->ratio;
> +    samples =3D ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
>  #else
> -    samples =3D (int64_t)sw->HWBUF->size * sw->ratio >> 32;
> +    samples =3D (int64_t)sw->HWBUF.size * sw->ratio >> 32;
>  #endif
>      if (audio_bug(__func__, samples < 0)) {
>          dolog("Can not allocate buffer for `%s' (%d samples)\n",
> @@ -126,7 +129,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>          size_t f_fe_min;
>
>          /* f_fe_min =3D ceil(1 [frames] * f_be [Hz] / size_be [frames]) =
*/
> -        f_fe_min =3D (hw->info.freq + HWBUF->size - 1) / HWBUF->size;
> +        f_fe_min =3D (hw->info.freq + HWBUF.size - 1) / HWBUF.size;
>          qemu_log_mask(LOG_UNIMP,
>                        AUDIO_CAP ": The guest selected a " NAME " sample =
rate"
>                        " of %d Hz for %s. Only sample rates >=3D %zu Hz a=
re"
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

