Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17933A192B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:20:13 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr004-0007fx-Ma
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzuU-0006k7-Bw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqzuS-0006N0-6m
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623251663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PqrCG4/pqbgIM4copmkDS7DRjSWJcx/JL3WsfTZTda0=;
 b=S3YJjGcDGMXQT7ijq7lEEMPUU4UwbC1XcC5hdlc4VY8cTekgzi3h98oUwyWmNzwm7rK7p6
 RQM5Ta3nsUn+/b29vEmt3L3RnnyrZmCLs2ie+zTA0nG4O7hcgccDIgeXO7uN/6qW/1tiYx
 n19x32C9+S2veLTN83DTv8I9lkjwLu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-_dEqB3S6MUmVZmehpjFewg-1; Wed, 09 Jun 2021 11:14:21 -0400
X-MC-Unique: _dEqB3S6MUmVZmehpjFewg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC698CC624
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:14:20 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E39260CCC;
 Wed,  9 Jun 2021 15:14:13 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:14:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/13] [RfC] fix tracing for modules
Message-ID: <YMDaxBVivnksvA/7@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gZvYidkC2UCyS1QT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gZvYidkC2UCyS1QT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:01PM +0200, Gerd Hoffmann wrote:
> First version that actually works.  Only qxl covered for this RfC,
> other modules will follow once the basics are hashed out.
>=20
> v4:
>  - rebase to latest master.
>  - fix systemtap tracing.
>  - also cover virtio-gpu modules.
>  - pick up some review tags.
>  - misc minor tweaks.
>=20
> v3:
>  - handle initialization of modular tracepoints.
>=20
> TODO:
> Enabling modular tracepoints via -trace cmd line doesn't work yet.
> Guess we need to store the list somewhere for later re-processing.
> Error handling is tricky, specifically the "tracepoint doesn't exist"
> error.  Suggestions / ideas are welcome.

Excellent! I think we discussed these TODOs in the past. Can we merge
this series in close to its current form or does it degrade the tracing
experience (e.g. does the -trace command-line no longer work for
trace-events files that were split off into modules)?

Stefan

--gZvYidkC2UCyS1QT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDA2sQACgkQnKSrs4Gr
c8hplQf+NyOUWn45aIsJF/imqZAY03pOLUeIbE8+DYEQzOXZHO+bMvCxQP06mvw0
7x4MLQytYLfzmLFeksgGDukJf5FcYQQZmWd4orQjd3upYdvRxDBbUmpvZVpXVmVj
HT0VGBdy2AaQCU0PAe6zgtUfTMygSLosOhUKy5yVUL6Z1bu6xtWCuVMucO47I42M
tROt01ZwKLb91g6g5TMRuTZQPvaKwmrJmbtEJ09KldK2TihknjhrTXZ+/n94yEb0
i58AcM7l0w8B3heRaSvNepCH/keLQ34TmGeljFfSjA8jAcWpE4xgzrKNDxUKilN6
7+mmiU3XPT7beM6zEyQd7QV6S+Hlag==
=XnFl
-----END PGP SIGNATURE-----

--gZvYidkC2UCyS1QT--


