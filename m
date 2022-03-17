Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D604DC9C7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:21:09 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrw4-0004aq-Kp
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:21:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrqh-0008Ju-Tv
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:15:36 -0400
Received: from [2607:f8b0:4864:20::112a] (port=46823
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrqg-0001D0-Hs
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:15:35 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e58e59d101so61320957b3.13
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LoZRcpYnHlO4OMIfpnGEtH9DlZjShugRPMVzcLIH3jE=;
 b=kmkKUDjcsqVKtD+rUOASJr9ZLytkEpgCz4vFuIvnG5Er7a1kng7bi2k0694D1TgY4o
 GnNccJmFGSPN41uR9QQKykHWKZHtIwF6YiKOAbDXP0Or+o+aMO/9zpmqv0P6ZJemWhpH
 jd0r5o8t9Cy02ne93WHR0ZtJQvAy8KnQIxK9HK+UrD8ptn1udxHf+Nd1XQgm+kLbRjVY
 yUHKhGThNyyOcBAF5L6EPrIxKbSYqHSCARetBUTNjys+IMRsmrNvlo2NvFEytF7LYjUj
 2D760i8DDvZo/Dn6a1obwa6n9YkPinoMiLrfAY7MDvkQKQToAfrWPkW4w3VQTfBcgQqH
 6QPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LoZRcpYnHlO4OMIfpnGEtH9DlZjShugRPMVzcLIH3jE=;
 b=lOwX03xOy5AZ9O1pFuZaeP9Rf3gLZCWMCCkVTLcxlRDXcvYVvgDfhnBiwwLgTuhXE9
 gpu0jDHjiHm3Ayq2xfNpI0uGCEURw6/CzPHKF4Ych1/JLYBcMG4zhctyaxdwJc7zarY6
 ByWtESvm7HPry5o/tXJPyYcmfTEBmq6gd2ZpVL/CnVqYJmWbD1CLmYhdBDb2rgdrwINL
 ask4iyiOz0jFQo9Xzm7xmMxoUt+LuT3jrCsE6asVl+jUMxrfnyKGKC83WU72DfsB3ZYD
 V8+j5pgmzzgkmbhdfXDEWDi1RbNHEkA7O3JxfTXEuGk5hH4lz+vqwHB8SKH7U88F7nZW
 oKgA==
X-Gm-Message-State: AOAM532q9++tC7e0xLLF21wsaI82lR0w7P7IM5M2Anf3UtsaJPmMQL3S
 6Nu72kBMdP5tBd+286G/LXMu8VRL8Vmq2Kc6AcvyUOBEyfWc8g==
X-Google-Smtp-Source: ABdhPJyA+8Dm6MNfPibi85psvYm1Rk6tIIDcwWeVOkUXcKt7ePWe5pRTcGFgwEARod39ZV8lVe1gGj4HGPZ5WKh2xXg=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr6034399ywr.64.1647530133454; Thu, 17 Mar
 2022 08:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-19-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:15:21 +0000
Message-ID: <CAFEAcA8C3m3LNG7O=eHdEbe3ur=Q8PSiJdwN_wys_4rBq0zVMQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 18/51] target/nios2: Use hw/registerfields.h
 for CR_TLBMISC fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use FIELD_EX32 and FIELD_DP32 instead of managing the
> masking by hand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

