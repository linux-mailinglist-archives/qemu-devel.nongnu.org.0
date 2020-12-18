Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D592DE0E6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:22:47 +0100 (CET)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCuM-0001gb-Ck
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqCsS-0000Xx-4Z
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqCsK-0005yU-GQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608286834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6SQ9GYHhrILXZIzMeeOkdZEHqBIgzRWEVDhZ/B1nC+E=;
 b=Xd8UN2xXRW/tUe616CBmAQfyd1+5TTiRKCAyqT3o4RCdiB0bwGQXxfsAn7b8Zq+lnLKQ00
 aRH/H+Ij4IfX4+HuBvYtQqZ/pvfsmZR3vVZTJ+tb2NCerHlqWzh7bVv0otRhVDjyAX6feR
 BLg7g0CExXLTyHdf3PwQhtqMibUzb4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-pY_eUj-QNKefNBpGG-pE_w-1; Fri, 18 Dec 2020 05:20:31 -0500
X-MC-Unique: pY_eUj-QNKefNBpGG-pE_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7FB9803623;
 Fri, 18 Dec 2020 10:20:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F4260BE5;
 Fri, 18 Dec 2020 10:20:25 +0000 (UTC)
Date: Fri, 18 Dec 2020 11:20:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/nvme: Do not allow image creation with NVMe block
 driver
Message-ID: <20201218102024.GC9596@merkur.fritz.box>
References: <20201204165724.2647357-1-philmd@redhat.com>
 <d1deeab3-251f-5081-7d45-0092b381bc5a@redhat.com>
 <06e30ac7-e667-0b4c-4777-78a5edfe4069@redhat.com>
 <20201217161729.GB24632@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201217161729.GB24632@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Xueqiang Wei <xuwei@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 17.12.2020 um 17:17 hat Stefan Hajnoczi geschrieben:
> On Mon, Dec 07, 2020 at 06:16:04PM +0100, Philippe Mathieu-Daud=E9 wrote:
> > On 12/4/20 11:28 PM, Philippe Mathieu-Daud=E9 wrote:
> > > On 12/4/20 5:57 PM, Philippe Mathieu-Daud=E9 wrote:
> > >> The NVMe driver does not support image creation.
> > >> The full drive has to be passed to the guest.
> > >>
> > >> Before:
> > >>
> > >>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
> > >>   Formatting 'nvme://0000:04:00.0/1', fmt=3Draw size=3D21474836480
> > >>
> > >>   $ qemu-img info nvme://0000:04:00.0/1
> > >>   image: nvme://0000:04:00.0/1
> > >>   file format: raw
> > >>   virtual size: 349 GiB (375083606016 bytes)
> > >>   disk size: unavailable
> >=20
> > Maybe I should not forbid all formats... But 'raw' is kinda
> > dangerous, as there is no way to enforce the next layer to
> > access beside the size allocated.
> >=20
> > Safe drive partitioning can be achieved creating namespaces,
> > feature which is not yet implemented.
>=20
> I don't see the need for this patch. Or if there is a need then
> block/file-posix.c, block/iscsi.c, and block/nbd.c should also be
> changed (anything that uses bdrv_co_create_opts_simple()).
>=20
> Instead I suggest adding a warning at creation time if a raw format
> image is created on top of a BDS that is larger than requested. The
> warning should remind the user that they need to use the raw format
> drivers's size=3D open option to restrict the disk capacity when opening
> the image.

This sounds like a good idea to me.

Kevin

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/cgmgACgkQfwmycsiP
L9YHsw/+MNCknJQmClKC1r3eER8ihanjmWV+BFepE/fLLedbGgVqAPmzy/nltLxG
HIVveFV+RpJi69w2EQ3QXbACozsXYHRZg914Gu6fsh/OTc+7aTkzricNPCJgg0mu
e20NMKfG/ZyJ6Ig+RblwnIoPlNNd2db5ITptPOCC/+dCn6xXtiGTykBYJmhkUZzx
vHMPnAmsRwIAhgHKEfvPok/0Fc2nKSy/S7npPro3IHtJDuZeXCEfvi2tLZaTF43C
1+E3eret4cT5wIhNCGO+YBs9naxwsPULWqz9ZXc+fvEH5B4o7SHtggFjzpMwoDNv
Hq85vKQ5ukyxP04WQT5mzCgixrOK13kKXB6t0NNJqlu4qxw2LQVh/lNZCl06oKI7
ecmmpdQBvTOuBPJvXKgcgnyQ6eh8R9kOlpbnA048IugStN5ggVT5iMZq98rBCszs
qxxKiA00ErnRh9QLjGxQ/qDapuvJ3Ga1gPIn14jV/7VDZAtsL2lk+JRSiU4Vd1wy
DJi+qRF177XgKLPRLaNaMj8pdNu7B00UksRE+0xwuxR2REgyt+eXYgcgOxIvUXXa
Zll2f17c0kfNUYZKLWgfhaliRSpYhxl1ABYYopeUY7rizdnVUXHjLGCTIhDRS7lt
i4MYHCcmpMIEnuh890LeCvg8ug2hy7CfP09CgNYNX+a5l22LRMs=
=B22e
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--


