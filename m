Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594E9AF87
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:30:33 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18i8-0007df-2F
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18am-0001jv-So
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18al-0004Dn-I5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:22:56 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18al-0004DR-C0
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:22:55 -0400
Received: by mail-ot1-x343.google.com with SMTP id e12so8547855otp.10
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGdFUjEvkvr0aLyqbmB7fLaSWCh5uIuyanW0UVDVCyE=;
 b=Q/r73RznQWwQ1h38DiKDU/2QPPngEeC4AXhhDNbhezO4LgW83PNqDpeGvQWwzVJDuq
 S4z+XUcQajA27a6e2O3KWjuU7wfWH4q/QlkdxGjiT+gmks6lzfRmJG9xfR278bjRYg+W
 kXbn4CVEbgTXiKrKynYbJOlslpC15lG/S4j139J4hq6tqyDs81985eoEvOGq4Rtla0Pm
 VJkU929R1mtdpMF7ZfbzeI6CItOzAV/7GrV4kJFvaocgvXkxworUx8QVVkEiTusTU9df
 WrwMV3tNnBoeFpQub0b1DsQGqL9FN5bdOqaHd+ZHdpOKMjMLWNev7OyfkY972TOsEGXs
 veNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGdFUjEvkvr0aLyqbmB7fLaSWCh5uIuyanW0UVDVCyE=;
 b=Ersn0Qqo+Kh/6SDzoY7ND21X4c2u014UgApMF+IjxwvbF/AtKKJxXGaI2YqVlObiyx
 qiCmfXX0UFe0zq69JXyps9dWFKcydKsEcReca9PiHg03xzdV3e91bxMCjFARjb0ZcEGy
 w+m73MHbzgte1laitXYkgJ+Ph2FidN1v9skfBXej48H/EC0Cyt6Nx9291kwIhoSkIMtd
 oXmdVh0QG5GrX19I27BMRfNbTsupPgDR9Nb/50cnpnvn86kgFsL0xDJzZ+lqezPAyq69
 EvtbgHKuGxzLCLu427hl4IfBcX9fCUhTSh2QG/DB1P2LJmDtKoi57J0Z1Tw6b5V6Z4Pa
 ywzw==
X-Gm-Message-State: APjAAAWGWIoJMQa3uKG0p1ygTtz5/jHhzIiu5jYNipzMndgRje++korX
 6wkLFjgC1X9F8gkFev6X7bfx04/r3hi1fdmUtr1BlA==
X-Google-Smtp-Source: APXvYqxred9DZV9QywCNl71nsOwYN2jlQNMhaa+AzmRb0VGMSzUnk9zGtORZBB4KYXbCFbRrLaDL7xyXTiOXvHH2fIo=
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr3606088otq.221.1566562974800; 
 Fri, 23 Aug 2019 05:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-13-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:22:44 +0100
Message-ID: <CAFEAcA8Jh5iD8Qqf0W8-xoKMWzzdaciEzQwUOtGs9uARkwaJ9w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 12/68] target/arm: Convert MSR
 (immediate) and hints
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 60 +++++++++++++++++++++++++++++-------------
>  target/arm/a32.decode  | 25 ++++++++++++++++++
>  target/arm/t32.decode  | 17 ++++++++++++
>  3 files changed, 84 insertions(+), 18 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

