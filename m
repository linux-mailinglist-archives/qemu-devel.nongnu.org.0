Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8E48AC3D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:13:49 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7F64-0004pQ-6B
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:13:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1n7F2d-0001ik-1N
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:10:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1n7F2U-0002ax-Rt
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641899403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXuiwevPbPzR17e7fDjBLhSaR0KI8yaXtyp8EnTWzJQ=;
 b=dMznfVfsiBwVKl4DH0lhvAYWdr3HbhXxZihG9oBpRn6LOUNsS+faeldzeHqIFRtNMty/Jv
 d4/4Lw3T0ck4ViWQiUbLlfsp5dHIsZh2DizpD9vsmO6iwlSJ0il+gEM+nZ9LolOVTF8Dq5
 FJqdKDeCKxtEW1hNvIQhQYSo/9omh6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-eKtOg7X6MsGC4S9_aauHkg-1; Tue, 11 Jan 2022 06:08:56 -0500
X-MC-Unique: eKtOg7X6MsGC4S9_aauHkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EFF3180E49D;
 Tue, 11 Jan 2022 11:08:55 +0000 (UTC)
Received: from localhost (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649662A189;
 Tue, 11 Jan 2022 11:08:35 +0000 (UTC)
Date: Tue, 11 Jan 2022 12:08:47 +0100
From: Sergio Lopez <slp@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH v1 2/2] hw/i386: Make pic a property of common x86 base
 machine type
Message-ID: <20220111110847.abqlu7ymf6ulyssk@mhamilton>
References: <20220111073528.1771552-1-xiaoyao.li@intel.com>
 <20220111073528.1771552-3-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220111073528.1771552-3-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cm7ewyugloire4fs"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cm7ewyugloire4fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 03:35:28PM +0800, Xiaoyao Li wrote:
> Legacy PIC (8259) cannot be supported for TDX guests since TDX module
> doesn't allow directly interrupt injection.  Using posted interrupts
> for the PIC is not a viable option as the guest BIOS/kernel will not
> do EOI for PIC IRQs, i.e. will leave the vIRR bit set.
>=20
> Make PIC the property of common x86 machine type. Hence all x86
> machines, including microvm, can disable it.
>=20
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  hw/i386/microvm.c         | 27 +--------------------------
>  hw/i386/pc_piix.c         |  4 +++-
>  hw/i386/pc_q35.c          |  4 +++-
>  hw/i386/x86.c             | 25 +++++++++++++++++++++++++
>  include/hw/i386/microvm.h |  2 --
>  include/hw/i386/x86.h     |  2 ++
>  6 files changed, 34 insertions(+), 30 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--cm7ewyugloire4fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmHdZT4ACgkQ9GknjS8M
AjWswxAAjA+8tCUTnYuB8yDkzXHZhtnfyPgri1ZwzIk1sy4PGBse6+/Y9IRkP7F0
zsCncuQcE5ls4oUqBQoLheSJ7L1Ud1DWNCz3D7pYCPkEa9Imoim25Ztcci0xeRsa
Pnk+cjlXeq34cVP3W+OiPp0DbGpfH0QgC/aQFU+Plwoxz6Iia0WAv5FZ2zNpH/zc
u7SVAoR9l9bB5ALO8+dwwvq7eCVMSwpKFhrBSXpxkXdvKnWpJq+mzuGn8c7m9Hod
NQlLqnke9fap+FSLusyGlU4mdxbLVIh+d3Y3YWKze2glAO5ijqNFc/UvURIvXGca
s7egY0qAee2cL+eUzMORKz3I7/l3vxOD2gZ/cD/jLtFr/hUlZN4Ol/U57fsZ2FcC
whX2L/PJpzx0vmZXYrfeckdIXhAA+9zOZzVbaPd9Ql5VqdhM2hRhUDJ1rP8A8nTO
/SkI7mayhPElhtE5fHUQ0Qb6dcCQ21jT9ZqIKNxYoBsyWwUWou2z2AxkcOPrFePQ
G0u8HlvZcYvLCqCCQA+fryAJDKsu31ZpqFQ610Y3yOUBQqF0xFOVglWTFrt+62q9
lp3x/ycj5pPOae/qQoGubELGQ8JeX3uDk/CIvE3ujM5gOP/n8SQBEBpfcsWzZzah
x+wpNL2zQathqyO/ip2s3SLFloVE+SGrD7tfNUhaSvRR4Lgeh8Q=
=WkF6
-----END PGP SIGNATURE-----

--cm7ewyugloire4fs--


