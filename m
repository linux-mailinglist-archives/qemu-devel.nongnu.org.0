Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0CCD3B44
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:35:42 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqOj-0005At-T1
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqND-0003y2-D5
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqNA-0008A4-VU
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:34:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqNA-000895-PS
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:34:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D440C057F31
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:34:02 +0000 (UTC)
Received: from localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08AD3451F;
 Fri, 11 Oct 2019 08:33:55 +0000 (UTC)
Date: Fri, 11 Oct 2019 09:33:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/7] libqos: add VIRTIO PCI 1.0 support
Message-ID: <20191011083354.GH12360@stefanha-x1.localdomain>
References: <20191010155853.4325-1-stefanha@redhat.com>
 <157074191940.11314.4445412008409730407@37313f22b938>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline
In-Reply-To: <157074191940.11314.4445412008409730407@37313f22b938>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 11 Oct 2019 08:34:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 02:12:00PM -0700, no-reply@patchew.org wrote:
> 4/7 Checking commit e3477ab2dc8e (libqos: add MSI-X callbacks to QVirtioP=
CIDevice)
> ERROR: line over 90 characters
> #31: FILE: tests/libqos/virtio-pci.c:283:
> +static void qvirtio_pci_set_queue_vector(QVirtioPCIDevice *d, uint16_t v=
q_idx, uint16_t entry)
[...]
> 7/7 Checking commit f7c93099d7df (libqos: add VIRTIO PCI 1.0 support)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
[...]
> ERROR: line over 90 characters
> #235: FILE: tests/libqos/virtio-pci-modern.c:198:
> +static QVirtQueue *virtqueue_setup(QVirtioDevice *d, QGuestAllocator *al=
loc, uint16_t index)
>=20
> WARNING: line over 80 characters
> #298: FILE: tests/libqos/virtio-pci-modern.c:261:
> +static void set_queue_vector(QVirtioPCIDevice *d, uint16_t vq_idx, uint1=
6_t entry)
>=20
> WARNING: Block comments use a leading /* on a separate line
> #328: FILE: tests/libqos/virtio-pci-modern.c:291:
> +    /* "Any PCI device with ... PCI Device ID 0x1000 through 0x107F incl=
usive
>=20
> WARNING: Block comments use a leading /* on a separate line
> #336: FILE: tests/libqos/virtio-pci-modern.c:299:
> +    /* "Devices MAY utilize a Transitional PCI Device ID range, 0x1000 to
>=20
> WARNING: Block comments use a leading /* on a separate line
> #340: FILE: tests/libqos/virtio-pci-modern.c:303:
> +        /* "Transitional devices MUST have the PCI Subsystem Device ID m=
atching
>=20
> WARNING: Block comments use a leading /* on a separate line
> #345: FILE: tests/libqos/virtio-pci-modern.c:308:
> +        /* "The PCI Device ID is calculated by adding 0x1040 to the Virt=
io
>=20
> WARNING: Block comments use a leading /* on a separate line
> #393: FILE: tests/libqos/virtio-pci-modern.c:356:
> +    /* Due to the qpci_iomap() API we only support devices that put all

Will fix these in v2.

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2gPnIACgkQnKSrs4Gr
c8h37wgAk3IWFcA8kki4VAt6DSk2RnbUcmquiyG/K4V6u1c/woEbmAqHUz2hQ+fj
IVU/60UiIh0KlV7ytUm2ZOaQ9SY9UNRfC2RxSeMHFZYAez3o+DRl7Sj+0ocFFRxb
6ekbqwAEmh6eKyZ8ApcUC70zhawggosnwiyhdQSumpLs0hBfc/F9lDcFiJPy1fxM
dBIzS/6XVx+ex++oUkJU7rD+dgQr6if+ujZJZzKM3A/+Ftin0BNQNXRMcxcnTIyD
EtcuytjoBHxl1ZVTNkAzxEt5kl4wHzhEeG3sHw+9Kxo0jV+B3yRSfCZZMTXAYt0I
J6mdlf9DE/qNRiW+N23ltZUTgUwrtQ==
=IMwC
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--

