Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B929C2AD23B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:19:39 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPoQ-00015f-Qk
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcPmR-0000PD-Mz
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcPmP-00062O-Tj
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604999852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EzQuHCleqv5nHVOSQ1P4HRxI7FX0ZIzuNxdyuHBZtRw=;
 b=T2vaSpK6y4zRaJwCSV7Gx5eVZtAVYG/Hpj3FPhbJkwhJ4ogu7hZPWgx5SIuSRu2B4baKw8
 1PSitLXgvpVJL0Ar9S7YjIoSm3gHoYW5pkob2bWAiSaSLt7dUfrI+NUcByfcD3aSCBPVP9
 W88C2EyzFcW4S/3Wq0SUdVf3A45NV44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-oYZtQt8EPNypOZrH8Pyv3g-1; Tue, 10 Nov 2020 04:17:28 -0500
X-MC-Unique: oYZtQt8EPNypOZrH8Pyv3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8785A11CC7E2;
 Tue, 10 Nov 2020 09:17:27 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C31D05B4B6;
 Tue, 10 Nov 2020 09:17:23 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:17:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-5.2] vhost-user: fix VHOST_USER_ADD/REM_MEM_REG
 truncation
Message-ID: <20201110091722.GA1080921@stefanha-x1.localdomain>
References: <20201109174355.1069147-1-stefanha@redhat.com>
 <20201109185900.509417bf.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201109185900.509417bf.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-stable@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 06:59:00PM +0100, Cornelia Huck wrote:
> On Mon,  9 Nov 2020 17:43:55 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Fixes: f1aeb14b0809e313c74244d838645ed25e85ea63 ("Transmit vhost-user m=
emory regions individually")
>=20
> I think the canonical format is
>=20
> Fixes: f1aeb14b0809 ("Transmit vhost-user memory regions individually")

According to https://wiki.qemu.org/Contribute/SubmitAPatch:
"Fixes: <at-least-12-digits-of-SHA-commit-id> ("Fixed commit subject")"

> Maybe cc:stable as well?

Good point, this issue started in QEMU 5.1.

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qWqIACgkQnKSrs4Gr
c8jGXwf/VtcHAJ04Dj1odKwzhH1Pqgc7+5+6aZi1z4UsxNG1fjyKjxxLZcdL1y0e
2zvwUZq3zR2Idv+9IWS6UXduS/Ua0UJXSt175PNVvpg6OD80y2yjs9GcD2wz7o5k
bSgolFxoQs8AoJQxMijhJETj/C77CxfECW1inpLuYdnbgzzxbjZPzyBvo/CUEUCU
r2ZCn7M95mJYEH+tLoODybNAlTevmzJwtMYk8e4+3jKqBBHyPRS/qDMlFCdhdqF9
y9NFkRuuGj/IwZmuQrHhZ1CAVaTbH7Y/PeazAyXDcPRfAYid8Sw70WQ8mRKHSOKG
mhIsBw5KPBB0/DaBwwdDUJU3XoJpdA==
=eyv5
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--


