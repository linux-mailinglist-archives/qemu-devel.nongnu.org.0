Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A616BD988
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 20:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pctZH-00073O-9i; Thu, 16 Mar 2023 15:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYy-0006xi-O7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYx-0008BA-25
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678996018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bdTdOJ6+s2GcSWJg3glgRqHLDbFvhpyQGCderohXZ7Y=;
 b=CQ+qbdEJZhMM+ReGBkOcIUBzngbJ7dOeVFc7vNKZRmJF6WkLYtU7lCX3l/lbWX8o4LRgCh
 OklSAioE+HHsrFViJLDjzC9WDV9CbdOutcj6bZR36Nfam4otLFJrWapDaIDDoSx+Eh1UL9
 RkuZzAlkdYkq3WAV79FPvMbCKq3XgMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-sl2LBpVNMXS-1l3sltPdWw-1; Thu, 16 Mar 2023 15:46:52 -0400
X-MC-Unique: sl2LBpVNMXS-1l3sltPdWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2179C884EC3;
 Thu, 16 Mar 2023 19:46:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92E5D2166B26;
 Thu, 16 Mar 2023 19:46:51 +0000 (UTC)
Date: Thu, 16 Mar 2023 15:24:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com,
 Hanna Reitz <hreitz@redhat.com>, hare@suse.de,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com,
 Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v7 0/4] Add zoned storage emulation to virtio-blk driver
Message-ID: <20230316192423.GG63600@fedora>
References: <20230310105431.64271-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g/veVqzWPfdd0/XF"
Content-Disposition: inline
In-Reply-To: <20230310105431.64271-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--g/veVqzWPfdd0/XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:54:27PM +0800, Sam Li wrote:
> This patch adds zoned storage emulation to the virtio-blk driver.
>=20
> The patch implements the virtio-blk ZBD support standardization that is
> recently accepted by virtio-spec. The link to related commit is at
>=20
> https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad=
15db65af8d7d981
>=20
> The Linux zoned device code that implemented by Dmitry Fomichev has been
> released at the latest Linux version v6.3-rc1.
>=20
> Aside: adding zoned=3Don alike options to virtio-blk device will be
> considered as following-ups in future.
>=20
> v6:
> - update headers to v6.3-rc1

Hi Sam,
I had some minor comments but overall this looks good. Looking forward
to merging it soon!

Thanks,
Stefan

--g/veVqzWPfdd0/XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQTbOcACgkQnKSrs4Gr
c8iN3gf/cTsBjYPDxFs2/VXzgYz1TXBEUx7BWJNxiaoZHbU04tw6KYTM2O6qNPql
kZF3eyAsin3lrIx7JpcPzyKOPycw2G+5aCdGcpGz5dtGPI4ux5j7dB2dixF++XDL
y85GkodKuGraq6Iv1aEkUZk+ibF19/V/OI/YKcBnydhSYwOo8lW1qDsUA8hdSr6V
cDG+gPS6wxyrgLZQW1/bBKzr0Kwq+VFvDFEmT/qvgKQwmjiG+sv71Xz2NX2nqNJj
SMgXCIHAZZo4HAwxBQf/lj30GiqodJHdXt82m8uCeKzG/+zKzH2fS/LorsQtS4do
xtYAPuhVMZFPVxb8TkI4Z6kLrDZARw==
=K3sE
-----END PGP SIGNATURE-----

--g/veVqzWPfdd0/XF--


