Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75F41BAA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 07:53:44 +0200 (CEST)
Received: from localhost ([::1]:56816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hawCd-000859-Gm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 01:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8j-0004Of-3f
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8h-00070m-Pi
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:41 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1haw8g-0006zb-Jr; Wed, 12 Jun 2019 01:49:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwtQ3PFXz9s9y; Wed, 12 Jun 2019 15:49:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560318574;
 bh=afZGPOcXXj2+YdmyHT27j2KUWyG32JKL2p+Rx7eidK8=;
 h=From:To:Cc:Subject:Date:From;
 b=PGJjatN6eXBO2HKVQXFeTNmmrgIisNceCm8irNNwiu1f1AqbZp1em1xk9l3ed0Phe
 Vhukxs7G2z2SvHGh2mw3TvYrdwYPqswwg6DA57B6qSyHjZ6cqGImjBWPIKf2iGFavB
 k2J3rcYy6O3oWj25moDv7USqWFUjCIvYWuKYNl94=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 12 Jun 2019 15:49:16 +1000
Message-Id: <20190612054929.21136-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 00/13] ppc-for-4.1 queue 20190612
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 219dca61ebf41625831d4f96a720852baf44b7=
62:

  Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-pull-reque=
st' into staging (2019-06-11 16:02:07 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190612

for you to fetch changes up to 4aca9786542e427d4337503566efdf09f2cb87cd:

  ppc/xive: Make XIVE generate the proper interrupt types (2019-06-12 10:=
41:50 +1000)

----------------------------------------------------------------
ppc patch queue 2019-06-12

Next pull request against qemu-4.1.  The big thing here is adding
support for hot plug of P2P bridges, and PCI devices under P2P bridges
on the "pseries" machine (which doesn't use SHPC).  Other than that
there's just a handful of fixes and small enhancements.

----------------------------------------------------------------
Anton Blanchard (1):
      target/ppc: Fix lxvw4x, lxvh8x and lxvb16x

Benjamin Herrenschmidt (1):
      ppc/xive: Make XIVE generate the proper interrupt types

C=C3=A9dric Le Goater (1):
      ppc/pnv: activate the "dumpdtb" option on the powernv machine

David Gibson (8):
      spapr: Clean up device node name generation for PCI devices
      spapr: Clean up device tree construction for PCI devices
      spapr: Clean up dt creation for PCI buses
      spapr: Clean up spapr_drc_populate_dt()
      spapr: Clean up DRC index construction
      spapr: Don't use bus number for building DRC ids
      spapr: Direct all PCI hotplug to host bridge, rather than P2P bridg=
e
      spapr: Allow hot plug/unplug of PCI bridges and devices under PCI b=
ridges

Greg Kurz (1):
      spapr_pci: Improve error message

Richard Henderson (1):
      target/ppc: Use tcg_gen_gvec_bitsel

 hw/intc/xive.c                      |  22 +-
 hw/ppc/pnv.c                        |   2 +
 hw/ppc/spapr.c                      |  25 +-
 hw/ppc/spapr_drc.c                  |  13 +-
 hw/ppc/spapr_pci.c                  | 497 ++++++++++++++++++++++--------=
------
 include/hw/pci-host/spapr.h         |   4 +-
 include/hw/ppc/spapr_drc.h          |   3 +-
 include/hw/ppc/xive.h               |   3 +-
 target/ppc/translate/vsx-impl.inc.c |  37 +--
 9 files changed, 368 insertions(+), 238 deletions(-)

