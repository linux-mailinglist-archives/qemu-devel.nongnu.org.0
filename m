Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09692F62AF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:07:18 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03HR-0000L0-TG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l03Co-0004M5-87
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:02:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l03Ck-0008DQ-K3
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mh9BoYbbrCm35XUjKIF1I/6ZWLIuBZIiqbEVDre1N0w=;
 b=HyIrXlLITc0i5C4M6sTa2/UwzBq7cQH79sU2RFmLhOTHS6uJR1lQcRepWq0hdQyhQkaN6X
 FT8EiTcT0oqSlAefeAF6wf50UDqul3/rBJg92UroLQ5Rs7M7SaiDz8k39qFXk8IWigcLtj
 OGhDKt4uPCuvmzEDjt1XnF5ZL7Kj8NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-MfZVtegwMP-u3LmQ0aEdAg-1; Thu, 14 Jan 2021 09:02:22 -0500
X-MC-Unique: MfZVtegwMP-u3LmQ0aEdAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78B0E107ACF7;
 Thu, 14 Jan 2021 14:02:20 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D97961D2E;
 Thu, 14 Jan 2021 14:02:18 +0000 (UTC)
Date: Thu, 14 Jan 2021 14:02:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210114140217.GD292902@stefanha-x1.localdomain>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 07:20:42PM -0500, John Snow wrote:
> On 1/13/21 6:45 PM, BALATON Zoltan wrote:
> >=20
> > Please don't. That would break all scripts that already call qemu using
> > single dash options. Forcing everyone to edit their scripts is not nice=
.
> > How about also accepting single dash in qemu-img for consistency then
> > you can use whatever you want in docs as long as single dash still work=
s
> > for consistency and backward compatibility.
>=20
> That's not what I meant -- I meant for documentation purposes. QEMU can k=
eep
> accepting single dash, but we should standardize on the spelling for
> purposes of interactive messages, documentation, etc.

I wasn't aware of the fact that some of the utilities are sensitive to
'--' vs '-'! I'm in favor of consistently using '--' in documentation
but allowing both for backwards compatibility where '-' is currently
supported.

If we are in agreement, then let's:

1. Add a section to CODING_STYLE.rst or other developer documentation
   documenting this.

2. Convert existing documentation to use '--'. This will make it more
   consistent and also avoid confusion about '-' vs '--'.

John: Do you have time to do these things as part of your QEMU
command-line and API improvement work?

Thanks,
Stefan

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAATukACgkQnKSrs4Gr
c8iyHgf+PxuyvAc9j6HCap1MG93W5unqfUCCE2nD2/kbJVsTarlLNkUhZHaukG6c
Qid3hYztinO2T0biMxXmTD7RPdZMq8G6UoVqEqDuZ5vGms4lEVz9Z0E0ZGK4R8g0
fd+kgRusjrXrXwfLoyfDBZyPfpDiU7X4zw+FoxwUWk8vuPHWRYcu6JpmniKUXK2H
5QAKZnGLvWqjDNZSChDnychIQW2x4dsiwX1UbsnHHm42UK1ezr3+CKRzf5TJH0KZ
fHD9gngfNHmU6K9Vp/NcolYkf0kALSXBeQQlSU8SmxqA+kFKC6r5EucvCzOZnAsT
jiyMcdYTg7HgYgGYvq0N6rFBSExWwg==
=9Pqe
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--


