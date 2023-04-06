Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63B6D9CF5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:03:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkS41-0004zY-Op; Thu, 06 Apr 2023 12:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pkS3z-0004xT-Dz
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:02:15 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pkS3x-00049u-Ov
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:02:15 -0400
Received: by mail-lf1-x134.google.com with SMTP id x17so51507661lfu.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680796931; x=1683388931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjh1vGWNr9t/smkoxT4yFwEIqwWUVvUCZrdIrD5LlBU=;
 b=MJErEnTKJExzqZ2WhRwexCymx4BFBcOKht1P95UBXqoSNXQduqxicz2J+J/5xq0ftU
 LmDLHsgcehCwRdAxiABVvQ+XfgmWlikT2bmksWOR2nK/vOIab7cG73y4pjOMw2qtlY0J
 d2cDJO/jGpa7T2KUKRedEG3zLJvwTW+xWCimk9iiNOZ724tSxbMJxxUT88cJmwKfoAx3
 CaCLMqsdF9e7RNAM7mZKtdb+YM10xGKqwezdOgR7Gd2UZAo14/qz1qZy7CVDIS//GMhw
 bK2GoWTKwWxIY6myom+R6Q2gUow8UM4y0kZBV6TeMpBcRZSRI+3iaq7B408v7d70i33m
 +hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796931; x=1683388931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjh1vGWNr9t/smkoxT4yFwEIqwWUVvUCZrdIrD5LlBU=;
 b=BNhcC8QVMKShyM1olU2wKfVBCdfpucG1afofS+kZRTZP2JUPyPpdvG/l/8TQkDiwll
 J640tXaYK04g/VbEN1L7hc7/+yCNEyNZhgsP3LjWJEOy3ullv6xjsAqMeEMClSxxSQKJ
 lQrV4eCMuUEJEDCYTWzT+bBah8oF2dLlomNY7YUAIakhVPRgaGoVeSLsDSpdwIDDu/j+
 uiU4bC0rDbbTh50TKTDAPkYOvSQ7MpSkoCvyj6+OTOnEJlWOQHdnK86kbJbMRFx/GD0O
 aUXwLl54GBP3Re4Y0CuMHLHYttTNTrn8Vpp9tmhSrg7KWadtd5sZar0O8jg81XluMkb5
 VDKg==
X-Gm-Message-State: AAQBX9fr6Z0KTCs1Kpn5U72JfeXYtb+XVvzbnPRoCLH+YmigxgAfvsHQ
 HJMZ0vDdIPohTj//lNLtVaEQ1QE2NP4sFKKI2/4=
X-Google-Smtp-Source: AKy350a+snKBOWBGQM1FyZp50cXD96JqL1dNABNg59A7yId0JadF0MH/sbfsWdayVXfP4I7FYfFFJ1hTOKLiLOfc6Cs=
X-Received: by 2002:a05:6512:1026:b0:4e8:c8f1:a010 with SMTP id
 r6-20020a056512102600b004e8c8f1a010mr3085297lfr.11.1680796931344; Thu, 06 Apr
 2023 09:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230406154347.4100700-1-stefanb@linux.ibm.com>
In-Reply-To: <20230406154347.4100700-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 Apr 2023 20:01:59 +0400
Message-ID: <CAJ+F1CL1_PcyowNdbn-N1jczNAGJ9SJwxP62MXVjro+-PODO6Q@mail.gmail.com>
Subject: Re: [PATCH] util/error: Fix use-after-free errors reported by Coverity
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

On Thu, Apr 6, 2023 at 7:43=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.com=
> wrote:
>
> Fix use-after-free errors in the code path that called error_handle(). A
> call to error_handle() will now either free the passed Error 'err' or
> assign it to '*errp' if '*errp' is currently NULL. This ensures that 'err=
'
> either has been freed or is assigned to '*errp' if this function returns.
> Adjust the two callers of this function to not assign the 'err' to '*errp=
'
> themselves, since this is now handled by error_handle().
>

Fixes: commit 3ffef1a55ca3 ("error: add global &error_warn destination")

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

worth including for 8.0 imho.

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  util/error.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/util/error.c b/util/error.c
> index 5537245da6..e5e247209a 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -46,6 +46,10 @@ static void error_handle(Error **errp, Error *err)
>      }
>      if (errp =3D=3D &error_warn) {
>          warn_report_err(err);
> +    } else if (errp && !*errp) {
> +        *errp =3D err;
> +    } else {
> +        error_free(err);
>      }
>  }
>
> @@ -76,7 +80,6 @@ static void error_setv(Error **errp,
>      err->func =3D func;
>
>      error_handle(errp, err);
> -    *errp =3D err;
>
>      errno =3D saved_errno;
>  }
> @@ -289,11 +292,6 @@ void error_propagate(Error **dst_errp, Error *local_=
err)
>          return;
>      }
>      error_handle(dst_errp, local_err);
> -    if (dst_errp && !*dst_errp) {
> -        *dst_errp =3D local_err;
> -    } else {
> -        error_free(local_err);
> -    }
>  }
>
>  void error_propagate_prepend(Error **dst_errp, Error *err,
> --
> 2.39.1
>


--=20
Marc-Andr=C3=A9 Lureau

