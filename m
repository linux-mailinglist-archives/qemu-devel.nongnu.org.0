Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB754B9F56
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 12:45:34 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfE5-00072W-7z
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 06:45:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfBC-0005M8-VE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:42:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfB8-00075H-EE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645098148;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcRMaZ1VCYblgiDbNbfOzgEnRKyYAZ7+dlqtKZO6vSk=;
 b=N5A1w6Zw9xJy62kVFRZWS6k2IKUZOx/TdcHxFjDKChFnC5HjOiObE4JuD/JYaJq+vPSROu
 f3wbPSeHR8Hlkq261iQuJW8En5vntfX4DeJ9hZov6LLRofWkzt0GajAKtWhrh6Re6PZB/q
 zw7n4TkzkUeOcj6ZuZCfu6m1DN8ovU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-d_FYwM5RNUCq07ViLbiOwA-1; Thu, 17 Feb 2022 06:42:20 -0500
X-MC-Unique: d_FYwM5RNUCq07ViLbiOwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA742F47;
 Thu, 17 Feb 2022 11:42:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3E16C350;
 Thu, 17 Feb 2022 11:42:17 +0000 (UTC)
Date: Thu, 17 Feb 2022 11:42:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Should we apply for GitLab's open source program?
Message-ID: <Yg40l4HU9ShzCdRX@redhat.com>
References: <878sdp4ks9.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <878sdp4ks9.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu@sfconservancy.org" <qemu@sfconservancy.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 04, 2020 at 04:35:34PM +0100, Alex Bennée wrote:
> 
> Hi,
> 
> Given our growing reliance on GitLab and the recent announcement about
> free tier minutes:
> 
>   https://about.gitlab.com/pricing/faq-consumption-cicd/
> 
> is it time we officially apply for GitLab's Open Source Program:
> 
>   https://about.gitlab.com/solutions/open-source/program/
> 
> ?
> 
> From what I can see the QEMU project will easily qualify - the only
> minor inconvenience is needing to reapply every year. So far it seems as
> a public project their are no usage limits anyway. We are currently
> listed as 0 of 50,000 minutes:
> 
>   https://gitlab.com/groups/qemu-project/-/usage_quotas#pipelines-quota-tab
> 
> So we are in no pressing hurry to do this for the minutes but I suspect
> there may be other things that are made easier by having access to all
> the toys GitLab provides. Daniel has already posted to the forum
> requesting details about how this might affect our workflow so maybe we
> should just wait for feedback until pressing on?
> 
>   https://forum.gitlab.com/t/ci-cd-minutes-for-free-tier/40241/33

Fast forward 18 months... their timeframe for enforcing quotas has
slipped out as they better understood the need to finese plans to
minimise impact on OSS projects & their contributors. It is starting
to crystalize a little more now though.


One key thing that we've missed in previous discussion is that there is
a distinction between "wall clock CI minutes" and "billed CI minutes",
with the latter being calculated from the former using a "cost factor".

IIUC right now

   - public projects created before July 2021 have a cost factor of 0.
     That's QEMU & libvirt covered.

   - public projects created after July 2021 have a cost factor of 0.008

   - private projects have cost factor of 1

   - users and groups created in the past got a billed CI minutes
     allowance of 2,000, while new users/groups get 400. Can't recall
     the date of that change in allowance.

     For reasons I don't understand though, QEMU appears to have
     an allowance of 50,000 not 2,000. AFAIK that should only be
     possible on the Gold tier, which requires payment or membership
     of the OSS program.

NB this is all for Linux shared runners, macOS runners have a cost
factor much higher than 1. I'm ignoring that since we don't use them.


When this means is that if you have a user/group quota of '400' billed CI
minutes, and a cost factor of 0.008 for your project, you get 50,000
minutes of wall clock CI time.  The "low" 400 minute quota sounds a bit
less insane once you understand the cost factor impact.


For projects which are currently on a cost factor of 0 it is currently
impractical to determine your current CI usage from the Git Lab UI. The
"Usage Quotas" page shows "billed CI minutes" and so will always be
zero.

They implemented new UI to expose wallclock CI mintes ("Shared runners
duration" under the 'Analytics' page):

   https://gitlab.com/gitlab-org/gitlab/-/issues/340504

however that turned out to be inaccessible because the Analytics
pages at the group level are a premium feature. In response to me
pointing that out, they've got a new issue to track making this
available to all:

  https://gitlab.com/gitlab-org/gitlab/-/issues/353062

Once that happens we'll be able to get a clearer understanding of
our CI shared runner usage over time, and thus figure out the likely
impact on us before quotas become more strictly applied.



As mentioned above, QEMU currently get a cost fact of zero applied
to our project(s) as they have existed a long time. GitLab's proposed
next step in applying stricter quotas will be to change all public
projects to a cost factor of 0.008. With our (strangely high) 50,000
minute quota, that'll give 625,000 minutes shared runner time.
This should be more than enough for our pipelines per month.


Their longer term proposed plan is that all public projects will
get a cost factor of 1. That would reduce our wall clock time on
shared runners to 50,000 minutes which gives us on the order of
30 pipelines a month. Not enough for our needs during freeze times.


By that stage they expect any OSS projects which need more, to
have applied for membership of their Open Source Program. That
will retain a cost factor of 0.008 and give a quota of 50,000
billed CI minutes. ie 625,000 wall  clock minutes. That would
easily cover QEMU pipeline usage.


To minimise harm to contributors, public forks will also retain
the 0.008 cost factor. ie QEMU developers will still get either
50,000 or 250,000 CI minutes of wallclock time on shared runners
depending on how old their account is. That's quite alot but
we'll still want to be much more prudent in what we run to
minimize consumption for our contributors.  I'm fuzzy on whether
the "public forks" special case applies to any public fork, or
only forks of OSS Program projects, or only forks of projects
with a detected OSS license. None the less, QEMU contributors
will be OK if we join thue OSS program.

If you want to follow along, the following comment thread on their
public issue tracker gives the best up2date record of their proposals:

  https://gitlab.com/gitlab-org/gitlab/-/issues/243722#note_843079845

you'll notice I've been raising QEMU/libvirt's concerns in this
thread and issue more broadly. They appear quite genuine in wanting
to find a balance that doesn't impose too much pain on OSS projects
and their contributors, while still protecting their CI resource from
abuse.

In summary

 - QEMU will need to join the GitLab Open Source Program in the not
   too distant future. We can live with first change to a cost factor
   of 0.008, but we'll definitely not cope with the change after that
   to a cost factor of 1. There's no firm date for the latter, and we
   should get some warning ahead of time if we keep following the
   issue trackers and announcements.


 - We will need to change our pipelines rules to not run in user
   forks at all by default. We'll need a way for users to explicitly
   request a pipeline at time of their choosing instead. While they
   will have quite a lot of CI wallclock minutes, we will still need
   to make it easier to control how many jobs get launched, to
   preserve as many billed CI minutes as practical

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


