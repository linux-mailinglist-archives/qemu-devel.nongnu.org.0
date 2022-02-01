Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D874A6717
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:31:38 +0100 (CET)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0kS-0008JL-4t
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEwYE-0004hh-1A
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEwY3-0004nq-Lx
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643734915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ubXrtP9Gti/4IN+QHdUh2aveeDczH8c6Bw/e4h6oFNU=;
 b=HYnXvXnnpPI9uWH0Wr8bNLL2/QPMErcldt/iMtlcOqzkUEX9pfcpyyNB9M3yx8dy3k+PUI
 OF3OPydCOOI5oECEKHiRQOzSOdrv3kQ2z5lV3w2GoH+P/3nw3dd4pMHjgnkBBeZ7Nj9eAe
 Dy0tJ1Z/VljDTozz6I5a4X+j12xrWPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-RjMjhaDNMLuD6h5-r7w9BA-1; Tue, 01 Feb 2022 12:01:47 -0500
X-MC-Unique: RjMjhaDNMLuD6h5-r7w9BA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 454CE1091DA1;
 Tue,  1 Feb 2022 17:01:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBFF07574F;
 Tue,  1 Feb 2022 17:01:43 +0000 (UTC)
Date: Tue, 1 Feb 2022 17:01:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YflndOiIn8JbjuOS@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <CA+bd_6KgJ_tG9r9Nhn5p6bDsdiXKRckGiZ75srxTNZj4bdd2UA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+bd_6KgJ_tG9r9Nhn5p6bDsdiXKRckGiZ75srxTNZj4bdd2UA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 12:29:56AM -0500, Cleber Rosa wrote:
> 
> Assuming this is about "Testing that QEMU can boot a full distro", I wouldn't
> try to solve the problem by making the distro too slim to get to the
> point of becoming
> an unrealistic system.

At a high level our with acceptance (integration) testing is of
course to make sure that QEMU is correctly emulating a full virtual
machine, such that we have confidence that it can run real world
operating systems.

There are a number of approaches to achieve that with varying
tradeoffs.

  - Testing with very specific tailored environments, running
    very specific userspace tools and minimal kernel setup.

    This can give us a pretty decent amount of coverage of
    the core features of the emulated environment in a tightly
    controlled amount of wallclock time. When it fails it ought
    to be relatively easy to understand and debug.

    The downside is that it is the QEMU code paths it hits are
    going to be fairly static.


  - Testing with arbitrary execution of real world OS images.

    I think of this as a bit of scattergun approach. We're not
    trying to tightly control what runs, we actually want it
    to run alot of arbitrarily complex and unusual stuff.

    This is going to be time consuming and is likely to have
    higher false positive failure rates. It is worthwhile
    because it is going to find the edge cases that you simply
    won't detect any other way, because you can't even imagine
    the problems that you're trying to uncover until you uncover
    them by accident with a real OS workload.

    It is kinda like fuzzing QEMU with an entire OS :-)


Both of these approaches are valid/complementary and we should
want to have both.

Any test suite is only going to find bugs though if it is
actually executed.

As a contributor though the former is stuff I'm likely to be
willing to run myself before sending patches, while the latter
is stuff I'm just always going to punt to merge testing infra.

We want to be wary of leaving too much to be caught at time
of merge tests, because that puts a significant burden on the
person responsible for merging code in QEMU.  We need our
contributors to be motivated to run as much testing as possible
ahead of submitting patches.

> IMO the deal breaker with regards to test time can be solved more cheaply by
> having and using KVM where these tests will run, and not running them by
> default otherwise.  With the tagging mechanism we should be able to set a
> condition such as: "If using TCG, exclude tests that boot a full blown distro.
> If using KVM, do not criticize what gets booted".  Resulting in something
> like:

> Does that sound like something appropriate?

Depends whether you only care about KVM or not. From a POV of QEMU
community CI, I think it is valid to want to test TCG functionality


> BTW, on the topic of "Using something as a base OS for scripts (tests) to run
> on it", another possibility for using full blown OS would be to save
> their initialized
> state, and load it to memory for each test, saving the guest boot time.  This
> should of course be done at the framework level and transparent to tests.

There is *massive* virtue in simplicity & predictability for testing.

Building more complex infrastructure to pre-initialize caches with
clever techniques like saving running OS state is clever, but is
certainly not simple or predictable. When that kind of stuff goes
wrong, whoever gets to debug it is going to have a really bad day.

This can be worth doing if there's no other viable approach to achieve
the desired end goal. I don't think that's the case for our integration
testing needs in QEMU though. There's masses of scope for us to explore
testing with minimal tailored guest images/environments, before we need
to resort to building more complex optimization strategies.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


