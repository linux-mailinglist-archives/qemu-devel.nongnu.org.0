Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB061022EC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:20:22 +0100 (CET)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX1YT-0007rI-Fh
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iX1X0-0007F8-Nf
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iX1Wz-0005LX-20
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:18:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57204
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iX1Wy-0005Kz-Tq
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574162328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Snfb7zSSVHhDNzI/t/v6fob2kQQssNDZ1eYitArqRuE=;
 b=fk+T+5iu9SVW//L5oAgywyRcANyPHRNTWiXa/uPyN7yuHtScpgx7TvlaZVSViMo7MDYn88
 wdkTcDc2w6FpEN/qFPb6vQfvDd5e6PKA43uJN/RN54h7JPSkRhc1+F+0o54faofU7a/tpn
 SWbypQleVJzJJXpAR/mLJeWPD3ifMjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-hYNF4A-iPwSYYOa4jaxw0Q-1; Tue, 19 Nov 2019 06:18:47 -0500
X-MC-Unique: hYNF4A-iPwSYYOa4jaxw0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B67107ACC4;
 Tue, 19 Nov 2019 11:18:46 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-75.ams2.redhat.com [10.36.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C036F1E9;
 Tue, 19 Nov 2019 11:18:42 +0000 (UTC)
Date: Tue, 19 Nov 2019 12:18:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 0/8] blockdev: avoid acquiring AioContext lock twice
 at do_drive_backup and do_blockdev_backup
Message-ID: <20191119111840.GA5910@linux.fritz.box>
References: <20191112113012.71136-1-slp@redhat.com>
 <157359898425.22470.3655469789274855006@37313f22b938>
 <87pnhwt9xm.fsf@redhat.com> <87h837ucxa.fsf@redhat.com>
 <34ffd31f-66c4-59f5-ead1-b2df449ecee6@redhat.com>
 <87d0docf0s.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87d0docf0s.fsf@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 19.11.2019 um 11:54 hat Sergio Lopez geschrieben:
>=20
> Max Reitz <mreitz@redhat.com> writes:
>=20
> > On 13.11.19 14:24, Sergio Lopez wrote:
> >>=20
> >> Sergio Lopez <slp@redhat.com> writes:
> >>=20
> >>> no-reply@patchew.org writes:
> >>>
> >>>> Patchew URL: https://patchew.org/QEMU/20191112113012.71136-1-slp@red=
hat.com/
> >>>>
> >>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> This series failed the docker-quick@centos7 build test. Please find =
the testing commands and
> >>>> their output below. If you have Docker installed, you can probably r=
eproduce it
> >>>> locally.
> >>>>
> >>>> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> >>>> #!/bin/bash
> >>>> make docker-image-centos7 V=3D1 NETWORK=3D1
> >>>> time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> >>>> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >>>>
> >>>>   TEST    iotest-qcow2: 268
> >>>> Failures: 141
> >>>
> >>> Hm... 141 didn't fail in my test machine. I'm going to have a look.
> >>=20
> >> So here's the output:
> >>=20
> >> --- /root/qemu/tests/qemu-iotests/141.out=092019-11-12 04:43:27.651557=
587 -0500
> >> +++ /root/qemu/build/tests/qemu-iotests/141.out.bad=092019-11-13 08:12=
:06.575967337 -0500
> >> @@ -10,6 +10,8 @@
> >>  Formatting 'TEST_DIR/o.IMGFMT', fmt=3DIMGFMT size=3D1048576 backing_f=
ile=3DTEST_DIR/t.IMGFMT backing_fmt=3DIMGFMT
> >>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> >>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> >> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "job0"}}
> >> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> >>  {"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: nod=
e is used as backing hd of 'NODE_NAME'"}}
> >>  {"return": {}}
> >>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "e=
vent": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
> >>=20
> >> Those extra lines, the "paused" and "running", are a result of the job
> >> being done in a transaction, within a drained section.
> >>=20
> >> We can update 141.out, but now I'm wondering, was it safe creating the
> >> job at do_drive_backup() outside of a drained section, as
> >> qmp_drive_backup was doing?
> >
> > I think it is.  Someone needs to drain the source node before attaching
> > the job filter (which intercepts writes), and bdrv_backup_top_append()
> > does precisely this.
> >
> > If the source node is in an I/O thread, you could argue that the drain
> > starts later than when the user has invoked the backup command, and so
> > some writes might slip through.  That=E2=80=99s correct.  But at the sa=
me time,
> > it=E2=80=99s impossible to drain it the instant the command is received=
.  So
> > some writes might always slip through (and the drain will not stop them
> > either, it will just let them happen).
> >
> > Therefore, I think it=E2=80=99s fine the way it is.
> >
> >> Do you think there may be any potential drawbacks as a result of alway=
s
> >> doing it now inside a drained section?
> >
> > Well, one drawback is clearly visible.  The job goes to paused for no
> > reason.
>=20
> This is something that already happens when requesting the drive-backup
> through a transaction:
>=20
> {"execute":"transaction","arguments":{"actions":[{"type":"drive-backup","=
data":{"device":"drv0","target":"o.qcow2","sync":"full","format":"qcow2"}}]=
}}
>=20
> I don't think it makes sense to have two different behaviors for the
> same action. So we either accept the additional pause+resume iteration
> for qmp_drive_backup, or we remove the drained section from the
> transaction based one.
>=20
> What do you think?

Draining all involved nodes is necessary for transactions, because you
want a consistent backup across all involved disks. That is, you want it
to be a snapshot at the same point in time for all of them - no requests
may happen between starting backup on the first and the second disk.

For a single device operation, this requirement doesn't exist, because
there is nothing else that must happen at the same point in time.

Kevin

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJd08+QAAoJEH8JsnLIjy/WwiEP/0LJMHj7+FcOBT/AU/fJIErN
BTfVu+jzsic4F7K8l7n051xWzep5nWJwVkppSwZ3wPVcS+uvPPp8OvkiQhKxgZlM
zNDPWwqZreZnGJbARjNcjwBWnNA9lRlj8Op8j59YZLj5/kdpBuuKLKx0++M6JBYF
RoG8yAg8zV8GQARna1sCCFEYxl6YkJdtjxHpTnIAtjRugjAJEGUGXvYgA9A7LtGt
LEhPLMDZrCvDLpvlF/36P6ucucFfkyJQ8nOIDdCPORFvVVDkQT6HUQqJE4LSsJ3U
ErnYw/OzBB65fsHzlvY8A/sSExyrWos9DG7TaZL/GyBu4TvY78EAAR6V0wzF0XbC
SCpsxauAl+N3wg+USic2Ov2GRn9mgSnOUHXqwM/R1pqn00nP2g+mmHIC3whzgKPI
1Fpk3NLsDHd5ciBDUbVskobFo9d9kjkUaTDkzImvW9cp7psjl0hQTG22j0ap6Jtx
HwV6xze4tMhZUtDY3OfQP2pA0hVbV7vIUz0j9VG1snJQHwOW0xw9j9YJkEXB9Aiq
+/8BR9ZVStWP/NuoFsHjGCg0AlIHR+EvzScAOw2I4kBzL1f06HZNV5wbUErCr6+G
zBJHWmv0dKxBWFuJx9YQfYgxXvnmkqi2XO+fKgx+mN6/qBbL7ipXY4h8ZCHOgLhL
BrmvPvlJ9sDvQAnXqYXP
=3LUx
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


