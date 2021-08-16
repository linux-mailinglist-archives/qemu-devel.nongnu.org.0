Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B563ED1F3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:28:18 +0200 (CEST)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZqr-0007Dc-6f
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZph-0005sS-3y
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:27:07 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZpf-0004io-HY
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:27:04 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v2so15214391edq.10
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLRP6Srbo7LHnLeghdyqGBWPiWpWRH/NL4bZ5LUSgN0=;
 b=cF7qy124xUHv63ogJCZv9+62xWhGWcWoVIN00Z8IGf9x6ugtCPoWrK7Ska5uigH+iu
 lMvltD8/7tHrwZPQI6huHGRXD5E92El6FIcThMaqA9t5LI9ee/gn4HoKppDyi8DC7RFC
 tRcseErLhoqQTb+ZPopykbjTkYkORTZTw4iVSxVGmTJO/PlpMUaqNzXQ3QrpyAHnZcYq
 /6+UNxemb+EbvQf3ztw2YdZfydXgoXNa6ZHJxCkqUSjVHZzlciJ8/jshfm3x8mlz2v9c
 RpuBjfXSpVxCNOvaxWD5+yvDeIRTb5/QFoSa8emcs8fvuyJaxCTbs3G3F5GOdNF8pivz
 5daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLRP6Srbo7LHnLeghdyqGBWPiWpWRH/NL4bZ5LUSgN0=;
 b=HXwRMfwCq1f5ibT9iYkTCjapsjU6NLiQguDNLteSQMy5C51KLW3jwSDcMUL7UxL0r8
 /lXv4xbYsUEg6BCXtnug/cIrubJhHtBreT7ImdVLiPdpfBkXrUDB39sP3x0aMSCDQYDJ
 j1yH+UqydEXQiVEOHm/5DfQgWJ0G3jYTv1sFrBNg8+ckV4qpbuqIDMiPlE9Yv0nS/qyX
 1L0Tdp5/53wUBBIFu6u+XAdhaoSkG+0eqgetuEZTggORA2D22bBaeYpk/oYo33BypQc5
 +JFc0oDsxzBmHPJYJz6eA7ztm3vqVOXwW9M7vUuNgbNr6Q2jUuOdJQSNrteRdnk4V1Os
 NPoQ==
X-Gm-Message-State: AOAM5324tg9Y2rrhbzvop8V9nN+BfAeL7isLHhnfLQRhbdYDfe44cExG
 +inDHarAOac9hM+yOTHMZw0TfqJwC4Qyovi7EOGQjg==
X-Google-Smtp-Source: ABdhPJwkk2MM2xvGhN9V9E5imRE/7QDcTK8SE9EgJ8AH6tfuGJ5L/QpqS7/QlVMUR9iS+YYOAjv96Fju4uimN1xOML4=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr19077883edu.100.1629109619854; 
 Mon, 16 Aug 2021 03:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
In-Reply-To: <YRn6d/Vb10JTmZ18@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 11:26:14 +0100
Message-ID: <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 06:46, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
> > IBM EMAC Ethernet controllers are not emulated by qemu. If they are
> > enabled in devicetree files, they are instantiated in Linux but
> > obviously won't work. Disable associated devicetree nodes to prevent
> > unpredictable behavior.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> I'll wait for Zoltan's opinion on this, but this sort of thing is why
> I was always pretty dubious about qemu *loading* a dtb file, rather
> than generating a dt internally.

My take is that if you have to modify the dtb file to get QEMU to
work, then that's a bug in QEMU that should be fixed. It's no
worse than for the machines we have that don't use dtb and where
the kernel just knows what the hardware is. (In my experience
Arm kernels can be a bit finicky about wanting the right dtb
and not some earlier or later one, so I think at least for Arm
trying to generate a dt for our non-virt boards would have been
pretty painful and liable to "new kernels don't boot any more" bugs.)

Is it sufficient to create stub "unimplemented-device" ethernet
controllers here, or does the guest want more behaviour than that?

thanks
-- PMM

