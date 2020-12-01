Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF8A2CA399
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:19:49 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5ZM-0006oB-BY
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk5XO-0005m1-6I
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk5XL-0002jf-5B
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606828661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1LkIZcGr2YjhYssJjdDBtbZyRCt7wZ5NOA/+jhVR9zY=;
 b=gbus1+wuT2LImgNHdI+MxGed27qx6DUnOYZCfv5kPzVze7DYAlkEV9lfzMY555VyEyrt19
 dMFyJhTS+o9FXdvqt/YxeIUljinwitxbWjrkzW8JxOsTd6AyIoGilPO6xoV6PmAAxjPPhE
 ozUxpiPd4ebiD1DlaVxTr1a/IIg+4f8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-R9LGh1Q7ORi8vNPj1UBbtg-1; Tue, 01 Dec 2020 08:17:37 -0500
X-MC-Unique: R9LGh1Q7ORi8vNPj1UBbtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7924B873163;
 Tue,  1 Dec 2020 13:17:34 +0000 (UTC)
Received: from localhost (ovpn-114-82.ams2.redhat.com [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1254C60CE7;
 Tue,  1 Dec 2020 13:17:25 +0000 (UTC)
Date: Tue, 1 Dec 2020 13:17:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201201131725.GF585157@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201111125626.GC3232@work-vm>
 <20201111153438.GD1421166@stefanha-x1.localdomain>
 <20201111154159.GG3232@work-vm>
 <20201116143812.GF96297@stefanha-x1.localdomain>
 <20201117044120-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201117044120-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Kevin" <kevin.tian@intel.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Yan Zhao <yan.y.zhao@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 04:44:52AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 16, 2020 at 02:38:12PM +0000, Stefan Hajnoczi wrote:
> > On Wed, Nov 11, 2020 at 03:41:59PM +0000, Dr. David Alan Gilbert wrote:
> > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > On Wed, Nov 11, 2020 at 12:56:26PM +0000, Dr. David Alan Gilbert wr=
ote:
> > > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > > > Orchestrating Migrations
> > > > > > ------------------------
> > > > > > In order to migrate a device a *migration parameter list* must =
first be built
> > > > > > on the source. Each migration parameter is added to the list if=
 it is in
> > > > > > effect. For example, the migration parameter list for a device =
with
> > > > > > new-feature=3Doff,num-queues=3D4 would be num-queues=3D4 if the=
 new-feature migration
> > > > > > parameter was introduced with the off value disabling its effec=
t.
> > > > >=20
> > > > > What component builds that list (i.e. what component needs to kno=
w the
> > > > > history that new-feature=3Doff was the default - ah I think you a=
nswer
> > > > > that below).
> > > >=20
> > > > Yep. Thanks for noting this. I'll need to reorder things so it is c=
lear.
> > > >=20
> > > > > > The following conditions must be met to establish migration com=
patibility:
> > > > > >=20
> > > > > > 1. The source and destination device model strings match.
> > > > > >=20
> > > > > > 2. Each migration parameter name from the migration parameter l=
ist is supported
> > > > > >    by the destination. For example, the destination supports th=
e num-queues
> > > > > >    migration parameter.
> > > > > >=20
> > > > > > 3. Each migration parameter value from the migration parameter =
list is
> > > > > >    supported by the destination. For example, the destination s=
upports
> > > > > >    num-queues=3D4.
> > > > >=20
> > > > > Hmm, are combinations of parameter checks needed - i.e. is it pos=
sible
> > > > > that a destination supports    num-queues=3D4 and  new-feature=3D=
on/off -
> > > > > but only supports new-feature=3Don when num-queues>2 ?
> > > >=20
> > > > Yes, it's possible but cannot be expressed in the migration info JS=
ON.
> > > >=20
> > > > We need to choose a level of expressiveness that will be useful eno=
ugh
> > > > without being complex. In the extreme the migration info would cont=
ain
> > > > Turing complete validation expressions (e.g. JavaScript) so that an=
y
> > > > relationship can be expressed, but I doubt that complexity is neede=
d.
> > > > The other extreme is just booleans and (opaque) strings for maximum
> > > > simplicity.
> > > >=20
> > > > If the syntax is not expressive enough then it's impossible to chec=
k
> > > > migration compatibility without actually creating a new device inst=
ance
> > > > on the destination. Daniel Berrange raised the requirement of check=
ing
> > > > migration compatibility without creating the device since this help=
s
> > > > with selecting a migration destination.
> > >=20
> > > Right, but my worry isn't the JSON description, it's the set of 3
> > > conditions above; they need to state that only some combinations need=
 to
> > > be valid.
> >=20
> > Yes, the proposed syntax is simply not expressive enough. The migration
> > compatibility check will pass and then the destination will refuse to
> > set up the device (before the device state is transferred).
> >=20
> > Any suggestions for a syntax without full-blown arithmetic and logic
> > expressions?
> >=20
> > > > Any ideas for a better syntax?
> > >=20
> > > I'd be happy with a --param name=3Dvalue   repeatedly, but also know =
that
> > > some option parsers don't like that.
> >=20
> > Another wart, Sphinx considers repeated options an error so you cannot
> > document options using rST option syntax. I remember having this proble=
m
> > when documenting virtiofsd's command-line options :).
> >=20
> > If something comes to mind please let me know. I'm not set on a
> > particular syntax, but I'd like to choose the one that is both
> > human-friendly and compatible with option parsers while avoiding
> > namespace collisions with the device implementation's own options.
> >=20
> > Stefan
>=20
>=20
> I think the simplest way is just to include and open-source tool
> for figuring all this out together with qemu.
> Any vendor interested in supporting migration with qemu
> will then just submit a patch for that tool.
>=20
> This will also help make sure this interface
> is not just a way to bypass GPL, we can ask that the
> supporting server is opensource.
>=20
> And it will help us guide vendors towards supporting migration
> correctly.

Can you describe the tool's command-line interface in more detail? Does
this tool completely replace the VFIO/mdev sysfs and vfio-user
command-line interfaces?

Is it just for vfio-user devices or also for VFIO/mdev devices?

Regarding GPL, I guess you mean the tool maintainers in QEMU would only
accept patches if the corresponding device backend implementation is
open source (GPL, MIT, BSD, Apache, etc)? I'm not sure if that helps
since proprietary vendors ship their own QEMU or can replace this tool
with another binary.

Stefan

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/GQmQACgkQnKSrs4Gr
c8g+kgf+JQGAz8Z5c+O+5G9ZjIi044fkx/mk6HeY0ri1eekeH8YOpNvTaPIsJiyw
ZIpvQdL9XDtV6es5N8aM3ZTBmucyMfKPt6K5/KWRGKQQFfwC9rk0zftZxGasXe1p
d9JU/BJRkhkV+P7lGy9tyWohUobXYblVYDq1MXvL34qCTfwbLdciHgbW3YEuusFm
JQm/sbp6uOx9KW1FboDaVfgzFL76AviJYAr6SOY1/yljBgIhJCwED9tk+t/At7pa
Uq16BWXKq0FSZlaMnrgVqYfP1/+wo6iis92xAfSfiv4Iw/0po3xIyc90UilGDoLk
Iijpbn5JYIXKHQAzNWLAA99y2w/IMQ==
=Bt50
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--


