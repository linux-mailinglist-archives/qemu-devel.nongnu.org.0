Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C2E981
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLAQ4-0003hg-O9
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:50:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLANc-0002hJ-Jv
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLANb-00012d-Qk
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:47:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLANb-00012I-Jl
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:47:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id u15so9403186otq.10
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kyj3yaotyScuvoTgwqky4+dB3dXTDqqjbwvr+4CaU9E=;
	b=kDZo1hZXw+3N8IrFtZdq2A/ewG+Dm820y+Gvp9o3gnyOJZM97wb2xBnnNxxTxA2Gw0
	82zpKC7T+myr/naOD1a0zjgreTHMTgBDjbO4NK77IV4+5QsWIdMn42vZOB4aYUf81gwN
	68CK7nbBKcD5mwEyn9McxHcYoqkcn3wqMcjvFKLwAAarkZoUTSSoOQXhYqkbjcylv+u8
	OSB4H8L2WvEOcMQkBI9s09Z102qOnWoh7rfxPppNLdf/o691SHELSxC6cyXUSVbuQOkg
	N77DPmgQP4X1pcb8jzdcJz4z4gi0YZ82nhtH4Rpr6bVaJObQR+r/GNb6uBrM7XNL42i2
	hHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kyj3yaotyScuvoTgwqky4+dB3dXTDqqjbwvr+4CaU9E=;
	b=iLjA4Z/m0EZkT2ve9OX0tFjjASvdtfyBPW+3QWE5edSwR4t+tfXQppl08xyN7lGOAg
	Vn7191VsOHxDStVO0WmWc3DTHxvi5QOozqet24bf431iomWRLP/9PtNJ4v+0Jlh4PpOA
	iElj2HL0xH5FR1Y39k3UAnRhgY2WJF9Q/hfbQj4z/7fcu0FZxE2P2Ybj8+RR/pC3Q7/i
	MWb44GIDVkth4H91nOIkoHNkXnyRM0r78xlAU/WpeHKSiIACMdDYFkHLO6Sanj1H1ssZ
	fP4ZxemLz9+3YQnZtlvQrdcWxjUc5A85xAcIKImAC7v+prBKjfmqqFia99cUQA6vuaGj
	iMvA==
X-Gm-Message-State: APjAAAXhv3wAMgTEzV7SSsPpW4h+FMRq2IoR8q/Rzd7tzzU/K4TYhYi8
	0tJTOXbqWoFZ29gp0Y8JlJ67imvaLb7KffjSU57BRg==
X-Google-Smtp-Source: APXvYqw6nAa/gUl/3iw6MMDX6noXQy+1uzWTZvOf/U8GQim5Rt4H7zq6YTgJB6yqO6JB5edG4/EbghcfLglEwn56dyo=
X-Received: by 2002:a9d:404:: with SMTP id 4mr37277375otc.352.1556560070661;
	Mon, 29 Apr 2019 10:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-4-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 18:47:39 +0100
Message-ID: <CAFEAcA8tZwmzrvvEv+Gx=AzdtNs_S+5vBkVQ2hqExzBxeDk=vA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 03/26] target/alpha: Convert to
 CPUClass::tlb_fill
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Apr 2019 at 04:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/cpu.h        |  5 ++--
>  target/alpha/cpu.c        |  5 ++--
>  target/alpha/helper.c     | 50 +++++++++++++++++++++++----------------
>  target/alpha/mem_helper.c | 16 -------------
>  4 files changed, 35 insertions(+), 41 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

