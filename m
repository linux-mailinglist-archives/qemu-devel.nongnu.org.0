Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F5E2C53DA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:19:56 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGFf-0000j7-Cy
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG6M-0003i6-Cm
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:18 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:43017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG6K-000343-I8
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:18 -0500
Received: by mail-ed1-x542.google.com with SMTP id q16so2013679edv.10
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AXz1m1i+65iswKWE/rwF3UT/eG70EpYkYvNAE+HAIL0=;
 b=rPRULAirf/U6xh0Os35XQROyRehdnk9euFNCUZPpI/xhIsGP8cXSc4rgREVjnycsHN
 B11AXwFSyE1YGBgJ/RolKoWcG9ueHgzL6XHkZ36WiChRAXNl9kSlQiUMSlFCmJ9qL1IF
 IEzIdyxTiZcIWhOR4p7R5heo4H3W/M0dqIZ958e1j3p+0p4mhZbEoXOPHcOtZzHJkC98
 ZBn8kF4ZUXA5FFySz8RMojQYAvxT+gihjicNRBNr1mwkTL0tDwRE0ggHMkr8uT2O+i0Y
 e/kA+uRANo8hB0NPHWExO5nw4Ry25HvQabNorzSOGA4zJ6i0ge96B/9yHz9PXapjc1GU
 1uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AXz1m1i+65iswKWE/rwF3UT/eG70EpYkYvNAE+HAIL0=;
 b=V1Uu1pjl8xoSMSHVM9XquF2tvbDwhKC8YHEO9AejbcXJu3zBvVDRhYzUbg5tLlW+he
 TYFKiT+yrDZpnRtDe8hXcBjv1nyQCHfVj85B5c93QyttR2w6eG0aQgJfgeQB7mrU4O1F
 4EMZh5TH7K0YWj9MsR2LtYz2KMXyJ+rKmsxvQpSn2YqYSjyqUp4sY4FztHksmUOR8cRv
 XHNPTKGM9PQ8impmpfzu8Ui2YYhzTGrTjGn8fK5ywinkGPd18fbga9pkZgiRLMCboyU3
 QVONZh7Yc+k9V2xZ9JN1gA9WskAz2ILLOCg9oVUK/N+bRHUUk/G9cmOBCL03a8rEdfM7
 o3eQ==
X-Gm-Message-State: AOAM5332FOBQeYtn4MSvT3wNFbeGQ6K1vi/uPMt2IG/YaeaTw2TKwY2R
 c4oJXHQeAouzazGfb1xq0Yjd7V9o45qTpRiNNYjz+Q==
X-Google-Smtp-Source: ABdhPJxvh7bJrM39HFwhK8TuY6KVd8f8GZJENvOedfkID6Mq/RvLSOGd4eLiCG6zVSi38Tr3zWGPRB9btVnqCUbu63M=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr2224584edb.100.1606392613760; 
 Thu, 26 Nov 2020 04:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-13-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-13-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:10:02 +0000
Message-ID: <CAFEAcA_g5-tuqrRY8khKC0e7LBrJYr6DTVBx322=+yPYP4HcJQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] compiler: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 108bfdb391..f492baf341 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -55,14 +55,10 @@
>      (offsetof(container, field) + sizeof_field(container, field))
>
>  /* Convert from a base type to a parent type, with compile time checking=
.  */
> -#ifdef __GNUC__
>  #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
>      char __attribute__((unused)) offset_must_be_zero[ \
>          -offsetof(type, field)]; \
>      container_of(dev, type, field);}))
> -#else
> -#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
> -#endif

This bit looks good.

>  #define typeof_field(type, field) typeof(((type *)0)->field)
>  #define type_check(t1,t2) ((t1*)0 - (t2*)0)
> @@ -93,7 +89,7 @@
>  #if defined(__clang__)
>    /* clang doesn't support gnu_printf, so use printf. */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#elif defined(__GNUC__)
> +#else
>     /* Use gnu_printf (qemu uses standard format strings). */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>  # if defined(_WIN32)
> @@ -101,8 +97,6 @@
>      * even when MinGW or GLib include files use __printf__. */
>  #  define __printf__ __gnu_printf__
>  # endif
> -#else
> -#define GCC_FMT_ATTR(n, m)
>  #endif

Didn't you already change the GCC_FMT_ATTR stuff in a previous
patch in the series? If so this part should just be squashed
into that one.

thanks
-- PMM

