Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C56CDA0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 13:44:20 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho4pf-0003wx-Ss
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1ho4pN-0003KY-QH
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ho4pM-0000wN-F8
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:44:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19112)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ho4pM-0000tT-9K
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A20B78F915;
 Thu, 18 Jul 2019 11:43:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73ABF600D1;
 Thu, 18 Jul 2019 11:43:54 +0000 (UTC)
Date: Thu, 18 Jul 2019 12:43:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190718114352.GE15411@redhat.com>
References: <cb727b5d-683f-115d-f3c0-06f5a6761aea@redhat.com>
 <126a3ec4-f5e3-0590-011a-9c2a10d07b24@redhat.com>
 <bf5da6c7-74c1-8950-2869-2d94419f1820@redhat.com>
 <CAL1e-=iLLQfAdfFrKpAT9k48X0sEMevBXFWAmny7PRPwtBMiEQ@mail.gmail.com>
 <4367860f-5226-ec42-6407-f50dfd96270b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4367860f-5226-ec42-6407-f50dfd96270b@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 18 Jul 2019 11:43:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] No archives to download from www.qemu.org/download/
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 18, 2019 at 01:29:02PM +0200, Thomas Huth wrote:
> On 18/07/2019 12.55, Aleksandar Markovic wrote:
> > On Thu, Jul 18, 2019 at 10:58 AM Philippe Mathieu-Daud=C3=A9 <philmd@=
redhat.com>
> > wrote:
> >>
> >> On 7/18/19 9:10 AM, Thomas Huth wrote:
> >>> On 18/07/2019 08.25, Philippe Mathieu-Daud=C3=A9 wrote:
> >=20
> >>>> ...
> >=20
> >>>> Now there are no archive to download at this url...
> >>>
> >>> You just have to click on the "Source code" tab ... is that too har=
d?
> >>
> >> Argh it has been a rough night, now I feel ashamed. I scrolled but
> >> missed that tab. Really sorry for crying wolf here :/
> >>
> >=20
> > Download QEMU page <https://www.qemu.org/download/>
> >=20
> > In all fairness to Philippe, this page could be better in terms of
> > human-computer interaction... If one presses 'Download', one
> > expects to get to the download links directly or obviously easily.
>=20
> I guess we should simply re-arrange the order of the tabs ... the
> OS-agnostic source code tab should come first (since this is about what
> we provide for download on our site), and then the others with
> references to the distros etc.

I'm not sure it is clear cut. I think its reasonable to say that users
coming to QEMU are best served by using distro provided packages. Only
those wishing to actually hack on QEMU, or who need newer than the
distro provides, should prefer the source. Building from source has many
more potential hurdles / failure points than installing distro packages,
which can leave users with a worse first experience of QEMU.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

