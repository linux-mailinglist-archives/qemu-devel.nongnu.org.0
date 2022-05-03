Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDB518A04
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:33:42 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvT3-0004cm-BR
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBm-0004FO-EZ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:15:53 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBk-0005XO-AU
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:15:49 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id y76so31959419ybe.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zzEb4FkMCxElM+ai3vup1PidQzwLCjGmY0/ePMDvpM=;
 b=JOSFrur9yzCQSjG4NdY2/okOKqqLTW7Fj+dCyme97s+8xEsUROECJLHtuMiIwcoCEx
 eGwCIQLeLOa+rUsQTbCJU6c0USZCPptWx8G2BzQ/XMdI8Pc2HX1p9K6zeFeXMWoWbE6/
 Av1a7y4CuwMked+4g2h3m6M8IWxBzZhlFXYWyZ5MhSRZL5SsQDHsDoBZJtt0UUpzvxNY
 Dj6LpvdJs4fuE3cVKsATfPhWIgDSRPXIJmlkBRS4T2NF7vmoyRQ4EidGJtAS1PRXYh4m
 IsWFljhXK2Jra0ICGflohQM2iy9eF28F33zlqrY5g2IsvAummE6TjSfXDha9tNaXlF+s
 9Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zzEb4FkMCxElM+ai3vup1PidQzwLCjGmY0/ePMDvpM=;
 b=pCSUlXMpREV2fC1YqKb9rRy5T2P5bYNsqXJmoDDruCo5viB1mPoxY0fVkD9R+4lsl1
 1CBC7Q4z3alKX1ABQXawJelje7/eQlttx0uSF95n5UBs+8GDgIQiNUYrkzNe9LyU/0Px
 ruivUZRnBmKE+e2sgS6m9kTpKKl8r1A26oFCsNtgc/l9W3+wSNZnfDdHQKasvPTr3gb+
 Rsg8wtBYL5t6EpaPkCW1AK+bLGwknvE8sPEVa/ZVXXvqywi9CUTKuOFNsIVkpwjpvuqF
 DwsqdMqGqpWLbQiyB35ts9bl5zMWW4lScrFHzPVBvkH6rOE1urI0JxW1ejL7ug6gAU2W
 RaDg==
X-Gm-Message-State: AOAM531hTVqfxpKrIAHwgNyNRKv54HqP3Mfoe/a2Qf47oruvHk5WA3BD
 3SuXUSbd06KLCesh/3VLdV5OZYebtotw/b+XpIZT+A==
X-Google-Smtp-Source: ABdhPJx+TMXUNXtzC2EXid2ZnYzi/g+PcVw4HX3gy3JKZOKMp9LismbmYK1iHSFy6bdpKX4JA1u/SScwhnGmlbuhQwE=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr14084047yba.193.1651594547019; Tue, 03
 May 2022 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-16-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:15:35 +0100
Message-ID: <CAFEAcA_i4kMjPbP9kdk81Xh8vhLtYy6f1n__Zhh6_y5BF_6XMg@mail.gmail.com>
Subject: Re: [PATCH v4 15/45] target/arm: Use bool for is64 and ns in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 1 May 2022 at 07:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Bool is a more appropriate type for these variables.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 4 ++--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

