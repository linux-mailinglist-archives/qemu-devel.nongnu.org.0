Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2D5A0041
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:20:48 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQu3Z-00050d-TH
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQu28-0003cC-3w
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQu24-0001rH-OV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661361546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ix15T7mv+9wgJBCrzH/s1BjQCbEnjWIibpaO++fZioE=;
 b=dyo5dMMJ6fxVY7K6rcqXUM/ZRMXtYKxxNsgiKNAGSyGitjhfNKb526/hRGdTLM/gGoFtkh
 My1h9sXAZM6I/rdZqdOmRRfDitjJQaIt5il4Vrf3HlsWNf2wsQl9jFA6pOeL5vRHm2feMc
 hU6s9PEK8cGKmnAJJTpXw41ETJu2htA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-yMICmKZbOAqYRte1qPYR0A-1; Wed, 24 Aug 2022 13:19:03 -0400
X-MC-Unique: yMICmKZbOAqYRte1qPYR0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E031010361;
 Wed, 24 Aug 2022 17:19:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8E711121315;
 Wed, 24 Aug 2022 17:19:01 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:18:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Martin Oliveira <Martin.Oliveira@eideticom.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "fam@euphon.net" <fam@euphon.net>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Stephen Bates <stephen@eideticom.com>,
 Chaitanya Kulkarni <Chaitanyak@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Message-ID: <YwZdg/nExYoDNRR/@fedora>
References: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y0BwX+3SOlYfDiJ2"
Content-Disposition: inline
In-Reply-To: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--y0BwX+3SOlYfDiJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 10:36:00PM +0000, Martin Oliveira wrote:
> Hello,
>=20
> I'm trying to use the QEMU NVMe userspace driver and I'm hitting an error=
 when trying to use more than one device from an IOMMU group:
>=20
>     Failed to open VFIO group file: /dev/vfio/39: Device or resource busy
>=20
> If devices belong to different IOMMU groups, then it works as expected.
>=20
> For each device, I bind it to vfio-pci and then use something like this:
>=20
>     -drive file=3Dnvme://0000:26:00.0,if=3Dnone,id=3Ddrive0,format=3Draw
>     -device virtio-blk,drive=3Ddrive0,id=3Dvirtio0,serial=3Dnvme0
>=20
> Using the file-based protocol (file=3D/dev/nvme0n1) works with multiple d=
evices from the same group.
>=20
> My host is running a 5.19 kernel and QEMU is the latest upstream (a8cc584=
2b5cb).

First, multiple QEMU instances cannot access nvme:// devices sharing the
same IOMMU group. I don't think this will ever be possible because it
opens a backdoor around process memory isolation.

However, a single QEMU (or qemu-storage-daemon) instance should be able
to access multiple nvme:// devices in the same IOMMU group.
Unfortunately the code currently doesn't support that.
util/vfio-helpers.c:qemu_vfio_init_pci() has no logic for sharing
groups/containers. Opening the group fails with EBUSY because the kernel
only allows the file to be opened once at any given time.

It's possible to extend the util/vfio-helpers.c code to reuse VFIO
groups (and share VFIO containers), but I'm not aware of anyone who is
currently working on that.

Stefan

--y0BwX+3SOlYfDiJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGXYMACgkQnKSrs4Gr
c8jrrwf/Ul556buQYD9lM0zF+4EgrcIE9giOVQELhC5idOsu94h5uCZrmVXgqayS
nVLFeL2Zd20glib3RMAQ+6PYFchXAvgsNc9rSwpnbrUXyW3fQF1tVsepW1wG9HM8
QobIp4MilrgvC7+4xUSPc8QvvSjAKoeIgoYRmRHR7JKyly/Fw7OYpSjqa3effFaD
RzniWHuGB1NLJKcdqLcz3np2jaTPuM/+sdICAt9m0tRajVAJZPVkpE6RMtfdhvQa
Jbb+rDZN3FZYtAG1WLm+uTzf+jJRBFgK5F9Oc79/uAbP4E0tTNn2w4eUHofkT8Ww
A4fd/yDjB/nq8zwf8oplJnlv0zMZ2A==
=uQoC
-----END PGP SIGNATURE-----

--y0BwX+3SOlYfDiJ2--


