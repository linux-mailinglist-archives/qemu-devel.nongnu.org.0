Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A661683C8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:40:02 +0100 (CET)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BLN-0003lC-Pj
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1j5BHB-0005Kp-58
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:35:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rdunlap@infradead.org>) id 1j5BH9-0001xt-W2
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:35:41 -0500
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:58110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rdunlap@infradead.org>)
 id 1j5BH9-0001tX-Ol
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=VL6gh0yPQIpT2nL/+Hwg/Bl1b1dNG3KY79WqjmhXwG8=; b=Lu16Wnf5xgjg6FezgS0tFqeKPj
 tlX0AdWRAo+cJ0QadzQvCTV+iqpD+UiJ1/PoWHBXN7Gh9a7iwm9TaHSyOBR+VNkDfmyAI6fN3zZ+o
 qeDro/A338xHvEvS+VdB4v/IJhZ7AULjdBU89/ts77smD2uAZAO7OrKiRAlEbjb8yQRLZIlsh8zkl
 50knhHs5T3HhvaQOa/3MWH/A1HEysEYc7nfq6LOFdVgnuQk8K8ZXmUrfIfdWMZKO6Q4bjLiRh4x6W
 fCn+I1hd+RZBkAFhgQUKthDC80MHPcJpcdn8RPy/1bp3yJqXKBlwtazHGOgzlbq15la9d9d1dnDeW
 wbqfYF8Q==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5BGx-0008Nu-4M; Fri, 21 Feb 2020 16:35:27 +0000
Subject: Re: [PATCH v5 4/5] docs: gpio: Add GPIO Aggregator documentation
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-5-geert+renesas@glider.be>
 <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
 <CAMuHMdUFV0nbfrpxY60av2x+UUN62wDiVLbcEG83133aqfFcUQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <98997c64-9486-ee64-32df-3172e518b70d@infradead.org>
Date: Fri, 21 Feb 2020 08:35:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUFV0nbfrpxY60av2x+UUN62wDiVLbcEG83133aqfFcUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:7c80:54:e::133
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Harish Jenny K N <harish_kandiga@mentor.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 8:34 AM, Geert Uytterhoeven wrote:
> Hi Randy,
> 

Hi Geert,
Those changes look good. Thanks.

-- 
~Randy


