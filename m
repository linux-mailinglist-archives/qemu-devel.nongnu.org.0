Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32C1170A7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:39 +0100 (CET)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieL6P-0001kc-Sx
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 10:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieL5L-0001DF-An
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieL5J-0003EV-Sa
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:36:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieL5J-0003EK-M7
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:36:29 -0500
Received: by mail-ot1-x343.google.com with SMTP id g18so12469945otj.13
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/DiSn6IfMMoE4lSKlBr9f53VlL1HEB43qNwHBmaFqM=;
 b=mGc6FIL1iPR4gvfsEiF+YLk/SoCjjcew12B9l16kkPcJHVwF0n50iXz+UC7h8uJe9V
 TCjBML3e+7g0BCeNp9A3gXcA4WjW8/eQHB7evaPX7fcMetpGYO+NverK9d/JGPB2oTE/
 K5mTITjl40RLnTfpAhuDl5ZAUuWX1FNAs1mIWw8hdVMiWGIGxJnAOLIqihU9uuIvyuIz
 KMs6XNL4p1lu4oD6p4m/bxHkv8O33n2Ak6twroeqFrN+GrWldt9BrQsLLZLeuR0Rqdzz
 TbZiunXtT4kWY3NG2cK9CNm9BikS+UEl2jQt+B1yJXEZwKcDLJtgWBV2RtRkfwp++1HN
 vBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/DiSn6IfMMoE4lSKlBr9f53VlL1HEB43qNwHBmaFqM=;
 b=NALmFcUBNNeaQFVZOeNAe+xebseGCiB1JMZdekgMaRzOQbtKOThnMj0Nx18vYR0/fr
 qjSQkCfuC4eHkbVCTFhbVcc+Hv00qsHfckv6xhGnVu004DqVQrgDZl/yhgT870MWKOnp
 0n3dc3qHxJ1DTUeQqwvTel5JsXodB3TJTRRbVIdXyIgUar0/He0vmWqE5eic+WP83zm1
 efpQfoT3NQnSbgSDdf7n48dfwB9TMxOsxLcZ4CE9QASn2yYbRphaszOm5wDxPOjwR1qn
 Vbd3jryaiASDpMi/xo63allCsUj7sZZYIZ0QRpHDzVbogD7RXTpz/XkTBCNYlSZMYR8f
 TXJA==
X-Gm-Message-State: APjAAAXidQVs1786Mu9DrJicH6XEBvZ1FI7QrbelkMGo7aw0M/7kxVhq
 LDK3GCozQ2AREb9MdGzKmx9DmooyoBFobHEmSKO2zQ==
X-Google-Smtp-Source: APXvYqyaVyT8YVgCQ74GWWheHkxC5cNqAHPmUaLAQTUKAVg7sFc0eMqJi3U+jU16icL3ksUkjEgmQW2BEEF7N+7bMHI=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr20302350otp.97.1575905788255; 
 Mon, 09 Dec 2019 07:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20191209152456.977399-1-daniel.thompson@linaro.org>
In-Reply-To: <20191209152456.977399-1-daniel.thompson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 15:36:17 +0000
Message-ID: <CAFEAcA-sgFKev2MiOjRAzuE0trNYQoNe6LOFLeghGm73N1h=SA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Second uart for normal-world
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Dec 2019 at 15:25, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> The virt machine can have two UARTs but the second UART is only
> registered when secure-mode support is enabled. Change the machine so
> this UART is always registered bringing the behaviour of the virt
> machine closer to x86 land, where VMs can be expected to support two
> UARTs. This approach is also similar to how a TZPC would typically
> make a UART inaccessible to normal world on physical hardware.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     It is difficult to add a UART without some kind of odd difference of
>     behaviour somewhere. As far as I could tell the choices are:
>
>     1. Move the secure UART from UART1 to UART2. This is a
>        not-backward-compatible difference of behaviour (will likely break
>        the command lines for existing users of the secure UART).
>
>     2. We tack the new UART on at the end, meaning UART1 will re-enumerates
>        as UART2 when secure mode is enabled/disabled. This is rather
>        surprising for users.
>
>     3. UART1 is registered and inaccessible when secure mode is not enabled
>        (e.g. user must provide a dummy -serial argument to skip the missing
>        UART)
>
>     4. Normal world can only use the second UART if there is no secure mode
>        support.
>
>     5. Don't support an extra UART ;-)
>
>     Of these I concluded that #4 was least worst! Ultimately it is should be
>     unsurprising for users because it is how most physical hardware works
>     (e.g. a trustzone controller is used to make an existing UART
>     inaccessible to normal world).

This change looks simple but it will break booting of UEFI
in the guest. Unfortunately UEFI enumerates UARTs in the guest
in the opposite order to the Linux kernel, so whichever way
round you put the extra UART something will get it wrong and
stop producing output where the user expects.

I think the conclusion I came to was that the only way to
avoid breaking existing command lines would be to only
create the second UART if the user explicitly asked for
it somehow. (Possibly just looking at "if there really is
a 2nd serial on the command line" with "if (serial_hd(1)"
would suffice, or perhaps not.)

You also need to do something to add the 2nd UART to the ACPI tables.

(Very out of date and broken patchset from last time I looked at this:
https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
)

thanks
-- PMM

