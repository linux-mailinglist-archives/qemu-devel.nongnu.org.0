Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A423477D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 16:12:52 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1VmF-0002Wl-3W
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k1VlQ-00025n-RL
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 10:12:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25996
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k1VlO-0005Kw-4n
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 10:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596204716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l5BMN84/nFjfKuGCtoKsxuaws9MCl5OPEbl10yee1Oc=;
 b=aX6dPv67JE1JM0KKhZIuODOhu0vTjt6zWWuEtI5yZO3rO7RFhd56LbSkSyZbfI8b1tl+lP
 rts5Eoq3GL6/wJTKZbUiCOTG5r6bF0dB7Bdns86BIIIHUbN2D9vYmAPGm+JFH6mjrbWSSm
 sEkLcxiU6Us2uY28FLAMVDsrvHAKb7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-fCkvy1-qMaevmnK0Qq1Jgg-1; Fri, 31 Jul 2020 10:11:54 -0400
X-MC-Unique: fCkvy1-qMaevmnK0Qq1Jgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9CF59;
 Fri, 31 Jul 2020 14:11:53 +0000 (UTC)
Received: from localhost (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50D77797FC;
 Fri, 31 Jul 2020 14:11:48 +0000 (UTC)
Date: Fri, 31 Jul 2020 15:11:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Roman Mohr <rmohr@redhat.com>
Subject: Re: [PATCH v2 3/3] virtiofsd: probe unshare(CLONE_FS) and print an
 error
Message-ID: <20200731141147.GA199536@stefanha-x1.localdomain>
References: <20200727190223.422280-1-stefanha@redhat.com>
 <20200727190223.422280-4-stefanha@redhat.com>
 <OSBPR01MB45826073E5A54CF869E56721E5730@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CALDPj7syG0KPhtZEma5n403=YFZ2ptcD4MtP=GdrY9n1eUs5Eg@mail.gmail.com>
 <20200728131250.GB78409@redhat.com>
 <CALDPj7uvquu=YWX_Ve7ROdj=LZWjkgPOm+wvEAynGvjeF4Xivg@mail.gmail.com>
 <20200729144027.GF52286@stefanha-x1.localdomain>
 <ad75a25c-0343-5c57-1933-e3c88f76df1c@redhat.com>
 <20200731082638.GA173083@stefanha-x1.localdomain>
 <CALDPj7s-UjrvgD4-mhEwisetz7PtAO-RCmKvH+=1UTM8K8oLPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALDPj7s-UjrvgD4-mhEwisetz7PtAO-RCmKvH+=1UTM8K8oLPw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 10:11:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: "vromanso@redhat.com" <vromanso@redhat.com>,
 Daniel Walsh <dwalsh@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
 "mpatel@redhat.com" <mpatel@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2020 at 10:39:37AM +0200, Roman Mohr wrote:
> On Fri, Jul 31, 2020 at 10:26 AM Stefan Hajnoczi <stefanha@redhat.com>
> wrote:
>=20
> > On Thu, Jul 30, 2020 at 06:21:34PM -0400, Daniel Walsh wrote:
> > > On 7/29/20 10:40, Stefan Hajnoczi wrote:
> > > > On Wed, Jul 29, 2020 at 09:59:01AM +0200, Roman Mohr wrote:
> > > >> On Tue, Jul 28, 2020 at 3:13 PM Vivek Goyal <vgoyal@redhat.com>
> > wrote:
> > > >>
> > > >>> On Tue, Jul 28, 2020 at 12:00:20PM +0200, Roman Mohr wrote:
> > > >>>> On Tue, Jul 28, 2020 at 3:07 AM misono.tomohiro@fujitsu.com <
> > > >>>> misono.tomohiro@fujitsu.com> wrote:
> > > >>>>
> > > >>>>>> Subject: [PATCH v2 3/3] virtiofsd: probe unshare(CLONE_FS) and
> > print
> > > >>> an
> > > >>>>> error
> > > >> Yes they can run as root. I can tell you what we plan to do with t=
he
> > > >> containerized virtiofsd: We run it as part of the user-owned pod (=
a
> > set of
> > > >> containers).
> > > >> One of our main goals at the moment is to run VMs in a user-owned =
pod
> > > >> without additional privileges.
> > > >> So that in case the user (VM-creator/owner) enters the pod or
> > something
> > > >> breaks out of the VM they are just in the unprivileged container
> > sandbox.
> > > >> As part of that we try to get also rid of running containers in th=
e
> > > >> user-context with the root user.
> > > >>
> > > >> One possible scenario which I could think of as being desirable fr=
om a
> > > >> kubevirt perspective:
> > > >> We would run the VM in one container and have an unprivileged
> > > >> virtiofsd container in parallel.
> > > >> This container already has its own mount namespace and it is not t=
hat
> > > >> critical if something manages to enter this sandbox.
> > > >>
> > > >> But we are not as far yet as getting completely rid of root right =
now
> > in
> > > >> kubevirt, so if as a temporary step it needs root, the current
> > proposed
> > > >> changes would still be very useful for us.
> > > > What is the issue with root in user namespaces?
> > > >
> > > > I remember a few years ago it was seen as a major security issue bu=
t
> > > > don't remember if container runtimes were already using user namesp=
aces
> > > > back then.
> > > >
> > > > I guess the goal might be simply to minimize Linux capabilities as =
much
> > > > as possible?
> > > >
> > > > virtiofsd could nominally run with an arbitrary uid/gid but it stil=
l
> > > > needs the Linux capabilities that allow it to change uid/gid and
> > > > override file system permission checks just like the root user. Not
> > sure
> > > > if there is any advantage to running with uid 1000 when you still h=
ave
> > > > these Linux capabilities.
> > > >
> > > > Stefan
> > >
> > > When you run in a user namespace, virtiofsd would only have
> > > setuid/setgid over the range of UIDs mapped into the user namespace. =
 So
> > > if UID=3D0 on the host is not mapped, then the container can not crea=
te
> > > real UID=3D0 files on disk.
> > >
> > > Similarly you can protect the user directories and any content by
> > > running the containers in a really high UID Mapping.
> >
> > Roman, do user namespaces address your concerns about uid 0 in
> > containers?
> >
>=20
> They may eventually solve it. I would not let us hang up on this right no=
w,
> since as said at least in kubevirt we can't get rid right now of root
> anyway.
> Even if it is at some point in the future save and supported on
> bleeding-edge managed k8s clusters to allow ordinary users to run with ui=
d
> 0, from my perspective it is right now common to restrict namespaces with
> PodSecurityPolicies or SecurityContexts to not allow running pods as root
> for normal users.
> It is also common that a significant part of the community users run dock=
er
> and/or run on managed k8s clusters where they can not influence if
> user-namespaces are enabled, if they can run pods as root, if the runtime
> points to a seccomp file they like or if the runtime they prefer is used.
>=20
> But let me repeat again that we require root right now anyway and that we
> don't run the pods right now with the user privileges (but we should and =
we
> aim for that). Right now PSPs and SCCs restrict access to these pods by t=
he
> users.
> So for our use case, at this exact moment root is acceptable, the unshare
> call is a little bit more problematic.

Okay, thanks for explaining.

Stefan

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8kJqMACgkQnKSrs4Gr
c8jVbQgAyYO9cKSUW7EGV6IZ7kVySXKKq/gwb3J4AckA4/xQ8knhf6J8zm1zgsvE
jv3cEucwvyueZ5glj9NnZNQsnjT+SwduGbAhWYnR7ULbvV9k/3XqKUX545KcMK2F
FH8YtunI943cjlMnoHJvOOyCwUy/YUCspkTZU5kPhtcVx6121GvdYZs3pfoCR6cM
8woIQbaA6dwAh+zxtAHfUygMfXBWMutJ5eL38d/K2kp22pU7UyYIQhQV7Nh0zENe
KV4iWcdYZ8ca9F6end2ef+lN3GltrKgAZg2l952r6AKF9FcKCu3yp4xTR/fZGiq7
PLrJDYh/UN8BGWuXmwXbsHfwyuJrdw==
=uvXF
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


