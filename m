Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F054466E3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:20:08 +0100 (CET)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1wl-0005jY-OB
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1ml-00047v-Cj
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:09:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1mM-0006hd-Kv
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:09:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id r8so14465700wra.7
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vr1zSR9fB3KPn/JFZuCIaYvKPYLLocx8baOqc5yoKLY=;
 b=ZVeEfeGXbr79RydtbcedT/Zrq2BTNxvKsSxZFYPeJObWUJLhAT4YITYg3duCamFwK5
 2HPnn743CLyFkOfqMfr2PvvkrRwuO1V9YQ1c4dTrfx8kv7FAl8F4ZbBY7xoxnc96z9Zn
 SmgPauCA8vL9FbwqhSnIMy6A8uFWy1Rc9aihTqUKsBs5Fies5SKwQL2bnLDwJZgu27hq
 2zBrVF/1hZUN9K8Ybfkgk8o64/vAlUwj2PvVU5rpaThfZ8IGs4sRKEPHjfCTjAKRetmh
 nUlM8wr7WNxDkwc6dXWbgs3CJz1ljQaIAhpaXbwNRfoTfEzt7OEDc85EYaGHlPlxl+5v
 LyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vr1zSR9fB3KPn/JFZuCIaYvKPYLLocx8baOqc5yoKLY=;
 b=twbJHgl1DMCJTbmWkEyzS+JT6ryhZVhx9WTMkejsThKwuO6itl0C1tUqkRfxdAs+/H
 Ux2y/uwIDq1ncVAeNmUzTU0eYB7LEBi6Azh9ADQgyc9hBjQqW9pPKxD6A3EwiMgd3AMs
 iEOYI4DQyFviAzk+u0sQRec79YbjM1j/LWmOGygY3JqvGZp8eLvesJHDyGUZXTzheblf
 XehzQZo0He7qLo3sCmrHHpesKFrpTnNVe1F49DU4J/nDtD+ZZOjqTfioE5ND/Ko2Kc9J
 3DLGMHpdQWk31SPHNj0kh8Zlua9eYfLBMsWU5i13CJcdkVhFLnrQCqAHVwFXh5oAKGnZ
 US7Q==
X-Gm-Message-State: AOAM531pv6/sopIb3kqENYJnm+7YXL0uf5F4EJmeNcCDft2jYKFNHNuv
 C79xQ7K6v9I1VJRoBpYHgkrfUNGiMW6U4tlbf42/4w==
X-Google-Smtp-Source: ABdhPJz5MYE5NebXt4XV3S/t++4icMgOx2sLIjKcrd4JQPZNRsdDPHW1gQwXLvYQqTt70Y0TMLXm9WBwcJNJDHTDENA=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr22530611wri.376.1636128561040; 
 Fri, 05 Nov 2021 09:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211004074421.3141222-1-laurent@vivier.eu>
 <20211004074421.3141222-2-laurent@vivier.eu>
In-Reply-To: <20211004074421.3141222-2-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 16:09:09 +0000
Message-ID: <CAFEAcA9iHusvcQK7JMvq2G4V-v-XiChMsnDDcJsYhxzxnfaW+w@mail.gmail.com>
Subject: Re: [PULL 01/26] linux-user: Add infrastructure for a signal
 trampoline page
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Oct 2021 at 08:44, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Allocate a page to hold the signal trampoline(s).
> Invoke a guest-specific hook to fill in the contents
> of the page before marking it read-execute again.

Hi; Coverity complains here about a missing error check
(CID 1464101):

>
> +    /*
> +     * TODO: load a vdso, which would also contain the signal trampolines.
> +     * Otherwise, allocate a private page to hold them.
> +     */
> +    if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
> +        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
> +                                           PROT_READ | PROT_WRITE,
> +                                           MAP_PRIVATE | MAP_ANON, -1, 0);

target_mmap() can fail and return -1, but we don't check for that and
instead assume it's always valid.

> +        setup_sigtramp(tramp_page);
> +        target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
> +    }
> +

thanks
-- PMM

