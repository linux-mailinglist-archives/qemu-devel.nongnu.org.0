Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC552DD0CC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:51:08 +0100 (CET)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kproJ-0004j9-M2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kprh2-0005lr-R0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kprh1-0000Sb-48
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608205414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyIqB23JwnZYHGAWkNFaM9pV1Ag2jMMOyHckGdG4sJU=;
 b=QLBDDxDSbqpqVlJpc2YS6GXb9nQO5JGrQpOFVK2HsoCaZPdJWqK4qtLiXSDXSLERokwbrr
 dIViv5ndEEkF00rjlLQ3oNBLnE2Ar8MbCBmP9+dXVJeN+P55jCRAppqfFELixXRnTCcD0P
 WvbVhtMzOGS8H0DH+8mqlTPOg60QvJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ep45ulrANZOTpRE_DowVqg-1; Thu, 17 Dec 2020 06:43:29 -0500
X-MC-Unique: ep45ulrANZOTpRE_DowVqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A2D800D55;
 Thu, 17 Dec 2020 11:43:27 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDC9D1A262;
 Thu, 17 Dec 2020 11:43:16 +0000 (UTC)
Date: Thu, 17 Dec 2020 12:43:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201217124313.0b321ecf.cohuck@redhat.com>
In-Reply-To: <20201217062116.GK310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
 <20201204141229.688b11e4.cohuck@redhat.com>
 <20201208025728.GD2555@yekko.fritz.box>
 <20201208134308.2afa0e3e.cohuck@redhat.com>
 <20201217062116.GK310465@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R0kL8VplyVYXrejI1PMf7M_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/R0kL8VplyVYXrejI1PMf7M_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Dec 2020 17:21:16 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Dec 08, 2020 at 01:43:08PM +0100, Cornelia Huck wrote:
> > On Tue, 8 Dec 2020 13:57:28 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >  =20
> > > On Fri, Dec 04, 2020 at 02:12:29PM +0100, Cornelia Huck wrote: =20
> > > > On Fri, 4 Dec 2020 13:07:27 +0000
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >    =20
> > > > > * Cornelia Huck (cohuck@redhat.com) wrote:   =20
> > > > > > On Fri, 4 Dec 2020 09:06:50 +0100
> > > > > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > > > > >      =20
> > > > > > > On 04.12.20 06:44, David Gibson wrote:     =20
> > > > > > > > A number of hardware platforms are implementing mechanisms =
whereby the
> > > > > > > > hypervisor does not have unfettered access to guest memory,=
 in order
> > > > > > > > to mitigate the security impact of a compromised hypervisor.
> > > > > > > >=20
> > > > > > > > AMD's SEV implements this with in-cpu memory encryption, an=
d Intel has
> > > > > > > > its own memory encryption mechanism.  POWER has an upcoming=
 mechanism
> > > > > > > > to accomplish this in a different way, using a new memory p=
rotection
> > > > > > > > level plus a small trusted ultravisor.  s390 also has a pro=
tected
> > > > > > > > execution environment.
> > > > > > > >=20
> > > > > > > > The current code (committed or draft) for these features ha=
s each
> > > > > > > > platform's version configured entirely differently.  That d=
oesn't seem
> > > > > > > > ideal for users, or particularly for management layers.
> > > > > > > >=20
> > > > > > > > AMD SEV introduces a notionally generic machine option
> > > > > > > > "machine-encryption", but it doesn't actually cover any cas=
es other
> > > > > > > > than SEV.
> > > > > > > >=20
> > > > > > > > This series is a proposal to at least partially unify confi=
guration
> > > > > > > > for these mechanisms, by renaming and generalizing AMD's
> > > > > > > > "memory-encryption" property.  It is replaced by a
> > > > > > > > "securable-guest-memory" property pointing to a platform sp=
ecific       =20
> > > > > > >=20
> > > > > > > Can we do "securable-guest" ?
> > > > > > > s390x also protects registers and integrity. memory is only o=
ne piece
> > > > > > > of the puzzle and what we protect might differ from platform =
to=20
> > > > > > > platform.
> > > > > > >      =20
> > > > > >=20
> > > > > > I agree. Even technologies that currently only do memory encryp=
tion may
> > > > > > be enhanced with more protections later.     =20
> > > > >=20
> > > > > There's already SEV-ES patches onlist for this on the SEV side.
> > > > >=20
> > > > > <sigh on haggling over the name>
> > > > >=20
> > > > > Perhaps 'confidential guest' is actually what we need, since the
> > > > > marketing folks seem to have started labelling this whole idea
> > > > > 'confidential computing'.   =20
> > >=20
> > > That's not a bad idea, much as I usually hate marketing terms.  But it
> > > does seem to be becoming a general term for this style of thing, and
> > > it doesn't overlap too badly with other terms ("secure" and
> > > "protected" are also used for hypervisor-from-guest and
> > > guest-from-guest protection).
> > >  =20
> > > > It's more like a 'possibly confidential guest', though.   =20
> > >=20
> > > Hmm.  What about "Confidential Guest Facility" or "Confidential Guest
> > > Mechanism"?  The implication being that the facility is there, whether
> > > or not the guest actually uses it.
> > >  =20
> >=20
> > "Confidential Guest Enablement"? The others generally sound fine to me
> > as well, though; not sure if "Facility" might be a bit confusing, as
> > that term is already a bit overloaded. =20
>=20
> Well, "facility" is a bit overloaded, but IMO "enablement" is even
> more so.  I think I'll go with "confidential guest support" in the
> next spin.
>=20

Works for me.

--Sig_/R0kL8VplyVYXrejI1PMf7M_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl/bRFEACgkQ3s9rk8bw
L68CLRAAp36nl9zlR8I/XeSW6EAJQS+9P2Ose7DKrowr6/vkXSSOtHl9cv/6TDiU
V5tOO3CbItyzBPxw5w7ezy88bgYOxgijmr4MHs4nC0YqtzYYv4vCeEIKmT99rgy4
q/nCkRGY0C+cnSuehjLgPIC9wqFuOjrgui4edY1+eNxe311QZR/XuAfSGs4RJ0VB
UiT7+xdqiygzNTgiLttpw+msZrj9lKLmad5LnUiEvVvzbxFPtWWqbBisWS7M7D49
58yYobJr/o/Rh77mqNFDzgBiWmYvnmi2ukAMyLSUl+g0fGMKZzu1CVjPE0wg1jkX
n8B7qkpZrTC27HqzUR+r37fuBpWgkqBmiUXzyayn4z3Z+HoY4Io2ipfYOK62PRLm
+0j6Tgw3cIBHY+NscF4f83iNQRrxqqZia9PWdncfdwJC/JIkNnV9hIABTkm4lC2L
GPoXS0X6/6Q5dXILqrSPJUuaWlF3P3/m3ehAHLqurs9hirutfTR5MPWREcy1oBxm
kGqCaXUO/faCGGoJkYdKot5UpysuL87RBo7EgBo3HL8V/VfUlo+6CJeiPQWbDKw9
l9z3kZfbFzl2FrJmxfuJapVlRCfSzpjVCebMDl4CSjP+Dax170lAt9bX/0CgdL8u
z8c8aFVhACPWFRw8CJaqldSznQsISXj5BnPHvGTSwYTZRnNH1AA=
=XYiF
-----END PGP SIGNATURE-----

--Sig_/R0kL8VplyVYXrejI1PMf7M_--


