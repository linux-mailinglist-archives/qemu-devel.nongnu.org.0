Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F124B5DCB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 23:39:42 +0100 (CET)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJk0T-0005Ef-EM
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 17:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjyH-00048A-Dl
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 17:37:25 -0500
Received: from [2607:f8b0:4864:20::431] (port=42822
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjyC-0001Cs-4R
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 17:37:25 -0500
Received: by mail-pf1-x431.google.com with SMTP id i6so29795936pfc.9
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 14:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulzP8XqOMHdUPd7alEuqlSYedSkpNqGEkKe2bdFBYTo=;
 b=ATn1t1ySKao0zow+gUdRWG708bvycUbYxt953KuhfyVyEXzt/O9cqqh+xd/O5uyoK+
 dAwZEYsrZAXc0zjhADvJoQgLXxGIDsuxR9O/ZdgTUitRpCrlsC6Mnd/RnbwvlPovQdyy
 jq28XsHAks1NcR4VIZr9RSPP5keDQ1rW1Ah09qGxH43pcY9YrK2Bk+J5FJ49jisraP+2
 8HuoFqilLXKYRa1u0/C4ujN73v31gOgGRtrke5EQc3pVvNJLH6CIAFsGOonA7m0zP2l0
 ZDTV+IR1bQ82NRT4xfutWTr+mukVhczXDyC1W3ve/MmRP2kN9Aszfzp9ErGiM1T0tfcF
 4t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulzP8XqOMHdUPd7alEuqlSYedSkpNqGEkKe2bdFBYTo=;
 b=c8G7BjMRwmvmBbcqBbwwJVqp5Ezc2WT1kVeJ1tafh3JuHZ1m3UsFv11+kswDydv2NK
 Ym1y+WZcXPQpx0ZlQFU+YrT/Ha4EHWgeEvIx2+sWL+AmaiZZGxif5774im3jhbe3YfGm
 86s2EH9599QJwijWZ72h76fS+e0yhYGLaZQDdmxGtuakHkr3+EHIsLpm4zQnVJtzFpl5
 Nst+PxjE8h8J6eY1fEHlJ/j6SSFZCS0RsjbEnAQaXM7gXQ+/cODZNwnQtR/PM0vdoa6F
 NZ6dM5Aday+F39kqsDpAhHf9wIt5kBigsCj5ogO8L93Bbk9dmScxad1+57OYKfT+M1Ns
 +r2g==
X-Gm-Message-State: AOAM532VhKi4AYeW5RzaQntoD1mt6VnUmrXkctOcsFfWs5Ki7bQ6//pG
 6guBFlOVdy62G0Oc7IBXiis=
X-Google-Smtp-Source: ABdhPJz4yOrHzism4WmsI8tvIUtW4ONh/9gfhFGGgcCRKSinJczGtjLIf2B0vRhX2mUzOpuLuQim8g==
X-Received: by 2002:a63:2b11:: with SMTP id r17mr1019221pgr.83.1644878228190; 
 Mon, 14 Feb 2022 14:37:08 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q8sm40830847pfl.143.2022.02.14.14.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 14:37:07 -0800 (PST)
Message-ID: <24acffa9-2f41-e59e-7a51-6ba7c9f4a1bd@amsat.org>
Date: Mon, 14 Feb 2022 23:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 09/11] 9p: darwin: Implement compatibility for mknodat
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
 <20220210132946.2303-10-wwcohen@gmail.com>
In-Reply-To: <20220210132946.2303-10-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/2/22 14:29, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin includes a function
> that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
> 
> This function (pthread_fchdir_np) is protected by a check in
> meson in a patch later in this series.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>               - Replace clang references with gcc
>               - Note radar filed with Apple for missing syscall
>               - Replace direct syscall with pthread_fchdir_np and
>                 adjust patch notes accordingly
>               - Move qemu_mknodat from 9p-util to osdep and os-posix
>               - Move pthread_fchdir_np declaration only to osdep
>               - Declare pthread_fchdir_np with
>               - __attribute__((weak_import)) to allow checking for
>                 its presence before usage
>               - Move declarations above cplusplus guard]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   hw/9pfs/9p-local.c   |  4 ++--
>   include/qemu/osdep.h | 12 ++++++++++++
>   os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+), 2 deletions(-)

> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
> + * in case it disappears in future macOS versions, because it is
> + * is a private API.
> + */
> +#ifdef CONFIG_DARWIN
> +int pthread_fchdir_np(int fd) __attribute__((weak_import));
> +#endif

Please use Meson to define CONFIG_PTHREAD_FCHDIR_NP, similar to commits
10f6b23187 ("configure, meson: move pthread_setname_np checks to Meson")
and 479a57475e ("util: Implement debug-threads for macOS").

