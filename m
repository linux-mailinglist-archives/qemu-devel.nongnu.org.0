Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316B4CBAA2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:48:46 +0100 (CET)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPi4d-0004ro-9X
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPi1C-0002re-22
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPi17-0005Gs-Jr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646300700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLR7FIVPSrpsftBawiMhIAD/dDls0xOqPd3OqR5iq4U=;
 b=dcWRcVXWAKwgpTBj5THpeLTwJNwjNvD6EFoPH/fMjClMLGp/0yNOgZAh2Gu/x573scV8lL
 pOJ/3NyDuoJ5xRJU8SSXyRsbO59v7PybeawAtyTdzcw04X2gsQ2qfeL55G+ovRbcztqZYP
 RyERSA3qjbfROXX/+SVHnA0udkSwWwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Awc9O7BuNuWVzn63dnBHig-1; Thu, 03 Mar 2022 04:44:57 -0500
X-MC-Unique: Awc9O7BuNuWVzn63dnBHig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46EB880EDA3;
 Thu,  3 Mar 2022 09:44:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 297A56E1A6;
 Thu,  3 Mar 2022 09:44:12 +0000 (UTC)
Date: Thu, 3 Mar 2022 09:44:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v2 0/3] Enable vhost-user to be used on BSD systems
Message-ID: <YiCN67eJqf/5zyZw@stefanha-x1.localdomain>
References: <20220302180318.28893-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5MAEvHPCnDQHB7UG"
Content-Disposition: inline
In-Reply-To: <20220302180318.28893-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5MAEvHPCnDQHB7UG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 07:03:15PM +0100, Sergio Lopez wrote:
> Since QEMU is already able to emulate ioeventfd using pipefd, we're alrea=
dy
> pretty close to supporting vhost-user on non-Linux systems.
>=20
> This two patches bridge the gap by:
>=20
> 1. Adding a new event_notifier_get_wfd() to return wfd on the places where
>    the peer is expected to write to the notifier.
>=20
> 2. Modifying the build system to it allows enabling vhost-user on BSD.

Please update the vhost-user protocol specification. It mentions eventfd
and there needs to be a note explaining how pipes are used instead on
non-Linux platforms.

Stefan

--5MAEvHPCnDQHB7UG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIgjesACgkQnKSrs4Gr
c8hJFQf41zixo62gwAD9UcnFVO/2tddUO56dhlF+DONIXVi8O8z09ZeNLu5fwhXV
2uVTQuXttFj0eBHDuaYgt7aIkxXmUfzUMJt9DMwKOsGQk4MzxOCw3hnLJX8V66id
2c4TzYG3HXkb6t+s1vHS2SpUB+9S7GPxSY9WvUVym+HPqu0M3ygYse1UiLvx/qMj
O0p/UYdKxLu8B577FCVf7EQA3AfAyozrniQpVMM6weZe5OFWdknnuLKpF8ickphf
Z4pmdqD1ysIbTkSGqlUXBvNqnbIbbKdn01LvXOfb7kQbk5oe/SCvE7A4CcDuLq64
QrjSC3hQOf3qdDgRMxfuXggnZvcI
=LQYc
-----END PGP SIGNATURE-----

--5MAEvHPCnDQHB7UG--


