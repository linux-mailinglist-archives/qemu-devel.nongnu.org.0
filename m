Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C632D886
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:24:37 +0100 (CET)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHriG-0002ig-Dn
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHrhC-0002GI-JY
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHrh8-0004f7-JM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614878604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKTS01T7IGVOlS5bEae77wFej2ma5mPKqJrMpoFQp1s=;
 b=WrpS7Eqf5teXua534nTDle1CgfSajEwWKPyYXW41C9kxnR2cmjZwAAHbUwBHq7D4t6nYGf
 su1Vi8cR2rfrrsbwiEweGSkiWh3j0JR7K4cWQ9Ln7VCNyH+axylxZh3b5hxmZVwU6+vWM2
 wDJVcwp5nZvSDfNivN8iSI8AzTqXPcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-1GAy0MEnPzCjOsSzZD4zlA-1; Thu, 04 Mar 2021 12:23:22 -0500
X-MC-Unique: 1GAy0MEnPzCjOsSzZD4zlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8EE57;
 Thu,  4 Mar 2021 17:23:21 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA54139A70;
 Thu,  4 Mar 2021 17:23:17 +0000 (UTC)
Date: Thu, 4 Mar 2021 17:23:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Message-ID: <YEEXhBClR6GRLDu6@stefanha-x1.localdomain>
References: <20210303145011.14547-1-alex.bennee@linaro.org>
 <20210303165554-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210303165554-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ttxplPPTaMgzWM3o"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jiang Liu <gerry@linux.alibaba.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ttxplPPTaMgzWM3o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 05:01:05PM -0500, Michael S. Tsirkin wrote:
> On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Benn=E9e wrote:
> Also, are we sure it's ok to send the messages and then send
> VHOST_USER_SET_FEATURES with VHOST_USER_F_PROTOCOL_FEATURES clear?
> Looks more like a violation to me ...

Looking again I agree it would be a violation to omit
VHOST_USER_F_PROTOCOL_FEATURES in VHOST_USER_SET_FEATURES.

Previously I only looked at VHOST_USER_SET_PROTOCOL_FEATURES where the
spec says:

  Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present i=
n
  ``VHOST_USER_GET_FEATURES``.

So negotiation is *not* necessary for sending
VHOST_USER_SET_PROTOCOL_FEATURES.

However, I missed that other features *do* require negotiation of
VHOST_USER_F_PROTOCOL_FEATURES according to the spec. For example:

  If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
  ring is initialized in an enabled state.

Now I think:

1. VHOST_USER_F_PROTOCOL_FEATURES *must* be included
   VHOST_USER_SET_FEATURES if the master supports it.

2. VHOST_USER_SET_PROTOCOL_FEATURES does not require negotiation,
   instead the master just needs to check that
   VHOST_USER_F_PROTOCOL_FEATURES is included in the
   VHOST_USER_GET_FEATURES reply. It's an exception.

Stefan

--ttxplPPTaMgzWM3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBBF4QACgkQnKSrs4Gr
c8gLiAf+PyPbgr/EFXtuh84TjLmXYqmHrJHX3Tyk8G/6qX7pmAEMAdGod9rjslUa
OHWHK2QgsfsO88V+/MypCR8BkJjWlza0a/0xOeo+r6ggHxBNbN3H1OswGRQB13dl
Y8aVJ5R8HYCR3hism1ptT8+yVMW5y2MKzoi5LQtR3QzDF8DeywzAiftSWSpMPvF2
FCHvIk7ZnKp3PATPMevZoG+1I/dRxBGOgAn6WAlfWWRPnKw092Ky5IRGYSDZJyFy
0isNGx8ttpMv7tADXi27t5+xCLd2fNP3V2KbHWzJKt5ukKm8pVce8QgbXP6KDpPk
UyzV0y0MurxQtoqq3WJ6Q9Un/XbIwQ==
=6w/N
-----END PGP SIGNATURE-----

--ttxplPPTaMgzWM3o--


