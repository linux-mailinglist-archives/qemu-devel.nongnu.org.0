Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD132CDCA2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:47:31 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkshW-0005fX-Ms
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kksXY-0007Jb-4K
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kksXT-00081V-W2
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607017026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg6+c60GryMYEu+v65AtbaWpKJVk3ib/7ZGZ1FwaLQI=;
 b=J0ev0TZF4E6Fy0hse25J/By7ht76UvebBqhlKWQjKv60acRZPGnZ1N9VnZ6fOXhQLWnfUb
 Q0ZQlwpS+FHs9uOMybieRdeWwDMOiu9q5UxBKkr+Z5ye6Mk9DSEXNrBWrm04ih9NGdfBL1
 rSMCa6idS81ftnbs3tGu49jndDU3jYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-uPSlcf_RMimyYY8Naes9OA-1; Thu, 03 Dec 2020 12:37:01 -0500
X-MC-Unique: uPSlcf_RMimyYY8Naes9OA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1C88100747E;
 Thu,  3 Dec 2020 17:37:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DADFF5D9CC;
 Thu,  3 Dec 2020 17:36:52 +0000 (UTC)
Date: Thu, 3 Dec 2020 17:36:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201203173649.GL2952498@redhat.com>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
 <20201203170233.GK2952498@redhat.com>
 <20201203172959.GA2792185@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201203172959.GA2792185@localhost.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 12:29:59PM -0500, Cleber Rosa wrote:
> On Thu, Dec 03, 2020 at 05:02:33PM +0000, Daniel P. Berrangé wrote:
> > I think the problem with the Fedora acceptance is that we'll be constantly
> > chasing a moving target. Every URL we pick will go away 6-12 months later.
> > IOW, while the acceptance test pass today, in 6 months time they'll be
> > failing.  IOW,  switching to F32 doesn't solve the root cause, it just
> > pushs the problem down the road for 6 months until F32 is EOL and hits
> > the same URL change problem.
> >
> 
> Just FIY, the tests will not FAIL when the images are removed from the
> official locations.  This is what happens Today:
> 
>    JOB ID     : e85527a9d75023070f15b833eac0f91f803afc83
>    JOB LOG    : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e85527a/job.log
>     (1/1) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm: CANCEL: Failed to download/prepare boot image (0.33 s)
>    RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 1
>    JOB HTML   : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e85527a/results.html
>    JOB TIME   : 0.76 s
> 
> And *normally*, we'd have 12+ months between updates, that is from
> Fedora 31 -> 33, 33 -> 35, etc.
> 
> > One way to avoid this is to *not* actually  test a current Fedora.
> > Instead intentionally point at an EOL Fedora release whose URL has
> > already moved to the archive site which is long term stable.
> >
> 
> So the tradeoff is, a patch every 6 or 12 months, versus using a more
> modern guest.  With other tests, such as virtiofs_submounts.py,
> already depending on the same decision (to avoid multiple guest images
> downloaded), I think this tradeoff decision needs more visibility.
> 
> IMO, the cost of such a simple patch every 6 or 12 months is very low
> provided we'll benefit from the newer guests.

I don't think changing the OS version typically changes the level of
coverage in aggregate.  The new OS may exercise new code paths, but
it will stop exercising old code paths, so most of the time it'll
be net-zero.  The ideal would be to test a representative selection
of both old and new versions but capacity limits.

The only time there's probably a notable difference is if we need to
access to a new type of device that the old OS doesn't have, but
that's relatively rare.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


