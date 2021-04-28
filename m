Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DF36D4BA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:26:15 +0200 (CEST)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgSU-0007t9-VQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgPG-0006HV-9V
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgPD-0005Qc-0T
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619601770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iDHWk8Aq8uVxQGwif4sGs8S/wwYODbOhSf8eojf1bVs=;
 b=VYt+OdUulTKxu6H8FhWe9gis9HL0jL3lGVlCeleqdUFSTWKfaJ3IEzDBk9zQhdItL3/fdL
 6ZC014/8n5NXceMUMBYqXdI2Vb1dLpUm+lSAZxk02T5lFml6bbyAu+mvWDDcGx9c0RuneH
 HMW4reIqupWv7WUxwo5weGarwy6nP2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-C7MFpXNRNLeMtmSwYdArOQ-1; Wed, 28 Apr 2021 05:22:48 -0400
X-MC-Unique: C7MFpXNRNLeMtmSwYdArOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35A8F195D56B;
 Wed, 28 Apr 2021 09:22:40 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4C85D6D5;
 Wed, 28 Apr 2021 09:22:39 +0000 (UTC)
Date: Wed, 28 Apr 2021 10:22:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YIkpXqg5/wV1QNZB@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
 <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bSmrvWNwKmP9ehoN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bSmrvWNwKmP9ehoN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 02:02:27PM -0400, John Snow wrote:
> On 4/27/21 1:54 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 4/27/21 7:16 PM, John Snow wrote:
> > > On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
> > > > I suggest fixing this at the qdev level. Make piix3-ide have a
> > > > sub-device that inherits from ISA_DEVICE so it can only be instanti=
ated
> > > > when there's an ISA bus.
> > > >=20
> > > > Stefan
> > >=20
> > > My qdev knowledge is shaky. Does this imply that you agree with the
> > > direction of Thomas's patch, or do you just mean to disagree with Phi=
l
> > > on his preferred course of action?
> >=20
> > My understanding is a disagreement to both, with a 3rd direction :)
> >=20
> > I agree with Stefan direction but I'm not sure (yet) that a sub-device
> > is the best (long-term) solution. I guess there is a design issue with
> > this device, and would like to understanding it first.
> >=20
> > IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
> > only allow a single parent. Multiple QOM inheritance is resolved as
> > interfaces, but PCI/IDE qdev aren't interfaces, rather abstract objects=
.
> > So he suggests to embed an IDE device within the PCI piix3-ide device.
> >=20
> > My view is the PIIX is a chipset that share stuffs between components,
> > and the IDE bus belongs to the chipset PCI root (or eventually the
> > PCI-ISA bridge, function #0). The IDE function would use the IDE bus
> > from its root parent as a linked property.
> > My problem is currently this device is user-creatable as a Frankenstein
> > single PCI function, out of its chipset. I'm not sure yet this is a
> > dead end or I could work something out.
> >=20
> > Regards,
> >=20
> > Phil.
> >=20
>=20
> It sounds complicated. In the meantime, I think I am favor of taking
> Thomas's patch because it merely adds some error routing to allow us to
> avoid a crash. The core organizational issues of the IDE device(s) will
> remain and can be solved later as needed.

The approach in this patch is okay but we should keep in mind it only
solves piix3-ide. ISA provides a non-qdev backdoor API and there may be
more instances of this type of bug.

A qdev fix would address the root cause and make it possible to drop the
backdoor API, but that's probably too much work for little benefit.

Stefan

--bSmrvWNwKmP9ehoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCJKV4ACgkQnKSrs4Gr
c8g5jAf/dOvz60pe6IjwHkRaWsGLtJUPliESj/88b5o1ehWzOVaVhOWbC8Qw1qsu
9sH1WcZRFLWWq2P07j8Bfmxh44rdsbto15e7zyAbDPjJlWzdYBumCP+kAIxSXDTj
LMawhbVYqI+5wTEo2iJ8llRbNEdQkVLAokBsO3cTYkoZdFt/DNMWYUWa+UfxD0d7
6UI8BOQFBW6O2qX5ziaKtZZF803aFxn/kbK848mjYjvH+SPuel4pSArDcmDmZWMe
KRpUomyI9xObEkbIvqhGsDvvpec9k6CSi0lg+imbHItUFZQmwqeWdjkhzmxdpdGz
I/offb9kt794C/FvNaM4oENnnUdWSw==
=M0bD
-----END PGP SIGNATURE-----

--bSmrvWNwKmP9ehoN--


