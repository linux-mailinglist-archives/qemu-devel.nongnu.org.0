Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3D4C57BA
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:45:55 +0100 (CET)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO24l-0001aV-5p
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO20s-0000W1-1K
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:41:50 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=42968
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO20q-0002jW-Eg
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:41:49 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id e140so12335912ybh.9
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpiPDWCuLrwmixto/pMK+GRlyl2/MKjTBd02vGYqurI=;
 b=Ktd8dHpnclNe9rXRhCu7MTblhnpFsX0oYwtpWRt8y45MtZ3dKk9naLzChq4YTbtfTT
 OBed9ajF5Z+e0yZ+k76uOfg3Qh6qUE3xIvaQZ/E+nvQwqtD9RlPvD3ZoTvNxN/Sx2fmq
 2koVhtrnvrgLrh4kuF3xwAJ5Ww+sZh93HwsAZJdEHa+WebwPR+g+MGeBjitNcCHr0DSm
 R4HNd7yeZlyaIwC1GaYwDZidpV5DoNJk6YcoQ9W3qXgZgk3xJB1qoSSbTCz0mYTjk5SL
 dozb0mkyv8dXvfnuNUTrSy16mHhQ4r0REgFuvY5t0sjXInXreUyRzNxyQ+EmpSat/BqT
 esUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpiPDWCuLrwmixto/pMK+GRlyl2/MKjTBd02vGYqurI=;
 b=FMKkB7RLCFet5fA3noH+RHjRsfAopi5ylLua3NmZevvh/AW5bZCxA4cdvaxDl+wP+0
 ttaLuP3r3/f6dJ3p/TIAPb4OICCTpp+gLOzdBuzGMV4a8KQj/+ZOw84TZ+euaFHjBlEo
 j3vLLIUAIo4kmuln0GzCnV73N+IMGx2BLckA/pi0dOyrywM5m8XzeHy/Gb3AlonVQgKP
 lfzfKTY6DfnyQQSYMb8ltTcVwTM7zqpzP2S1qeFgXjckfcZ7qeOkAcmAyuG6+kN2oDg8
 N+LEUeLav4W/9mzz+vWJpS24yF7a4D7pVi/er2o79bBBHjmJ5dy2wToBUA1dDKn5s3MZ
 /chg==
X-Gm-Message-State: AOAM533RCnAeHoNJJ0yfZaRY9k5ZdR5D2EA/JauHejrBjRWvyQt4j1+j
 EN3Ib4A2R/yj2B18CRzcHtOrqMyJ2s7i9qraUp2Cyhy6SCs=
X-Google-Smtp-Source: ABdhPJznlZDc3ItGspxS+wqESJefm01YkCLtgnaW1/2beh4zQ37azV1/hsMsOLA0x7gscNE2lgcsO40F/xi6XlBuTAg=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr12691596ybe.67.1645900905789; Sat, 26
 Feb 2022 10:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-2-peter.maydell@linaro.org>
In-Reply-To: <20220226180723.1706285-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Feb 2022 18:41:34 +0000
Message-ID: <CAFEAcA9ercN8AcJXVHK1Lm4OdvnGdUbM2S83304fN5F-yj0Mxg@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Feb 2022 at 18:07, Peter Maydell <peter.maydell@linaro.org> wrote:

Forgot to cc Gerd on this one as USB maintainer. Sorry..

> qemu_oom_check() is a function which essentially says "if you pass me
> a NULL pointer then print a message then abort()".  On POSIX systems
> the message includes strerror(errno); on Windows it includes the
> GetLastError() error value printed as an integer.
>
> Other than in the implementation of qemu_memalign(), we use this
> function only in hw/usb/redirect.c, for three checks:
>
>  * on a call to usbredirparser_create()
>  * on a call to usberedirparser_serialize()
>  * on a call to malloc()
>
> The usbredir library API functions make no guarantees that they will
> set errno on errors, let alone that they might set the
> Windows-specific GetLastError string.  malloc() is documented as
> setting errno, not GetLastError -- and in any case the only thing it
> might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
> thing for any of these.  Replace them with straightforward
> error-checking code.  This will allow us to get rid of
> qemu_oom_check().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have left all of these errors as fatal, since that's what they
> were previously. Possibly somebody with a better understanding
> of the usbredir code might be able to make them theoretically
> non-fatal, but we make malloc failures generally fatal anyway.
> ---
>  hw/usb/redirect.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 5f0ef9cb3b0..8692ea25610 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -1239,7 +1239,11 @@ static void usbredir_create_parser(USBRedirDevice *dev)
>
>      DPRINTF("creating usbredirparser\n");
>
> -    dev->parser = qemu_oom_check(usbredirparser_create());
> +    dev->parser = usbredirparser_create();
> +    if (!dev->parser) {
> +        error_report("usbredirparser_create() failed");
> +        exit(1);
> +    }
>      dev->parser->priv = dev;
>      dev->parser->log_func = usbredir_log;
>      dev->parser->read_func = usbredir_read;
> @@ -2239,7 +2243,10 @@ static int usbredir_put_parser(QEMUFile *f, void *priv, size_t unused,
>      }
>
>      usbredirparser_serialize(dev->parser, &data, &len);
> -    qemu_oom_check(data);
> +    if (!data) {
> +        error_report("usbredirparser_serialize failed");
> +        exit(1);
> +    }
>
>      qemu_put_be32(f, len);
>      qemu_put_buffer(f, data, len);
> @@ -2330,7 +2337,11 @@ static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused,
>          bufp->len = qemu_get_be32(f);
>          bufp->status = qemu_get_be32(f);
>          bufp->offset = 0;
> -        bufp->data = qemu_oom_check(malloc(bufp->len)); /* regular malloc! */
> +        bufp->data = malloc(bufp->len); /* regular malloc! */
> +        if (!bufp->data) {
> +            error_report("usbredir_get_bufpq: out of memory");
> +            exit(1);
> +        }
>          bufp->free_on_destroy = bufp->data;
>          qemu_get_buffer(f, bufp->data, bufp->len);
>          QTAILQ_INSERT_TAIL(&endp->bufpq, bufp, next);
> --
> 2.25.1

