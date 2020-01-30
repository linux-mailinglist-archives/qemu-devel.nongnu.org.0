Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA314E2E3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 20:07:23 +0100 (CET)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixF9u-0005bL-Qz
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 14:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixF8k-0004im-Hg
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:06:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixF8j-0004ot-Eb
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:06:10 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:45109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixF8j-0004nr-8k
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:06:09 -0500
Received: by mail-oi1-x22e.google.com with SMTP id v19so4662818oic.12
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 11:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=hapO40zyEKj/a7Cu178kKHegMfsAafPt+SqVGrJ0FUY=;
 b=aCf8cwHkhGpK+VRGRtt3/RSQv75UCZZflaDXPm9jyhx3oXBqPg02joLr+XWh/OfASA
 XRwktJZ+RcWgdt3KgrTnYqx1ysbh78oinTHym652RYiiOwkYy1hCS3YNe5Dwt3uz6Kkr
 CScTiIe44KsAd6ScpfEqU+6gUMZJuS0AIXHmMU4EaVW5xi+V6D3XAMaNZudsuClDhi5V
 /6xjasQZcgq50RHH2vTJCXab14qK0X+ScbEp0Ylx5Fxtv8lVzXDhVd+WbaL6i5yAGYzL
 P4hQ6pK/8cHf+aNE4b+M0ImNWDOc6hdzWu2HEuWxGkNe9X7CGZ4YOrYjzURIyyRMdV/A
 r7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=hapO40zyEKj/a7Cu178kKHegMfsAafPt+SqVGrJ0FUY=;
 b=uHTI7osI4LAJu8vsoL3A84AxxFvfm+HDbpDWX/uK1pSHDHCiJAPKRfg6XxfHGJGtya
 AakrXvDdc2M0vvwTybdFabgWzq+XKM4GE8UdiXRwIFCTffDuYMrHBgOzMjo5mH0vUQdN
 rIT8vAh2C7LQbEBY3Wd14A6TRU/E9bVDmaF89IIFzWHhjoJAG892t4aGHmFdlGvRK/hm
 a4mCxP/JKY3M3fKHZQ6GB6B1Tqg/NNAcSSghFO/VuyEkOsNPo3MnXhFkD4jTzcYxlOZD
 UhAGSREh/2/J6Pg/aouuMawhllgteSkfPudLVB3SvI1HaO6l7K+nGeXKWfv9J52B/G50
 LlYw==
X-Gm-Message-State: APjAAAV+Fjq4hO1Wle9yfhVc18hN5VW0e07/Cz6WBANXiCwp4+rVQXSS
 WmxGb0KsXweybmM/bVUm04fh7KXaNIfaoZ5MSP7QbNAdrxk=
X-Google-Smtp-Source: APXvYqzfZxPu+S2z51hJsSlD5jb6PVWsAertjN8fi3VvKImyaU/piiSbswvEKpfUaXZQl9g4+X/grwkYul8KlLEYMgg=
X-Received: by 2002:aca:7514:: with SMTP id q20mr3781183oic.48.1580411168312; 
 Thu, 30 Jan 2020 11:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20200130161533.8180-1-peter.maydell@linaro.org>
In-Reply-To: <20200130161533.8180-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 19:05:57 +0000
Message-ID: <CAFEAcA9ivKXHMNpRXTHmr9atcMwKeLTX1XfeO=ouAq7+EVPxkg@mail.gmail.com>
Subject: Re: [PULL 00/26] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jan 2020 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> target-arm queue. The big thing here is the landing of the 3-phase
> reset patches...
>
> -- PMM
>
> The following changes since commit 204aa60b37c23a89e690d418f49787d274303ca7:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jan-29-2020' into staging (2020-01-30 14:18:45 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200130
>
> for you to fetch changes up to dea101a1ae9968c9fec6ab0291489dad7c49f36f:
>
>   target/arm/cpu: Add the kvm-no-adjvtime CPU property (2020-01-30 16:02:06 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/core/or-irq: Fix incorrect assert forbidding num-lines == MAX_OR_LINES
>  * target/arm/arm-semi: Don't let the guest close stdin/stdout/stderr
>  * aspeed: some minor bugfixes
>  * aspeed: add eMMC controller model for AST2600 SoC
>  * hw/arm/raspi: Remove obsolete use of -smp to set the soc 'enabled-cpus'
>  * New 3-phase reset API for device models
>  * hw/intc/arm_gicv3_kvm: Stop wrongly programming GICR_PENDBASER.PTZ bit
>  * Arm KVM: stop/restart the guest counter when the VM is stopped and started
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

