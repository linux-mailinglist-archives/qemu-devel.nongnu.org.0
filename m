Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A22D2B52
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:45:17 +0100 (CET)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcMm-0006bV-Oo
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmcLH-00062Q-Js
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:43:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmcLF-0004jy-38
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607431420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9NjwKxT/SFtSebETsZkqlQUYSJrNizbHsL2kPkriiiI=;
 b=dA8xN791mbRIho1sXLfPqaG1E+RToJxdwTEGCeRo91wrODgviE7ZjYqXxsXyMpk8VBHzyg
 XsmaTIdqWAnW/+hQAIvUwJmcFvQC7B2YjqWficb7F2onMJ6jsnfS2GzS2HWTXZQT8/mMg2
 714y2k3g8FY+WH7KbyPBTU4THLLkBRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-n86cLAbHN0u98jWvn_X04A-1; Tue, 08 Dec 2020 07:43:38 -0500
X-MC-Unique: n86cLAbHN0u98jWvn_X04A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42CF887950E;
 Tue,  8 Dec 2020 12:43:36 +0000 (UTC)
Received: from gondolin (ovpn-113-5.ams2.redhat.com [10.36.113.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62FC41001901;
 Tue,  8 Dec 2020 12:43:24 +0000 (UTC)
Date: Tue, 8 Dec 2020 13:43:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201208134308.2afa0e3e.cohuck@redhat.com>
In-Reply-To: <20201208025728.GD2555@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
 <20201204141229.688b11e4.cohuck@redhat.com>
 <20201208025728.GD2555@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="Sig_/zU8XNVbQwRALPRxAVzVqthS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--Sig_/zU8XNVbQwRALPRxAVzVqthS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Dec 2020 13:57:28 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Dec 04, 2020 at 02:12:29PM +0100, Cornelia Huck wrote:
> > On Fri, 4 Dec 2020 13:07:27 +0000
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >  =20
> > > * Cornelia Huck (cohuck@redhat.com) wrote: =20
> > > > On Fri, 4 Dec 2020 09:06:50 +0100
> > > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > > >    =20
> > > > > On 04.12.20 06:44, David Gibson wrote:   =20
> > > > > > A number of hardware platforms are implementing mechanisms wher=
eby the
> > > > > > hypervisor does not have unfettered access to guest memory, in =
order
> > > > > > to mitigate the security impact of a compromised hypervisor.
> > > > > >=20
> > > > > > AMD's SEV implements this with in-cpu memory encryption, and In=
tel has
> > > > > > its own memory encryption mechanism.  POWER has an upcoming mec=
hanism
> > > > > > to accomplish this in a different way, using a new memory prote=
ction
> > > > > > level plus a small trusted ultravisor.  s390 also has a protect=
ed
> > > > > > execution environment.
> > > > > >=20
> > > > > > The current code (committed or draft) for these features has ea=
ch
> > > > > > platform's version configured entirely differently.  That doesn=
't seem
> > > > > > ideal for users, or particularly for management layers.
> > > > > >=20
> > > > > > AMD SEV introduces a notionally generic machine option
> > > > > > "machine-encryption", but it doesn't actually cover any cases o=
ther
> > > > > > than SEV.
> > > > > >=20
> > > > > > This series is a proposal to at least partially unify configura=
tion
> > > > > > for these mechanisms, by renaming and generalizing AMD's
> > > > > > "memory-encryption" property.  It is replaced by a
> > > > > > "securable-guest-memory" property pointing to a platform specif=
ic     =20
> > > > >=20
> > > > > Can we do "securable-guest" ?
> > > > > s390x also protects registers and integrity. memory is only one p=
iece
> > > > > of the puzzle and what we protect might differ from platform to=
=20
> > > > > platform.
> > > > >    =20
> > > >=20
> > > > I agree. Even technologies that currently only do memory encryption=
 may
> > > > be enhanced with more protections later.   =20
> > >=20
> > > There's already SEV-ES patches onlist for this on the SEV side.
> > >=20
> > > <sigh on haggling over the name>
> > >=20
> > > Perhaps 'confidential guest' is actually what we need, since the
> > > marketing folks seem to have started labelling this whole idea
> > > 'confidential computing'. =20
>=20
> That's not a bad idea, much as I usually hate marketing terms.  But it
> does seem to be becoming a general term for this style of thing, and
> it doesn't overlap too badly with other terms ("secure" and
> "protected" are also used for hypervisor-from-guest and
> guest-from-guest protection).
>=20
> > It's more like a 'possibly confidential guest', though. =20
>=20
> Hmm.  What about "Confidential Guest Facility" or "Confidential Guest
> Mechanism"?  The implication being that the facility is there, whether
> or not the guest actually uses it.
>=20

"Confidential Guest Enablement"? The others generally sound fine to me
as well, though; not sure if "Facility" might be a bit confusing, as
that term is already a bit overloaded.

--Sig_/zU8XNVbQwRALPRxAVzVqthS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl/PdNwACgkQ3s9rk8bw
L68BRA//TCOIZrF+v+dXbOq+uR5phW4kslQrUTC7M7RK7pWVrmP7OJizDIuOfNj4
ev+p+5nspO1c5gYh/m/kU4qy/dwkrR/q/AdZm19lft5fRb/77NFWALdqq6ftH0YK
7IOogAYlmIo2qg1L1ETQdig4MRCNnrThf7NILYU4mHNVWj7TQkwoJEOA0ow00qze
Svd5myUVZqVD3tX6AbKl/kW7/F8oY0kHUWd8zL5JkvG4OtNKrwdv+eIpPTzatTNA
Xr8z5j2VDHhQRFaw/gQg1RJBRSV9eCJbXQ1SpVUdPxBz04hQxYBg8MpfPSlI/ECV
+f6NTiXuUxHpguyKy4gLODcwgDIG5D81FljHYsQc2JS+M0mbqaHZcf5nb7oFhtFt
sLBAOrc6NLG1LjupzExH1LaXZSxjuOEDh7Ow9bTU06DhkxXu32LRundLKcENXVv5
X4Ob1IEFt28djLiDSFJxRyj1K8Yz4vR1QVKulmTD7U9HvXXOCm2EpRLEnO4S/nHf
HBk5fpvQmY8g3eG2/CdZHbc1OI0HNXpfiWCmFYnF3/cB+aVg9dNF2614vQxLTyQN
tFG+4xJxrpkXizwaTnDHRuU80jCPL668UH3cetBOc5L2Q0gbR9EhbKta6X50ZFix
i4B1hE3MnQh28dMTU7w2Z1hdbJLGJ3hINDXfTvoTKAhNEII+FKU=
=Z85K
-----END PGP SIGNATURE-----

--Sig_/zU8XNVbQwRALPRxAVzVqthS--


