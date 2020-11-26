Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595C2C518C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 10:46:05 +0100 (CET)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiDqm-0006ta-3z
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 04:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiDon-0006Qq-GY
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiDol-0001KI-4I
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606383832;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44aZUWF2xrqIwuVgw//wbQngH4I+F2e2E1JB+c4PGIA=;
 b=UJTrs5NZjosD6CPSznsuFBNo43EdcCX4rT7EPJp7QAnMs6lrTzqjx+VpSQiVHRcgFuure4
 8p8xSLLAg78/r9P1ub567mpmecQbVDYJAkRtPpI1/MdMxU0k+2xjdgA4PCJO/CMVm5eREL
 R0l1/jqDyI7kHYpbdy4gz2Mu5tCBG44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Pn4ONUEhMXOwK4RWcqow8g-1; Thu, 26 Nov 2020 04:43:46 -0500
X-MC-Unique: Pn4ONUEhMXOwK4RWcqow8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C91F680EDAD;
 Thu, 26 Nov 2020 09:43:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BAF110013C0;
 Thu, 26 Nov 2020 09:43:41 +0000 (UTC)
Date: Thu, 26 Nov 2020 09:43:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <20201126094338.GB1122957@redhat.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 09:10:14AM +0100, Lukáš Doktor wrote:
> How
> ===
> 
> This is a tough question. Ideally this should be a standalone service that
> would only notify the author of the patch that caused the change with a
> bunch of useful data so they can either address the issue or just be aware
> of this change and mark it as expected.

We need to distinguish between the service that co-ordinates and reports
the testing, vs the service which runs the tests.

For the service which runs the tests, it is critical that it be a standalone
bare metal machine with nothing else being run, to ensure reproducability of
results as you say.

For the service which co-ordinates and reports test results, we ideally want
it to be integrated into our primary CI dashboard, which is GitLab CI at
this time.

> Ideally the community should have a way to also issue their custom builds
> in order to verify their patches so they can debug and address issues
> better than just commit to qemu-master.

Allowing community builds certainly adds an extra dimension of complexity
to the problem, as you need some kind of permissions control, as you can't
allow any arbitrary user on the web to trigger jobs with arbitrary code,
as that is a significant security risk to your infra.

I think I'd just suggest providing a mechanism for the user to easily spin
up performance test jobs on their own hardware. This could be as simple
as providing a docker container recipe that users can deploy on some
arbitrary machine of their choosing that contains the test rig. All they
should need do is provide a git ref, and then launching the container and
running jobs should be a single command. They can simply run the tests
twice, with and without the patch series in question.

> The problem with those is that we can not simply use travis/gitlab/...
> machines for running those tests, because we are measuring in-guest
> actual performance.

As mentioned above - distinguish between the CI framework, and the
actual test runner.



> Solution 3
> ----------
> 
> You name it. I bet there are many other ways to perform system-wide
> performance testing.

IMHO ideally we should use GitLab CI as the dashboard for trigger
the tests, and report results back.  We should not use the GitLab
shared runners though for reasons you describe of course. Instead
register our own dedicated bare metal machine to run the perf jobs.
Cleber has already done some work in this area to provide custom
runners for some of the integration testing work. Red Hat is providing
the hardware for those runners, but I don't know what spare we have
available, if any,  that could be dedicated for the performance
regression tests


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


