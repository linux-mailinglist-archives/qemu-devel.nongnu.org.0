Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A769F2FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhQ-0006Ef-C3; Wed, 22 Feb 2023 05:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhO-0006EO-DA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:10 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhM-0000ZE-IB
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:10 -0500
Received: by mail-lj1-x235.google.com with SMTP id b13so8290098ljf.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kn9sZvPFKjBBngf+5EdFL59WiJO8dA2rB9q2cVtsVVk=;
 b=Nh2NoM7p6XynaGVXvAyRXGhyg6Y/UrcaoYKiloLmrqxExxS/sfxr2nNDeVcdgVXBOg
 K/9ZiMYFWIPU/1+TNMNMFjTXv/444Fgu0o+s/0vnAqhETtF4pesL4b67qbcAWwxq09l0
 4zDQAlIqXS98YcGrQE9/NqOMxuJYGpjqh4fDDvmj7X4wUDMODYHRYxJbALHb+O1R5z0b
 NKsTaD9o0IfJFyd3LuQRpD7mumOkvu9d+rFVrtmp3LjF080ohI2Q9LAeP8N+uFnAoOnQ
 Lao1sd+Jim/s8dKDNc0QHc6/BIxmzXjnkusr7yEQZLzdYBmAKhFeHpzGXSRYQuuqKgLt
 +5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kn9sZvPFKjBBngf+5EdFL59WiJO8dA2rB9q2cVtsVVk=;
 b=XJo7aBs/Aqhz2eAjnTmoy4ZmvnnRlV5G5HY6Z478eSo8LCEHBELmI1pRShFjLLsdo1
 xlutYuIDst04Jm6olEHqssB3ISJuFg873vYoaJzWW7vtcgBdfvgNtiOJTiuR3ajmCoLj
 4M/7PHEFbwSKDVLiyJ+8d74SJN7m5CczdtFQKPC7HNxJ3sqiTUpisTDDx4khmUU/KQQQ
 NAAL35/XBkOXdaRpiCv0JeemRet5uiQ1e+qsXJU+m/I4JchsZs7c5cuJXWdUOM0Tq0VU
 sbolcPOYGF44dcJH6AIBAI6k22RyhVojsfxBeDWLrwxzN6XUdviqVWKc/gJPa52cWGFx
 w1AA==
X-Gm-Message-State: AO0yUKXnyH1eMoTCP+PFkwtVw+8uTPmfg8ibkZByrt9v/iZAMjRQVMfE
 iD6FT4zAUgzhp06WqPO1Robb374Jf+nej5IcCvM=
X-Google-Smtp-Source: AK7set/ZPAQrTyZZxmRHCBl4twXRZrYul0MplJQQwmapDt73JlZ0UEVdfeFSGeetVxM7zdfHf2cMNldOgYhi/kv2tdk=
X-Received: by 2002:a05:651c:b9b:b0:295:945d:b382 with SMTP id
 bg27-20020a05651c0b9b00b00295945db382mr1087264ljb.4.1677063006407; Wed, 22
 Feb 2023 02:50:06 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-7-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-7-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:54 +0400
Message-ID: <CAJ+F1CLHUEmwHv13UHjBSqQqED2VF-1rstadCdKyPXGtF73P8w@mail.gmail.com>
Subject: Re: [PATCH v2 07/17] audio: don't misuse audio_pcm_sw_write()
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

On Mon, Feb 6, 2023 at 10:52 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> The audio_pcm_sw_write() function is intended to convert a
> PCM audio stream to the internal representation, adjust the
> volume, and then mix it with the other audio streams with a
> possibly changed sample rate in mix_buf. In order for the
> audio_capture_mix_and_clear() function to use audio_pcm_sw_write(),
> it must bypass the first two tasks of audio_pcm_sw_write().
>
> Since patch "audio: split out the resampling loop in
> audio_pcm_sw_write()" this is no longer necessary, because now
> the audio_pcm_sw_resample_out() function can be used instead of
> audio_pcm_sw_write().
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index cd10f1ec10..44eb7b63b4 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1056,26 +1056,33 @@ static void audio_capture_mix_and_clear(HWVoiceOu=
t *hw, size_t rpos,
>
>          for (sc =3D hw->cap_head.lh_first; sc; sc =3D sc->entries.le_nex=
t) {
>              SWVoiceOut *sw =3D &sc->sw;
> -            int rpos2 =3D rpos;
> +            size_t rpos2 =3D rpos;
>
>              n =3D samples;
>              while (n) {
>                  size_t till_end_of_hw =3D hw->mix_buf.size - rpos2;
> -                size_t to_write =3D MIN(till_end_of_hw, n);
> -                size_t bytes =3D to_write * hw->info.bytes_per_frame;
> -                size_t written;
> +                size_t to_read =3D MIN(till_end_of_hw, n);
> +                size_t live, frames_in, frames_out;
>
>                  sw->resample_buf.buffer =3D hw->mix_buf.buffer + rpos2;
> -                sw->resample_buf.size =3D to_write;
> -                written =3D audio_pcm_sw_write (sw, NULL, bytes);
> -                if (written - bytes) {
> -                    dolog("Could not mix %zu bytes into a capture "
> +                sw->resample_buf.size =3D to_read;
> +                live =3D sw->total_hw_samples_mixed;
> +
> +                audio_pcm_sw_resample_out(sw,
> +                                          to_read, sw->hw->mix_buf.size =
- live,
> +                                          &frames_in, &frames_out);
> +
> +                sw->total_hw_samples_mixed +=3D frames_out;
> +                sw->empty =3D sw->total_hw_samples_mixed =3D=3D 0;
> +
> +                if (to_read - frames_in) {
> +                    dolog("Could not mix %zu frames into a capture "
>                            "buffer, mixed %zu\n",
> -                          bytes, written);
> +                          to_read, frames_in);
>                      break;
>                  }
> -                n -=3D to_write;
> -                rpos2 =3D (rpos2 + to_write) % hw->mix_buf.size;
> +                n -=3D to_read;
> +                rpos2 =3D (rpos2 + to_read) % hw->mix_buf.size;
>              }
>          }
>      }
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

