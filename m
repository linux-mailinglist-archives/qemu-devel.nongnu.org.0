Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E4327D2A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:27:42 +0100 (CET)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgiD-0007lv-Cx
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGgf2-0006eh-Iy
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGgez-0006Oz-Hp
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614597860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+GgYK4ixDan5pmx5gm9c+eM//WfHQDV7uWEEMEL9mUY=;
 b=dqLobaIxPKNRA6p45eDlbXXmFbZiH4wugSNRZN9WedsgC5+AfTX9IxzTVaF94ewc8ZiqX6
 K216sDxBJXe1aBdpDmP9FRq0u6tSmH8YHg+kCf5wcRvZgOHp5xqn8TFBOQdtgURGs8QYZL
 gpjHwQFZw+RqmDFl/yXYJnIHqXpwcfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-EwFfX5wZM_-tm0NDY2Eptg-1; Mon, 01 Mar 2021 06:24:15 -0500
X-MC-Unique: EwFfX5wZM_-tm0NDY2Eptg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E62C107ACE8;
 Mon,  1 Mar 2021 11:24:14 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15FF5D9FC;
 Mon,  1 Mar 2021 11:24:12 +0000 (UTC)
Date: Mon, 1 Mar 2021 11:24:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
Message-ID: <YDzO23tOmZGNZxMt@stefanha-x1.localdomain>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
 <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
 <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
 <cd96210d-58bc-2978-02bc-b7ca794f7274@redhat.com>
 <08381101-fde1-dc5c-8156-32e90b21fee3@redhat.com>
 <a9cf5d49-f30c-0b21-4c76-de454e1c9583@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a9cf5d49-f30c-0b21-4c76-de454e1c9583@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bw8L+pDKk61UkxQD"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jag Raman <jag.raman@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bw8L+pDKk61UkxQD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 09:50:59AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 2/26/21 8:48 AM, Paolo Bonzini wrote:
> > On 26/02/21 00:16, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> I personally don=E2=80=99t have any preference for the name.
> >> Great.
> >>
> >> So with the summary/description updated as:
> >>
> >> summary_info +=3D {'Multiprocess QEMU (vfio-user device backends)':
> >> multiprocess_allowed}
> >>
> >> option('multiprocess', type: 'feature', value: 'auto',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'Multiprocess =
QEMU (vfio-user device backends)
> >> support')
> >>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9<philmd@redhat.com>
> >>
> >=20
> > It's not yet vfio-user.=C2=A0 For now I can put "out of process device
> > emulation";
>=20
> OK.
>=20
> > however, if the protocol is going to change, I wonder if it
> > should be disabled by default.
>=20
> Sounds safer indeed. We need to add --enable-multiprocess in CI to
> keep testing the feature.

Package maintainers tend to disable optional features explicitly, while
developers and CIs may not notice new features that are disabled by
default.

In the interest of preventing bitrot and catching failures early (before
CI!), I suggest leaving it enabled for maximum build coverage.

Stefan

--bw8L+pDKk61UkxQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA8ztsACgkQnKSrs4Gr
c8j0XAgAjvMJ/uiedh4wVD0t+DjNVZBWBLjINV87DkWeT/inpzCIIMO/axWmfs74
KyJQSyiI9V6Nk7nmsoKDr3eC1Wj3R5w3j049VHtmcPTQX0sGGWm4mk4BDli9Drfp
vFSZTv1bSednqJPOebO60XEZgKdwtuTiOROT1U9ZlOKjc+7RIJyAQ0ZNoZx0VPYR
iGkbW38WHg5FHp6nqFZpMdfHLgOhp7zgat2BHObXGXbXs+1LXjKBguxCMDaXbpkn
f9K6VjRY10BSJoRg8uuyrSk1qm6D23vSir4zgH5lA6ZsmLG0YdsbE8se+JZ5EI06
/jf6FoBH6VncmuguVfo6eAdpM+Mi/w==
=U33y
-----END PGP SIGNATURE-----

--bw8L+pDKk61UkxQD--


