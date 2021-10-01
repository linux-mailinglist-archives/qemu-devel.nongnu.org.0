Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3341E83C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:21:28 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCrH-0002TI-O1
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mWChs-0001Xc-HY
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mWChq-0004fU-3d
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+HbEKiZlVyQgsc3W/ug2TC1MwIhP8s9fqqNu2BSoRQo=;
 b=Mytqm+qOz50KNAjSYebPemq12X22A7YV/+aeSEjGXcIt0N2rhwvFw3AKVBIxcZ3GWphsqK
 6H3Cikk5n6HjRAlI2FutW1rSC9y4rJAya690hYxBVelh9X8PFi7NI2/+cAYAC8UTtUJVj+
 o5ddL/xEn35HUTJ3Uuk24LIkMwilpB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-0OIbb5sSPlS2AcGwa4C5wA-1; Fri, 01 Oct 2021 03:11:38 -0400
X-MC-Unique: 0OIbb5sSPlS2AcGwa4C5wA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A580B50755;
 Fri,  1 Oct 2021 07:11:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4369119C59;
 Fri,  1 Oct 2021 07:11:36 +0000 (UTC)
Date: Fri, 1 Oct 2021 08:11:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <YVXePK28T7nl9J7k@invalid>
MIME-Version: 1.0
In-Reply-To: <YVXePK28T7nl9J7k@invalid>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hMHU5023mgYBnWqE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, michael.roth@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hMHU5023mgYBnWqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 03:57:49PM +0000, Eldon Stegall wrote:
> Hello!
> I'd be happy to help with this. I'm mostly a consumer of QEMU, but
> greatly appreciate all the work this community has done, and was able
> to contribute a little by helping with QEMU advent this past year. I
> would be happy to help streamline some of this activities if that would
> be welcome, and would gratefully contribute time and resources. Hosting
> and serving data like this has been core to my recent experience.
>=20
> I would be happy to suggest and build out a distribution strategy for
> these packages, and believe I could cut some costs, and even convince a
> small consultancy I am a part of here that uses QEMU to foot a
> reasonable bill.
>=20
> A brief introduction, since I haven't had the pleasure of attending
> FOSDEM or any other QEMU meetups: I am a startup-oriented Cloud Security
> Architect, based out of Atlanta, previously with companies like
> DataStax, but now working on AWS video pipelines for a startup here.

Thanks for joining the discussion and for running last year's QEMU
Advent Calendar, Eldon.

Any ideas for moving download.qemu.org to a hosted service would be
appreciated! We haven't compared CDN and cloud providers closely yet. If
you have experience in this area or time to check them out, then that
would be valuable.

QEMU has funds if there is a cost for file hosting (probably less than
$100/month). Some providers may be willing to support an open source
project for free. Possible providers include CloudFlare, Akamai, Fastly,
Microsoft Azure, Google Cloud Storage, etc.

We need to keep the security of QEMU releases in mind. Mike Roth
signs and publishes releases. Whoever facilitates or hosts the files
should not be able to modify the files after Mike has blessed them. One
way to do this is to keep hosting the .sig files on download.qemu.org
and to redirect the actual tarballs to a file hosting provider. A way to
securely publish files without hosting anything on qemu.org would be
even better though (maybe it's enough to publish signatures on the
static GitLab Pages website).

Stefan

--hMHU5023mgYBnWqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFWtKcACgkQnKSrs4Gr
c8gOfgf/cWVIfw/HOpDOHsKxjk+xy65/XRb9PJDwL/BLZrUGezkkf4CV4w8nyCOA
SFviJEOnUwipyjgDBF33RLdq/QqBlnF1EhxTjCLQoeyO+QPjjZySlBsOD5fxYf2w
ZOVQYg4tDJbZjKhhJQdNjQK6a1d0tRIPnQJ8BtSUhzRvIc16h/T8WHOGKnjLEqOM
pDW5IfkB3ahXfPG3voMeiqTcBqstJEYluVudtEX62u5bjoYO/ra1b3qthWx5lAkZ
8cRIVx2zOzpUBEe8C22ooxIbRk0rAJB9x+Sqwncaq24aEJIOsdK6CsgGUXVuOcrj
r/13x1uNhJ0mVy5vSIVvZytBPbLTPg==
=dcBq
-----END PGP SIGNATURE-----

--hMHU5023mgYBnWqE--


