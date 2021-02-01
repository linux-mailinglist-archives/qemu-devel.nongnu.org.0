Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79AD30A620
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:06:12 +0100 (CET)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6X23-0005xZ-Mg
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6Wxv-0003YK-64
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6Wxp-0004Lw-ER
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612177303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IF7/GH0/OfspoQbBJx7s2i8nIDsZ2ah34lJegyBpa4=;
 b=E8SZig7oMSlbxyjesPjrxdfPL1JxOcnGVgXSCr1yfnHPE+ZkrnMYCcwsd7Ul9DaOpo6DYg
 Lv7yScoZNToRx6zULAX4ZDUSSrVy7APKXZG5t4XfL3sb0d1TKO7QaRcoQVuzCbhFwPUq6M
 BM7kvonTs5eL+anamLGTqPwJXZAaAXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-fnB4jnKMOMaB73u54S5xsA-1; Mon, 01 Feb 2021 06:01:40 -0500
X-MC-Unique: fnB4jnKMOMaB73u54S5xsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CE3801B14;
 Mon,  1 Feb 2021 11:01:38 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B8E72167;
 Mon,  1 Feb 2021 11:01:32 +0000 (UTC)
Date: Mon, 1 Feb 2021 11:01:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: lagarcia@br.ibm.com
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Message-ID: <20210201110131.GC159493@stefanha-x1.localdomain>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
 <3c777954-b3c8-b4a9-2713-83245521f82e@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <3c777954-b3c8-b4a9-2713-83245521f82e@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:41:15PM -0300, Leonardo Augusto Guimar=E3es Garc=
ia wrote:
> On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
> > On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
> > +
> > +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> > +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFOR=
M))) {
> > +       error_setg(errp, "IOMMU is not supported by the vhost-user devi=
ce backend");
> > +       goto err_iommu_needed;
> > +   }
> >=20
> > Also, can this logic be made generic for all vhost-user devices? It's
> > not really specific to vhost-user-fs.
>=20
>=20
> I am afraid I will need some additional guidance on how to do that. If I =
am
> reading the code correctly, the vhost-user devices don't follow any speci=
fic
> pattern. Looking at the vhost-user-fs code path, we have:
>=20
> vuf_device_realize -> vhost_dev_init -> vhost_user_backend_init
>=20
> So, I thought that naturally, if the check was in vuf_device_realize on m=
y
> previous patch, I should move it to vhost_user_backend_init. However, in
> order to check if the VirtIODevice has been specified with the
> VIRTIO_F_IOMMU_PLATFORM option, I would need to have access to the
> VirtIODevice inside vhost_user_backend_init, which currently is not
> available and not one of the arguments of vhost_backend_init virtual
> function it implements. vhost_dev_init doesn't have access to VirIODevice=
s
> as well. Looking at other device types that call vhost_dev_init, not all =
of
> them initialized the VirtIODevice by the time vhost_dev_init is called (e=
.g.
> cryptodev-host). Hence, adding a VirtIODevice as parameter to vhost_dev_i=
nit
> and vhost_backedn_init is not a feasible solution. vhost_dev_init does
> receive structu vhost_dev which has a field VirtIODevice vdev. But as the
> VirtIODevice hasn't been initialized by the time vhost_dev_init is called=
 on
> all vhost-user devices today also makes this not a solution.
>=20
> Any ideas on this? Is it correct for a virtio-user devices to call
> vhost_dev_init before having VirtIODevice ready?

Maybe Michael Tsirkin has an idea. Otherwise let's go with a
vhost-user-fs fix.

Stefan

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAX34sACgkQnKSrs4Gr
c8jhIggAvMxES78XDXBF7rWFwywlALT0D/SEYqojRoBsYAbBS1UIRw6hKwt1mIvE
kg3z96NOPK3NX2U6ONRqsOjGBokEVzBFoAf2n/aDoIOsAstgC3Fvd0hZmzJPIuXf
fxe2G4MYoY/4QNMkZk70tn11k8BXBeO5iLqANR9gJxi7fAbI1txv8Wd+nx24AnQ8
pHO2NRXW3mvbT69xOLtDGKtD+wBUk7PmTm+b+1Gv9vEuB4/Sd5V1xi2+USbb8yLO
WqR1F0jxIzwN0w0BJKSq8FUi7jAsAPmcrNhUR1w7TDOojzm5OnXOo1WpH3TGOJua
2OP9nbNMFM7lkStDAgh9onWMj5ZcMA==
=0D8O
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--


