Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F072EB9E4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:13:45 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx24n-0005dF-22
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kx23F-0004n4-90; Wed, 06 Jan 2021 01:12:09 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:58564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kx239-00043U-OK; Wed, 06 Jan 2021 01:12:08 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 77636A00DB; Wed,  6 Jan 2021 07:12:00 +0100 (CET)
Date: Wed, 6 Jan 2021 07:12:00 +0100 (CET)
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PULL 00/22] ppc-for-6.0 queue 20210106
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
Message-ID: <alpine.LMD.2.03.2101060709550.30830@eik.bme.hu>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
 BOUNDARY="1117279078-2135431784-1609913520=:30830"
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org, groug@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1117279078-2135431784-1609913520=:30830
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 Jan 2021, David Gibson wrote:
> The following changes since commit 52d25464605dc20022ad94aa8bc8e8473e6008=
33:
>
>  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210104'=
 into staging (2021-01-05 16:18:20 +0000)
>
> are available in the Git repository at:
>
>  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210106
>
> for you to fetch changes up to 5cbd51a5a58098444ffa246ece2013849be04299:
>
>  ppc440_pcix: Fix up pci config access (2021-01-06 11:09:59 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-01-06
>
> First pull request for 2021, which has a bunch of things accumulated
> over the holidays.  Includes:
>  * A number of cleanups to sam460ex and ppc440 code from BALATON Zoltan
>  * Several fixes for builds with --without-default-devices from Greg Kurz
>  * Fixes for some DRC reset problems from Greg Kurz
>  * QOM conversion of the PPC 4xx UIC devices from Peter Maydell
>  * Some other assorted fixes and cleanups
>
> ----------------------------------------------------------------
> BALATON Zoltan via (5):
>      ppc4xx: Move common dependency on serial to common option
>      sam460ex: Remove FDT_PPC dependency from KConfig

I've sent a v4 without these pathces

>      ppc440_pcix: Improve comment for IRQ mapping
>      ppc440_pcix: Fix register write trace event
>      ppc440_pcix: Fix up pci config access

but including another one missing from here so this pull request does not=
=20
have the latest set of patches. Of course it's difficult for me to tell=20
you when I can't send mail to your domain. We're trying to figure out why.

Regards,
BALATON Zoltan

> C=C3=A9dric Le Goater (1):
>      spapr/xive: Make spapr_xive_pic_print_info() static
>
> Greg Kurz (12):
>      spapr: DRC lookup cannot fail
>      spapr: Fix DR properties of the root node
>      spapr: Allow memory unplug to always succeed
>      spapr: Fix buffer overflow in spapr_numa_associativity_init()
>      spapr: Call spapr_drc_reset() for all DRCs at CAS
>      spapr: Fix reset of transient DR connectors
>      spapr: Introduce spapr_drc_reset_all()
>      spapr: Use spapr_drc_reset_all() at machine reset
>      spapr: Add drc_ prefix to the DRC realize and unrealize functions
>      ppc: Fix build with --without-default-devices
>      ppc: Simplify reverse dependencies of POWERNV and PSERIES on XICS an=
d XIVE
>      pnv: Fix reverse dependency on PCI express root ports
>
> Peter Maydell (4):
>      hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
>      ppc: Convert PPC UIC to a QOM device
>      hw/ppc/virtex_ml507: Drop use of ppcuic_init()
>      hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
>
> MAINTAINERS                 |   2 +
> hw/intc/Kconfig             |  17 +--
> hw/intc/meson.build         |  13 +-
> hw/intc/ppc-uic.c           | 321 +++++++++++++++++++++++++++++++++++++++=
+++++
> hw/intc/spapr_xive.c        |   2 +-
> hw/pci-host/Kconfig         |   5 +
> hw/pci-host/meson.build     |   2 +-
> hw/ppc/Kconfig              |  29 +---
> hw/ppc/ppc440_bamboo.c      |  38 ++++--
> hw/ppc/ppc440_pcix.c        |  50 ++++---
> hw/ppc/ppc4xx_devs.c        | 262 +++++-------------------------------
> hw/ppc/spapr.c              |  44 +++---
> hw/ppc/spapr_drc.c          |  63 +++++++--
> hw/ppc/spapr_events.c       |   3 +-
> hw/ppc/spapr_hcall.c        |  33 +----
> hw/ppc/trace-events         |   1 +
> hw/ppc/virtex_ml507.c       |  21 ++-
> include/hw/intc/ppc-uic.h   |  73 ++++++++++
> include/hw/pci-host/spapr.h |   2 -
> include/hw/ppc/spapr.h      |   6 +-
> include/hw/ppc/spapr_drc.h  |  10 +-
> include/hw/ppc/spapr_xive.h |   2 -
> 22 files changed, 616 insertions(+), 383 deletions(-)
> create mode 100644 hw/intc/ppc-uic.c
> create mode 100644 include/hw/intc/ppc-uic.h
>
>
--1117279078-2135431784-1609913520=:30830--

