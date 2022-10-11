Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC75FB076
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:30:46 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCX6-0004RZ-IQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oiCPG-0007at-0j; Tue, 11 Oct 2022 06:22:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oiCP7-0002b8-7f; Tue, 11 Oct 2022 06:22:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5C57F74638A;
 Tue, 11 Oct 2022 12:22:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6226A746335; Tue, 11 Oct 2022 12:22:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 603BB74632B;
 Tue, 11 Oct 2022 12:22:21 +0200 (CEST)
Date: Tue, 11 Oct 2022 12:22:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 00/13] Misc ppc/mac machines clean up
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
Message-ID: <923f59f6-5824-26b6-30e0-783060aad888@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Oct 2022, BALATON Zoltan wrote:
> This series includes some clean ups to mac_newworld and mac_oldworld
> to make them a bit simpler and more readable, It also removes the
> shared mac.h file that turns out was more of a random collection of
> unrelated things. Getting rid of this mac.h improves the locality of
> device models and reduces unnecessary interdependency.

Ping?

> v3: Some more patch spliting and changes I've noticed and address more
> review comments
> v2: Split some patches and add a few more I've noticed now and address
> review comments
>
> BALATON Zoltan (13):
>  mac_newworld: Drop some variables
>  mac_oldworld: Drop some more variables
>  mac_{old|new}world: Set tbfreq at declaration
>  mac_{old|new}world: Avoid else branch by setting default value
>  mac_{old|new}world: Simplify cmdline_base calculation
>  mac_newworld: Clean up creation of Uninorth devices
>  mac_{old|new}world: Reduce number of QOM casts
>  hw/ppc/mac.h: Move newworld specific parts out from shared header
>  hw/ppc/mac.h: Move macio specific parts out from shared header
>  hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>  hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>  hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>  mac_nvram: Use NVRAM_SIZE constant
>
> MAINTAINERS                   |   2 +
> hw/ide/macio.c                |   1 -
> hw/intc/heathrow_pic.c        |   1 -
> hw/intc/openpic.c             |   1 -
> hw/misc/macio/cuda.c          |   1 -
> hw/misc/macio/gpio.c          |   1 -
> hw/misc/macio/macio.c         |   8 +-
> hw/misc/macio/pmu.c           |   1 -
> hw/nvram/mac_nvram.c          |   2 +-
> hw/pci-host/grackle.c         |  15 +--
> hw/pci-host/uninorth.c        |   1 -
> hw/ppc/mac.h                  | 105 ----------------
> hw/ppc/mac_newworld.c         | 225 ++++++++++++++++------------------
> hw/ppc/mac_oldworld.c         | 111 +++++++----------
> include/hw/misc/macio/macio.h |  23 +++-
> include/hw/nvram/mac_nvram.h  |  51 ++++++++
> include/hw/pci-host/grackle.h |  44 +++++++
> 17 files changed, 280 insertions(+), 313 deletions(-)
> delete mode 100644 hw/ppc/mac.h
> create mode 100644 include/hw/nvram/mac_nvram.h
> create mode 100644 include/hw/pci-host/grackle.h
>
>

