Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E931C6BCF99
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmph-0003SL-Fh; Thu, 16 Mar 2023 08:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcmpX-0003Rx-6O
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcmpV-0002ip-5u
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678970136;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUUnncZzc0xPcrtdiX5fMZ1d+/d7aCvjskN6Qzdm0OQ=;
 b=OT4H6Kzvn8FHv9WuXX8GorxNWizkit0xqWf4jDfkEAzFPgiSYGuNFrt0xQfbhYWAQiKbOQ
 mF/ANor1qqlv5+8cONabBKVqvKj3vLOwAlPDUI0mjFo+U43/ylab2GfF3EF9NtmbFEQ9pi
 x8pwP4V3vuCw/tRWp+q8m3am4H8ohY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-So2bhigpNrCW7HOhfvzIHA-1; Thu, 16 Mar 2023 08:35:33 -0400
X-MC-Unique: So2bhigpNrCW7HOhfvzIHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C6087A9E0;
 Thu, 16 Mar 2023 12:35:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7906540C6E68;
 Thu, 16 Mar 2023 12:35:31 +0000 (UTC)
Date: Thu, 16 Mar 2023 12:35:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: dropping 32-bit host support
Message-ID: <ZBMNEdz9WnUsckd7@redhat.com>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 16, 2023 at 02:11:08PM +0300, Andrew Randrianasulu wrote:
> чт, 16 мар. 2023 г., 14:02 Thomas Huth <thuth@redhat.com>:
> 
> > On 16/03/2023 11.22, Andrew Randrianasulu wrote:
> > >
> > >
> > > чт, 16 мар. 2023 г., 12:17 Andrew Randrianasulu <randrianasulu@gmail.com
> > > <mailto:randrianasulu@gmail.com>>:
> > >
> > >
> > >
> > >     чт, 16 мар. 2023 г., 11:31 Thomas Huth <thuth@redhat.com
> > >     <mailto:thuth@redhat.com>>:
> > >
> > >         On 16/03/2023 08.36, Philippe Mathieu-Daudé wrote:
> > >          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
> > >          >>
> > >          >> чт, 16 мар. 2023 г., 10:05 Philippe Mathieu-Daudé
> > >         <philmd@linaro.org <mailto:philmd@linaro.org>
> > >          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
> > >          >>
> > >          >>     Hi Andrew,
> > >          >>
> > >          >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
> > >          >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
> > >         <https://wiki.qemu.org/ChangeLog/8.0>
> > >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> > >         <https://wiki.qemu.org/ChangeLog/8.0>>
> > >          >>      > <https://wiki.qemu.org/ChangeLog/8.0
> > >         <https://wiki.qemu.org/ChangeLog/8.0>
> > >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> > >         <https://wiki.qemu.org/ChangeLog/8.0>>>
> > >          >>      >
> > >          >>      > ===
> > >          >>      > System emulation on 32-bit x86 and ARM hosts has been
> > >         deprecated.
> > >          >>     The
> > >          >>      > QEMU project no longer considers 32-bit x86 and ARM
> > >         support for
> > >          >>     system
> > >          >>      > emulation to be an effective use of its limited
> > >         resources, and thus
> > >          >>      > intends to discontinue.
> > >          >>      >
> > >          >>      >   ==
> > >          >>      >
> > >          >>      > well, I guess arguing from memory-consuption point on
> > 32
> > >         bit x86
> > >          >>     hosts
> > >          >>      > (like my machine where I run 32 bit userspace on 64
> > bit
> > >         kernel)
> > >
> > >         All current PCs have multiple gigabytes of RAM, so using a 32-bit
> > >         userspace
> > >         to save some few bytes sounds weird.
> > >
> > >
> > >     I think difference more like in 20-30% (on disk and in ram), not *few
> > >     bytes*.
> > >
> > >
> > > I stand (self) corrected on *on disk* binary size, this parameter tend
> > to be
> > > ~same between bash / php binaries from Slackware 15.0 i586/x86_64. I do
> > not
> > > have full identical x64 Slackware setup for measuring memory impact.
> > >
> > >
> > > Still, pushing users into endless hw upgrade is no fun:
> > >
> > >
> > https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-more-sense-than-recycling/
> > >
> > >
> > > note e-waste and energy consumption
> >
> > Now you're mixing things quite badly. That would be an argument in the
> > years
> > before 2010 maybe, when not everybody had a 64-bit processor in their PC
> > yet, but it's been now more than 12 years that all recent Desktop
> > processors
> 
> ===
> 
> 
> Laptops, tablets etc exist.
> 
> 
> >
> > feature 64-bit mode. So if QEMU stops supporting 32-bit x86 environments,
> > this is not forcing you to buy a new hardware, since you're having a
> > 64-bit
> > hardware already anyway. If someone still has plain 32-bit x86 hardware
> > around for their daily use, that's certainly not a piece of hardware you
> > want to run QEMU on, since it's older than 12 years already, and thus not
> > really strong enough to run a recent emulator in a recent way.
> >
> 
> Well, current qemu runs quite well, than you very much (modulo all this
> twiddling with command line switches). I think very fact it runs well (even
> as tcg-only emulator, on integer tasks at least) on 32-bit hosts actually
> good, and if 32-bit arm hardware can keep some codeways in working state
> for me - even better.

The problem being debated here is not a technical one, but a question
of resource prioritization.

It is certainly technically possible to keep 32-bit support working
indefinitely and there are certainly people who would benefit from
that, like yourself.

The issue is that it comes at a cost to the QEMU project both in terms
of where our contributors invest their time, and in terms of what we
use our CI resources for. Both maintainer time and hardware resources
are finite quantities.

IOW, if we continue to support 32-bit host, that means that we will
be unable to work on some other feature(s) instead.

The question we're battling with is where to draw the line, so that
we can bring the biggest benefit to QEMU consumers as a whole.

If we keep supporting 32-bit host, that may (hypothetically) benefit
100 users.

If we drop 32-bit host we might be able to develop some new features
that (hypothetically) benefit 5000 new users.

In this illustration, it would make sense to drop 32-bit, because in
aggregate we would loose 100 users, but gain 5000 new users, meaning
a net gain of 4900. Furthermore, since QEMU is open source the users
that we drop support for, do (theoretically at least) still have the
option of continuing to use older releases.

Now those specific numbers were totally invented, and it isn't very
easy to come up with especially accurate numbers. So we have to make
a call based on a combination of factors, our intuition, consideration
of the overall hardware market, feedback from users in response to a
deprecation announcements, and more.

With all those factors together, at this time it is looking likely
that QEMU will be better (on aggregate) if we discontinued support
for 32-bit hosts. We know that is going to upset some users, and
we are sorry for that, but we believe more users will benefit in
the long run by releasing resources to invest in other areas.

The sad reality faced by most open source projects is that plenty
of people are willing to complain when features are dropped or not
accepted, but far far fewer are willing to contribute to the
maintenence effort, to enable the projects to accomplish more
overall.  So the project maintainers are left in an impossible
situation where they unfortunately have to make tough decisions
that leave some people disappointed.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


