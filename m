Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487843BBD52
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:07:27 +0200 (CEST)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OJq-0004kZ-0a
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OI3-0002Of-9U
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OHy-0008Fg-Tl
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625490328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XFvZhXLbKAe3w/LmNMwD2AQsl+D6nwkPY1ZdrQNzjiY=;
 b=axOU8+agwjOLSF10iSGoGj8KcbvR3U12kjt0eAj82GAFzQmVegH+fA1/AJCsnRKhsdup6X
 6dg3q4/cXh/5dqeBIwh0ENavSIWKrf2vinqO9dCnxkl5wvhNXQmWTqaGRKsn6gY2sApWy3
 6hyvo34LuLESiCsWayAwo8LcGfRpEX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-llHMg1fgO0mO-2R3OQ_bRA-1; Mon, 05 Jul 2021 09:05:24 -0400
X-MC-Unique: llHMg1fgO0mO-2R3OQ_bRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A0EE1084F55;
 Mon,  5 Jul 2021 13:05:23 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30CC260C0F;
 Mon,  5 Jul 2021 13:05:23 +0000 (UTC)
Date: Mon, 5 Jul 2021 14:05:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/6] hw: Let the DMA API take a MemTxAttrs argument
Message-ID: <YOMDktOtmcxPSVPe@stefanha-x1.localdomain>
References: <20210702092439.989969-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210702092439.989969-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D5/WSe/lmJxHtJIX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--D5/WSe/lmJxHtJIX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 11:24:33AM +0200, Philippe Mathieu-Daud=E9 wrote:
> I'm going to send yet another series aiming to fix the DMA
> reentrancy problem, which is based on these patches. Since
> they are already reviewed, send them apart as a preparatory
> series.
>=20
> Since v2:
> - Rebased, fixing conflicts in:
>   . hw/display/virtio-gpu.c
>   . hw/ide/ahci.c
>   . hw/net/allwinner-sun8i-emac.c
>   . hw/pci-host/pnv_phb4.c
>   . hw/sd/sdhci.c
>=20
> Supersedes: <20201001172519.1620782-1-philmd@redhat.com>
>=20
> Philippe Mathieu-Daud=E9 (6):
>   dma: Let dma_memory_valid() take MemTxAttrs argument
>   dma: Let dma_memory_set() take MemTxAttrs argument
>   dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
>   dma: Let dma_memory_rw() take MemTxAttrs argument
>   dma: Let dma_memory_read/write() take MemTxAttrs argument
>   dma: Let dma_memory_map() take MemTxAttrs argument
>=20
>  include/hw/pci/pci.h          |  6 +++--
>  include/hw/ppc/spapr_vio.h    | 11 +++++---
>  include/sysemu/dma.h          | 50 ++++++++++++++++++++++-------------
>  hw/arm/musicpal.c             | 13 ++++-----
>  hw/arm/smmu-common.c          |  3 ++-
>  hw/arm/smmuv3.c               | 14 ++++++----
>  hw/core/generic-loader.c      |  3 ++-
>  hw/display/virtio-gpu.c       | 10 ++++---
>  hw/dma/pl330.c                | 12 ++++++---
>  hw/dma/sparc32_dma.c          | 16 ++++++-----
>  hw/dma/xlnx-zynq-devcfg.c     |  6 +++--
>  hw/dma/xlnx_dpdma.c           | 10 ++++---
>  hw/hyperv/vmbus.c             |  8 +++---
>  hw/i386/amd_iommu.c           | 16 ++++++-----
>  hw/i386/intel_iommu.c         | 28 ++++++++++++--------
>  hw/ide/ahci.c                 |  8 +++---
>  hw/ide/macio.c                |  2 +-
>  hw/intc/spapr_xive.c          |  3 ++-
>  hw/intc/xive.c                |  7 ++---
>  hw/misc/bcm2835_property.c    |  3 ++-
>  hw/misc/macio/mac_dbdma.c     | 10 ++++---
>  hw/net/allwinner-sun8i-emac.c | 18 ++++++++-----
>  hw/net/ftgmac100.c            | 25 +++++++++++-------
>  hw/net/imx_fec.c              | 32 +++++++++++++---------
>  hw/net/npcm7xx_emc.c          | 20 ++++++++------
>  hw/nvram/fw_cfg.c             | 12 ++++++---
>  hw/pci-host/pnv_phb3.c        |  5 ++--
>  hw/pci-host/pnv_phb3_msi.c    |  9 ++++---
>  hw/pci-host/pnv_phb4.c        |  5 ++--
>  hw/sd/allwinner-sdhost.c      | 14 +++++-----
>  hw/sd/sdhci.c                 | 35 +++++++++++++++---------
>  hw/usb/hcd-dwc2.c             |  8 +++---
>  hw/usb/hcd-ehci.c             |  6 +++--
>  hw/usb/hcd-ohci.c             | 28 ++++++++++++--------
>  hw/usb/hcd-xhci.c             | 18 ++++++++-----
>  hw/usb/libhw.c                |  3 ++-
>  hw/virtio/virtio.c            |  6 +++--
>  softmmu/dma-helpers.c         | 11 ++++----
>  38 files changed, 305 insertions(+), 189 deletions(-)
>=20
> --=20
> 2.31.1
>=20
>=20

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--D5/WSe/lmJxHtJIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDjA5IACgkQnKSrs4Gr
c8j99AgAj44wuFTjHsxqZ24SPNJ1z8BdVTHQDyFr+XDHOv8DEtmlitsb5qJRVZ4L
ZpoU2APg3qZeG0C2DLAzb0LfoQLYkThduSs0tPWYiJ4+jX8ao1Ndc1GzKtXGQ+N4
u90fxd6CADMSalrPu6BBPT7IwIPRR/wovPufr262jWx+O9jVROifPqK8XVr/+zVo
lx+ZgWhIbp4PdOKR3n+dbJgBu0ze2nUzi5+M2b/mXYsnieWxNzsGb6b/NolOrkAj
S0V60pNBBvb21zunhVYPzoAKEz6xEf4g7QU0aMcZocrK+uq4QlvHAWRZeO3MGrr6
ohcp+VlWieqpL+OEabtqoIlJ2g0OFw==
=EJNc
-----END PGP SIGNATURE-----

--D5/WSe/lmJxHtJIX--


