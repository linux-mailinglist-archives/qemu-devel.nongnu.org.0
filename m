Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363348AC35
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:12:07 +0100 (CET)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7F4P-0002pc-IJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1n7F1q-0000y3-2u
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1n7F1m-0002MW-Hz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641899361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEE1Wdkxv8rEK5buquCjy9C1sH3DV1lG9CoM6y3mCkc=;
 b=BtF7Iajc1nwAgTLJsYcXIHHu1+ppCVTWiWUJ8gKw13OWR0rtjo9S0vyWTzzSOVxjCNcGw+
 biKw4ExbLzxpy+GtCpacS+0Dc8PWBwbnuNC2bUzZ5piDyOjki2swQXXXnhJuWpDV7rg2/u
 +br0cwq7DXSB2lvjLNccgjl8xMoPM+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-MNjDCUYtPGKsVyDypiHAIA-1; Tue, 11 Jan 2022 06:08:12 -0500
X-MC-Unique: MNjDCUYtPGKsVyDypiHAIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2227593A8;
 Tue, 11 Jan 2022 11:08:10 +0000 (UTC)
Received: from localhost (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD3F105915D;
 Tue, 11 Jan 2022 11:07:45 +0000 (UTC)
Date: Tue, 11 Jan 2022 12:07:57 +0100
From: Sergio Lopez <slp@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH v1 1/2] hw/i386: Make pit a property of common x86 base
 machine type
Message-ID: <20220111110757.43dhosivan6htkt2@mhamilton>
References: <20220111073528.1771552-1-xiaoyao.li@intel.com>
 <20220111073528.1771552-2-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220111073528.1771552-2-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ivzcv2u5pmd5nqzr"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
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

--ivzcv2u5pmd5nqzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 03:35:27PM +0800, Xiaoyao Li wrote:
> Both pc and microvm have pit property individually. Let's just make it
> the property of common x86 base machine type.
>=20
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  hw/i386/microvm.c         | 27 +--------------------------
>  hw/i386/pc.c              | 24 +++---------------------
>  hw/i386/x86.c             | 25 +++++++++++++++++++++++++
>  include/hw/i386/microvm.h |  2 --
>  include/hw/i386/pc.h      |  2 --
>  include/hw/i386/x86.h     |  2 ++
>  6 files changed, 31 insertions(+), 51 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--ivzcv2u5pmd5nqzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmHdZQwACgkQ9GknjS8M
AjW76Q/5AUvFT/EuWtWglJFKw1DNDu90vG/Kx93RhokxJf4IhN7Q+fQoQcOVLvZ1
WpRWArw/CDAGyEux9DFiyJMse1kRWC5Nkp5CL24+5GuGj4FGS7jUeYomPzL50l8I
vNzop7EudSny1VFSr8uZn7IyeYdzW6w5S57nsexk+0WsG/mc14PB9xilN/qOdFXe
gYhC3y4svljtqramMj/L+qMzCjic/6+bCYySHt6Se0posCBUU33CwKejrs0NE6Gp
rzoS54f03R6CBii8MageGucNaWKbUsP9aTIWrnpcZXMDgwOfvVQlwvNuOFrQWmKy
wlt3LXyG4doTFJv73Jd/nXpONOl17Z2iquTDU7Zwlu3A9bTwlc0WEgPtciEj1fA9
ogR9d/rhQYNeTQAtaHxN7N4K3F33D5yzG9R2nazLceM0RKLeC2Jjn0o9XO5B50CV
UyLo6y/OFxIsfuaAAjbCiry8oHHEDUYop8ohCI8jOkkBWL6phR2cXvjoZIopv5NY
nmEAZhiVbM2HFshwbGkuw66NPzMPZWwwX80DPjCNT4N8GHhdks/q1WUOhfhi1TZo
5vvu6MwTVQka/Lk2EhUEJeimd90MXI8lsdEKDrUJ3qiX26ZsIMW3MhMu44FO1yKn
jjDgvGZUkEhhz5DMIUuzTAAV3kE/xykz6JoSnOExjMlh42fNRHo=
=chVj
-----END PGP SIGNATURE-----

--ivzcv2u5pmd5nqzr--


