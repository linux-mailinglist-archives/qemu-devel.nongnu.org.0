Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B29E3C5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:16:03 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Xa6-0001KS-Ma
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XZ0-0000Lp-0B
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XYz-0007Gm-1j
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:14:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XYy-0007GR-Rz
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:14:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id t24so14354959oij.13
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ka3LXG9PjTwvkfqrQm4tf7mp2fvvzx49GuSdIesR6cQ=;
 b=oHHCQaN1dKogmrLFK0ShxYvqV7BjVp6wS4HIWu3thM1bVqELm0sU5WY8lx2Sdz8bHz
 bnap4//+ooVwgEy9qA3KTawYAwo6JwXVvni+ogf6iEjW8HEwScSZoK8ffGOxMGqumFoC
 YDtZzYsVAYvdCjl2JY4/yQDrBX4P5/EViAIEL28cB4pSoHCceLMsh2qo5sQIbKIhyp3g
 z/AjpiUFyqQa3FDJ+OazytrkFn1JYfAkkhPshylkBwJ9pRJ30fWKvWTdD43df48dRk2G
 jfarw+RBodE0uVn7SadVsE3sIpGv1wKj+E8eIRtzv7+BXgyw7R5l0VSKpzusGz39g8qk
 GXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ka3LXG9PjTwvkfqrQm4tf7mp2fvvzx49GuSdIesR6cQ=;
 b=Lh3jM0xzGIxDRpezGD5+Y6YsJctSZkS3amlMCAQcZdyd5xSPAlojrfpEmZB5MrQ6CJ
 dzRqILG3Z7WWRObM7dQs9tEqWQaNJznJmepeNWSAg4Djwb6x80ijmQL7ltgi3Z57X7fr
 5WMeyz3AHOkRYQIxrDAARY22PoZIo1HjGOVcN+Mezj4tCVpH6wkvnhyfDQzHHVVy2AN5
 GiR6+E4po/zU5IVeTVpssyFpLwBI8zXc+HCKw/WAJ6Rzel0blzWPFHHFl0osYe32Hg/0
 BB2oV2CIwCn/Fgta6Dq0tlMrUmNwiImQM3agV8MOlU54P6naui2HuYBWpdmTirbpCAVr
 hVVw==
X-Gm-Message-State: APjAAAUhH2zn8B4o5yW1LpnA7BHWIhtjF8ChiEz0lDJQ5A/p45EkjJg1
 +V1abFc3I9vMPn2KWExAwhjC5jfC/ZfJ1mX5lpxrmw==
X-Google-Smtp-Source: APXvYqyRvy06MZEC4aovdJEuRYwETeoeLRktuf7oo6mEcxo1tdNRdNYgpVbquV2PTYl1wXl4RynjbYEadOoKA/xrL8Q=
X-Received: by 2002:a54:4718:: with SMTP id k24mr42115oik.146.1566897292122;
 Tue, 27 Aug 2019 02:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-66-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:14:41 +0100
Message-ID: <CAFEAcA9Zgw+LH5yVBHYgotUcEG2Je83ejAFkp-aSwAv7V=-V8g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 65/68] target/arm: Convert T16,
 Unconditional branch
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
>  target/arm/translate.c | 9 ++-------
>  target/arm/t16.decode  | 6 ++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

