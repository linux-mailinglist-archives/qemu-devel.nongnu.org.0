Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6317A899
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 16:13:25 +0100 (CET)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9sBg-0008Ev-AY
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 10:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9sAe-00078J-Qj
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9sAd-00023v-Lk
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:12:20 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:43856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9sAd-00022r-Fu
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:12:19 -0500
Received: by mail-oi1-x233.google.com with SMTP id p125so6256934oif.10
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wY0b8pvpJG0t2jLOKClYgCQYlE0BnwwKRiZ/BUOMAU=;
 b=JV/X8QZdpqAnqDzU53OR9BTiIi78uVCli/R+e1+Vjfe/8IPn/HmGEby/Z4sebQ6gWr
 k0y2HHuKAPdjfix+hcbrhdwvdk6ftcJU2O7TWk6fwMbvCY7FJN0zRyUnCKLAq/a0i9HT
 nabwdjkwWb3QdgYjDJI77BDNXV0bbK33vUEEZb5D8lKHnlGfOPYf/ItO0gOp6gg2SNFj
 om/PFSFqV/i6IyG/rAnG8RO7HDUauWBecHPnn17gFb8esif6i9oRohqqfugkvybWcDHL
 BH/BnqtLtZYoWIzG0+ESVFtoAoNIzkszcoFM2eyu+FuVoTozMUBY27t81qVZ77Y+3oeZ
 v4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wY0b8pvpJG0t2jLOKClYgCQYlE0BnwwKRiZ/BUOMAU=;
 b=Bo2oDkj37DR9QJ7vi5t7KAekSvKX9jZw8dZBpIABYtqKrxXPCcHmIwp0wpcLEdYyiX
 VvBBqTemERDc78GSdpG3ucLnerz6udywD5vI6k4wsIiNfvrGUhc0bUekJwcUDbWrf863
 bb6tjtIgDHVYPkAD3K155912+KrcpQlnnqQelW97tK1cNJUxV/2BaKG3AEzbpnFWgvuj
 AV2X1hqVTQRwEyYETQQknCfJ+Idd9fPHV9QRNj/qb+xFgfCPX/KhPZ0NXCfDXROco6rR
 4EZQSNCeftoYYYFwuMlzZJAjgO8E5qrK8WjfQDda6JDLJTql6UmwI4GdsssQFppWmpmk
 +TqA==
X-Gm-Message-State: ANhLgQ2Gelyq++n+pwgeJfBBTgHVt70+5t1l3+n84IVVaDlzTpxkqduN
 bFpMna6hM1Ql2u166Y5JJg1i5ulAUKQ5SqUWQkGnkw==
X-Google-Smtp-Source: ADFU+vsfU8zK5EvZPUXRVpmpQwHqTzeRileA36i5HXwBM+kjuRncjasqudQIrA7GCn7V2JqqFY0EljG1Ido5TwPv/vQ=
X-Received: by 2002:a54:478b:: with SMTP id o11mr1049536oic.146.1583421138606; 
 Thu, 05 Mar 2020 07:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 15:12:07 +0000
Message-ID: <CAFEAcA-SFEHPGhBesEwHir1a4Y5a-vqXuaoh6LKjx7c9WqDVMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] target/arm: Misc cleanups surrounding TBI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Improve commit message in "Optimize cpu_mmu_index".
>   * Add "Introduce core_to_aa64_mmu_idx".
>   * Use it in "Apply TBI to ESR_ELx in helper_exception_return".

Applied 1-7 to target-arm.next, thanks.

-- PMM

