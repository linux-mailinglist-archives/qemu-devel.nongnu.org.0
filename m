Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17091156F4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 19:08:35 +0100 (CET)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idI1q-0006Tj-UX
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 13:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idHTd-0007Qv-I9
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:33:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idHTc-0007lh-B5
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:33:13 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35452)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idHTc-0007jQ-5k
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:33:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id o9so6487158ote.2
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VeSwYRbo6w5Z4yOyoVb5dLwOXBa6eM5CqUKrem0lPGM=;
 b=eGzat3WdtDNtyFKKlSg8NISmjLXiy5nNNkDfX5xk+ogstgi6BxM8i6FN/2n1Ey9Yvg
 c5ehLk4XG+mzUJXPUaAqm+UXviykFwoAwzQZ3C0cJrPhM5LkNZrcVUnys4PnjJywHaiy
 v0zjSSkbfrCZbyWvpbjO0A2xYePjSoTzB80fSAwoB/QIjzM2ecULcq7Q6Z5JyZY9P9T9
 rXlT+4MNjfPp1ObpKqVAa48py3UuT8zAUY1DF/7Pvg9w2YjtpcqC1hQ7VhwGRnUb+M+3
 WzwJoaAIo3KsdrABObtvKXAu2kC7KIwoU2pZOnnni2jw/A+z8BCNKKaicE8QLJYGJpkb
 sHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VeSwYRbo6w5Z4yOyoVb5dLwOXBa6eM5CqUKrem0lPGM=;
 b=ecn5kI3i0Ldm5husXglL/3q3z0x77MwFqNqrExPy0M8ec+FGlJeYxsW3CnXyJbDG4a
 5TMU6zsSr+WAraW5VvrLMXTpJ4VLgYfCJiiP9lKvKADAxt5PHg9wdk+G1Xct0gdFHmx4
 44EUCgbJz3k2dZ/supcSB07c8WhMshDMplD91O3PJsPWYr+tRNtJW03ZgKhbr6ZdK0yf
 3hEKSp/XMZs6uYWOEBFivC03zffKBYnL9JBNJBOsyFWmC1ZEDmYU6LVKzjDH5WwhtF7h
 iqyAWq9VVDs15zZ7H98BUg4+ZUSqj6ECgU2f0a70X/aDynbJY/12UsW8S+Py6/UYNqAp
 dL5Q==
X-Gm-Message-State: APjAAAVTo9a3dIC1bT0+obb93E3Vqbq6on1x9mig556AhiYdO6F3VdB3
 p9JpyJPQ4Qp5X+TeEKeeG7uFn5zRlTB/XAINRy2mmw==
X-Google-Smtp-Source: APXvYqwddwVKhRbtA2+gOxp4X8plVQqE8IFz6rICJA96MvzCTdk3VhGYeUMZEJYxejMJmdoJmhF0y62LynK4cfqIlHY=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr6022602otd.91.1575653591202; 
 Fri, 06 Dec 2019 09:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-29-richard.henderson@linaro.org>
In-Reply-To: <20191203022937.1474-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 17:33:00 +0000
Message-ID: <CAFEAcA-UfZt3j3kqU8hKiDF9DXW+-BhrK5GqJVmsj+3aZjR2xw@mail.gmail.com>
Subject: Re: [PATCH v4 28/40] target/arm: Add VHE timer register redirection
 and aliasing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Dec 2019 at 02:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Apart from the wholesale redirection that HCR_EL2.E2H performs
> for EL2, there's a separate redirection specific to the timers
> that happens for EL0 when running in the EL2&0 regime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 191 +++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 179 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

