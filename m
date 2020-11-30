Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C682C8458
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:51:51 +0100 (CET)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiek-0005Lh-IR
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjiMr-0008LP-KK
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjiMh-0004Vt-IV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h4AJA1lXLpbGofF76hi2YMSRYpNmQnrPhw0t2FcKa+8=;
 b=NhwrFxZbqf3H36bRi+Plkra2Yyqz97QMaAPEzY3OLU9IiU0N4eqs67WnRrnmqHH08u+sZX
 PCaUmXrSARQkaE53KrFZCi3Ah8BZdgd49yM786vxpVTj3zawr6+NBORdOQKvOxPeY8+0ld
 4sw2f5PguF3pCxDkn/B0hYGdADxcUX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-lq8nwY01MIiM6-Ni4YNGgA-1; Mon, 30 Nov 2020 07:33:04 -0500
X-MC-Unique: lq8nwY01MIiM6-Ni4YNGgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E211005D58;
 Mon, 30 Nov 2020 12:33:02 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3242E5D9C0;
 Mon, 30 Nov 2020 12:33:01 +0000 (UTC)
Date: Mon, 30 Nov 2020 12:33:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v5 12/12] hw/block/nvme: add persistence for zone info
Message-ID: <20201130123300.GA422962@stefanha-x1.localdomain>
References: <20201126234601.689714-1-its@irrelevant.dk>
 <20201126234601.689714-13-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20201126234601.689714-13-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 12:46:01AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  docs/specs/nvme.txt   |  15 +++
>  hw/block/nvme-ns.h    |  16 ++++
>  hw/block/nvme-ns.c    | 212 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/nvme.c       |  87 +++++++++++++++++
>  hw/block/trace-events |   2 +
>  5 files changed, 331 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> index 03bb4d9516b4..05d81c88ad4e 100644
> --- a/docs/specs/nvme.txt
> +++ b/docs/specs/nvme.txt
> @@ -20,6 +20,21 @@ The nvme device (-device nvme) emulates an NVM Express=
 Controller.
>    `zns.mor`; Specifies the number of open resources available. This is a=
 0s
>       based value.
> =20
> +  `zns.pstate`; This parameter specifies another blockdev to be used for
> +     storing zone state persistently.
> +
> +       -drive id=3Dzns-pstate,file=3Dzns-pstate.img,format=3Draw
> +       -device nvme-ns,zns.pstate=3Dzns-pstate,...
> +
> +     To reset (or initialize) state, the blockdev image should be of zer=
o size:
> +
> +       qemu-img create -f raw zns-pstate.img 0
> +
> +     The image will be intialized with a file format header and truncate=
d to
> +     the required size. If the pstate given is of non-zero size, it will=
 be
> +     assumed to already contain zone state information and the header wi=
ll be
> +     checked.

In principle this makes sense but at first glance it looks like the code
is synchronous - it blocks the vCPU if zone metadata I/O is necessary.
That works for test/bring-up code but can't be used in production due to
the performance impact.

Is the expectation that the QEMU NVMe device emulation will only be used
for test/bring-up now and in the future?

Stefan

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/E5nwACgkQnKSrs4Gr
c8gERQf/fTRk4d4jmC2wspKiVcJKQ+CkhiHgqO3R+narNCG9mmYeAYp/LGdLS85R
2DizAD+tzbAPEWiSOCXvIAN0DuQxur6wT5q3B6Pt/nQenrJbkJNEqZ9hUqB/NOOp
jpvfIVmhos/l8bW76dPNrmvypGyS2R6jVa+ObdTWISr4Nb4K8uzWm9gM6UPnUooc
N33M38sOk+K7pJswbsSiP4SN6FSFRiwtQ47RA4x16FS1L0jz7Hg4+384Ksr3Ku33
ymICz6QjSGBJy3+7TPjZ45NPAPrPbqPzAf9GpkUOO1VROHeReG9NAig+uEwkhPIA
sEvP7r6iehj1M9jqnggPFvaIC6VxbA==
=qOH4
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--


