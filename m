Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684F37A94B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:29:53 +0200 (CEST)
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTOS-0004C0-Au
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTHA-0000yg-In
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTH7-00004r-Tt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjBC18Nf7vAugpXiHZ0FxXOgYrVaIM8oOXmHAhBydl8=;
 b=L2tJyQ0Fp+Q4E5uldioVFlXJGqOrfZoQEWbW0/BULixV7yailHPyiAXZuqrRCg6Hulfnd7
 SQIkm3F2VkC7TKm/cGXHdEDV0wQSNsz6O5jn7KI7tzLxLyqnSWeWE25cR7uD5MsXWangEm
 UxyM4u0yUc4LWbBn7hITjKrHPpWx224=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-NzSnmMnyNXmqiAaAXz9vXg-1; Tue, 11 May 2021 10:22:07 -0400
X-MC-Unique: NzSnmMnyNXmqiAaAXz9vXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9857107ACF7;
 Tue, 11 May 2021 14:22:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEAC5434E;
 Tue, 11 May 2021 14:21:49 +0000 (UTC)
Date: Tue, 11 May 2021 15:21:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
Message-ID: <YJqS+FqVttnrw6zb@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
 <YH1QJZGYQXc6x9Et@redhat.com> <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
 <YH1gtK/JFtVE4lF1@redhat.com>
 <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
 <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 08:48:44AM +0200, Philippe Mathieu-Daudé wrote:
> +Stefan/Peter
> 
> Not sure if following up this thread or start a new one, but I got
> blocked again from Gitlab, tagged as a crypto miner for running QEMU
> CI...
> [1]
> https://about.gitlab.com/handbook/support/workflows/investigate_blocked_pipeline.html#trends--high-priority-cases
> 
> I pushed 5 different branches to my repository in less than 1h,
> kicking 580 jobs [*].
> 
> I didn't try to stress Gitlab, it was a simple "one time in the month
> rebase unmerged branches, push them before respining on the mailing
> list".
> 
> I'm considering changing my workflow:
> - not push more than 2 branches per hour (I know 3/h works, so choose
>   a lower number, as we want to add more tests).
> - merge multiple branches locally and push the merged result and
>   bisect / re-push on failure
> - run less testing
> - do not run testing
> 
> This sounds counter productive and doesn't scale to a community of
> contributors asked to use Gitlab.
> 
> So far I don't have better idea than this series.
> 
> Who is interested in sending patches to improve our workflow?

So we have a few scenarios for using the CI

 1. Running gating CI before merging to master
 2. Subsystem maintainers running CI before sending a PULL req
 3. Contributors running CI before sending a patch series

Right now we have the same jobs running in all three scenarios.

Given the increasing restrictions on usage, we clearly need to cut
down in general and also make it so that it is harder to accidentally
burn all your available CI allowance.

Currently we always run CI whenever pushing to gitlab. This is
convenient but in retrospect it is overkill. People often push
to gitlab simply as their backup strategy and thus don't need
CI run every time.

Not all changes require all possible jobs to by run, but it is hard
to filter jobs when we're triggering them based on pushes, as the
baseline against which file changes are identified is ill-defined.


For scenario (1) we need all the jobs run to maximise quality.
This is also a case where we're most likely to have custom runners
available, so CI allowance is less of a concern. The job count still
needs to be reasonable to avoid hitting issues at times when the
merges are frequent (just before freeze).


For scenario (2) subsys maintainers, we want them to minimize
the liklihood that a pull request will fail scenario (1) and
require a respin.  Running all jobs achieces this but it is
likely overkill.

eg we have 24 cross compiler builds. If we expect most maintainers
will have either x86-64 or aarch64 hardware for their primary dev
platform, then the key benefit of cross compilers is getting coverage
of

 - 32-bit
 - big endian
 - windows

We don't need 24 jobs todo that. We could simply pick armel as the
most relevant 32-bit arch and s390x as the most relevant big endian
arch, and then the win32/64 platforms. IOW we could potentially only
run 4-6 jobs instead of 24, and still get excellant arch coverage.

Similarly for native builds we test quite alot of different distros.
I think we probably can rationalize that down to just 2 distros,
one covering oldest packages (Debian Stretch) and one covering newest
(Fedora 34), and a "build everything" config.

We have many other jobs that are testing various obscure combinations
of configure args. I'd suggest these rarely fail for most pull requests
so are overkill.

For subsystem maintainers we could potentially get down to just 10-15
jobs if we're ambitious. Leave everything else as manual trigger only.

Perhaps set all the jobs to only run on certain branch name patterns.
eg perhaps "*-next" filter is common for subsystem maintainer's pending
branches ?

For general contributors a similarly short set of jobs to subsystem
maintainers is viable. Perhaps again just let then use a "-next"
branch.

If we can enable manual triggers on any other branches that's good.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


