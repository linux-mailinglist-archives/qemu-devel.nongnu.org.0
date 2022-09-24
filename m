Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1A05E8D0D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:20:42 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc55E-00059P-MC
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4uh-0001yT-2J; Sat, 24 Sep 2022 09:09:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:64458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4ub-0006vL-Qi; Sat, 24 Sep 2022 09:09:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BF786759B50;
 Sat, 24 Sep 2022 15:09:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 89392746E06; Sat, 24 Sep 2022 15:09:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 863F0746307;
 Sat, 24 Sep 2022 15:09:38 +0200 (CEST)
Date: Sat, 24 Sep 2022 15:09:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/10] Misc ppc/mac machines clean up
In-Reply-To: <cover.1663368422.git.balaton@eik.bme.hu>
Message-ID: <9c9cf132-bc4f-2e21-8956-a99ec66f4a3@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 17 Sep 2022, BALATON Zoltan wrote:
> This series includes some clean ups to mac_newworld and mac_oldworld
> to make them a bit simpler and more readable, It also removes the
> shared mac.h file that turns out was more of a random collection of
> unrelated things. Getting rid of this mac.h improves the locality of
> device models and reduces unnecessary interdependency.

Ping? Patches still needing review: 3, 4, 6, 8, 10

Regards,
BALATON Zoltan

> BALATON Zoltan (10):
>  mac_newworld: Drop some variables
>  mac_oldworld: Drop some more variables
>  mac_{old|new}world: Set default values for some local variables
>  mac_newworld: Simplify creation of Uninorth devices
>  mac_{old|new}world: Reduce number of QOM casts
>  hw/ppc/mac.h: Move newworld specific atuff out from shared header
>  hw/ppc/mac.h: Move macio specific atuff out from shared header
>  hw/ppc/mac.h: Move grackle-pcihost declaration out from shared header
>  hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>  hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>
> MAINTAINERS                   |   1 +
> hw/ide/macio.c                |   1 -
> hw/intc/heathrow_pic.c        |   1 -
> hw/intc/openpic.c             |   1 -
> hw/misc/macio/cuda.c          |   1 -
> hw/misc/macio/gpio.c          |   1 -
> hw/misc/macio/macio.c         |  27 ++++-
> hw/misc/macio/pmu.c           |   1 -
> hw/nvram/mac_nvram.c          |   2 +-
> hw/pci-host/grackle.c         |   2 +-
> hw/pci-host/uninorth.c        |   1 -
> hw/ppc/mac.h                  | 105 ----------------
> hw/ppc/mac_newworld.c         | 220 ++++++++++++++++------------------
> hw/ppc/mac_oldworld.c         | 105 +++++++---------
> include/hw/misc/macio/macio.h |   2 +-
> include/hw/nvram/mac_nvram.h  |  49 ++++++++
> 16 files changed, 222 insertions(+), 298 deletions(-)
> delete mode 100644 hw/ppc/mac.h
> create mode 100644 include/hw/nvram/mac_nvram.h
>
>

