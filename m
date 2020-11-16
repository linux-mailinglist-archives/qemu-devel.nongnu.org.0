Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9F2B4602
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:39:36 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keffM-0006QE-2W
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kefeA-0005ql-Fh
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kefe8-0000uq-Qx
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605537499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdxEEU3rFRSUfLliEv8Sq0xd7f9so/RXcGueDW3hZxs=;
 b=QRhQ09I0yOuJV//YdEN60EC+qC84iyNTleQL7Bi4G55H5b31U61twhOyc+o0zQNT4zv010
 nLh1QDEGqi/c5q3PZKKy9J+M2FAApZAv8u1RIKzklH989rnqtyzySUdTHrJYHPwbspTCCJ
 6BiA7GHtvT1h7aGBYrs/Xfb6gP/SqlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-vKXI_kPiMTSzR57j9seauQ-1; Mon, 16 Nov 2020 09:38:16 -0500
X-MC-Unique: vKXI_kPiMTSzR57j9seauQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62AD4186DD21;
 Mon, 16 Nov 2020 14:38:14 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE2BC5C5B7;
 Mon, 16 Nov 2020 14:38:13 +0000 (UTC)
Date: Mon, 16 Nov 2020 14:38:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116143812.GF96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201111125626.GC3232@work-vm>
 <20201111153438.GD1421166@stefanha-x1.localdomain>
 <20201111154159.GG3232@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201111154159.GG3232@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 03:41:59PM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Wed, Nov 11, 2020 at 12:56:26PM +0000, Dr. David Alan Gilbert wrote:
> > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > Orchestrating Migrations
> > > > ------------------------
> > > > In order to migrate a device a *migration parameter list* must firs=
t be built
> > > > on the source. Each migration parameter is added to the list if it =
is in
> > > > effect. For example, the migration parameter list for a device with
> > > > new-feature=3Doff,num-queues=3D4 would be num-queues=3D4 if the new=
-feature migration
> > > > parameter was introduced with the off value disabling its effect.
> > >=20
> > > What component builds that list (i.e. what component needs to know th=
e
> > > history that new-feature=3Doff was the default - ah I think you answe=
r
> > > that below).
> >=20
> > Yep. Thanks for noting this. I'll need to reorder things so it is clear=
.
> >=20
> > > > The following conditions must be met to establish migration compati=
bility:
> > > >=20
> > > > 1. The source and destination device model strings match.
> > > >=20
> > > > 2. Each migration parameter name from the migration parameter list =
is supported
> > > >    by the destination. For example, the destination supports the nu=
m-queues
> > > >    migration parameter.
> > > >=20
> > > > 3. Each migration parameter value from the migration parameter list=
 is
> > > >    supported by the destination. For example, the destination suppo=
rts
> > > >    num-queues=3D4.
> > >=20
> > > Hmm, are combinations of parameter checks needed - i.e. is it possibl=
e
> > > that a destination supports    num-queues=3D4 and  new-feature=3Don/o=
ff -
> > > but only supports new-feature=3Don when num-queues>2 ?
> >=20
> > Yes, it's possible but cannot be expressed in the migration info JSON.
> >=20
> > We need to choose a level of expressiveness that will be useful enough
> > without being complex. In the extreme the migration info would contain
> > Turing complete validation expressions (e.g. JavaScript) so that any
> > relationship can be expressed, but I doubt that complexity is needed.
> > The other extreme is just booleans and (opaque) strings for maximum
> > simplicity.
> >=20
> > If the syntax is not expressive enough then it's impossible to check
> > migration compatibility without actually creating a new device instance
> > on the destination. Daniel Berrange raised the requirement of checking
> > migration compatibility without creating the device since this helps
> > with selecting a migration destination.
>=20
> Right, but my worry isn't the JSON description, it's the set of 3
> conditions above; they need to state that only some combinations need to
> be valid.

Yes, the proposed syntax is simply not expressive enough. The migration
compatibility check will pass and then the destination will refuse to
set up the device (before the device state is transferred).

Any suggestions for a syntax without full-blown arithmetic and logic
expressions?

> > Any ideas for a better syntax?
>=20
> I'd be happy with a --param name=3Dvalue   repeatedly, but also know that
> some option parsers don't like that.

Another wart, Sphinx considers repeated options an error so you cannot
document options using rST option syntax. I remember having this problem
when documenting virtiofsd's command-line options :).

If something comes to mind please let me know. I'm not set on a
particular syntax, but I'd like to choose the one that is both
human-friendly and compatible with option parsers while avoiding
namespace collisions with the device implementation's own options.

Stefan

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+yjtQACgkQnKSrs4Gr
c8iMMAf/Q4sEN99bHqRV8iGZ7t2BG4PizT2P7mbvXEt4T+2YxQr0nx5Sw7VINmzy
XNVFrm3JMCHCDYgspITuPbvmnyX3Q0id64J+5VEHpbyjpHeNPeAOQZePe0kF+emH
+iK7eiYfeDgv+FLBtkBa/YviUZUTqRfQg2uQffsOldIsIW3QdBZr0HyVrgtw1OYa
98piNEUGJFuMi4k4hqF12z/hulAJpG55qMlVuZTRB0gYE791MvZSrI0KfSWai6GQ
MPA+f3oj1eI/e5UaMNMJSphdNQORNpS5vl228sLcBxSkJGEYxI2i5mADSqD9/x9I
RSrTQvU7q4WWaXTF+o2LsXSCN22ekg==
=t7ml
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--


