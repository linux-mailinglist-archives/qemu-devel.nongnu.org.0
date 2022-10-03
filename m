Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D665F34DF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 19:53:05 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofPcj-0007Dg-96
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 13:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofPOu-0000U6-4v
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 13:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofPOq-0003Vu-6v
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 13:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664818719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=iwetfxWw0HWOxGvCyqesbjfN8JrO8/azbCX1GE9YGhc=;
 b=MnwidmQ0w/RWqPpXsuv7mnsllcG2fuMN10xbbGUDEGuvd7B2pr9LICenZ3TmblyZe0wGrt
 xx1Ul0E9UCuJO2v+qNjB2n2fP85toFNPS9Oz/7sCcC6UiQzmj57eLbvCeH57bHLLw047cL
 zYPhvtf2wYS0UlyqPOc+VTJDTBlkbRk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-QmnJma2iPk-WuW8udxYCcQ-1; Mon, 03 Oct 2022 13:38:37 -0400
X-MC-Unique: QmnJma2iPk-WuW8udxYCcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79833862FDF
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 17:38:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5EF32027061
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 17:38:36 +0000 (UTC)
Date: Mon, 3 Oct 2022 18:38:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Conserving GitLab CI minutes - check your repo is a true fork
Message-ID: <YzseGmKLRblf+hmt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Last week the /qemu-project namespace got added to the GitLab Open Source
Program. This gives repos under that namespace extra CI minutes (50,000)
and a cost factor of 0.5, meaning in effect 100,000 minutes per month.
Primarily this applies to CI pipelines jobs the merge coordinator runs
for pull requests via the upstream staging branch.


Joining the OSS program also, however, has a benefit for people who have
forks of the /qemu-project/qemu repository.

Each user with the free plan normally gets 400 minutes of CI quota per
month [1], though some people with older gitlab.com user accounts may still
get 2,000 CI minutes / month. Note this quota is across all repos under
your /$USERNAME path in gitlab, NOT per repo.

You can check your allowance and usage at:

   https://gitlab.com/-/profile/usage_quotas#pipelines-quota-tab

Where things get complicated is the CI cost factor, which varies depending
on repo context[2].

Provided your QEMU repo is a fork of /qemu-project/qemu, its CI cost factor
should be 0.008.  IOW, if you have 400 minutes quota and only run pipelines
for QEMU, you should be able to use 50,000 minutes of wall-clock time on
shared runners.

If your QEMU repo is NOT a fork of /qemu-project/qemu, your CI cost factor
will likely be 1.  IOW, if you have 400 minutes quota you'll only get 400
minutes of wall-clock time. A QEMU CI pipeline will devour those 400 minutes
almost instantly.

IOW, it is absolutely critical that your repository is considered a fork
of /qemu-project/qemu if you intend to use CI, as it will mean you consume
CI quota x125 more slowly.

For the majority of contributors this won't be a problem, but a few may
have created their QEMU repo before /qemu-project existed on GitLab, and
thus not be considerd a fork.

To check this, go to the Gitlab web UI for your repo and check that the
header says:

    " Forked from QEMU / QEMU "

just underneath the repo description.

If it does not say that, then you'll need to rename your existing repo to
a different path, and fork from /qemu-project/qemu again.

NB, if you exhaust your CI quota, it resets on the 1st of each month.


Even with the reduced 0.008 cost factor, QEMU pipelines can consume CI time
pretty quickly, so be prudent with what jobs you run.

Ensure ***ALL*** your branches are rebased to post v7.1.0 release, before
pushing to gitlab, such that they include this commit:

  commit 28357dc525b4798cdef1101cbb459afcd7233280
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri May 27 16:36:02 2022 +0100

    gitlab: don't run CI jobs in forks by default

This prevents CI pipelines being created merely by pushing the branch.

Also avoiding setting 'QEMU_CI=2' when running pipelines, as that triggers
every job which will burn alot of CI quota. Best is to use 'QEMU_CI=1'
which creates the pipeline but marks all jobs as manual, so you can choose
exactly which subset to run.

BTW, this largely all applies to other projects on gitlab that use CI
too. In libvirt we're switching off CI on push events too, and have also
joined the OSS Program to get forks to benefit from reduced cost factor
for CI.

With regards,
Daniel

[1] https://about.gitlab.com/pricing/

[2] https://docs.gitlab.com/ee/ci/pipelines/cicd_minutes.html#cost-factor
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


