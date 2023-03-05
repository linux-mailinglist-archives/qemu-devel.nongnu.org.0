Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8CD6AB14C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 16:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYqjO-0001Kk-4F; Sun, 05 Mar 2023 10:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYqjL-0001FY-Ob; Sun, 05 Mar 2023 10:56:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYqjJ-0001ng-Qx; Sun, 05 Mar 2023 10:56:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8C32F7457E7;
 Sun,  5 Mar 2023 16:56:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8D586745720; Sun,  5 Mar 2023 16:56:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 896407456E3;
 Sun,  5 Mar 2023 16:56:43 +0100 (CET)
Date: Sun, 5 Mar 2023 16:56:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v7 0/6] Pegasos2 fixes and audio output support
In-Reply-To: <cover.1678023358.git.balaton@eik.bme.hu>
Message-ID: <8b8ed466-a37d-ebf3-70c6-55a10423f0c9@eik.bme.hu>
References: <cover.1678023358.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 5 Mar 2023, BALATON Zoltan wrote:
> Changes in this version:
> v7:
> - Added a comment and log to patch 3 as asked by Bernhard
> - Added missed R-b tag to patch 5
> - Patch 4 in this version is
> Based-on: <20230304114043.121024-2-shentey@gmail.com>

For patchew only, also:

Based-on: 20230304114043.121024-1-shentey@gmail.com

the series the above patch is part of but that's the only patch which 
would conflict with patch 4 in this series. I don't know why patchew did 
not pick that up so I try in another way now.

> (hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt)
> so whatever fix for that will be taken this should apply (revert and
> corresponding patch for fixing same problem was in v6 which can still
> be mixed and matched in this series if needed)
> 
> Only patches 1-3 don't yet have review, patch 1 and 2 are optional
> (patch 1 adds debug property useful for testing, should be easy to
> review; patch 2 fixes MorphOS on pegasos2 with PCI and USB devices)
> patch 3 is needed for the rest of the series and has been beaten to
> death already so it's about time to come to a conclusion with it at
> last.
> 
> BALATON Zoltan (4):
>   hw/display/sm501: Add debug property to control pixman usage
>   hw/isa/vt82c686: Implement PCI IRQ routing
>   hw/ppc/pegasos2: Fix PCI interrupt routing
>   hw/audio/via-ac97: Basic implementation of audio playback
> 
> Bernhard Beschow (1):
>   hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
> 
> David Woodhouse (1):
>   hw/intc/i8259: Implement legacy LTIM Edge/Level Bank Select
>
>  hw/audio/trace-events           |   6 +
>  hw/audio/via-ac97.c             | 455 +++++++++++++++++++++++++++++++-
>  hw/display/sm501.c              |  18 +-
>  hw/intc/i8259.c                 |  10 +-
>  hw/intc/i8259_common.c          |  24 +-
>  hw/isa/trace-events             |   1 +
>  hw/isa/vt82c686.c               |  44 ++-
>  hw/pci-host/mv64361.c           |   4 -
>  hw/ppc/pegasos2.c               |  26 +-
>  hw/usb/vt82c686-uhci-pci.c      |  12 -
>  include/hw/isa/i8259_internal.h |   1 +
>  include/hw/isa/vt82c686.h       |  25 ++
>  12 files changed, 592 insertions(+), 34 deletions(-)
> 
> -- 
> 2.30.8
> 
> 
>

