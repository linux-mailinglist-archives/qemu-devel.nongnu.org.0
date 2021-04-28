Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97E36DF27
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:45:47 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpBy-0001ca-8e
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbp9t-0000j7-Qh
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbp9k-0000oX-4h
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619635406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zV5Ie6+ZFPpmEODsoIkO6p3D8zt2H0QT5UWsmwSsRyo=;
 b=K2+i7gKgrxWsAqUBFW8kLCpfGEzcK6BihTuvaoTV8b+6+BUfH+DInPDTxR8e31UVWj0BYi
 tNUTZRRtedNHr1fPYy8q2QYvPuLgakhqHrTE4AFS/pY9wINHqEgFvMQ9o7cIwssWTExUlD
 9U45w2PZtDjHA1k5G7GwKiV0K5T08W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-6cqUK9nKPlCzIQjH52Q1bQ-1; Wed, 28 Apr 2021 14:43:21 -0400
X-MC-Unique: 6cqUK9nKPlCzIQjH52Q1bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6F48026AC;
 Wed, 28 Apr 2021 18:43:20 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B1876064B;
 Wed, 28 Apr 2021 18:43:19 +0000 (UTC)
Date: Wed, 28 Apr 2021 19:43:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YImsxg/G2u659nkI@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
 <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
 <YIkpXqg5/wV1QNZB@stefanha-x1.localdomain>
 <87mtti1oie.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mtti1oie.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YVmGGdcjqsvXECCA"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YVmGGdcjqsvXECCA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 04:18:17PM +0200, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Tue, Apr 27, 2021 at 02:02:27PM -0400, John Snow wrote:
> >> On 4/27/21 1:54 PM, Philippe Mathieu-Daud=E9 wrote:
> >> > On 4/27/21 7:16 PM, John Snow wrote:
> >> > > On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
> >> > > > I suggest fixing this at the qdev level. Make piix3-ide have a
> >> > > > sub-device that inherits from ISA_DEVICE so it can only be insta=
ntiated
> >> > > > when there's an ISA bus.
> >> > > >=20
> >> > > > Stefan
> >> > >=20
> >> > > My qdev knowledge is shaky. Does this imply that you agree with th=
e
> >> > > direction of Thomas's patch, or do you just mean to disagree with =
Phil
> >> > > on his preferred course of action?
> >> >=20
> >> > My understanding is a disagreement to both, with a 3rd direction :)
> >> >=20
> >> > I agree with Stefan direction but I'm not sure (yet) that a sub-devi=
ce
> >> > is the best (long-term) solution. I guess there is a design issue wi=
th
> >> > this device, and would like to understanding it first.
> >> >=20
> >> > IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
> >> > only allow a single parent. Multiple QOM inheritance is resolved as
> >> > interfaces, but PCI/IDE qdev aren't interfaces, rather abstract obje=
cts.
> >> > So he suggests to embed an IDE device within the PCI piix3-ide devic=
e.
> >> >=20
> >> > My view is the PIIX is a chipset that share stuffs between component=
s,
> >> > and the IDE bus belongs to the chipset PCI root (or eventually the
> >> > PCI-ISA bridge, function #0). The IDE function would use the IDE bus
> >> > from its root parent as a linked property.
> >> > My problem is currently this device is user-creatable as a Frankenst=
ein
> >> > single PCI function, out of its chipset. I'm not sure yet this is a
> >> > dead end or I could work something out.
> >> >=20
> >> > Regards,
> >> >=20
> >> > Phil.
> >> >=20
> >>=20
> >> It sounds complicated. In the meantime, I think I am favor of taking
> >> Thomas's patch because it merely adds some error routing to allow us t=
o
> >> avoid a crash. The core organizational issues of the IDE device(s) wil=
l
> >> remain and can be solved later as needed.
> >
> > The approach in this patch is okay but we should keep in mind it only
> > solves piix3-ide. ISA provides a non-qdev backdoor API and there may be
> > more instances of this type of bug.
> >
> > A qdev fix would address the root cause and make it possible to drop th=
e
> > backdoor API, but that's probably too much work for little benefit.
>=20
> What do you mean by backdoor API?  Global @isabus?

Yes. It's also strange that isa_get_irq(ISADevice *dev, unsigned isairq)
accepts dev =3D NULL as a valid argument.

Stefan

--YVmGGdcjqsvXECCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCJrMYACgkQnKSrs4Gr
c8gfOwgAkVOZSy3xfWqMS11DzVfXztEJvh9wnJwQr8ZWNbfXE0LkUmQ+WlhYzdel
QTv4UHKfQI4Okrhj+TsSwm5XQ7eqDVI5yqXO5/fNhhcZTpONLGy6uEGYRZS4RmE7
Q6vdN3qADPjMOUDGiNBZeUlARFCYy0gwucKKC72IPEyUEViecV5PZXSkR1Pv1JPu
Jdz9K9fmssCkPpkCwnT+l7MsxixBer46hfpb/9A8pDLw6L225WZjfnFhnbq22jAR
6X8P1Fj0BSuT6SUNY9EbYGkdarUeJsHwaSg5a0piwJ+BVW1S2OvfbR/mU80xoefr
VRI+R2szNP3jP147K2G3+JB9pa+gzA==
=29+c
-----END PGP SIGNATURE-----

--YVmGGdcjqsvXECCA--


