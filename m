Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720722CEFA5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:21:17 +0100 (CET)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBxU-0001xQ-HZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klBw1-0001Q7-Qv
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klBvy-0001yk-JT
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607091581;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxw2F4VAMaoxxrd/awT32yJnwQo97mAKA0qxL05A2ds=;
 b=IjlRlIyqbLeXo8rwVKvwpUytXpAoLGjCH0DGO6+hHQFrUxAdiq2ory9tqtv/d+rINpAkff
 yJxHkyANCLqiav6JrkxpF79yHL82NiN5uZkg1esNybriFhYm8I/U4j0GbcIgHU+1NeaLNd
 onvLtN7EsmIRka8KGMmZROFuzlm+kbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-R_xcaAgPNFKCRUGfERpAsA-1; Fri, 04 Dec 2020 09:19:36 -0500
X-MC-Unique: R_xcaAgPNFKCRUGfERpAsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C60A185E484;
 Fri,  4 Dec 2020 14:19:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08F0F60C15;
 Fri,  4 Dec 2020 14:19:28 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:19:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201204141926.GK3056135@redhat.com>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
 <20201203170233.GK2952498@redhat.com>
 <5ee763b3-379e-45f7-2716-9b7e073d3ec7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5ee763b3-379e-45f7-2716-9b7e073d3ec7@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 03:08:52PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/3/20 6:02 PM, Daniel P. Berrangé wrote:
> > On Thu, Dec 03, 2020 at 11:50:33AM -0500, Cleber Rosa wrote:
> >> On Thu, Dec 03, 2020 at 10:37:01AM +0100, Philippe Mathieu-Daudé wrote:
> >>> On 12/2/20 10:57 PM, Cleber Rosa wrote:
> >>>> Currently in use Fedora 31 has been moved out of the standard download
> >>>> locations that are supported by the functionality provided by
> >>>> avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
> >>>> canceled by not being able to find those specific images.
> >>>>
> >>>> Ideally, this would be bumped to version 33.  But, I've found issues
> >>>> with the aarch64 images, with various systemd services failing to
> >>>> start.  So to keep all archs consistent, I've settled on 32.
> >>>>
> >>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >>>> ---
> >>>>  tests/acceptance/boot_linux.py | 12 ++++++------
> >>>>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> >>>> index 1da4a53d6a..0824de008e 100644
> >>>> --- a/tests/acceptance/boot_linux.py
> >>>> +++ b/tests/acceptance/boot_linux.py
> >>>> @@ -42,13 +42,13 @@ class BootLinuxBase(Test):
> >>>>          vmimage.QEMU_IMG = qemu_img
> >>>>  
> >>>>          self.log.info('Downloading/preparing boot image')
> >>>> -        # Fedora 31 only provides ppc64le images
> >>>> +        # Fedora 32 only provides ppc64le images
> >>>>          image_arch = self.arch
> >>>>          if image_arch == 'ppc64':
> >>>>              image_arch = 'ppc64le'
> >>>>          try:
> >>>>              boot = vmimage.get(
> >>>> -                'fedora', arch=image_arch, version='31',
> >>>> +                'fedora', arch=image_arch, version='32',
> >>>
> >>> I already expressed my view on this (latest QEMU should be
> >>> able to use at least f31 - which was tested - and eventually
> >>> f33 - which is coverage extension). I'm not going to vouch
> >>> this change. If other maintainers are happy with it, I don't
> >>> mind this gets merged.
> >>>
> >>> BTW I don't see why this is urgent for 5.2.
> >>>
> >>> Phil.
> >>>
> >>
> >> Hi Phil,
> >>
> >> Are you implying that, in your opinion, QEMU (say 5.2) should somehow
> >> provide compatibility with Fedora 31 because it was used during the
> >> entire cycle?  I sympathize with that, but, QEMU is not really
> >> advertising compatibility support with specific Linux Distros, is it?
> 
> What I don't understand is why you remove F31 and not simply add a F32
> test. Why should I stop testing F31 if I have it cached?

Well we can't let the list of OS increase unbounded.

IMHO there's not enough changes between each Fedora release to justify
keeping them all. Same for any other short life distro.

If we're trying to get a variety of coverage, I'd suggest we focus on
the long life distros for old stuff. eg RHEL-5, RHEL-6, RHEL-7, etc
all have large enough differences in their virtual hardware to justify
having a test for each major version.

We could then just have 1 recent-ish Fedora as a way to get coverage of
the cutting edge.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


