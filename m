Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DD69F303
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:52:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmi3-0006tb-WB; Wed, 22 Feb 2023 05:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmht-0006XO-8J
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:43 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhp-0000lN-9r
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:38 -0500
Received: by mail-lj1-x22b.google.com with SMTP id j17so7498476ljq.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voaf1T9JCdRE5wwLO22fnVr46byzId8qTuSRhKYYH/4=;
 b=aolr/cfRPe7GPx+wNzGkJ5xFhqxAkYXEoqnl8PeDuGcSvMuX9I71iouwQ+pl4/W/f/
 N76WqiNiizP7o22uimF3x7HN0nETJWuPz109JXDjS955cN5+ZSXOS3Ax1OgrdbLfm7qI
 0pyVD9m3TqN9DUKe66MPKQnxRr8+XqgKlxBPJz3B9OaPYkIBKJJYEXtUNzO4cqiu9ifG
 HqOCibRVQwV+EZVQ6wwMfSlWOWsDZci17Jmbl5aycvZYsgMZ3t2G4I6XCeex3vLOmKGA
 32gVIlDvJyY5QkBUg/DMTZVbgPY6rKC5G8eh4mGUSXFkrmvEMSiI6w4Un6W8bm+V7sk4
 gVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voaf1T9JCdRE5wwLO22fnVr46byzId8qTuSRhKYYH/4=;
 b=S1AkkMEf6yaqoV/Lp41UZOe1Nf3O5HGeDA/8kWyWllQxRFkS7xYlq8Q7wkOdi4U7ot
 /Y6kpRz3ngxVy3R0xfC6OwHek+JtGPiP7NtpcEL0H+PX7p9SRRdBol37IdPbSXGDBiFU
 bgve4BWjjsEHmvJrTuOPaoZ74GZw23FtLyC3p6MarvMBqODgry2Gl9x2MY74XJ3hvueF
 fXQaL6NlNhAAWn4pD0Pyce6nMUadRTnrJHqfedd20nL4g1euZ8GONMtjOyaPPP8w9oz5
 BL44/cEpYVc5+R/vkJcejQj6MaRUZ2uOP2uCboEVm/yQ9XCBuJyiNf52hxeZhOQJn/fR
 hopw==
X-Gm-Message-State: AO0yUKXgUFgHW7Q06E6sYuBsGouMdYXXPi8oWuF1WNmttuTZoQWgFxax
 lHdifvwj03iNYxp0TkSwa373++FwNy/ei3N6IlI=
X-Google-Smtp-Source: AK7set9v6kTu5+b6XJlINg4RAloDf1vlsyVaqPftdCMrP48fhB9vwBO6SZjNc6iYaQ+nxuAMWLul7dV+kD8/qpy8IU8=
X-Received: by 2002:a05:651c:3cd:b0:293:261e:74ce with SMTP id
 f13-20020a05651c03cd00b00293261e74cemr2634508ljp.4.1677063035782; Wed, 22 Feb
 2023 02:50:35 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-16-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-16-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:50:23 +0400
Message-ID: <CAJ+F1CL6=sSDdfCCivU0f-oz-a2VJU1vuvNVSw5hsPKa7Dq3wA@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] audio/audio_template: substitute sw->hw with hw
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
> Substitute sw->hw with hw in the audio_pcm_sw_alloc_resources_*
> functions.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio_template.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 0d8aab6fad..7e116426c7 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -107,6 +107,7 @@ static void glue (audio_pcm_sw_free_resources_, TYPE)=
 (SW *sw)
>
>  static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>  {
> +    HW *hw =3D sw->hw;
>      int samples;
>
>      if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
> @@ -125,7 +126,6 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>      }
>
>      if (samples =3D=3D 0) {
> -        HW *hw =3D sw->hw;
>          size_t f_fe_min;
>
>          /* f_fe_min =3D ceil(1 [frames] * f_be [Hz] / size_be [frames]) =
*/
> @@ -149,9 +149,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE)=
 (SW *sw)
>      sw->resample_buf.pos =3D 0;
>
>  #ifdef DAC
> -    sw->rate =3D st_rate_start (sw->info.freq, sw->hw->info.freq);
> +    sw->rate =3D st_rate_start(sw->info.freq, hw->info.freq);
>  #else
> -    sw->rate =3D st_rate_start (sw->hw->info.freq, sw->info.freq);
> +    sw->rate =3D st_rate_start(hw->info.freq, sw->info.freq);
>  #endif
>
>      return 0;
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

