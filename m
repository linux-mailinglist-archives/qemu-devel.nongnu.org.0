Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160691A9743
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 10:46:59 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOdhC-0004DS-4d
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 04:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOdg8-0003iS-G5
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 04:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOdg7-0000Tu-9I
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 04:45:52 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:33734)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOdg6-0000Su-St
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 04:45:51 -0400
Received: by mail-ot1-x332.google.com with SMTP id j26so2421507ots.0
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/EMyOEGQKbYWaiBwSfQWcNwY/6hcbpcJ7t9t1mmi8E0=;
 b=EQDQx511rXjrTMKrB5FYJSxINjURCBK9q2DNt0ZegtKAIXhn+1xiI6OQfv7HyGVEO3
 Imf9Mg7dRt6fnUcdjtsJoI8UwKcTv0Ak1zJWdnH46t8+mPq4ccoSJ5uQTjwINNGr+tdx
 o5CK3dH0hZ5AJd5K8M3PIzFeyNMVj0ng5fJe6UuVPm1wIWwaUrl5MVGYSKIs/7qJKfq0
 ZJzoaaqKJSllUiZrnpsMSVy1hupUbOoyL1E4C/yZ/UmSA21uxLlLjCWW1VBetRr7WG7O
 /z9ZAeo7wyXnroKaJpcECgvsK27VivV5KIUDUJjldpDlW/GTKjLo9Jh4fv79/Zc3jkKm
 IE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EMyOEGQKbYWaiBwSfQWcNwY/6hcbpcJ7t9t1mmi8E0=;
 b=iB4OSl7YiTAbodq+ysCLLJKGxRKwsWvl1GwklwJygRk9t11uiYC+D9PcfbUvxUmXXp
 8jus7K6d9crgIcTVb/6x9K33wI2T+sX3ae8nk3kOlDokZbbCB200YyUA4iBBwP7jK6GN
 trUAOrPQQ6kA4e64lCGvNjsZSht3/LpYjAReJCJi5jr0pMU/DkcByi6jtym9s2pHI2VQ
 9Y8ChB+OwF+cNf43kRiJtvmECSaQNiLGbTwV8bgG4n/DbltnRxu1YiDpYWXL1kucBSwH
 icuQipQ1mSyldJr3IEpigz5B9OY7UoMxXIp1MuXdgT0gSRTmZR4IQ07PQ4d/s2lnVsxO
 OMyw==
X-Gm-Message-State: AGi0Pub/p7CfQaynMeY1ZWD8RaTPYuiLRBGrc4Eb/uMYR1SfBDE80nJX
 ISvcXoAj2W0BsAUTATT60xAsJZs+SnulmW7Vy0iUEA==
X-Google-Smtp-Source: APiQypJbZ+LFuFfqqxPQvLCeM/VFy44Hdg/wcgZ9GTCBPFMqpXyOcw0OBkfxK9wntiP+xuhHlIWV15jYs7vkgmKEfTI=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr653628otc.221.1586940349550; 
 Wed, 15 Apr 2020 01:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB3963D92BC26FB661C7640D61F4DA0@DM6PR11MB3963.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3963D92BC26FB661C7640D61F4DA0@DM6PR11MB3963.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Apr 2020 09:45:38 +0100
Message-ID: <CAFEAcA9sKn_ZKoN5OmQT2PnZ51xk_6O3+ZS7g3ZU4BwcK4Aytw@mail.gmail.com>
Subject: Re: Qemu system mode emulation for heterogeneous SOC
To: "Ancuta, Cristian" <cristian.ancuta@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::332
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Apr 2020 at 23:08, Ancuta, Cristian
<cristian.ancuta@intel.com> wrote:
> As the subject says, I was wondering if QEMU execution model allows the full system emulation of a custom heterogeneous SoC architecture.

Only in the very limited sense "you can have two different CPUs which
are of the same architecture", eg an Arm M-class core and an A-class
core. You can't have two CPUs which are entirely different architectures
(eg PPC and Arm). In principle this would be nice to be able to do, but
in practice QEMU's current source tree assumes that various properties
of the guest CPU are compile-time fixed, and making those all be
"this is actually a variable property that applies only to some of the
CPUs being emulated" rather than just "this is set by a #define" would
be a massive effort.

> As a related question, is MMIO supported in user mode emulation?

No. Much of the infrastructure and framework for device emulation
is only in the -softmmu binaries. The user-mode emulation stuff
is intended for emulating single Linux userspace processes, which
don't have direct access to device hardware.

thanks
-- PMM

