Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196315D4B3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 10:27:47 +0100 (CET)
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2XGE-0006ZI-JR
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 04:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2XF2-0005zo-5J
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 04:26:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2XF1-00077P-8i
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 04:26:32 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2XF1-00076S-2i
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 04:26:31 -0500
Received: by mail-oi1-x241.google.com with SMTP id z2so8799122oih.6
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Naq8o0gstU0K0l8QzCdUTMTZTl72zzwe6tWvByxFx6I=;
 b=tyEV6hN7zeb685p0dU1hMJ/iYKOSL6MM9OZcee0FQi1IIuWxHuIlRDQEW6Shh3fTRv
 G3mCiY1eIXkZQbzZwo0cV3s7I9vwTdNWqgdFOVe93ymmwhfZ8cHq47kvOA9tJJsLlr+9
 zIgmQDpv5lyAfDlc/WyM8LUPP3xUs8iUqKqNLU31QRXkjygpIZzY9XBP7Tl79usu0EYB
 cD2uItsohv86400cPruuymWhncwkzD79VcV8ZSChkhOty9IWn63erhfWQtn6TYLCVBVX
 iPL2W8t/YtmJ41XhDeA+QzidGDiyf1QsSP/u/0M7N5GBzr/aA3/aHAib0DsKQkwgNUcg
 qHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Naq8o0gstU0K0l8QzCdUTMTZTl72zzwe6tWvByxFx6I=;
 b=A6ucfAeYQ2otXZbQRFuMQUT3sOhVvMqJxhKZC/0qRK6ij1yQ/fOpWSsYyoXjXZ0aTT
 os0aTH29xE5GBno1huSAcm1PmcgoiU5hC6WRPMye8zhdk118Z7WRv37cbbFzWXA1tBcI
 uNO11ReFbNtLMj/TmffBVy1pI7Jk+yXIG60voFrf7GszIa/+fklVBJCyQ8TSQJMTFl46
 b77fjCaEJbc5a23FnE/2vm9xIJhM7KVkC30rZeM0t9FLOkZZpxmjKNmr66MYgz6471jV
 q9m4ZbXuB/t6KqylzwKhSU3H8wRkGi6ujsu86uzlGqcAjBvtroSBfP0/tnG36tk1/Zv0
 UYAQ==
X-Gm-Message-State: APjAAAUM9wK5KB37T2zSA/dkls0Wn1LaaGjhbPQ1PCmrbDP9p8VoZqbG
 mL/CvRS4mDG9efkBFsg2HVnCQBurjs8jS06WRMk68A==
X-Google-Smtp-Source: APXvYqzN+Ihcr8bcKog3jkx5T41UCLyKI8nc9UwK8bv6BES5c29OmyHk8GRbmseSsMb/4W5vT4QWjs2+Bya2cHF8Wqg=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1221123oif.163.1581672390142; 
 Fri, 14 Feb 2020 01:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20200214060548.24939-1-linux@roeck-us.net>
In-Reply-To: <20200214060548.24939-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 09:26:19 +0000
Message-ID: <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 06:05, Guenter Roeck <linux@roeck-us.net> wrote:
>
> USB ports must be instantiated as TYPE_CHIPIDEA to work.
> Linux expects and checks various chipidea registers, which
> do not exist with the basic ehci emulation.

Hi; I didn't see a cover letter email for this series (sorry if
I missed it). Would you mind including a cover letter email
for any more-than-one-patch set, please? It helps the
automatic tools and it also decreases the chances that
I miss the patches when I'm scanning through my email
(when I'm tagging things I might want to review I basically
look through subject lines for single patch patches
and for 00/nn cover letters and ignore middle-of-patchset
emails...)


thanks
-- PMM

