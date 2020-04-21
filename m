Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726151B22AF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 11:27:21 +0200 (CEST)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQpBX-0006j8-Pd
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 05:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQpAJ-0005zc-FL
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:26:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQpAI-0008LZ-LF
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:26:03 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQpAI-0008JO-95
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:26:02 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r25so11483377oij.4
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UPjpJyUqfB86AekmP/ca6VfUaN7XihiTn81Pa18qXEM=;
 b=MxNUwCuVHN8BGtcIcIAyzEpWIEwy1gWzwfFI4IhVivm9NIkCevGmzbVzJqM4P63VmI
 ezvLALipz1oEnAIG4j8YHTbiByilQ9tw+IMYWOechWS+6zd1OizMTTffkzEOOkJJet+5
 k1PwAG53WERyblZJNdf4j6sU3t7VvemDpmo2WftibRlwu4MD7pxpSB95GXl+VAMH4YQJ
 1Ts7ai0eI8DZ/uaEGd31OT/ttMjr504XzqWtgecZGAyIvvwqYUhFQXjzFMpXR5+3QCca
 43Le40O/JGyz4EslEPO2Hw1BnmWOVzRDCqvzNIjb30zAxo7lb6cjRRkSNImTwYFovfFv
 sgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPjpJyUqfB86AekmP/ca6VfUaN7XihiTn81Pa18qXEM=;
 b=kxb3zsg3qggEJE+6WTLKhrpzrUJ4HTNOolZfawKP36SjgF4723vHI72jNCXvv9sk7/
 JWCTOUomnPxDQxcLMzb1bdyeUAEw1H2gyUpt4EU5ByfGl4/nPZ9v+aBQqH9KXklcn2OB
 DXoOCdkuVNRzoYvGsGspnsODurJKBm8IW5wCqOA9MxwiJEwPQacFP1n2YSuLImC/6dLO
 pP4MHsPfxlHz7UEj8yycRmvo8AlUV9k8tDmGEDH5JFxdF9ZF9P0XG4n/zoY+sOY45iA/
 xL721iEbw/AVyXBSa4fsH8fhkUAYIgvkV0ZCG1zMIUCewROsrzCd57VQbDQnowyF+tmj
 UkAw==
X-Gm-Message-State: AGi0PuZfLJ/e9dVI59n8+qBe3GGICi8x5hV+UDlU4ZCnrRXYpoSwi62C
 8vzWNZOsyTrXWHoqsqcZFLY1SQ0OEM4RdZTn2YYzlw==
X-Google-Smtp-Source: APiQypIy2xKxqZQXkqDy1rZ7aJ8qOKwK+zM9HrnWbSBJ4V3v4HhO4IAUUWMcoXJLQtobKXhF7Kn5XraH5djX6Pk58ZQ=
X-Received: by 2002:aca:c751:: with SMTP id x78mr2517267oif.163.1587461160779; 
 Tue, 21 Apr 2020 02:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200413220100.18628-1-f4bug@amsat.org>
 <CAFEAcA8kF1dhR0k2kgEr-KxBspxcqLXxVqWcMadDns3-SYKrAQ@mail.gmail.com>
 <alpine.BSF.2.22.395.2004151923090.92157@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2004151934110.92157@zero.eik.bme.hu>
 <20200421091552.77uogz2qwc7y4cxg@sirius.home.kraxel.org>
In-Reply-To: <20200421091552.77uogz2qwc7y4cxg@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 10:25:49 +0100
Message-ID: <CAFEAcA_vW0uzJ8icr2iHS9e8TVu67ue9ZBEuXU1Me1KC2aXtJQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2] hw/display/sm501: Avoid heap overflow in
 sm501_2d_operation()
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22e.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::22e
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Zhang Zi Ming <1015138407@qq.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Apr 2020 at 10:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
> cirrus stopped using pointers years ago, exactly for the reasons
> outlined above.  Conversion was pretty straight forward.
>
> commit 026aeffcb4752054830ba203020ed6eb05bcaba8
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Wed Mar 15 11:47:52 2017 +0100
>
>     cirrus: stop passing around dst pointers in the blitter
>
>     Instead pass around the address (aka offset into vga memory).  Calculate
>     the pointer in the rop_* functions, after applying the mask to the
>     address, to make sure the address stays within the valid range.

Aha, thanks for bringing up the prior art. (Did anybody benchmark
whether there was a noticeable performance impact for that cirrus
change? My guess is that there wouldn't be much/any because the memory
operations will dominate and you get to do the masking operation more
or less for free, but guesses are notoriously unreliable when it
comes to performance :-) )

thanks
-- PMM

