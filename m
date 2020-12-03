Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEAE2CDBF5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:11:07 +0100 (CET)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kks8C-00019p-Qb
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kks0T-0001ak-L4
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:03:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kks0O-0004IN-Qw
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607014974;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8r5zJ0Hmo3VSGAnTwxONst61BIT+sVxUrlwMRr+poQ=;
 b=etCZZy9viJwuvfqehRn525yGXXMpvtwQau+qWap9aHC+U7V852VBooCYspPXPvgAqmyuX9
 goeVOqQcscZg0tnUNObKd/5lWu3eYsJZt5BeyppIRrwL+VjlrHVptzNeLHoM/8TtiCpbJ0
 C+qsMBiGN+P7sNheiZW/wfl4g8W4Cbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-8cbP2BuNPXCJHuZUQPGLWg-1; Thu, 03 Dec 2020 12:02:48 -0500
X-MC-Unique: 8cbP2BuNPXCJHuZUQPGLWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48FA0858180;
 Thu,  3 Dec 2020 17:02:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABC527CA2;
 Thu,  3 Dec 2020 17:02:37 +0000 (UTC)
Date: Thu, 3 Dec 2020 17:02:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201203170233.GK2952498@redhat.com>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201203165033.GB2787993@localhost.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:50:33AM -0500, Cleber Rosa wrote:
> On Thu, Dec 03, 2020 at 10:37:01AM +0100, Philippe Mathieu-Daudé wrote:
> > On 12/2/20 10:57 PM, Cleber Rosa wrote:
> > > Currently in use Fedora 31 has been moved out of the standard download
> > > locations that are supported by the functionality provided by
> > > avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
> > > canceled by not being able to find those specific images.
> > > 
> > > Ideally, this would be bumped to version 33.  But, I've found issues
> > > with the aarch64 images, with various systemd services failing to
> > > start.  So to keep all archs consistent, I've settled on 32.
> > > 
> > > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > > ---
> > >  tests/acceptance/boot_linux.py | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> > > index 1da4a53d6a..0824de008e 100644
> > > --- a/tests/acceptance/boot_linux.py
> > > +++ b/tests/acceptance/boot_linux.py
> > > @@ -42,13 +42,13 @@ class BootLinuxBase(Test):
> > >          vmimage.QEMU_IMG = qemu_img
> > >  
> > >          self.log.info('Downloading/preparing boot image')
> > > -        # Fedora 31 only provides ppc64le images
> > > +        # Fedora 32 only provides ppc64le images
> > >          image_arch = self.arch
> > >          if image_arch == 'ppc64':
> > >              image_arch = 'ppc64le'
> > >          try:
> > >              boot = vmimage.get(
> > > -                'fedora', arch=image_arch, version='31',
> > > +                'fedora', arch=image_arch, version='32',
> > 
> > I already expressed my view on this (latest QEMU should be
> > able to use at least f31 - which was tested - and eventually
> > f33 - which is coverage extension). I'm not going to vouch
> > this change. If other maintainers are happy with it, I don't
> > mind this gets merged.
> > 
> > BTW I don't see why this is urgent for 5.2.
> > 
> > Phil.
> > 
> 
> Hi Phil,
> 
> Are you implying that, in your opinion, QEMU (say 5.2) should somehow
> provide compatibility with Fedora 31 because it was used during the
> entire cycle?  I sympathize with that, but, QEMU is not really
> advertising compatibility support with specific Linux Distros, is it?
> 
> And, assuming that the issues I found on the Fedora 33 aarch64 image
> can not be worked around, would you suggest not moving to 32?  I mean,
> I don't see a reason why QEMU shouldn't be able to use at least Fedora
> 32, which is a currently *active* version (different from 31).

I think the problem with the Fedora acceptance is that we'll be constantly
chasing a moving target. Every URL we pick will go away 6-12 months later.
IOW, while the acceptance test pass today, in 6 months time they'll be
failing.  IOW,  switching to F32 doesn't solve the root cause, it just
pushs the problem down the road for 6 months until F32 is EOL and hits
the same URL change problem.

One way to avoid this is to *not* actually  test a current Fedora.
Instead intentionally point at an EOL Fedora release whose URL has
already moved to the archive site which is long term stable.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


