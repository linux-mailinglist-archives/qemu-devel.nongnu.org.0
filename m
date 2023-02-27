Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC66A4769
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgqc-00067B-LW; Mon, 27 Feb 2023 11:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWgqZ-00066E-EM
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWgqW-00027v-3Y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677517166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GER2fv0+e6sEfwuzjIMS8/RGtRaxBrIb3F1tONZMH4=;
 b=SCgLdP+E2f0QN48RZyCotVSZBYfgF8y4FiXyHduHZvOiG+WNZmtRlkZQuS4KP9AmONSeDG
 cDCOpPaK9dTNDAFPLKw3dLymE3ziQ6WcqeaLw4NXvxEXAyIWCnteZ7/IfjkhMICNXH7MYd
 gXST3gP1mYe0FHwvJWbVuUuFB0T9lIQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-AkTSXGMHNLesejbyFkB5IA-1; Mon, 27 Feb 2023 11:59:23 -0500
X-MC-Unique: AkTSXGMHNLesejbyFkB5IA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E965A38041F3;
 Mon, 27 Feb 2023 16:59:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE422492B13;
 Mon, 27 Feb 2023 16:59:21 +0000 (UTC)
Date: Mon, 27 Feb 2023 16:59:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Ben Dooks <qemu@ben.fluff.org>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <Y/zhZ4brfdQ7nwLI@redhat.com>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/fkf3Cya1NOopQA@invalid>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Feb 23, 2023 at 10:11:11PM +0000, Eldon Stegall wrote:
> On Thu, Feb 23, 2023 at 03:33:00PM +0000, Daniel P. Berrangé wrote:
> > IIUC, we already have available compute resources from a couple of
> > sources we could put into service. The main issue is someone to
> > actually configure them to act as runners *and* maintain their
> > operation indefinitely going forward. The sysadmin problem is
> > what made/makes gitlab's shared runners so incredibly appealing.
> 
> Hello,
> 
> I would like to do this, but the path to contribute in this way isn't clear to
> me at this moment. I made it as far as creating a GitLab fork of QEMU, and then
> attempting to create a merge request from my branch in order to test the GitLab
> runner I have provisioned. Not having previously tried to contribute via
> GitLab, I was a bit stymied that it is not even possibly to create a merge
> request unless I am a member of the project? I clicked a button to request
> access.  
> 
> Alex's plan from last month sounds feasible:
>  
>  - provisioning scripts in scripts/ci/setup (if existing not already 
>  good enough) 
>  - tweak to handle multiple runner instances (or more -j on the build) 
>  - changes to .gitlab-ci.d/ so we can use those machines while keeping 
>  ability to run on shared runners for those outside the project 
> 
> Daniel, you pointed out the importance of reproducibility, and thus the
> use of the two-step process, build-docker, and then test-in-docker, so it
> seems that only docker and the gitlab agent would be strong requirements for
> running the jobs?

Almost our entire CI setup is built around use of docker and I don't
believe we really want to change that. Even ignoring GitLab, pretty
much all public CI services support use of docker containers for the
CI environment, so that's a defacto standard.

So while git gitlab runner agent can support many different execution
environments, I don't think we want to consider any except for the
ones that support containers (and that would need docker-in-docker
to be enabled too). Essentially we'll be using GitLab free CI credits
for most of the month. What we need is some extra private CI resource
that can pick up the the slack when we run out of free CI credits each
month. Thus the private CI resource needs to be compatible with the
public shared runners, by providing the same docker based environment[1].

It is a great shame that our current private runners ansible playbooks
were not configuring thue system for use with docker, as that would
have got us 90% of the way there already.



One thing to bear in mind is that a typical QEMU pipeline has 130 jobs
running.

Each gitlab shared runner is 1 vCPU, 3.75 GB of RAM, and we're using
as many as 60-70 of such instances at a time.  A single physical
machine probably won't cope unless it is very big.

To avoid making the overall pipeline wallclock time too long, we need
to be able to handle a large number of parallel jobs at certain times.
We're quite peaky in our usage. Some days we merge nothing and so
consume no CI. Some days we may merge many PRs and so consumes lots
of CI.  So buying lots of VMs to run 24x7 is quite wasteful. A burstab;le
container service is quite appealing


IIUC, GitLab's shared runners use GCP's  "spot" instances which are
cheaper than regular instances. The downside is that the VM can get
killed/descheduled if something higher priority needs Google's
resources. Not too nice for reliabilty, but excellant for cost saving.

With regards,
Daniel

[1] there are still several ways to achieve this.  A bare metal machine
    with a local install of docker, or podman, vs pointing to a public
    k8s instance that can run containers, and possibly other options
    too.
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


