Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5DD29355E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 09:00:16 +0200 (CEST)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUld1-0006CS-80
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 03:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1kUlbk-0005HJ-HL
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 02:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1kUlbi-0000Qx-2r
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 02:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603177133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQL1fvtD+tWuGfQoLUJH4jvHLGmVjpnq6aBvWI5dH2M=;
 b=RhKFtFLPZws6Lunt8PmIFytO3SPRBka7Aj/EkgItdKcC5Gwg25JvlBhAgd+sYVGqSJHT9z
 YmNQJirJnBU4XtjzRwoxyBcuLp2IbUS0/2TcZSx439litdTs3+L2Iki91aWfiW99lybPOL
 nAPncdLL4PKWPaf5E4675Xe9Nfzo9SE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-p_NvqUGRO4O8hc3bh6M3Gg-1; Tue, 20 Oct 2020 02:58:49 -0400
X-MC-Unique: p_NvqUGRO4O8hc3bh6M3Gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11176408B;
 Tue, 20 Oct 2020 06:58:47 +0000 (UTC)
Received: from nautilus (unknown [10.40.192.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39C961002397;
 Tue, 20 Oct 2020 06:58:42 +0000 (UTC)
Date: Tue, 20 Oct 2020 08:58:39 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v4 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
Message-ID: <20201020065839.GE495479@nautilus>
References: <20201019015003.1527746-1-crosa@redhat.com>
 <20201019015003.1527746-4-crosa@redhat.com>
 <20201019102610.GB495479@nautilus>
 <20201019204138.GC1617151@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201019204138.GC1617151@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 19, 2020 at 04:41:38PM -0400, Cleber Rosa wrote:
> On Mon, Oct 19, 2020 at 12:26:10PM +0200, Erik Skultety wrote:
> > On Sun, Oct 18, 2020 at 09:50:02PM -0400, Cleber Rosa wrote:
> > > To have the jobs dispatched to custom runners, gitlab-runner must
> > > be installed, active as a service and properly configured.  The
> > > variables file and playbook introduced here should help with those
> > > steps.
> > > 
> > > The playbook introduced here covers a number of different Linux
> > > distributions and FreeBSD, and are intended to provide a reproducible
> > > environment.
> > > 
> > > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > 
> > In general, there's been put quite some effort into the playbooks - sorry I'm
> > late to the game - is there a plan to introduce QEMU as a project to lcitool?
> 
> I think it's becoming quite clear that having so much duplication (in
> the dockerfiles, tests/vm, this playbook, etc) is costly and error
> prone.  I don't know if anyone has invested time in a PoC to
> consolidate those (with lcitool), but I can certainly see the upside
> to that.  BTW, are you volunteering (wink wink)? :)

I don't think I was trying to :), but sure, I can dedicate some time to it.
I'll need a bit of guidance in the QEMU world though for sure.

> 
> > We've taken care of most of the bits in the playbooks that are being introduced
> > and for the remaining ones I think it would be that big of an overhaul to do
> > the adjustments. One major re-factor though would IMO be to break the
> > dependency lcitool has on the machine naming, kind of restricting it to a
> > limited set of hosts and corresponding names (e.g. libvirt-fedora-32) which
> > makes it inconvenient to prepare physical hosts.
> >
> 
> Right... I wasn't aware of that depedency.  And, this may be a nice
> project to make sure that lcitool doesn't have any other libvirt
> specificities.

Yeah, that one will be a major change. Thinking about this some more, while
having a QEMU project inside lcitool sounds definitely useful, it would
probably be a wasted effort wrt task priority right now, because without
expanding lcitool's range of applicable hosts I don't see how QEMU would
utilize the tool without using quirks.

> 
> > More comments inline...
> > 
> > >  docs/devel/ci.rst                  | 63 ++++++++++++++++++++++++++
> > >  scripts/ci/setup/.gitignore        |  1 +
> > >  scripts/ci/setup/gitlab-runner.yml | 72 ++++++++++++++++++++++++++++++
> > >  scripts/ci/setup/vars.yml.template | 13 ++++++
> > >  4 files changed, 149 insertions(+)
> > >  create mode 100644 scripts/ci/setup/.gitignore
> > >  create mode 100644 scripts/ci/setup/gitlab-runner.yml
> > >  create mode 100644 scripts/ci/setup/vars.yml.template
> > > 
> > > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > > index 208b5e399b..a234a5e24c 100644
> > > --- a/docs/devel/ci.rst
> > > +++ b/docs/devel/ci.rst
> > > @@ -84,3 +84,66 @@ To run the playbook, execute::
> > >  
> > >    cd scripts/ci/setup
> > >    ansible-playbook -i inventory build-environment.yml
> > > +
> > > +gitlab-runner setup and registration
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +The gitlab-runner agent needs to be installed on each machine that
> > > +will run jobs.  The association between a machine and a GitLab project
> > > +happens with a registration token.  To find the registration token for
> > > +your repository/project, navigate on GitLab's web UI to:
> > > +
> > > + * Settings (the gears like icon), then
> > > + * CI/CD, then
> > > + * Runners, and click on the "Expand" button, then
> > > + * Under "Set up a specific Runner manually", look for the value under
> > > +   "Use the following registration token during setup"
> > > +
> > > +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> > > +``scripts/ci/setup/vars.yml``.  Then, set the
> > > +``gitlab_runner_registration_token`` variable to the value obtained
> > > +earlier.
> > > +
> > > +.. note:: gitlab-runner is not available from the standard location
> > > +          for all OS and architectures combinations.  For some systems,
> > > +          a custom build may be necessary.  Some builds are avaiable
> > > +          at https://cleber.fedorapeople.org/gitlab-runner/ and this
> > > +          URI may be used as a value on ``vars.yml``
> > 
> > Yes, this can be suboptimal...Would it make sense to fall back to build the
> > binary of a given version from git as a fallback during this playbook if the
> > necessary arch version isn't provided the official way? Just an idea, I'd like
> > to avoid the need for you to become the maintainer of the binaries and keep up
> > with the releases.
> >
> 
> Well, building them during the playbook would be a lot more
> complex... You can have your own repo with your own builds, and just
> tweak your vars.yml.

I didn't want to suggest this as a replacement to vars.yml.
What if people wanting to run the playbook don't have their own repo and you
(I mean you personally) are not providing a fresh build of gitlab-runner for
the given architecture?
The automation machinery would surely be more complex, but at the same time,
I can image a dedicated playbook that would handle gitlab-runner building and
installation of the binary to the correct place, you'd then simply include that
playbook if vars.yml don't specify an alternative repo and download from AWS
failed.
Another thing to consider - you currently host the missing arch builds under
your personal namespace on fedorapeople, what if you decide one day you're not
interested in being involved in QEMU CI that much and suddenly you stop
building the binaries, someone has to take over. On the other hand, if you
automate this whole process, having exposed the builds would definitely not
slow down machine provisions, but would also not cause them to fail if nobody
exposes them.

> 
> > > +
> > > +To run the playbook, execute::
> > > +
> > > +  cd scripts/ci/setup
> > > +  ansible-playbook -i inventory gitlab-runner.yml
> > > +
> > > +.. note:: there are currently limitations to gitlab-runner itself when
> > > +          setting up a service under FreeBSD systems.  You will need to
> > > +          perform steps 4 to 10 manually, as described at
> > 
> > Which one of them is considered an automation problem? In lcitool we made
> > gitlab-runner completely automated on all distros, including FreeBSD:
> >
> 
> It looks like lcitool went the more practical route.  I was hoping to
> not have to treat gitlab-runner in such a special way in any
> "supported" OS.  What I mean is, I'd rather write the code within
> gitlab-runner (or reespective libraries).  Of course, I did not get to
> it, so that's why I just documented the steps here.
> 
> I'll take a look at lcitool's playbook to see if I can easily
> canibalize some of that.  But, at this time, we don't runners for
> FreeBSD anyway, so I guess this is not *that* urgent.

Okay, I was simply curious. If it's not something you don't need at the moment,
then let's not focus on it.

> 
> > 4) log file permissions - you're creating the user, you can as well create the
> > file with correct permissions
> > 
> > 5) ensure /usr/local/etc/rc.d exists - once you execute build-environment.yml
> > it will pull a bunch of dependencies which ensure the dir exists
> > 
> > 6) gitlab_runner service script should IMO provided by this automation as a
> > template and install to the correct location
> > 
> > 7) ensure the service script is executable - template module can do that
> > 
> > 8) register the runner - you're doing that
> > 
> > 9) enable the service - Ansible's service module is generic and supports
> > init/OpenRC
> > 
> > 10) I don't see a step 10
> >
> 
> This was either a mistake or the installation steps got updated.  I'll
> adjust that.
> 
> > IOW I think there should be as little manual intervention as possible and in
> > this case I don't think any manual steps are needed by the user.
> >
> 
> Agreed.  I was not super happy with the current state of this playbook
> wrt FreeBSD, but I decided to pick other battles to fight.  Also,
> newer gitlab-runner versions *may* be using the updated service
> management lib, which may reduce/remove the need for custom handling.

What do you mean by "service management lib"?

Regards,
Erik


