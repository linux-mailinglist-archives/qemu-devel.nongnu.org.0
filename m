Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BB310FA4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:13:23 +0100 (CET)
Received: from localhost ([::1]:49342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85be-0003R7-Ih
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l84uo-00033N-K7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:29:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l84ul-0007gU-Po
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612546142;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHxtG8YFOgYvIo7X6EsgsJ4/KFLHH9EYwl7VeEGzM/U=;
 b=TY87dhLeRzvhEzCgjn0HeqN0mdIsdOapRKYSB+U5Uu+WFp2TqdOz0DiBNofbZLXpnZzt5v
 tH7W3XuF7KWa2UUP7eqMQIljxDSOBwzRBgGwwx1LdhjHTStywANre0QXGOjfMr1AW8mkDG
 XF4uXVFImKJRp7aG5zMtLk9SnS5vHnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-cb6wwGpLM6WYIZv6GoaG7g-1; Fri, 05 Feb 2021 12:28:53 -0500
X-MC-Unique: cb6wwGpLM6WYIZv6GoaG7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D301107ACE4;
 Fri,  5 Feb 2021 17:28:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E724B19C47;
 Fri,  5 Feb 2021 17:28:47 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:28:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/1] tests/acceptance/boot_linux: Switch to Fedora 32
Message-ID: <20210205172844.GT908621@redhat.com>
References: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
 <20c6fbf7-3000-0ef4-cdb1-31d748878206@redhat.com>
 <9955636f-507f-3b6a-d403-d23c4b78f01e@linux.vnet.ibm.com>
 <b8dd87b0-b0d1-0d7b-29db-686a60ceb930@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b8dd87b0-b0d1-0d7b-29db-686a60ceb930@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 05:54:24PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Wainer,
> 
> On 1/28/21 11:06 PM, Daniele Buono wrote:
> > On 1/28/2021 3:19 PM, Wainer dos Santos Moschetta wrote:
> >> Hi,
> >>
> >> On 1/26/21 10:09 PM, Daniele Buono wrote:
> >>> Local acceptance tests run with "make check-acceptance" are now
> >>> showing some cases canceled like the following:
> >>>
> >>> (01/39)
> >>> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
> >>> CANCEL: Failed to download/prepare boot image (0.25 s)
> >>>
> >>> Turns out, every full-vm test in boot_linux.py is trying to use a
> >>> Fedora 31 cloud image and is failing, with Avocado refusing to download
> >>> it, presumably because Fedora 31 is EOL.
> >>>
> >>> This patch moves to Fedora 32, which is still supported. And seem to
> >>> work fine
> >>
> >> While ago it was discussed about updating the Fedora version which, in
> >> my opinion, ended up without a conclusion. Please see the complete
> >> thread in:
> >>
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763986.html
> > 
> > Oops, didn't notice the previous thread. Apologies for the duplicate!
> > 
> >>
> >> I'm CC'ing Daniel Berrrangé so that, perhaps, we could resume the
> >> discussion.
> 
> The first question I'd like to figure out is how/where can we archive
> the artifacts being tested by the project. As we maintain stable tags,
> I'm more worried about regressions affecting LTS use rather than
> recently added features which get more coverage and activity.
> Is this too conservative for acceptance testing?

I think there's multiple issues to worry about, one short
term, the others long term.

The most immediate issue is that we are pointing to an EOL
Fedora release with broken download URL.

While we could update to F 32, that doesn't solve the problem.
It will burn us again in just a few months when F34 comes out
making F32 EOL. We need a long term solution.


The broader long term question is what our goals are for the
acceptance tests.

I think the primary goal is detect regressions in QEMU where
we break something which used to work.  To achieve this we don't
need to be chasing distro releases. It is fine for us to be
testing an EOL distro. The fact that it is EOL doesn't invalidate
the test behaviour.

The only problem switch EOL distros is the URL breakge. That is
trivially solved in the Fedora case by downloading from the
archive.fedoraproject.org server instead of main server. Problem
solved forever.


The more important long term question is whether the selection of
distros we are testing gives us coverage which exercises all the
scenarios that we care about.

For example, considering virtio devices, we need

 - Guest OS which *only* has virtio legacy mode implemented
     - pc for PCI 
     - q35 for PCI-e
   Proves deices work in legacy mode on both PCI and PCIe
 
 - Guest OS which has both legacy and modern mode implemented
     - pc for PCI 
     - q35 for PCI-e
   Proves devices work in transitional mode (pc) and
   modern-only mode (PCI-e)


So for virtio coverage, we'll need 2 guest OS, each with two
scenarios as a starting point.  RHEL-6 is an example of a
distro that was legacy only. Anything newer does the other
case.

But then we need to expand the axis to non-x86 too, most
especially for ppc64 and s390, which have non-PCI based
options as well as PCI.

Periodically a new virtio device will arrive (eg virtiofs)
and that might mean we need to add another test scenario, or
upgrade the more modern OS in an existing test scenario.
This is reasonably infrequent though, so in general we won't
need to be chasing the bleeding edge distros.


The matrix can grow pretty damn fast, and we need to keep it
under control. One way to deal with that is to have one test
case cover multiple features. eg don't run a separate test
for each of virtio-net, virtio-blk, virtio-scsi. Launch a
single VM in which we can test all of them at once.

Also we don't need to test all of Ubuntu, Fedora, RHEL, SUSE
if all those distros are basically exercising the same set
of QEMU device code paths. ie just becuase the distro is
different, doesn't mean it adds value to the test coverage.

We should be strongly driven by whether the distro exercises
a feature that isn't already covered by an existing test.


So the next question is what needs to be in our matrix ?
Most downstream vendors will say it needs to be all KVM related
features. QEMU as a project though also cares more broadly
about many more devices for emulating older platforms.
There's some balance to be struck here.


On many previous occassions we've talked about classifying
QEMU features into support tiers. If we had a view of what
our support tiers were for each feature, this would in turn
show us where to spend effort in building up testing coverage.

I made an abortive start at trying to define what tiers might
mean but didn't get into really classifying features 

   https://wiki.qemu.org/Support_Tiers

don't pay attention to the host/guest classifications I did
there - I was mostly just playing with how to represent it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


