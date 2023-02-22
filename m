Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3869F2F4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhC-0006BE-PD; Wed, 22 Feb 2023 05:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmh9-0006Au-IV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:56 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmh7-0000Kv-RC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:49:55 -0500
Received: by mail-lf1-x12b.google.com with SMTP id s22so9349592lfi.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23vQLxhQp+zCoNAqgSHRtv6Xfg1Pz6CwEoOOAls3P8U=;
 b=HnD8ksEaUg2CJAG8rEUWZa9rH9zU4eWmQrWXrPtFRbv2L0sEaGY3LH7pCiNhL6qmf1
 AhoUNllA2spXnDLxDRO1aLluxxj26I22G8xJnWKTMRSJqzzF/j08jdElVvWN5TMokNDy
 lubSBFoxvILiQ+KKywX3BPLU47fYm95SVGY47l+DTczFdPoYMMVQVg+pllnb6X2ynyWc
 oQHtlrizfhG1tJGKs2927fQV9f404ygOX1nJnVHA4WMw7NWzJPysyxdYup0LuDQ0fVJN
 sMyAmvkDQoonALQ8Yo8w6qv42OV5ARmMAO/deQmPH4mpxBJE/CaxrqKspDFFdzguPSEV
 2wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23vQLxhQp+zCoNAqgSHRtv6Xfg1Pz6CwEoOOAls3P8U=;
 b=RiGWV2aBmVm9mGjHxbd01iWGzUYAlivzR2ONG2u5LAV9VUvXkLZ449eNVtG8jWE/3g
 j+0npwuwm5ToQkPzQQmtRNOXG+IkFtf2jsjNjVGT+MuoQhyovwD/G95Lp12jFMQsJ4K7
 AK830ToJN2VpRtsvFRYox+19BbAq5E5SygN517pUoukHrleS8zqbcxbGMNukiPBXh5Vg
 VIqCQti4MBIO5h8noR2AkkDGSyD5NfuNdVmFKAsr4ZE0QP6saNJylYSDSmKgFFwSTJoE
 cgwaqNItM+TgndeV8xCYL73iNpsh1hrQFLnnZBWwFstAis6uyUfdHxgdoDB94EXm9Ij3
 CGgA==
X-Gm-Message-State: AO0yUKVObQvMtXvjCmbxd+zUyjUGL2j46akBexTjKn+AHL73XJ8ODW7w
 0rjttHu9gkcA7Si6gVxFWxTuR1kXQYVoiv8XcyA=
X-Google-Smtp-Source: AK7set8LuEH+WpYsObFXvwo5Br61dDTD/C8qyJ1CXx0k2r5NInJevMXukmMc1l5nmBgK8V5LNP4EM6j2dbvpb5ZZQ6Y=
X-Received: by 2002:ac2:560e:0:b0:4db:1999:67a4 with SMTP id
 v14-20020ac2560e000000b004db199967a4mr2589159lfd.5.1677062991720; Wed, 22 Feb
 2023 02:49:51 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-3-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-3-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:38 +0400
Message-ID: <CAJ+F1CJeBrR+DtL9dESEr-TZ1weyGWR=_eVntHiO3b6Mth6naA@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] audio: make the resampling code greedy
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
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

On Mon, Feb 6, 2023 at 10:52 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Read the maximum possible number of audio frames instead of the
> minimum necessary number of frames when the audio stream is
> downsampled and the output buffer is limited. This makes the
> function symmetrical to upsampling when the input buffer is
> limited. The maximum possible number of frames is written here.
>
> With this change it's easier to calculate the exact number of
> audio frames the resample function will read or write. These two
> functions will be introduced later.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

a bit hard to review, but looks ok
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




> ---
>  audio/rate_template.h | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/audio/rate_template.h b/audio/rate_template.h
> index b432719ebb..6648f0d2e5 100644
> --- a/audio/rate_template.h
> +++ b/audio/rate_template.h
> @@ -40,8 +40,6 @@ void NAME (void *opaque, struct st_sample *ibuf, struct=
 st_sample *obuf,
>      int64_t t;
>  #endif
>
> -    ilast =3D rate->ilast;
> -
>      istart =3D ibuf;
>      iend =3D ibuf + *isamp;
>
> @@ -59,15 +57,17 @@ void NAME (void *opaque, struct st_sample *ibuf, stru=
ct st_sample *obuf,
>          return;
>      }
>
> -    while (obuf < oend) {
> +    /* without input samples, there's nothing to do */
> +    if (ibuf >=3D iend) {
> +        *osamp =3D 0;
> +        return;
> +    }
>
> -        /* Safety catch to make sure we have input samples.  */
> -        if (ibuf >=3D iend) {
> -            break;
> -        }
> +    ilast =3D rate->ilast;
>
> -        /* read as many input samples so that ipos > opos */
> +    while (true) {
>
> +        /* read as many input samples so that ipos > opos */
>          while (rate->ipos <=3D (rate->opos >> 32)) {
>              ilast =3D *ibuf++;
>              rate->ipos++;
> @@ -78,6 +78,11 @@ void NAME (void *opaque, struct st_sample *ibuf, struc=
t st_sample *obuf,
>              }
>          }
>
> +        /* make sure that the next output sample can be written */
> +        if (obuf >=3D oend) {
> +            break;
> +        }
> +
>          icur =3D *ibuf;
>
>          /* wrap ipos and opos around long before they overflow */
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

