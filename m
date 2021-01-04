Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F056D2E991A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:46:38 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwS45-0005f0-IF
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwS1m-0005EO-TY
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwS1l-0008RL-3j
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609775052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LHDzQp8uW6jsEoorVRzEk0WNPPWUmKb3b69ncDdja6c=;
 b=H18id1G80hza+9vSqIxrU1Cf5eKWThLwmToK+Eg16GGYXD/0wfxR+UBzs60YT6uVbezinP
 XhkjNRWdvVXOwQDsTQO1nOA3M5ImApq9HBqCKQ6/Y0uQ9adh5e5QGktVkPbdIGtg4n6kZs
 reQDpzW+2wsq9iecv+lihSvzevvrBnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-TXGN1XZIMHm_VuAcksAmeQ-1; Mon, 04 Jan 2021 10:44:08 -0500
X-MC-Unique: TXGN1XZIMHm_VuAcksAmeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700C110054FF;
 Mon,  4 Jan 2021 15:44:07 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FDD81001281;
 Mon,  4 Jan 2021 15:43:57 +0000 (UTC)
Date: Mon, 4 Jan 2021 15:43:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [PATCH v2 0/3] nvdimm: read-only file support
Message-ID: <20210104154356.GD344891@stefanha-x1.localdomain>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <fe1dca5a-a373-7634-7e11-5dee6019036e@oracle.com>
MIME-Version: 1.0
In-Reply-To: <fe1dca5a-a373-7634-7e11-5dee6019036e@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 04:48:57PM +0000, Liam Merwick wrote:
> On 16/09/2020 10:51, Stefan Hajnoczi wrote:
> > v2:
> >   * s/the the/the/ in documentation [Philippe]
> >   * Assign nvdimm->unarmed earlier [Philippe]
> >=20
> > There is currently no way to back an NVDIMM with a read-only file so it=
 can be
> > safely shared between untrusted guests.
> >=20
> > Introduce an -object memory-backend-file,readonly=3Don|off option.
> >=20
> > Julio Montes sent an earlier patch here:
> > https://patchew.org/QEMU/20190708211936.8037-1-julio.montes@intel.com/
> >=20
> > Eric Ernst requested this feature again for Kata Containers so I gave i=
t a try.
> >=20
> > Stefan Hajnoczi (3):
> >    memory: add readonly support to memory_region_init_ram_from_file()
> >    hostmem-file: add readonly=3Don|off option
> >    nvdimm: honor -object memory-backend-file,readonly=3Don option
> >=20
>=20
>=20
> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
> Tested-by: Liam Merwick <liam.merwick@oracle.com>
>=20
> (I just quickly modified kata-runtime to unconditionally pass readonly=3D=
on
> and verified that the root filesystem couldn't be remounted as rw)
>=20
> Is this a candidate for 6.0?

Thanks! Yes, this is for 6.0.

Stefan

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/zN7wACgkQnKSrs4Gr
c8i+vAgAv3OTjSR/fH8lEMo3dhrjiEaSzl7/JwxkJDaulmfUCNGGyMK5nk1EmrJD
QgOzje9PN3XO/qU3KJ8+QrrqWs+1cRq+UgQHVC2HBF+LBkuUG0ha0bpYfu5JnVKO
pU1ut/hv7l7rZ55jtn+1Mu95wRiFrInk48ZNwOooHMuXi6x8zz7Yk9h6kOlYMKFT
p83VgNFt/8UwWZAlnKI8zwq4hpItC9d/PeANa+inXNDiA1Wpqrc6+RBxOSGjZd4C
Mi/SunAwZWujGpJatSJWaPkIDSJ0TGoJdDKHXUR5yWnv91MuX3sEMH0Qghn3KUV5
s7pxhwSKvfXDx1U4mpC85IfnC6Hx6g==
=osuy
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--


