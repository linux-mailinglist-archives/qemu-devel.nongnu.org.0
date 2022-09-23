Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440455E74F2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:38:17 +0200 (CEST)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdGK-0003YY-7g
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obd6p-0005ew-0m
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obd6m-0001cH-9J
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663918102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=l0wekk1+ebSio5rhJ9Mt6N9CUsZSIPbz++yFrhxnFHk=;
 b=HSgLZKHhD9d5E1EU5TX8imiFmNyv7HgS6UfKpCkXGyrCQp/O31hbuO2NwOB/T0oRTa4QA+
 wqIbrbr5d8Q6inIh8e/mcVGWQWViAY9hFA/N3qB1c8jabvafoYcsDIH+12ukToBmVsMlSs
 hWeoTLFW6UnTF2j3YKhmfOpDfuk2eEE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-HN4ndzAbObGPDln1pDoXNQ-1; Fri, 23 Sep 2022 03:28:21 -0400
X-MC-Unique: HN4ndzAbObGPDln1pDoXNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA8CE29324A8;
 Fri, 23 Sep 2022 07:28:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F43540C2066;
 Fri, 23 Sep 2022 07:28:09 +0000 (UTC)
Date: Fri, 23 Sep 2022 08:28:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: thuth@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
Message-ID: <Yy1gB1KB3YSIUcoC@redhat.com>
References: <YyyxrNp+5XrmLi1Y@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyyxrNp+5XrmLi1Y@fedora>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 03:04:12PM -0400, Stefan Hajnoczi wrote:
> QEMU's avocado and Travis s390x check-tcg CI jobs fail often and I don't
> know why. I think it's due to timeouts but maybe there is something
> buried in the logs that I missed.
> 
> I waste time skimming through logs when merging qemu.git pull requests
> and electricity is wasted on tests that don't produce useful pass/fail
> output.
> 
> Here are two recent examples:
> https://gitlab.com/qemu-project/qemu/-/jobs/3070754718
> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/583629583
> 
> If there are real test failures then the test output needs to be
> improved so people can identify failures.
> 
> If the tests are timing out then they need to be split up and/or reduced
> in duration. BTW, if it's a timeout, why are we using an internal
> timeout instead of letting CI mark the job as timed out?
> 
> Any other ideas for improving these CI jobs?

The avocado job there does show the errors, but the summary at the
end leaves something to be desired. At first glance it looked like
everything passed because it says "ERROR 0" and that's what caught
my eye. Took a long time to notice the 'INTERRUPT 5' bit is actually
just an error state too.  I don't understand why it has to have so
many different ways of saying the same thing:

  RESULTS    : PASS 14 | ERROR 0 | FAIL 0 | SKIP 37 | WARN 0 | INTERRUPT 5 | CANCEL 136


  "ERROR", "FAIL" and "INTERRUPT" are all just the same thing

  "SKIP" and "CANCEL" are just the same thing

I'm sure there was some reason for these different terms, but IMHO they
are actively unhelpful.

For example I see no justiable reason for the choice of SKIP vs CANCEL
in these two messages:

 (173/192) tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launch_set_up:  SKIP: sudo -n required, but "sudo -n true" failed: [Errno 2] No such file or directory: 'sudo'

 (183/192) tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias:  CANCEL: No QEMU binary defined or found in the build tree (0.00 s)

It would be clearer to understand the summary as:

 RESULTS: PASS 14 | ERROR 5 | SKIP 173 | WARN 0

I'd also like to see it repeat the error messages for the failed
tests at the end, so you don't have to search back up through the
huge log to find them.


On the TCG tests we see

imeout --foreground 90  /home/travis/build/qemu-project/qemu/build/qemu-s390x  noexec >  noexec.out

make[1]: *** [../Makefile.target:158: run-noexec] Error 1

make[1]: Leaving directory '/home/travis/build/qemu-project/qemu/build/tests/tcg/s390x-linux-user'

make: *** [/home/travis/build/qemu-project/qemu/tests/Makefile.include:60: run-tcg-tests-s390x-linux-user] Error 2


I presume that indicates the 'noexec' test failed, but we have zero
info. Perhaps noexec.out contains the useful info ? We don't know as
we can't access the file.  If a test system is storing results in a
file that needs to be cat'd to stderr on failure, for it to be
visible in CI.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


