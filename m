Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023221B6E92
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 08:59:01 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRsIe-000298-Mc
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 02:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eskultet@redhat.com>) id 1jRsHj-0001YS-AS
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 02:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eskultet@redhat.com>) id 1jRsHh-00006Q-MQ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 02:58:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54419
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1jRsHh-0008Um-7B
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 02:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587711479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjbDLZ6AgWIOgOTGl8FjPwsI1meFAu688o83UqZMSis=;
 b=FbCNMYdudxoX5T1GbEus/OpLv+eTlG7qbxPZXvOJ547g4OXfsqxhnUPopVX4ru6tDv8PhL
 ig6jI8fACAjBM3xA4uoaVNNVlFBpvMgXvzsLIhRkzEAd3/lrYZto0K6nhWg7vWr3n1LAxY
 HLyPYF8Wtb8+FPUxtCe3UlObPPvswDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-LcwZcsZLMuuq-GD3LB9stw-1; Fri, 24 Apr 2020 02:57:57 -0400
X-MC-Unique: LcwZcsZLMuuq-GD3LB9stw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDB4460;
 Fri, 24 Apr 2020 06:57:56 +0000 (UTC)
Received: from sturgeon.usersys.redhat.com (unknown [10.40.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 838251002380;
 Fri, 24 Apr 2020 06:57:48 +0000 (UTC)
Date: Fri, 24 Apr 2020 08:57:46 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/5] QEMU Gating CI
Message-ID: <20200424065746.GB372397@sturgeon.usersys.redhat.com>
References: <CAFEAcA8Lw94_=kY+Fv-cFW2Tk5RD62EjODjKdGf2-mLdDw7FuQ@mail.gmail.com>
 <1182067639.1655516.1584421185287.JavaMail.zimbra@redhat.com>
 <CAFEAcA-zRw7kzwzXxPmLaUqwOrQLwW9BymOJ34iJOOTCUAf=xg@mail.gmail.com>
 <20200317141257.GA5724@localhost.localdomain>
 <CAFEAcA9W4KXN6dcT0CNyD_mQ3xY5wDmJ7i0wowhaG2XPmyMYng@mail.gmail.com>
 <87sgi49uf6.fsf@dusky.pond.sub.org>
 <CAFEAcA_dcVneQ4Hj61GAkYRCUSMrA=QjwnAXccoBwjUjOE-wSQ@mail.gmail.com>
 <529508877.9650370.1587661453005.JavaMail.zimbra@redhat.com>
 <20200423171322.GJ1077680@redhat.com>
 <69e77a6e-8db8-f617-bfe6-1c8f39ec81b4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <69e77a6e-8db8-f617-bfe6-1c8f39ec81b4@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 02:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Wainer Moschetta <wmoschet@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 23, 2020 at 11:28:21PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 4/23/20 7:13 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Apr 23, 2020 at 01:04:13PM -0400, Cleber Rosa wrote:
> > > ----- Original Message -----
> > > > From: "Peter Maydell" <peter.maydell@linaro.org>
> > > > To: "Markus Armbruster" <armbru@redhat.com>
> > > > Cc: "Fam Zheng" <fam@euphon.net>, "Thomas Huth" <thuth@redhat.com>,=
 "Beraldo Leal" <bleal@redhat.com>, "Erik
> > > > Skultety" <eskultet@redhat.com>, "Alex Benn=C3=A9e" <alex.bennee@li=
naro.org>, "Wainer Moschetta" <wmoschet@redhat.com>,
> > > > "QEMU Developers" <qemu-devel@nongnu.org>, "Wainer dos Santos Mosch=
etta" <wainersm@redhat.com>, "Willian Rampazzo"
> > > > <wrampazz@redhat.com>, "Cleber Rosa" <crosa@redhat.com>, "Philippe =
Mathieu-Daud=C3=A9" <philmd@redhat.com>, "Eduardo
> > > > Habkost" <ehabkost@redhat.com>
> > > > Sent: Tuesday, April 21, 2020 8:53:49 AM
> > > > Subject: Re: [PATCH 0/5] QEMU Gating CI
> > > >=20
> > > > On Thu, 19 Mar 2020 at 16:33, Markus Armbruster <armbru@redhat.com>=
 wrote:
> > > > > Peter Maydell <peter.maydell@linaro.org> writes:
> > > > > > I think we should start by getting the gitlab setup working
> > > > > > for the basic "x86 configs" first. Then we can try adding
> > > > > > a runner for s390 (that one's logistically easiest because
> > > > > > it is a project machine, not one owned by me personally or
> > > > > > by Linaro) once the basic framework is working, and expand
> > > > > > from there.
> > > > >=20
> > > > > Makes sense to me.
> > > > >=20
> > > > > Next steps to get this off the ground:
> > > > >=20
> > > > > * Red Hat provides runner(s) for x86 stuff we care about.
> > > > >=20
> > > > > * If that doesn't cover 'basic "x86 configs" in your judgement, w=
e
> > > > >    fill the gaps as described below under "Expand from there".
> > > > >=20
> > > > > * Add an s390 runner using the project machine you mentioned.
> > > > >=20
> > > > > * Expand from there: identify the remaining gaps, map them to peo=
ple /
> > > > >    organizations interested in them, and solicit contributions fr=
om these
> > > > >    guys.
> > > > >=20
> > > > > A note on contributions: we need both hardware and people.  By pe=
ople I
> > > > > mean maintainers for the infrastructure, the tools and all the ru=
nners.
> > > > > Cleber & team are willing to serve for the infrastructure, the to=
ols and
> > > > > the Red Hat runners.
> > > >=20
> > > > So, with 5.0 nearly out the door it seems like a good time to check
> > > > in on this thread again to ask where we are progress-wise with this=
.
> > > > My impression is that this patchset provides most of the scripting
> > > > and config side of the first step, so what we need is for RH to pro=
vide
> > > > an x86 runner machine and tell the gitlab CI it exists. I appreciat=
e
> > > > that the whole coronavirus and working-from-home situation will hav=
e
> > > > upended everybody's plans, especially when actual hardware might
> > > > be involved, but how's it going ?
> > > >=20
> > >=20
> > > Hi Peter,
> > >=20
> > > You hit the nail in the head here.  We were affected indeed with our =
ability
> > > to move some machines from one lab to another (across the country), b=
ut we're
> > > actively working on it.
> >=20
> > For x86, do we really need to be using custom runners ?
> >=20
> > With GitLab if someone forks the repo to their personal namespace, they
> > cannot use any custom runners setup by the origin project. So if we use
> > custom runners for x86, people forking won't be able to run the GitLab
> > CI jobs.
> >=20
> > As a sub-system maintainer I wouldn't like this, because I ideally want
> > to be able to run the same jobs on my staging tree, that Peter will run
> > at merge time for the PULL request I send.
> >=20
> > Thus my strong preference would be to use the GitLab runners in every
> > scenario where they are viable to use. Only use custom runners in the
> > cases where GitLab runners are clearly inadequate for our needs.
> >=20
> > Based on what we've setup in GitLab for libvirt,  the shared runners
> > they have work fine for x86. Just need the environments you are testing
> > to be provided as Docker containers (you can actually build and cache
> > the container images during your CI job too).  IOW, any Linux distro
> > build and test jobs should be able to use shared runners on x86, and
> > likewise mingw builds. Custom runners should only be needed if the
> > jobs need todo *BSD / macOS builds, and/or have access to specific
> > hardware devices for some reason.

Not just ^that, you also want custom VM runners to run integration tests, e=
.g.
in libvirt, we'd have to put systemd and a lof of other cruft into the
container to be able to run the tests at which point you must ask yourself,
whyt not go with a VM instead in which case we're limited in terms of
infrastructure...

>=20
> Thanks to insist with that point Daniel. I'd rather see every configurati=
on
> reproducible, so if we loose a hardware sponsor, we can find another one =
and
> start another runner.
> Also note, if it is not easy to reproduce a runner, it will be very hard =
to
> debug a reported build/test error.

(Thanks for bringing ^this point up Philippe)

...However, what we've been actively working on in libvirt is to extend the
lcitool we have (which can spawn local test VMs) to the point where we're a=
ble
to generate machines that would be the reproducible. Right now I'm playing =
with
cloud-init integration with lcitool (patches coming soon) that would allow =
us
to use the same machines locally as we'd want to have in, say, OpenStack an=
d
share them as compressed images, so even when updated/managed by lcitool
locally, you'd get the same environment.

Regards,

--=20
Erik Skultety


