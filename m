Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68E2DDA34
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:38:52 +0100 (CET)
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq031-0000Z7-C9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzzQ-0006Qb-S8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzzO-00073T-TX
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608237305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZT8xugnMLiCfvSpOS7aGDo0OdcwAef2DXB2gEEIXrA=;
 b=Cheuo8W0Ndm6VHn+93dT8A2zs7jeC21llRyHTOalrwVRgLTwSBB/Mp4YTmN6eaurAkL1j9
 sQFSUkD1nbIQIiARnP0AaZ21nHoHPZjQJPjTGljbFetGVJrI2HSOF8o6+tMaz4Rw/JSn/r
 s2Hw+YVnRVSBrO22iOh0IRc2jn5Ak1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-BzZJo7x-NhSiBthtfPlNtg-1; Thu, 17 Dec 2020 15:35:03 -0500
X-MC-Unique: BzZJo7x-NhSiBthtfPlNtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B85B8015C6;
 Thu, 17 Dec 2020 20:35:02 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50DE6669EC;
 Thu, 17 Dec 2020 20:35:01 +0000 (UTC)
Date: Thu, 17 Dec 2020 20:34:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Logging, abnormal cases, ...
Message-ID: <20201217203458.GQ4117@work-vm>
References: <5517eec6-1b0f-7c36-c1a7-61bd24bfb6cd@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <5517eec6-1b0f-7c36-c1a7-61bd24bfb6cd@msgid.tls.msk.ru>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> Hi!
> 
> I want to bring a topic which is mostly neglected in qemu but it is
> one of very important, especially for serious usage of qemu.
> 
> This is about logging of various events or even some unexpected events
> coming from guest.
> 
> Let's see for example a very easy to understand situation: a virtual
> disk image of a VM runs out of space _on the host_, so that qemu does
> not have space to write newly allocated blocks to.  What does it do?
> By default it pauses the VM and just sits there waiting. But does it
> lets someone to know that it run onto something which it can't handle?
> Does it write at least some information about it somewhere?
> 
> I know this very situation should not happen in any serious environment
> to start with, but everything happens, and the should ring a very loud
> bell somewhere so that people can react sooner than later after numerous
> attempt to _understand_ what's going on.
> 
> What I'm talking about is that we should have some standard way of
> logging such events, at least, or a way of notifying something about these.
> Including for example start/stop, suspend/resume, migration out/migration
> in etc - while these might look like a job of some management layer on
> top of qemu (like libvirt), it's still better do that in qemu so that
> all possible tools using it will benefit.
> 
> But it is not restricted to such global events like outlined already,
> there are much more interesting cases there. For another example,
> there's a lot of places where qemu checks validity of various requests
> coming to virtual hardware it emulates, - so that DMA is done to a
> valid address, register holds valid index, etc etc. A majority of
> these checks results in a simple error return or even abort().
> But it'd be very interesting to be able to log these events, maybe
> with some context, and be able to turn that logging on/off at runtime.
> 
> The thing is - there ara at least 2 types of guests out there, one
> is possible "hostile" - this is what all the recent CVEs are about,
> it is possible to abuse qemu in one way or another by doing some
> strange things within a guest. And another is entirely different -
> a "friendly" guest which is here just for easy management, so that
> various migrations, expansions and reconfigurations are possible.
> And there, it should not do evil things, and if it does, we'd better
> know about that, as it is a possible bug which might turn into a
> smoking gun one day.
> 
> The other day we had a quite bad system crash in a VMWare environment
> which resulted in a massive data loss, interruption of service and
> lots of really hard work for everyone.  A crash which actually started
> after vmware side discovered that it does not have any place where to
> put a new write for a (production, "friendly") guest. After that issue
> were fixed, there were several more conditions _like_ this happened, -
> not with lack of free space, but with the same freezing, vmware stopped
> the guest for a few seconds several times, and I've seen brief change
> in the guest's icon color (turning to red) in the monitor at least twice,
> during these freezes. But there's nothing in the logs - *why* it stopped
> the guest, what happened?? - nothing's left.  And finally it crashed
> hard after live-migrating the VM into another host with larger capacity
> storage - at the moment the migration finished, the VM freeze for a few
> seconds, there was tons of kernel messages about stuck processes and
> kernel threads after that, and, among other things, there were a few
> error messages about failed writes into the (virtual) storage. Which,
> in turn, hit some bugs in oracle and finally the db become corrupt and
> oracle instance refused to open it in any way, crashing with sigsegvs
> at startup, so we had to resort to the harder way.

I'm glad it's not just me who has hard migration problems!

> The thing was that there was absolutely nothing on the vmware side,
> even the fact of migration weren't obvious in its logs. I bet there
> were some inconsistences within data request handling from the guest
> at least, or if system clocks were different this could have been
> logged too, or anything else not-so-expected. But there's nothing,
> so we don't sill know what happened. Sure it is a bug somewhere,
> maybe several bugs at once (vmware tools are running in the vm and
> the hypervisor surely can assume a safe state of the vm while doing
> last steps of the migration, oracle should not sigsegv on bad blocks,
> and so on). But if there were logs, we had at least some chance to
> debug and maybe fix it, or to work around this if fixing isn't possible.
> But there's nothing.
> 
> I think we can do much better in qemu.
> 
> Comments?

We've got lots of things, the problem is deciding what to use when.
We can:
  a) Send QMP events - that's pretty good for a 'hey I've stopped, disk
full'
  b) We've got a logging mechanism, but I think it's rarely used.
  c) We've got trace events - that's good for fine debug but not
what you want all the time.

For migration, if something fails, I always try and print to stderr
so I get it in the /var/log/libvirt/qemu/... log;  the problem is
that only happens if you know you've screwed up - if you corrupt some
state during the migrate, then a hung guest is often the outcome.

Dave

> Thanks,
> 
> /mjt
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


