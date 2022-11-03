Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CB617DA8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqa4G-0005DG-Fw; Thu, 03 Nov 2022 09:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa48-0005CO-5N
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:15:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa46-0006Pd-53
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:15:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso1746877pjc.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8UBwkU0AQinYBxIbP9QRSu7UPytCeWkzmuZb2pdgBUw=;
 b=oPxiwkhwfQtTwjg+ssSO7gknxIKhO6ZfqChzxoIqBLa0UVbBMWHTpyg+DCzhP9O2XX
 4DDFS06i+NDXKpduVginA2op5+9/8MJZx/LhwWbpXQSwY+5McfuB/p2ou0ilUBW5HvPz
 Xbn1BDUjb1/lfTzuCNoaN/wp92dqgYYEftOspf/FDScX5sFAbSUsGgLcI+c8YN+QQvOJ
 aX6pnm7NtoGw1pckMjmdNtDZRoEBoO8/o3MPRFltGdLihE5iY/rA+d971+hxBhKluES0
 7AX6ebaeEFTHoPOiUVyYS43pYfYklT7jAuTKpFEICxuq7d2Rbn3mWUg6vqO8uiJKfMgc
 3+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UBwkU0AQinYBxIbP9QRSu7UPytCeWkzmuZb2pdgBUw=;
 b=OYrLrXrz5vZo6skj4GkxXDcb6FNCdPpbJnyGd5GyFhNfdZCPakn531AC5ULRgb8JrR
 P0E8EWWXGg5FOBf4MiczrAk1c48t7I1cIWYlPDgZ/PUNP7DladoUEewb8d4pfBmoagmu
 6OxmhXST6USNS7KWlbzpcaWrH3Xg4DyWj8YvnNRcHGy4HHhBgnoXEUR4ZzOd4kRhryHY
 JB+U+B2Mmhh7jVOZw6g2F5ipomGw7iPh5Q3gbSpWmyhMS2Rw4CdoMbY64GpUJ0uoWi4q
 Mgbhn48lVJFWGCRLTS7WdKQQyfbY0daM9xgaeLFCg2eZvNMrc9MH3v/k4RG1532cGmiX
 ln4w==
X-Gm-Message-State: ACrzQf2gVsjPgEeRyVqxsU4i91igBdmmcDQ6K/MCnPpUg3F8gcc7TMZv
 wIJFhP0m6a5w/WH9ABy7Nre5LO3G8itOJgtiBS9nBg==
X-Google-Smtp-Source: AMsMyM4uT71qwsx3OJjwbqD3KR72Ufkijgd0jC1c7WXu86aoK8D7eMAM8FA5nBxt8r4Y87m0yimrEu3bsdICoHhOYDI=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr31204921pjb.19.1667481323789; Thu, 03
 Nov 2022 06:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221101064250.12444-1-ake@igel.co.jp>
 <2b021c6c-7fdc-9ef9-befb-ff18991e4776@linaro.org>
In-Reply-To: <2b021c6c-7fdc-9ef9-befb-ff18991e4776@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 13:15:12 +0000
Message-ID: <CAFEAcA89qn2gT3SZsHxfP64zhz4nCaf=v=OXHQ1ai5zFVvgh0g@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Ake Koomsin <ake@igel.co.jp>, qemu-devel@nongnu.org, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2 Nov 2022 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/22 17:42, Ake Koomsin wrote:
> > We need to check HCR_E2H and HCR_TGE to select the right MMU index for
> > the correct translation regime.
> >
> > To check for EL2&0 translation regime:
> > - For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
> > - For S1E2* ops, check only HCR_E2H
> >
> > Signed-off-by: Ake Koomsin<ake@igel.co.jp>
> > ---
> >
> > v3:
> > - Avoid recomputing arm_hcr_el2_eff() as recommended by Richard H.
> > - Use ':?' for more compact code as recommended by Richard H.
> >
> > v2:
> > - Rebase with the latest upstream
> > - It turns out that we need to check both HCR_E2H and HCR_TGE for
> >    S1E0*, S1E1* and S12E* address translation as well according to the
> >    Architecture Manual.
> > -https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg06084.html
> >
> > v1:
> > https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html
> >
> >   target/arm/helper.c | 15 +++++++++------
> >   1 file changed, 9 insertions(+), 6 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

