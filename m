Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8D479A26
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 11:06:36 +0100 (CET)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myWbr-0006x0-Jm
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 05:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWao-0006Hx-Lj
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:05:30 -0500
Received: from [2a00:1450:4864:20::32c] (port=38473
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWam-0004tL-UE
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:05:30 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so4549405wms.3
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zbwBO+OrPS3yA4SQMKfflusQ1AzU8VcL7zt7rl+8KVA=;
 b=HXway6V7liQ7ud5mBLOTil/LNuTn4ocoJS+cBi2Ar2WsFwDNzhmiUFVnGmVw4I+nnK
 giVOyYlNl1vdFEP80R/SicFpMOVdaZdBXXCcYXFOJd0Bkro5w+5FIYadefbqOGcTaJL9
 4bL5O/nHv7iGdE7sWgTVMr0qnbioacAhFcqUC62UdMwpef6Nbggo7ES+MTcK7S23pChj
 GJyYSmLQaKkOMRTVmg9pbqzOHHEcR2vjmUuneCDPRUx5ln/KAwEs8dDK6ClLxXWAjxAi
 sKXKsI3RGhpwvFVjQnBsE2n0+o4Ui9oijt7FO7aRsw8Gu8Csz+72FK4SfHoV+tdngpT5
 XFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zbwBO+OrPS3yA4SQMKfflusQ1AzU8VcL7zt7rl+8KVA=;
 b=2gVUV5Usp2Uf8azQuyUw6ubmRgXMWbetA3IzR9Myhx46Y1HMw+5QRsfPWo+uX2brWF
 4FU9uvWktdl8OCqULoLtETBl1yTYdnE39enEksHGoc0eYcWw5WmscKmlX25G2SslO/Pz
 c/1/64q9KnvlJOyy6UTb74Yndmzi+xWcYMgSX/SyJnPkCoWtlgFJapZ/3gZu82EHAvjH
 XHvEkHTQWcBqIOrOKBFXTr0XKiMF353zAxecah20Ah/Aebyx4BVnM+5t6gFlDWChjxOy
 +k5bT/dCBN5nVoQGo636X3+En9PrPc/SWpT+24QWrdxHgJEJh+7boImX+QNvtNqFLXZ1
 xzMA==
X-Gm-Message-State: AOAM531THlZRedUbBgIwZQIK012R2t1KBtxnPrHdxYb6VGsWwHaQzT12
 zZ/rNhTPDNl6iTPkCpMnZIo=
X-Google-Smtp-Source: ABdhPJwRUVjIL6XdUfWYjI+H83gdAZUxpJwTfiC5p86LTz7u0e373bbSyz97BC7q1FKyT+jUsdROew==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr6037812wmq.175.1639821926686; 
 Sat, 18 Dec 2021 02:05:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id p62sm9366098wmp.10.2021.12.18.02.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 02:05:26 -0800 (PST)
Message-ID: <dfe3bcf2-395b-3795-49b8-55312edd868f@redhat.com>
Date: Sat, 18 Dec 2021 11:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] docs/devel: more documentation on the use of suffixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211217171902.2668674-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211217171902.2668674-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 18:19, Alex Bennée wrote:
> Using _qemu is a little confusing. Let's use _compat for these sorts
> of things. We should also mention _impl which is another common suffix
> in the code base.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/style.rst  | 7 +++++++
>   include/glib-compat.h | 6 +++---
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 9c5c0fffd9..60dfdf9b7f 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -151,6 +151,13 @@ If there are two versions of a function to be called with or without a
>   lock held, the function that expects the lock to be already held
>   usually uses the suffix ``_locked``.
>   
> +If a function is a shim designed to deal with compatibility
> +workarounds we use the suffix ``_compat``. These are generally not
> +called directly and aliased to the plain function name via the
> +pre-processor. Another common suffix that is used is ``__impl`` which
> +is often used for the concrete implementation of something that has
> +multiple potential approaches hidden behind a common function name or
> +one that needs expansion via the pre-processor.

Another common suffix is ``_impl``; it is used for the concrete 
implementation of a function that will not be called directly, but 
rather through a macro or an inline function.

Otherwise it is indeed worth documenting!

Paolo

>   
>   Block structure
>   ===============
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f5..9d3eb1b7a0 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -46,9 +46,9 @@
>    *    int g_foo(const char *wibble)
>    *
>    * We must define a static inline function with the same signature that does
> - * what we need, but with a "_qemu" suffix e.g.
> + * what we need, but with a "_compat" suffix e.g.
>    *
> - * static inline void g_foo_qemu(const char *wibble)
> + * static inline void g_foo_compat(const char *wibble)
>    * {
>    *     #if GLIB_CHECK_VERSION(X, Y, 0)
>    *        g_foo(wibble)
> @@ -61,7 +61,7 @@
>    * ensuring this wrapper function impl doesn't trigger the compiler warning
>    * about using too new glib APIs. Finally we can do
>    *
> - *   #define g_foo(a) g_foo_qemu(a)
> + *   #define g_foo(a) g_foo_compat(a)
>    *
>    * So now the code elsewhere in QEMU, which *does* have the
>    * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
> 


