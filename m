Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483FB477689
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:02:28 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtD8-0002UB-QC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtBw-0001eK-TA
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtBk-0006aw-VH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639670456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYN/fGYIFjI6DXrqezNyW1kT72qRXTYn34QqmmS0K+E=;
 b=TeXb5Xq5W6qFcssZCqmeeBDcYysj5C6zLPv8kEbwP6ML+Ze7OC36zhBJbXSfkKvULQz5L4
 rk9k/mlmMV0+0jp5trQhRGDiHt/lcdZZukVweb990biqanzeFnaayJpVXMR53glomq4Suj
 LawjDxdtLKRGBh+3IcWjbUjVT9VlKy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-9JgzHohKNKOsA0Hi6Qa3Hg-1; Thu, 16 Dec 2021 11:00:53 -0500
X-MC-Unique: 9JgzHohKNKOsA0Hi6Qa3Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BCE810168C4;
 Thu, 16 Dec 2021 16:00:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC41E1037F39;
 Thu, 16 Dec 2021 16:00:49 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:00:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <levon@movementarian.org>
Subject: Re: [PATCH v4 08/14] vfio-user: handle PCI config space accesses
Message-ID: <YbtisP2PhjX3NGZ1@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <34e287d0a8d585f104bdd06681b32fc93e8746c7.1639549843.git.jag.raman@oracle.com>
 <YbsjTPnOiAkNKmhb@stefanha-x1.localdomain>
 <YbsnXH+wDJk0SgvT@movementarian.org>
MIME-Version: 1.0
In-Reply-To: <YbsnXH+wDJk0SgvT@movementarian.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oxVdWTgP7U2Tojz6"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, bleal@redhat.com,
 swapnil.ingle@nutanix.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 wainersm@redhat.com, alex.williamson@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, thanos.makatos@nutanix.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oxVdWTgP7U2Tojz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 11:47:40AM +0000, John Levon wrote:
> On Thu, Dec 16, 2021 at 11:30:20AM +0000, Stefan Hajnoczi wrote:
>=20
> > > +    ret =3D vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
> > > +                           pci_config_size(o->pci_dev), &vfu_object_=
cfg_access,
> > > +                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWA=
YS_CB,
> > > +                           NULL, 0, -1, 0);
> >=20
> > Thanos or John: QEMU's pci_host_config_read/write_common() works with
> > host-endian values. I don't know which endianness libvfio-user's region
> > callbacks expect. Does this patch look endian-safe to you (e.g. will it
> > work on a big-endian host)?
>=20
> https://github.com/nutanix/libvfio-user/issues/615

Thanks!

Stefan

--oxVdWTgP7U2Tojz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7YrAACgkQnKSrs4Gr
c8im7Qf/T0d8LyszfIbHOYVXfVEGkEQFGX5qAMrnJqj+uMKB4q1JSs8hyAoZFKjU
PauS1P0MTVDDbrdgF8BmiR1A/Lop6spLtj66HMMTQEdQE79NA0YrRrqOqtW2Hq/S
PLX+HFwYfPIWWrxhMUe/qmU1KeQm82JMzckhK1BkfX/Wq6/OPKfd7Utcd8cyoUtQ
mG+9iXQOPXHZlEiU+RG+03JTHB3iq282UlNLqT/58LVVVaZEvcilcHRzySVc6RRA
ALJeKGbNomMnqyERrnKk4c8L2eGw6O0sih6ex4491invUZjQrTWF5PUrXphxdPmo
cvp928hkAd1ZiX1bfbEs9WZT8pOdsg==
=psfO
-----END PGP SIGNATURE-----

--oxVdWTgP7U2Tojz6--


