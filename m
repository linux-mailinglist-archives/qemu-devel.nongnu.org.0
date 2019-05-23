Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F427FB7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTolC-0000VS-Cg
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 10:31:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hToh0-0005oy-B6
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTogz-0000o8-Hc
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:27:38 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTogz-0000nE-Cm
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:27:37 -0400
Received: by mail-oi1-x241.google.com with SMTP id u64so4522817oib.1
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=n0Ijl4hy3Tw3rG6YEgtZk7MKBK/kH8g9qzdKz+PPWmg=;
	b=kClbc+tbFVtfBqauINe1eE9GN40rWXJXr0s4OKcMdutCBsH3cnBBqMmRvuAeRfdz2E
	Y9pyBePHTpvYPQef3FY4a6cCN4t1+Sc2Hz7sQ+EUK/YuanhtAw9fUJWvT87LKwjM8b0U
	P76iTr5WOKLoSbDnh1Hyq9cSNn2trLm8/PrZbZ6wuR0oWAg2d4sK05bzazzwCP4DUduT
	InvGaxEWfHvJVutgvy411lz5MBoEiq8OaGgmITlyhlX+W4weDBkcQFeM4Vv1fgd8qXSR
	rtVz6Fiy6Livzr4y5sasAbyhS1K7l7UJtUCuxfejeCihM9mulr6MKNIMsZg5NuWOENQ2
	g6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=n0Ijl4hy3Tw3rG6YEgtZk7MKBK/kH8g9qzdKz+PPWmg=;
	b=ajIFHS5DUnx91YG5aYcoBGDiZvFNFbO3dS7vkthCRCgiU0SL5HdtRvbEOHDTkwK4vl
	qPJEz9rrmaJ5hWhmn4RNtatF/fukCjXsGQcitdngE8M9Krix+5jYmPFbWVQXU37bv5oG
	3X9pYfQGFu1XltzaLfyzje/SFGrdhZIUzoJBvuDE5oxazGG0VvcH3eRp5THeMHMosrUy
	7r2/i7rEDYMt9LuQAohkqfI4vjM1yc6+OSyNRo0Tz2jh7bgNKXBOGRpOsOk36JdUZ5IC
	Ap4NgAqFDAxfFSZxDh6o6TaoWFYnNs6cdurwMZygUau4cj4+/m8olmw1QopNBPrwdQiX
	FAXw==
X-Gm-Message-State: APjAAAWkx4Aoypma68I8AeUQC/JOMn5YWSEG06hkfiteyWLS1xEYDtbb
	UDru6gYLmuvf8S8WFCAoMTH35Pq4zuvAwKZg9kDgoQ==
X-Google-Smtp-Source: APXvYqwZxguR7fxAdz/1y3C7dX7W3tmwmcfXFPUgS1VI0hypzxVNeXFemctkq7Dw8LWC5iw2F2NIxxbXenhj7CXxb50=
X-Received: by 2002:aca:cd12:: with SMTP id d18mr2741321oig.146.1558621656272; 
	Thu, 23 May 2019 07:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190520162809.2677-1-peter.maydell@linaro.org>
In-Reply-To: <20190520162809.2677-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 15:27:25 +0100
Message-ID: <CAFEAcA8tJfNtTB0PaAT+Wvi3qGsjyjPdh7djJhXn56mkF19f6w@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 0/4] hw/intc/arm_gicv3: Four simple bugfixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 May 2019 at 17:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes four bugs in our implementation of the GICv3.
> They're all fairly small fixes, largely typo/cut-n-paste errors...
>
> thanks
> -- PMM
>
> Peter Maydell (4):
>   hw/intc/arm_gicv3: Fix decoding of ID register range
>   hw/intc/arm_gicv3: GICD_TYPER.SecurityExtn is RAZ if GICD_CTLR.DS == 1
>   hw/intc/arm_gicv3: Fix write of ICH_VMCR_EL2.{VBPR0,VBPR1}
>   hw/intc/arm_gicv3: Fix writes to ICC_CTLR_EL3

I put patches 3 and 4 into the arm pullreq; will respin
with a fixed patch 1 plus this patch 2.

thanks
-- PMM

