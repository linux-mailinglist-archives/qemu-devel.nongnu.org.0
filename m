Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B84CA907
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:25:52 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQrO-0002JC-Sr
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPQq0-0001Ry-TQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPQpz-0003mM-Dr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646234662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z6lfQ+/8B9B8XXN0ZdlMjhPgwhvJKUM8Y2F/+Ltg6o4=;
 b=ewoy+wID8j7rtQIVnl1g5+msqTJjA2QagkBs4mX5hOFnL8cwfesnNfLNIdL4CjfZm70PZW
 6oGpREJbBNKZWjdMUhlAnXTuUISyXv6P/AB3YjfUTlVbDdME38OuCDbQvbeq1mU2LtlsKd
 0Bs+Lr5Ct903a/TsZ5GjAxhLp5BO4bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-c2TNa6KhOqWVA4ExXpU9SA-1; Wed, 02 Mar 2022 10:24:19 -0500
X-MC-Unique: c2TNa6KhOqWVA4ExXpU9SA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD93683DBC7;
 Wed,  2 Mar 2022 15:24:17 +0000 (UTC)
Received: from localhost (unknown [10.33.36.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DABF7DE56;
 Wed,  2 Mar 2022 15:23:22 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:23:42 +0100
From: Sergio Lopez <slp@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 1/2] Allow returning EventNotifier's wfd
Message-ID: <20220302152342.3hlzw3ih2agqqu6c@mhamilton>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-2-slp@redhat.com>
 <20220302081234.2378ef33.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hojutzklhzfoy7i3"
Content-Disposition: inline
In-Reply-To: <20220302081234.2378ef33.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hojutzklhzfoy7i3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 08:12:34AM -0700, Alex Williamson wrote:
> On Wed,  2 Mar 2022 12:36:43 +0100
> Sergio Lopez <slp@redhat.com> wrote:
>=20
> > event_notifier_get_fd(const EventNotifier *e) always returns
> > EventNotifier's read file descriptor (rfd). This is not a problem when
> > the EventNotifier is backed by a an eventfd, as a single file
> > descriptor is used both for reading and triggering events (rfd =3D=3D
> > wfd).
> >=20
> > But, when EventNotifier is backed by a pipefd, we have two file
> > descriptors, one that can only be used for reads (rfd), and the other
> > only for writes (wfd).
> >=20
> > There's, at least, one known situation in which we need to obtain wfd
> > instead of rfd, which is when setting up the file that's going to be
> > sent to the peer in vhost's SET_VRING_CALL.
> >=20
> > Extend event_notifier_get_fd() to receive an argument which indicates
> > whether the caller wants to obtain rfd (false) or wfd (true).
>=20
> There are about 50 places where we add the false arg here and 1 where
> we use true.  Seems it would save a lot of churn to hide this
> internally, event_notifier_get_fd() returns an rfd, a new
> event_notifier_get_wfd() returns the wfd.  Thanks,

I agree. In fact, that's what I implemented in the first place. I
changed to this version in which event_notifier_get_fd() is extended
because it feels more "correct". But yes, the pragmatic option would
be adding a new event_notifier_get_wfd().

I'll wait for more reviews, and unless someone voices against it, I'll
respin the patches with that strategy (I already have it around here).

Thanks,
Sergio.

--hojutzklhzfoy7i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmIfi/0ACgkQ9GknjS8M
AjW30g/5AVF1V3bVZd+v78w4CUyPhe4tKgcG/N+U8UoR2Scy9eN7EmLRlIZSIoJY
/3D+MEgFFqvYKw8v6QqdjoXfXVaDsSx3o3nCjiaNojxeDGdnBi/2cTXizKFJbPAQ
59xJEtCECjonYzCX1nooCUO732GJcZTU05BDUMwMQpAseioDiR9wj/G27usLFFPb
9UyhYLtE/njCUAob7nr8wQCr3iqHuDMHw9r/dfjAKde2oPGFQjiGUVRj8cbtbrcI
ru1fF7vP52YZnPVXr+b8lKDurQ6wH2BRllxg42DvUI0qh2obkwIZeSB6Bj/4Vya5
b51W5fwKRYX1GPvQ/aGA5qHZPYe3vft/CvAan6QWDDVkbGxZE4IOHZWWUgfoReO+
5kKrdNkU3BkSeVBWvNBlmQxtIDY5VNKX3Up98FGlu0GduiRol5vaaLKULoI5tZHd
jgSJmMyL8kj2aoGSR/GBd4A6H6ePSD+TvJSqORQrWKAE6pPYngU7dHZGvnkxCnrm
4thiBI9xArEi98Cf6gwwsEjQ4OxiCjSZVKMbXRvm2FY9a7HnCCLr3EVV4DXNPwbE
fSKCM7G3O+spIToJTAfq7pUrSO46EBq75WbYWhC7V4h8vSaZNeAvEzk3JU/2P/yn
pzSGfA66Vi7F4VoQRekREHuNs3fp/Zm3aPnywISy4icF3Z0+X9Q=
=Yb7b
-----END PGP SIGNATURE-----

--hojutzklhzfoy7i3--


