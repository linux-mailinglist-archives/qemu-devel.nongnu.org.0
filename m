Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7D2E9A18
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 17:07:42 +0100 (CET)
Received: from localhost ([::1]:36944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwSOS-0006Oy-LP
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 11:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwSMa-0005xk-Bd
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwSMX-0007ec-O4
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609776341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FToyL89gW1ENSk439t03yC1Llax4Z7Uh1zupHhV5+tI=;
 b=OVstlAKJCyDM4gR/YrAYFoM5F1tgN4IMpMKGeNFwo5xIOPilnAeLWzjOGnqdcYlkKp2Diq
 zgKFzSfI8DHFzqu8b0Ta5zUpkn+cdLKPeLSECqxb8BJrtW9a97sK5n0gotLcwwOe+I7I1f
 +3QvZ+tke6TzS+M9osDZEnO3O3tr3mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-i63qn00HPfKBkQY9rXTQWg-1; Mon, 04 Jan 2021 11:05:37 -0500
X-MC-Unique: i63qn00HPfKBkQY9rXTQWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3A52801AC1;
 Mon,  4 Jan 2021 16:05:35 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1AEA61D31;
 Mon,  4 Jan 2021 16:05:31 +0000 (UTC)
Date: Mon, 4 Jan 2021 16:05:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/3] nvdimm: honor -object memory-backend-file,
 readonly=on option
Message-ID: <20210104160530.GE344891@stefanha-x1.localdomain>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-4-stefanha@redhat.com>
 <20201214121905.45bf4d13@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214121905.45bf4d13@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:19:05PM +0100, Igor Mammedov wrote:
> On Wed, 16 Sep 2020 10:51:50 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> > index e1574bc07c..848cd65917 100644
> > --- a/hw/mem/nvdimm.c
> > +++ b/hw/mem/nvdimm.c
> > @@ -146,6 +146,10 @@ static void nvdimm_prepare_memory_region(NVDIMMDev=
ice *nvdimm, Error **errp)
> >          return;
> >      }
> > =20
> > +    if (memory_region_is_rom(mr)) {
> > +        nvdimm->unarmed =3D true; /* this device is read-only */
> > +    }
> we probably should error out in case 'backend,readonly=3Dtrue + nvdimm,un=
armed=3Dfalse'
> instead of silently ignoring user's input

Will fix.

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/zPMoACgkQnKSrs4Gr
c8jEyQf/do2NvkdOSv3QxrR8zbr6LfXtJ1TL3dIg4pMqwpbigs+rULS5SzFWwEVo
KkYONVayz8o2NrL+jchhg/a+hxpFBoM//qIkWhdTRJSCng1zYKwvkgJUfbtPv675
gPg+bA/BSQ6bQI6kVGVUafL8JzZTrAMjotLIGCLY1xdubq/bLQppyhbYaAfU4M3d
eFYRNjrP2Ng5s4H5pw6oFoWoIGMA+xw2MBjdJ8i6MWk+bozSs5jpw5e0EI+wnK1a
64pTrRc9i5tJft3r7VzSyYt/A7naV8kinSG1WmAw2yQc/pGwKeafDfQkt+DxlqB+
pjlKEhEBuUVR7wrbNqgNgKSH5u31wQ==
=HYYi
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--


