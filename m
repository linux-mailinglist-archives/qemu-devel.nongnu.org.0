Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4E213B62
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:53:50 +0200 (CEST)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrM8T-0005g0-Dd
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM6p-0003IL-3R
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:52:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM6n-0000HH-6m
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:52:06 -0400
Received: by mail-oi1-x243.google.com with SMTP id x83so19002956oif.10
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Zg4UaLRNsQxpF3+LRuH3eHHCTSLdGm80tI92zWvhdk=;
 b=aVMVFWSL03y4QZugioqAliSJKlOl/uapAJXCTjfmTQSzJ2UyYV1yAdgJDkojq7aylj
 nQK5tYsZIAPA4Y0kLzCQWBup+2njzbIj7Bsyt3UDSdkZJnxAwf02hDIvA1eqSDoaYmB0
 B2ciuOtNtcOCAuhCpo+eeixsgFtYC6dap9b8ePSwBNYkiNHGPagdjFSS5H594Ih41zhY
 VKmt1UepyFGDwPVRNCwZIdXpqQSMZusqtYBxdhdKGG3BnoAyuGLeS8vksVX4z+EzmXWh
 WXb/xcOtaVblKkBZjA5q7ZTcqPJd/air4/g1zw8a9CbuvfdaKS+aSNapJG7zgVTAP36n
 +s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Zg4UaLRNsQxpF3+LRuH3eHHCTSLdGm80tI92zWvhdk=;
 b=r5ZALTE3ngM5b8PqYIpYwl38Wk++oOGvRNzNgpjrNmdZo/WDQgNoQJjRF5/95blsYH
 eJM/4uK0LW2q428tsQIVudIGo1c0DR37MUmNJqDrCGfbafi7OxBZf+SRI2AJQZm+mpC6
 fqVP2lcgC0Bsd8k5qFwnFEzQQ6WE1xJFXdZpsAviWqCY1djgzzz/LJ0EPmhbd1NDyswN
 PosyH6I86M68/vUcdx2hMA+ifRnFIpmupkgi9rJunGqJ9dhE9tblpB0l9/gg99LI1sog
 wyOJ0n7NkLe4IEGPkuVgZizUfpgH/tgXxZv40diSWjFei2QGc7RIDrBSFhm8J9jRucvC
 Tazw==
X-Gm-Message-State: AOAM532f9c3lmpX8sh1rFH9BzfYVf4H+TjHjcpKO5HFcbGzvKSjv5mNX
 kKFUN/KSZwDoz0OcD18iaqcjeQOXSq3+sRWk8QyX4g==
X-Google-Smtp-Source: ABdhPJyWY99WUs5pLqoCEAGBC6Yg11BTQVfQnDWRftWcFEgdXaQApPDhLXlnz/oaFNS/Tg9Q/lZXtGnFjGrkxOa8Fzg=
X-Received: by 2002:aca:1706:: with SMTP id j6mr588271oii.146.1593784324148;
 Fri, 03 Jul 2020 06:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqyoDM3EZwvP353aMAELYZ85RF_4vsOw0A=HD1_rSgfrDA@mail.gmail.com>
In-Reply-To: <CA+XhMqyoDM3EZwvP353aMAELYZ85RF_4vsOw0A=HD1_rSgfrDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:51:53 +0100
Message-ID: <CAFEAcA_d8YYbb+T0iWci8ukRS=TA1gGf4Ky8T717hWnbP1jJUg@mail.gmail.com>
Subject: Re: [PATCH 5/9] Define SIGIO constant with SIGPOLL equivalence
To: David CARLIER <devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jun 2020 at 01:47, David CARLIER <devnexen@gmail.com> wrote:
>
> From 93c001e7da19c76a73a687dc6584bc31385a2693 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:18:32 +0000
> Subject: [PATCH 5/9] Define SIGIO constant with SIGPOLL equivalence,
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  include/qemu/osdep.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 6e0cf9132d..e090ead826 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -425,6 +425,10 @@ void qemu_anon_ram_free(void *ptr, size_t size);
>  #define HAVE_CHARDEV_PARPORT 1
>  #endif
>
> +#if defined(__HAIKU__)
> +#define SIGIO SIGPOLL
> +#endif
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

