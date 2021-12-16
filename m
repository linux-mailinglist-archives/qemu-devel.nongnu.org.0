Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCF476F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:42:27 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoDS-0003Gd-7w
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxoBS-0001Uy-63
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxoBQ-0007RM-Hp
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDIbsBWxUZ0fDFL8PK8x+JACEfbMW44cd2rHyBl/su0=;
 b=THUsxlOpXcUehGk/chb3xxFXFJ/FoJvz9yjd3ENKX8+s6VfUewc88lfnOVqIBA5mwVD8Mu
 UNARSxtMcXJgD4iWebgsXYY5Jv3tAPSNX+UTuD18m4V8IXAnYRYvHULHQkOfatCY0XHLd8
 yKQ0N6BM01Y+gAQnxC9+I1LPShgZ6zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-cKsqvVN5Mu-QZD59Rmd02w-1; Thu, 16 Dec 2021 05:40:18 -0500
X-MC-Unique: cKsqvVN5Mu-QZD59Rmd02w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4244981EE6E;
 Thu, 16 Dec 2021 10:40:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D66D92A79;
 Thu, 16 Dec 2021 10:39:49 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:39:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 06/14] vfio-user: find and init PCI device
Message-ID: <YbsXdCYdXSm1UuHX@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <06d8cd0be786fb6786d42c9251b37094bff813a0.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <06d8cd0be786fb6786d42c9251b37094bff813a0.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pv4UzKLvQ8B9bGLD"
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
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pv4UzKLvQ8B9bGLD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:30AM -0500, Jagannathan Raman wrote:
> @@ -150,6 +157,38 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
> +    o->pci_dev =3D PCI_DEVICE(dev);
...
> @@ -190,6 +229,8 @@ static void vfu_object_finalize(Object *obj)
> =20
>      o->device =3D NULL;
> =20
> +    o->pci_dev =3D NULL;

We need to consider how this interacts with device_del hot unplug.
o->pci_dev is a pointer and we don't hold a refcount, so I think
o->pci_dev could disappear at any moment.

A pair of object_ref/unref(OBJECT(o->pci_dev)) calls would not be enough
because device_del will still unrealize the device that's in use by the
vfio-user server.

I suggest adding a check to qdev_unplug() that prevents unplug when the
device is in use by the vfio-user server. That's similar to the code in
that function for preventing unplug during migration.

One way to do that is by adding a new API:

  /*
   * Register an Error that is raised when unplug is attempted on a
   * device. If another blocker has already been registered then that
   * Error may be raised during unplug instead.
   *
   * qdev_del_unplug_blocker() must be called to remove this blocker.
   */
  void qdev_add_unplug_blocker(DeviceState *dev, Error *blocker);

  /*
   * Deregister an Error that was previously registered with
   * qdev_add_unplug_blocker().
   */
  void qdev_del_unplug_blocker(DeviceState *dev, Error *blocker);

The vfio-user server then needs to add an Error *unplug_blocker field to
VfuObject and call qdev_add/del_unplug_blocker() on the PCI device.

From a user perspective this means that device_del fails with "Device
currently in use by vfio-user server '%s'".

Stefan

--pv4UzKLvQ8B9bGLD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7F3QACgkQnKSrs4Gr
c8ib1ggAizahO+7IQJleLiIYv9TS8Da2jAoe7juHHi7Um0i5Q221GV49tflN3Ix2
fVPfsoDsCXleMKE7amRctXU2PI5VONcyXAZQ8cc04plFzCTChF78C5d1ML15bCga
tRRBkNHCIhixzoKSS9o+Nc/WUNs7PM/cGlPBJ5RDy9lgmwtMvfTyB7Hksji+VLfG
eXDi1siNiNc7pzY9+FMiy3dQcUUwBuCCpc80PE6UhYVvq3d4N8q0xJiWBoFFA1YI
GzBeczpLFJB3jiaux9BxLNtN92PGUC4+NPdDEUb5LQuyzIBiXTaKKtRiaj4lexgf
i8dDmPF0cTJgmhyACC5+ddnmX3gIQA==
=VWWH
-----END PGP SIGNATURE-----

--pv4UzKLvQ8B9bGLD--


