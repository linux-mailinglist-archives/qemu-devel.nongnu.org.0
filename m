Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662683CC56
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 14:57:29 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hagL9-0001kQ-Rq
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 08:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44325)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hagIo-0000uL-KG
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 08:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hagHW-0005Zo-UN
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 08:53:43 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hagHW-0005ZW-OC
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 08:53:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id d17so11731756oth.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qr7PQtMQI8XFZs1FjnRKW8+2eZ5C63I237MzQhr3FA8=;
 b=UafvNFtfv59KZSKk6c7lPTa02uT7zDdQ54wgJGqKmR2J9mKea2bVla8Pqpzu13y9bX
 Vx+wRSVokA/an5g0/HrbmG4a/H2f47YGWGeJ4yo70dDbBCf/nJvf1C0Cl9av/QcOOj75
 saVZftwMSfiiNXtNyZsUSKSxj6EqdW+6cAfwXmHJNqAHaifD7C0P6WRI8NPr6FKx2bZv
 gzAG32/jiJPmVuzWCzkJMA82d6eJiqgEhvro7U+sXRyrMqoDrfb2weawoOEJkXtNLJnI
 MOtAZYwZIrHdXo/2uw7KtSDjq29kWjWxeaoNV4sn/hEzirdntTJz+ArGl56iy2dMGZmv
 cq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qr7PQtMQI8XFZs1FjnRKW8+2eZ5C63I237MzQhr3FA8=;
 b=Jh+0MzZVyo9AZ1+VuQeL9xvJ0SMhfAZ5JFSH53nS6gt7IVKUx2q0OyXAcnLSGdcs7s
 QvldIM2PR1d7lhsojqnm/0RAtuBWYYWW2NUZj+Jn1SquSQi9/sDC3C8gjPQOuwU6uShT
 Uh/96cYALrUx4q5iZ4evn+0jHZQT0akcIpQDPPLk6wMLJo2zGXRBpWEZ9uJ5V3GrIWBl
 ohpFJzhSr0CXRRd8cKbxpix4ENBhhH9PmgGsdliJLJZd8GRer/j8Mr9jiwA9RSPgAum6
 A8jDxOxa1ae9bAjmHhCUKi+ZQGSPmVqGn7yjUgtdUzdBnOlbGlv5J0M5DQiyxlDjML6M
 07sA==
X-Gm-Message-State: APjAAAWBrMwEnl8HxFCS2Siu0gZThcTmkBUS5LtMPWIFDNsmUHl91I/c
 dzgscnqVzdDIxYll6t+NNX96P8IeTsiFAuFZfR+GJYlTxcg=
X-Google-Smtp-Source: APXvYqwvf51u5pCDT486uZ9t22wZIYhBHpUErked6T1b5lZarV5H30cueTrB7hEwY7QlvjGXLIM+yorJ7MmX3KhWzRk=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr22078otj.97.1560257621807;
 Tue, 11 Jun 2019 05:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190609222249.28818-1-richard.henderson@linaro.org>
In-Reply-To: <20190609222249.28818-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2019 13:53:30 +0100
Message-ID: <CAFEAcA9Jg4eeM683GtPEucjUSna5LBsU8gPgnLayBAmarJjUhA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] target/arm: Fix output of PAuth Auth
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jun 2019 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The ARM pseudocode installs the error_code into the original
> pointer, not the encrypted pointer.  The difference applies
> within the 7 bits of pac data; the result should be the sign
> extension of bit 55.
>
> Add a testcase to that effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

