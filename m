Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BD3D55E2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:51:57 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wL6-0007gV-5x
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wIj-0005Ou-Ic
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wIh-00049Q-Sh
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yoxV/YojjeWROgxEimn+F1ZrfwSc/gYTuhH+Zg9d3ig=;
 b=WvRYf4d4xrNtpjkAjrzUN04t2HWrCYtTBhxJq7Y2jiEIevKGs1n+wKA3KSzXIIxrv7eclL
 geS5GY70Goix8gloQxZajaT5lnRH8JDz6QIZSbbULaFltHRM755fV3TikLZ7A5B+0IR/8S
 FmfTKPUq5HF0WsSzDwmHSdACY8xjalw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-1Jq-3gPYN7q99YTNibkVuw-1; Mon, 26 Jul 2021 04:49:23 -0400
X-MC-Unique: 1Jq-3gPYN7q99YTNibkVuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6250E101C8A5;
 Mon, 26 Jul 2021 08:49:22 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACE581ABD1;
 Mon, 26 Jul 2021 08:49:14 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:49:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1 v3] block/nvme: Fix VFIO_MAP_DMA failed: No space
 left on device
Message-ID: <YP53CdBIKNECmUnr@stefanha-x1.localdomain>
References: <20210723195843.1032825-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723195843.1032825-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YtOrPNLJlAQ/xGDu"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YtOrPNLJlAQ/xGDu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 09:58:43PM +0200, Philippe Mathieu-Daud=E9 wrote:
> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
> -ENOMEM in case of error. The driver was correctly handling the
> error path to recycle its volatile IOVA mappings.
>=20
> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
> DMA mappings per container", April 2019) added the -ENOSPC error to
> signal the user exhausted the DMA mappings available for a container.
>=20
> The block driver started to mis-behave:
>=20
>   qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>   (qemu)
>   (qemu) info status
>   VM status: paused (io-error)
>   (qemu) c
>   VFIO_MAP_DMA failed: No space left on device
>   (qemu) c
>   VFIO_MAP_DMA failed: No space left on device
>=20
> (The VM is not resumable from here, hence stuck.)
>=20
> Fix by handling the new -ENOSPC error (when DMA mappings are
> exhausted) without any distinction to the current -ENOMEM error,
> so we don't change the behavior on old kernels where the CVE-2019-3882
> fix is not present.
>=20
> An easy way to reproduce this bug is to restrict the DMA mapping
> limit (65535 by default) when loading the VFIO IOMMU module:
>=20
>   # modprobe vfio_iommu_type1 dma_entry_limit=3D666
>=20
> Cc: qemu-stable@nongnu.org
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Reported-by: Michal Pr=EDvozn=EDk <mprivozn@redhat.com>
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> v3: Reworded (Fam)
> v2: KISS checking both errors undistinguishedly (Maxim)
> ---
>  block/nvme.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--YtOrPNLJlAQ/xGDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD+dwkACgkQnKSrs4Gr
c8g03QgApI73N3wCWlkH9mWP6B6de0uyWuJKPwKZlmnSM1hqFWYp6sYwa2eAMxO+
R/CRjoZSFjkfXUq7wa7XdbkD59KgcgVWrASapbCfFu2PrsfrCvVc8XrPaLhUyVf9
d35upa/BeTSZY5hQXH66xEqPJK844yCSGSNGg1WFcxtRQgKjOwt+z0aZGZvS4nsI
4K8YNIfxKAA9C1LGBHD4RhFrqKzDH17WVXPdF4DvetOoilpuoMaoIzLtKzu7pi6n
Zg2ZclTayLnPTQwl0tgv/ZaRktIlj4mtRSma/79xDEeziK6hG8Y+rWxPdWeA2wqe
BCJtBzD7zazi+gRiZn8vSQ4gFP9IBw==
=SLJz
-----END PGP SIGNATURE-----

--YtOrPNLJlAQ/xGDu--


