Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B7190B30
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 11:36:26 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGgv3-0004oJ-Up
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 06:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jGgtw-0003kj-Pd
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jGgtv-0005qa-Gi
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:22646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jGgtv-0005qE-CI
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585046115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCNjWsS0TWh5rO7RA6cL4rKhejw8GdmOmqMLNeiUbns=;
 b=Fd5IIlDIQDaYRRO5KctdTbCjEJ1kAbwNOqq3f6tIaIJakMg6gm76CTA6k6kTIuamDj6x7a
 dTEfFw6Gl5/3W/EPM7HhvMMra3PmUw15ka5LlU0Hb/lLohrtj4GuwRjb5FdMGrOFpwbxLi
 gVCxXE4AHwdKED5DHanSnykuIcWYahg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-rozzmIYdNqOi8lIO40nlYg-1; Tue, 24 Mar 2020 06:35:11 -0400
X-MC-Unique: rozzmIYdNqOi8lIO40nlYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4840018C8C00;
 Tue, 24 Mar 2020 10:35:10 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5A519C6A;
 Tue, 24 Mar 2020 10:35:08 +0000 (UTC)
Date: Tue, 24 Mar 2020 11:35:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] iotests: drop group file
Message-ID: <20200324103507.GF5417@linux.fritz.box>
References: <20200324074156.5330-1-vsementsov@virtuozzo.com>
 <20200324093629.GC5417@linux.fritz.box>
 <9ef27fe0-ef6e-ede7-7d8e-bc5331cd907e@virtuozzo.com>
 <20200324102138.GD3597586@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200324102138.GD3597586@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.03.2020 um 11:21 hat Daniel P. Berrang=E9 geschrieben:
> On Tue, Mar 24, 2020 at 01:02:18PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
> > 24.03.2020 12:36, Kevin Wolf wrote:
> > > Am 24.03.2020 um 08:41 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > When sending iotests to upstream or do patch porting from one branc=
h
> > > > to another we very often have to resolve conflicts in group file, a=
s
> > > > many absolutely independent features are intersecting by this file.
> > > > These conflicts are simple, but imagine how much time we all have
> > > > already spent on resolving them? Let's finally get rid of group fil=
e.
> > > >=20
> > > > This patch transposes group info: instead of collecting it in one f=
ile,
> > > > let each test define its groups by itself.
> > > >=20
> > > > Several steps are done to achive it:
> > > >=20
> > > > 1. Define groups in test files automatically:
> > > >=20
> > > >      grep '^[0-9]\{3\} ' group | while read line; do
> > > >          file=3D$(awk '{print $1}' <<< "$line");
> > > >          groups=3D$(sed -e 's/^... //' <<< "$line");
> > > >          awk "NR=3D=3D2{print \"# group: $groups\"}1" $file > tmp;
> > > >          cat tmp > $file;
> > > >      done
> > > >=20
> > > > 2. Copy groups documentation into docs/devel/testing.rst, which alr=
eady
> > > >     has a section about iotests.
> > > >=20
> > > > 3. Modify check script to work without group file.
> > > >=20
> > > >     Here is a logic change: before, even if test do not belong to a=
ny
> > > >     group (only iotest 142 currently) it should be defined in group
> > > >     file. Now, test is not forced to define any group. Instead chec=
k
> > > >     considers all files with names matching [0-9][0-9][0-9] as test=
s.
> > >=20
> > > This has both a positive and a negative effect: Now you don't have to
> > > modify another file when you add a new test, but it will be picked up
> > > automatically. However, if you want to disable a test, you could
> > > previously just remove it from groups (or comment it out), and now yo=
u
> > > have to delete the test instead.
> >=20
> > Hmm. Probably, you could add it to group "disabled", and run check -x d=
isabled.
>=20
> As a developer you don't really want to be making changes to git tracked
> files in order to temporarily skip a test, as then git reports them as
> modified & you risk accidentally committing throwaway changes.
>=20
> Better to have a separate groups.local file to record local overrides
> in a non-tracked file.

For locally disabling tests, we have that 'expunged' file that nobody
knows about and that I just found when we were reformatting the ./check
output...

I wouldn't want to use that for disabling the tests in a downstream
repository, though, it should stay a local thing even there.

Kevin


