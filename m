Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFDA69F2F2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhd-0006HD-QG; Wed, 22 Feb 2023 05:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhV-0006F5-CD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:18 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhS-0000aT-7N
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:15 -0500
Received: by mail-lf1-x12a.google.com with SMTP id bp25so9601591lfb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Pgptixf6aSzOpM/xoe5LZvI7v9xrk1H8zE7XRXPhQg=;
 b=Z3r6kKPkNwWKUxvUDteM7SSw5WhJ5iILFbaG1DqzQ88mlGJFgP7/cQerRKLTsEurV8
 jL9HZOEEgBUeI1AsGJfpCi6qSgNbyjsdM8CLA/3jTS2Yezx49rdSJ62ID7Qbwqz54gVj
 S7nHKur7JxCt1YItq6DjsRwD6ah9njP4ZBvAyxvWhsUHk7nnYSbEUJvI0uby/zv6kHsH
 rR97/N+8fronzCgkXZ/pWCBYEqL8/9kFui7pmQW0q+m70SUrJJdRDJraiN/RRy60ZnbY
 kn4j1h3ksVE3dY7yrfLHSPoJr2XsLuiUyLQX7xetxkeJ6K30MqmJAkSKOhNpcVzBAL7c
 H07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Pgptixf6aSzOpM/xoe5LZvI7v9xrk1H8zE7XRXPhQg=;
 b=NhHSKCZLM6/FlYfW+6VwA6MJhJ/AdtDYv+ROs6pBW5ghW0g9kOWsEIS2saMJNICNR4
 k/aBemctpUTOphSgHUrWeryk4jgZegCL9DCtHE1fK/PccN9jLT8SqR5km2+iuwzY95MR
 Pl3l8f94unOuCG1FQ89z1XoqMclVkDnVno3RK0R0SOw79qY9GXRuxatYpTqh/jLy0kOU
 zy+sqo1KYTDbXb9hWjfZqmhX1/HON0ewFCtcTyEO+G4mOfSZvn7LBbaRtbTScMrccMjV
 hAP5NJse8iKX/93MjNGtZ7jKV+lfUCAIdx4TVgill+9+egs5wZxfVlDozqcIckNPzSuZ
 XO0Q==
X-Gm-Message-State: AO0yUKXK34YfCNAzDqP5bB4Cy0v3vmicM5bWW9wjIJuHNNzZXeXAcVZ4
 5K0WGTcsFrihzoXq+eZMY0v6BnWeFivtliqmoLKDPxI6vRI=
X-Google-Smtp-Source: AK7set9jAaxBOvRNfeflOgE6GS8NCKycMRJ1hkKuFevbAivDgNIzRr6RaFGXLoHaqXdEmTCslqXL1pUwXtu8lyRPK+8=
X-Received: by 2002:a05:6512:4c8:b0:4db:1ae1:318b with SMTP id
 w8-20020a05651204c800b004db1ae1318bmr2572892lfq.5.1677063012210; Wed, 22 Feb
 2023 02:50:12 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-8-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-8-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:59 +0400
Message-ID: <CAJ+F1CKiZM0nYMgd4O6yLyUmh3EpeVj7SFDhwJ_ncRxZzzfXLA@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] audio: remove unused noop_conv() function
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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
> The function audio_capture_mix_and_clear() no longer uses
> audio_pcm_sw_write() to resample audio frames from one internal
> buffer to another. For this reason, the noop_conv() function is
> now unused. Remove it.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 44eb7b63b4..556696b095 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -381,13 +381,6 @@ void audio_pcm_info_clear_buf (struct audio_pcm_info=
 *info, void *buf, int len)
>  /*
>   * Capture
>   */
> -static void noop_conv (struct st_sample *dst, const void *src, int sampl=
es)
> -{
> -    (void) src;
> -    (void) dst;
> -    (void) samples;
> -}
> -
>  static CaptureVoiceOut *audio_pcm_capture_find_specific(AudioState *s,
>                                                          struct audsettin=
gs *as)
>  {
> @@ -485,7 +478,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
>          sw->info =3D hw->info;
>          sw->empty =3D 1;
>          sw->active =3D hw->enabled;
> -        sw->conv =3D noop_conv;
>          sw->ratio =3D ((int64_t) hw_cap->info.freq << 32) / sw->info.fre=
q;
>          sw->vol =3D nominal_volume;
>          sw->rate =3D st_rate_start (sw->info.freq, hw_cap->info.freq);
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

