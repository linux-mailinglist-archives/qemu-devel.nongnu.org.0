Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36519FC80D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 14:45:43 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVFRN-0006bf-Lg
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 08:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVFOC-0004th-GN
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:42:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVFOB-0002XL-5x
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:42:24 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVFOA-0002Wk-R5
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:42:23 -0500
Received: by mail-ot1-x344.google.com with SMTP id w24so4381118otk.6
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 05:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4GAnBww2X6cSXG0HbjYAqPKGo6hRQcAfSHD72VPTYQ4=;
 b=KYp4YTq4x3brN9zCcjIeUbtg9BhpH104DSnRlYMeVabuwbXp8YBG0tSZ48kqVAI9aq
 sRQAfV70uDk/Ucumc3CbwWooC6FZqE1KeIotRQ+K6x5ejgfUBoP6Vj2bgqdhWJTGWbJ4
 52B60jiYT/+Xh2bvCDDFLOyvdRbLVA2hCGtyltUOmhgPTx59+BGN7SP5yqNv2o13vkMv
 Y519gQts8SZBZzfAVOxAmrb0H88F/rAagE7xk7ciy1MTv9sSNgCM14gi2hYi5uFIu9vK
 WpXuTAM4LeoTw96R2JqPdmp+slxeZvltMxblIxjtYCTV69wsHuMj4H8FKMNf6/oKYieL
 cuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GAnBww2X6cSXG0HbjYAqPKGo6hRQcAfSHD72VPTYQ4=;
 b=KKU0F56yH5EAMUmg7vy1KhzCVW8+MX6yO8CTCt++eL5wHDgL6YpYr12Uv3LoDjS3wL
 b2SwhlUxM1oalamw1AxDk8cE1nEIc2y/sZxTpjoWkNhI+Z65l4RdWj2m2o8G9oKJ2UGE
 9jUPQuiFLcvLlqg8uqHoHjreRR9+vYO3JKCQYg5NRAwm5fsCOyFyQPm+6X4Xfh/U8nrD
 LJOWypTHXiRKvtUXBORsZQzmDXfybCoKaRaqWLF911HjpDiUQRSIcM9n7aw4zYbzIVh+
 LqpCIw3bhGdpPxigEk1Gl3UASMPnnFYO4k1VPTF9edDHl/BZOe8PPc5xqtuY1mLzxm2U
 /Rpg==
X-Gm-Message-State: APjAAAWmwksLfRvM6ZRQo+Mpo082mxXYC3nk0WOHTVTqkR9yks7QUl2t
 b6jiL9ODTGwX5A+FQ8cwtrvdXsC1UVv6LejseYY+jQ==
X-Google-Smtp-Source: APXvYqwnJAobQXpf9sTudr+vXOxZkOd1zAas3fJYXxBx0aBejwLLc2ysXHuC+46wK7E471EeROrEa6g6R5s8w02aTWs=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr6755559oto.97.1573738941582; 
 Thu, 14 Nov 2019 05:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20191104115228.30745-1-graf@amazon.com>
 <CAFEAcA8zkR_MZ-28Nc=x4j05U9MsFYfzQtkHxTf65ZwacK020w@mail.gmail.com>
 <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
 <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
In-Reply-To: <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 13:42:10 +0000
Message-ID: <CAFEAcA8HwRNd+Mg91RJ1DpiyoNJKBWHjFT_Te16xTV5P7wV_ug@mail.gmail.com>
Subject: Re: [PATCH] pl031: Expose RTCICR as proper WC register
To: Alexander Graf <graf@amazon.com>
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
Cc: Hendrik Borghorst <hborghor@amazon.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Nov 2019 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 12 Nov 2019 at 07:28, Alexander Graf <graf@amazon.com> wrote:
> > I still think that being consistent with the actual PL031 spec is
> > preferable though. If any real world guest breaks because of this, we
> > can still revert this patch and document the exact breakage in the
> > comment instead.
>
> Yeah, I agree; I'm essentially just gathering material
> for the commit message here. (The gold standard would be
> to go find some hardware with a real pl031 and prod it
> to confirm behaviour, but that's more effort than really
> seems justified to me.)

I propose to put this in for 4.2 with an updated commit message:

===begin===
    pl031: Expose RTCICR as proper WC register

    The current PL031 RTCICR register implementation always clears the
    IRQ pending status on a register write, regardless of the value the
    guest writes.

    To justify that behavior, it references the ARM926EJ-S Development
    Chip Reference Manual (DDI0287B) and indicates that said document
    states that any write clears the internal IRQ state.  It is indeed
    true that in section 11.1 this document says:

      "The interrupt is cleared by writing any data value to the
       interrupt clear register RTCICR".

    However, later in section 11.2.2 it contradicts itself by saying:

      "Writing 1 to bit 0 of RTCICR clears the RTCINTR flag."

    The latter statement matches the PL031 TRM (DDI0224C), which says:

      "Writing 1 to bit position 0 clears the corresponding interrupt.
       Writing 0 has no effect."

    Let's assume that the self-contradictory DDI0287B is in error, and
    follow the reference manual for the device itself, by making the
    register write-one-to-clear.
===endit===

Is that OK?

thanks
-- PMM

