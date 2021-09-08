Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643834040A2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 23:44:18 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5Mf-0006ne-04
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 17:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mO5Lm-00067I-FC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:43:22 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mO5Li-0005rC-U0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:43:21 -0400
Received: by mail-lf1-x130.google.com with SMTP id l10so7692407lfg.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=35vCthtar1OKCtrYGgP2FAwVBdZP7PTzta0yIGNjlC4=;
 b=qsNtjweqnCpvPEPhMUkZX8gU3BmAkYYKfv2wly8FwWS4WR/9yoZPwjP/+tgaQbB+/T
 Xr/LTmAYbkXEBZbcW+AYeZN7HDFL/HRol7636SKSkg/VIbUfOSArGO4ZaMvjGZYvbHKz
 cvWM0lah1Qq1O6/i+GTCMOti2QQ/mMx3H0iy+SD3VGwhDPPBMZpogduuPnOpW5UKDubd
 2FBLz0lOlyPQLTAx+U69ttD2fo6Lzicvba98AVyyK031Bu2CSDF+P8tf/1ab3dOaC2rz
 Bdm1ChGlMRuLjIe32DD0Lw/4c9IHjOXY1KxCn/lCsLzRRz7H+Q3fHh8h0UeqlrezaeFK
 yJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=35vCthtar1OKCtrYGgP2FAwVBdZP7PTzta0yIGNjlC4=;
 b=33CayvPIA9YtXMtKjcUbgNv3GRT6caK+37DqvDdDjUGZ3flpbQsccpy0JZoVP6QtLd
 dlRplSpsaCO4ITyJbdSrOArSpf9Eqk9m2Mjea+5kWv8XBLXq6KNP1pWaU4gsy2EZn1aq
 KEdgVLIKwKhC1eaE5xN43FBxV/eMSoqQD6xA7oi+LujioCQsKiG+ud0oYjNtkMz8A4rY
 f8EhkHIJoZFcSsRl82OYGUtTk8SDrbr8kUAEWyeZpZ89YQuguwIo3n3Oar72LHhNWH1P
 tO4ob9WTsLOlmqJ5H1zpWEz5GMUDIPW3wRdDlqYoYKPJjvaItjcEluFOZ/Y1KxEEXJEC
 OumQ==
X-Gm-Message-State: AOAM532+wkp0EYyHjw+cU9YFP4DpotQS2/ZDinoCc4pkxehDKqscBLwb
 T87tJ/h7CIh8CJq5tjdWTq8qaA==
X-Google-Smtp-Source: ABdhPJwOisPcS+lC8Z+BrcH6jJ1ceO0xXdMPTYChwqGazhEsZMKrgeNX7unQXE4t9mpPtxxL5ghsvA==
X-Received: by 2002:a05:6512:3190:: with SMTP id
 i16mr163327lfe.64.1631137396606; 
 Wed, 08 Sep 2021 14:43:16 -0700 (PDT)
Received: from 192.168.1.7 ([2a00:1370:810e:18d4:6011:88a9:c1bb:af5f])
 by smtp.gmail.com with ESMTPSA id c3sm26232ljj.77.2021.09.08.14.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 14:43:16 -0700 (PDT)
Date: Thu, 9 Sep 2021 00:43:13 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] elf2dmp: Check curl_easy_setopt() return value
Message-ID: <20210909004313.1dadb24e@192.168.1.7>
In-Reply-To: <59844a83-9058-3935-0228-e159eef5277e@redhat.com>
References: <20210901143910.17112-1-peter.maydell@linaro.org>
 <20210901143910.17112-2-peter.maydell@linaro.org>
 <59844a83-9058-3935-0228-e159eef5277e@redhat.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, 1 Sep 2021 17:25:09 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 9/1/21 4:39 PM, Peter Maydell wrote:
> > Coverity points out that we aren't checking the return value
> > from curl_easy_setopt().
> >=20
> > Fixes: Coverity CID 1458895
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  contrib/elf2dmp/download.c | 28 +++++++++++++++++-----------
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
> > index d09e607431f..01e4a7fc0dc 100644
> > --- a/contrib/elf2dmp/download.c
> > +++ b/contrib/elf2dmp/download.c
> > @@ -21,21 +21,19 @@ int download_url(const char *name, const char
> > *url)=20
> >      file =3D fopen(name, "wb");
> >      if (!file) {
> > -        err =3D 1;
> > -        goto out_curl;
> > +        goto fail;
> >      }
> > =20
> > -    curl_easy_setopt(curl, CURLOPT_URL, url);
> > -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
> > -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
> > -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
> > -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
> > +    if (curl_easy_setopt(curl, CURLOPT_URL, url) !=3D CURLE_OK ||
> > +        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) !=3D
> > CURLE_OK ||
> > +        curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) !=3D
> > CURLE_OK ||
> > +        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=3D
> > CURLE_OK ||
> > +        curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) !=3D CURLE_OK)
> > {
> > +        goto fail;
> > +    }
> > =20
> >      if (curl_easy_perform(curl) !=3D CURLE_OK) {
> > -        err =3D 1;
> > -        fclose(file);
> > -        unlink(name);
> > -        goto out_curl;
> > +        goto fail;
> >      }
> > =20
> >      err =3D fclose(file);
> > @@ -44,4 +42,12 @@ out_curl:
> >      curl_easy_cleanup(curl);
> > =20
> >      return err;
> > +
> > +fail:
> > +    err =3D 1;
> > +    if (file) {
> > +        fclose(file);
> > +        unlink(name);
> > +    }
> > +    goto out_curl;
> >  }
> >  =20
>=20
> Counter proposal without goto and less ifs:
>=20
> -- >8 -- =20
> @@ -25,21 +25,19 @@ int download_url(const char *name, const char
> *url) goto out_curl;
>      }
>=20
> -    curl_easy_setopt(curl, CURLOPT_URL, url);
> -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
> -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
> -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
> -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
> -
> -    if (curl_easy_perform(curl) !=3D CURLE_OK) {
> -        err =3D 1;
> -        fclose(file);
> +    if (curl_easy_setopt(curl, CURLOPT_URL, url) !=3D CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL) !=3D
> CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) !=3D
> CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=3D
> CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) !=3D
> CURLE_OK
> +            || curl_easy_perform(curl) !=3D CURLE_OK) {
>          unlink(name);
> -        goto out_curl;
> +        fclose(file);
> +        err =3D 1;
> +    } else {
> +        err =3D fclose(file);
>      }
>=20
> -    err =3D fclose(file);
> -
>  out_curl:
>      curl_easy_cleanup(curl);
>=20
> ---
>=20

Honestly, I would prefer this version over the original patch.
In any way, I have tested both of them.

--=20
Viktor Prutyanov

