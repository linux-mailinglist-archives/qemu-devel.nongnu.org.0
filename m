Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA79D6ED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:42:23 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Ksf-0002bt-U9
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KoB-0006kL-3P
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KoA-0000YG-5H
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:37:42 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34103)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Ko9-0000Xx-Ol
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:37:41 -0400
Received: by mail-oi1-x243.google.com with SMTP id g128so13085170oib.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23LG4DY3OMEUkCd0h78yKk9uBjEW3NZqnLyKS5sRjJ8=;
 b=W6UtsTuhWRMi8oL6HJ9xcpt9OphfGC7s8U/NaT7XCESNtY6nbHOTqgATCwRSufLpb9
 LLc1ZmSo8GwlqotT2Mqwth+VDSYi/LOR6xum905XMzvdn616wNUxfyNgr5D/8vA+gSN3
 rQga1giS0kthBY4E0a2Z3Te8CV12S2JKxhU3ZxhOgAI5rQblCs7F0eYOFrlemZ7vUXu/
 FMgCaW+z+FobBRQG0BpaxCqi7zJZHeufEUvZpYgHnrJ/7FTNTRxAarDLblTqIDAclimc
 Fo3v0wTV+nE9dzrgcpQTrbiyjjyV5OVL00rvc+SaOZEoMgxZ/JUj2GFP/mZQ1TzJeOVE
 5b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23LG4DY3OMEUkCd0h78yKk9uBjEW3NZqnLyKS5sRjJ8=;
 b=hpJTEADLJY7K6EJ5mjtafDcOQsvt4Syy7TKuoW4CwC3jeWPv+jvV4E339d5zNb76G2
 zYwTLr7V1YOC6nZL0hkB9O28f11mXPTPDgKEiA9EX9YSTxhhet/ncAXmF9WpcNd3iuL8
 tc8RyG+jXcaM/4Ev4jjN2TZY7qpSgx0yfWb0IasLdYvc2ZtOp1eQyIi5jZtjOGKurAXa
 3slL3PxZMfPUK/skMjm5TOn9hMDIPJ5ymUX9sTcgfIX11WbqpN9Yto9WQPfSwVh/FJZS
 gpWlx2gAUEbnjt8Rx33MYrert5A6NwFUjbXal3yGdzu77BEh5/ZjicLcFnXerbJl65xU
 N8zA==
X-Gm-Message-State: APjAAAXLTZ46g1LnFIdruGiZVeF6uPCxphWPNVlmCmWqzS3v+IPO6Y0p
 Z0rVcnOcnXAU+CrIFybRsCIBkRDoeveNJwMX8VbaJw==
X-Google-Smtp-Source: APXvYqwTJ92S49kwQKcy7PSUMuHgsl7VP9IJna3azs6JUQbokKRCjg28iM8XypSGolDwqS4wLt8GFW44zVO1KJ1J1E0=
X-Received: by 2002:aca:4814:: with SMTP id v20mr13766746oia.98.1566848260961; 
 Mon, 26 Aug 2019 12:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-59-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:37:29 +0100
Message-ID: <CAFEAcA_cbh+gSRKDPitTjRkGpCSrKvS6sL+QQ=9FBtAROmW1qg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 58/68] target/arm: Convert T16, nop hints
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c |  3 +--
>  target/arm/t16.decode  | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

