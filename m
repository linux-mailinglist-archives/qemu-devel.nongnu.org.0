Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4374665DF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:53:08 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnSN-0005Sq-6E
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msnQK-0001d4-KX
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:51:00 -0500
Received: from [2607:f8b0:4864:20::530] (port=34801
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msnQI-0003Tl-SA
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:51:00 -0500
Received: by mail-pg1-x530.google.com with SMTP id 200so27321864pga.1
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V91uzDHUNm7QF8ngjuRF8da08juWxV9bkKAPbAxfEjc=;
 b=LoZNGsU9SP+61gGXMm5AiYUQVjBM2oZF/zKo4QI9ixDdT11Fm34X3Zmhypwh81ib6N
 e64j6nrZa9Ql65h94IS1R72idCJsc8p1Y9O8O/HnOatY/hRWb4Elr9+JmO6HZk7opvr/
 +Odu+JMzQx2DRGcPjyg9HlF/GNKDRXnO56Nh5FUyDiIQSUYHx7ruOErAW0YKqB+5wNz7
 bsTDK0cer8Sxf/3nlxwN7Hg8TTJPRhOoJWTjosnCg2y3fAwx/cjMIz54WNo5mR+SoJNH
 7BBHO6de2jImb7o9Fl5BErMQdJNBf43q/T1IV3lVKG54D3Ygf0daVbzuUe50HTomu29b
 SKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V91uzDHUNm7QF8ngjuRF8da08juWxV9bkKAPbAxfEjc=;
 b=jtKTtjy/m7FOaHS6YoCehS83Eahi6bCYX685yzpKFpYLA2GZLPd6OGDavQhmqRsUbc
 F550YdivF1yB/3mdcZ9emtJ21x/Kr/1P2K1ceng7+lt6XrUrAyksrHZvQkuoZ6NkhT75
 wGmLv+lxPWWjg5VNflaTmT0leZj/BwDLQN5UHrT1YBuyfUTz8NjHVlzJ+F67IkKECsFB
 G0oQiMNn00fNxCnenzOIrpDcqGBfeQlz53t18AxFHXYZUdO4k7WmSvQnEs90kYMgfO3r
 9tXTl8rdGXHAoXRHwRpkLG1Dk6VDfJYT2Zr4xYeC++sTrRKyi0M4fBssQPNSWjLA+Gbl
 BCow==
X-Gm-Message-State: AOAM531AfyVsl0aLYcEd9VfMYSFBnxaX8lU9rO7gUEBkjpIOMsAcsjBH
 k+Jw4eoIdyTnHJINEs7ZG5fBcpiWI8CAKhG2LiBuEg==
X-Google-Smtp-Source: ABdhPJyTMmHRIgAVclmgVPWDsiyO4rMRiaccg6MHNsYg148eyIqxWYiQkW74cEqd/QPq9nIAJpSrLRHd7ea52XpHlR4=
X-Received: by 2002:a65:6a43:: with SMTP id o3mr9668267pgu.329.1638456657480; 
 Thu, 02 Dec 2021 06:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
 <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
In-Reply-To: <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Dec 2021 14:50:46 +0000
Message-ID: <CAFEAcA9psJ_vpZSduFVCqgisWgJVFnn2Vgap3vezWCrHK8yfjQ@mail.gmail.com>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Dec 2021 at 14:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> My compiler-developer colleagues present the following case where
> 'noinline' is not sufficient for the compiler to definitely
> use different values of the address-of-the-TLS-var across an
> intervening function call:
>
>   __thread int i;
>
>   __attribute__((noinline)) long get_ptr_i()
>   {
>     return (long)&i;
>   }
>
>   void switcher();
>
>   int g()
>   {
>     long a = get_ptr_i();
>     switcher();
>     return a == get_ptr_i();
>   }
>
> Trunk clang optimizes the comparison of the two pointers down
> to "must be always true" even though they might not be if the
> switcher() function has resulted in a change-of-thread:
>   https://godbolt.org/z/hd67zh6jW
>
> The 'optnone' attribute (clang-specific) seems to be able
> to suppress this

...no it doesn't -- although the get_ptr_i() function is
called both before and after, its return value is ignored
and g() always still returns 'true'.

-- PMM

