Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F918813
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 11:59:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOfpb-0004fl-1f
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 05:59:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOfnS-0003mC-CO
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOfnR-0002TK-GD
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:57:02 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42725)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOfnR-0002So-8q
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:57:01 -0400
Received: by mail-oi1-x244.google.com with SMTP id k9so1425346oig.9
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b5p8SeS3Gu9mrtvsUZnBi8MKwHMjPvottA6QoOJChdA=;
	b=SU2ZdVr9MZd8m+vT+/Hz5iygyGK2+fjPnR0nk6Qvyoc/z1EzsjvjEm6DI4dODmaGfi
	dSlYFxbrKzGdUYJ29OuMK1F3st3iL7XwwTw2eNLcEZS5ARcfPMC8mbQZoG3GSD543r4S
	gQpEgVqvzB1DdfE6LtfbQfDY90p9rEfCmcqJzCdMytdWqrgfnX7/pmDWYF2urRBgxNLk
	eBFpsF0ZHHvazMwOSkeR1PyaONb2QANQfOCwGm5Nop9bXsO1KLYJ4MeizIHvvY9HR5N9
	bUvZW0y7kRDYciPrYQKim9+4qtzIfTKnbv6fMPNx3Y2rUZOCgGMmEV9ywu52JKtlAasr
	26BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b5p8SeS3Gu9mrtvsUZnBi8MKwHMjPvottA6QoOJChdA=;
	b=dPUmR2ceWWAWS20gUyh0iHhfvBayM8Q4TmgJEN/M6hLmQrpdb9DEq/Io0cKmmH9/e/
	zHOnaEWBkZNQdbPWGxj2TEXuYkYeWDpMA857E1FKcZiYp9S2vsAfAuh7bt4m552wa6S+
	XNk2HeXVAyCK8GBroBKAB3sq+0cTeWpK2GAlmOB35pI9JyoN6+lSf7tMCMEOGuH0ra8h
	utsz88QF1eNA9TB1Z6KaSucs92t2BNb2jT6aOkcVLuiIZljFH5RjbaB6v8DBzTS8HHcI
	czH/BV31cEvavakbtKMvPoEW4tLbxPxs7LmO9Lql9r2XK35QOim8r0qQfiBlv9XHLdkn
	9HYA==
X-Gm-Message-State: APjAAAUo331aoza2CTS4VItDlZUT6WCzJSlPWuaSeQFtBc8oNwLFtb2d
	A03jlH+CjpVfSURsfg8u48jj6PQSGx/NTiVGNi0SCQ==
X-Google-Smtp-Source: APXvYqxlF5GBXVcml8+h/42hRGtLRDR5331BGXp2QlrIKJ6vE81pbPUooGRcXD5x2fGrtivjBxOe7bh3vCTB9tRdc/Q=
X-Received: by 2002:aca:b783:: with SMTP id h125mr900747oif.146.1557395820013; 
	Thu, 09 May 2019 02:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190509060246.4031-1-richard.henderson@linaro.org>
	<20190509060246.4031-25-richard.henderson@linaro.org>
In-Reply-To: <20190509060246.4031-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 10:56:48 +0100
Message-ID: <CAFEAcA-fHCfcqb9jM=usp11ZVoFjGk-faObAAo6ekCQTtPb2xw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 24/27] target/xtensa: Convert to
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 May 2019 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Keep user-only and system tlb_fill separate.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

