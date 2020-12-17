Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4972DD509
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:19:12 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvzj-0001Vc-7O
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvyH-0000Sc-GU
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvyF-00058k-0K
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608221857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FAoKDEmoXAwzL2cvYApR2OT5x1UnveB0jDAjqh/Aj4A=;
 b=FzCC9eeBh1Y7qSdIqxAdUk0AzMSyiEffNbZOPGsmkB65BvxS5qgHk0p60mAIXvh+7EeITW
 6v30/RJqt7FkYur0gQHRStAKrYeh5kJDYGiQexmx9hcau4QKjDcP4FNKe1+PYPaKw3Z/yB
 SViBOfW6lEdpgWRDwbQV8iTZNtq4tf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-bcFr7WazPZiOYTcdhJwDcA-1; Thu, 17 Dec 2020 11:17:34 -0500
X-MC-Unique: bcFr7WazPZiOYTcdhJwDcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BF16801817;
 Thu, 17 Dec 2020 16:17:33 +0000 (UTC)
Received: from localhost (ovpn-115-250.ams2.redhat.com [10.36.115.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 148225D9CD;
 Thu, 17 Dec 2020 16:17:32 +0000 (UTC)
Date: Thu, 17 Dec 2020 16:17:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] block/nvme: Do not allow image creation with NVMe block
 driver
Message-ID: <20201217161729.GB24632@stefanha-x1.localdomain>
References: <20201204165724.2647357-1-philmd@redhat.com>
 <d1deeab3-251f-5081-7d45-0092b381bc5a@redhat.com>
 <06e30ac7-e667-0b4c-4777-78a5edfe4069@redhat.com>
MIME-Version: 1.0
In-Reply-To: <06e30ac7-e667-0b4c-4777-78a5edfe4069@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Xueqiang Wei <xuwei@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 06:16:04PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 12/4/20 11:28 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 12/4/20 5:57 PM, Philippe Mathieu-Daud=E9 wrote:
> >> The NVMe driver does not support image creation.
> >> The full drive has to be passed to the guest.
> >>
> >> Before:
> >>
> >>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
> >>   Formatting 'nvme://0000:04:00.0/1', fmt=3Draw size=3D21474836480
> >>
> >>   $ qemu-img info nvme://0000:04:00.0/1
> >>   image: nvme://0000:04:00.0/1
> >>   file format: raw
> >>   virtual size: 349 GiB (375083606016 bytes)
> >>   disk size: unavailable
>=20
> Maybe I should not forbid all formats... But 'raw' is kinda
> dangerous, as there is no way to enforce the next layer to
> access beside the size allocated.
>=20
> Safe drive partitioning can be achieved creating namespaces,
> feature which is not yet implemented.

I don't see the need for this patch. Or if there is a need then
block/file-posix.c, block/iscsi.c, and block/nbd.c should also be
changed (anything that uses bdrv_co_create_opts_simple()).

Instead I suggest adding a warning at creation time if a raw format
image is created on top of a BDS that is larger than requested. The
warning should remind the user that they need to use the raw format
drivers's size=3D open option to restrict the disk capacity when opening
the image.

Stefan

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/bhJkACgkQnKSrs4Gr
c8heKwf9Eo77AwoGGAUBMqH3enzO9Z1h56DVAgm7MWmgc3uCG3GnFXZ9ghIaGnuZ
BkUHNIYSW5ifp7ocRHkEbSCLRz4Cl0cOEBU/vnU3MTwwjVV5v4nOncVLwaMydWH/
DlohgIAj/6VJkSlj5rcSpBGesMtGe/688XOuG8Pi7dkBW5D7tt9uyyh+0a3+qhV/
S/LxtJzghLlv7GWT65+5yj79qy0Fi04sp3mu4C0OB05/S5d2R14yIQ5JAjytcGVF
hPZbVFhfcWHKuhF60gkMVGNuwK4398Wd6cbcY3oa9pV+5vGhQ/Ptd90J13b+0Z8i
Mjf8kodjpR1jxh+dbSPfNzZy26LeHw==
=x3Rp
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--


