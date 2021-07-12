Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618983C463C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 11:23:24 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2s9q-0004rB-V8
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 05:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2s95-0004Cg-V7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2s93-0004YY-Ex
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626081752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Yj40WbrBiQ4ArAgws6Q9EDeogrEwI67jm8QMxWXeX6Y=;
 b=Nh3WOFqHn6UKsHFmXozh9X+ych8383hEamfndg+Q8jPQUXLPZNTvp+295xnuN0v+tNAtgn
 jXYiW4lMwE7HG6bnJ1j2aqDdd8Os2YiIG9jqYHWOZhaBj6MATlKHW6YJu02BoroGWun5UT
 627jcqHySKnsg8mTQr+77O2EdBw9DvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-2e0Zhwi-Mcmhj083cUjtjw-1; Mon, 12 Jul 2021 05:22:27 -0400
X-MC-Unique: 2e0Zhwi-Mcmhj083cUjtjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E956C1084F54;
 Mon, 12 Jul 2021 09:22:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 599B410074FC;
 Mon, 12 Jul 2021 09:22:21 +0000 (UTC)
Date: Mon, 12 Jul 2021 10:22:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: retrying failed gitlab CI external jobs (travis)
Message-ID: <YOwJyhZGXUhbF+nH@redhat.com>
References: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
 <CAFEAcA8LvPSUw+x9GhPvKFvZqx6zLtUDYOT7Uh2zYef3RZx-7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8LvPSUw+x9GhPvKFvZqx6zLtUDYOT7Uh2zYef3RZx-7A@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 10, 2021 at 05:29:24PM +0100, Peter Maydell wrote:
> On Sat, 10 Jul 2021 at 14:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Hi; we now have travis's CI hooked into gitlab, which is nice. However,
> > unlike the gitlab native CI jobs, there's no UI for saying "retry this"
> > when the "travis CI" part of the overall gitlab pipeline fails.
> > This is awkward because travis seems to be prone to intermittent failures.
> > Is there any way we can make the jobs retryable?
> 
> Also on the subject of the external travis job, what determines
> when it runs? I would expect it to be run always, but if you look
> at https://gitlab.com/qemu-project/qemu/-/pipelines
> you can see that it didn't get run for the pipeline for
> staging commit fc32b91a. It's not just "doesn't run for staging"
> because it did run in the pipeline for staging ebd1f710.

The way the Travis integration works is largely driven from Travis
itself.

So for retrying a failed pipeline, I think it is neccessary to hop
over to the travis-ci.com site.

This one had a failed Travis job:

  https://gitlab.com/qemu-project/qemu/-/pipelines/334623495

If you follow the link from the travis job there over to

  https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/232314773

then I'd really hope they show a retry button.

Authentication is likely the key. Hopefully retry isn't tied to the
specific person who configured the Travis setup, and will instead
be shown to anyone who does SSO auth with GitLab and has rights
over to the GitLab project. I've no way to confirm this myself
though.

WRT missing job for commit fc32b91a, I see there is a Travis stage
reported here:

  https://gitlab.com/qemu-project/qemu/-/pipelines/334907106/builds

So I presume there was some delay in running the Travis jobs and
thus they only got reported after you sent the mail. 

The extra stage in the pipeline is not triggered/tracked by GitLab
itself. Rather it relies on Travis to see the changes, runs its job
and pushes information back to GitLab. This is completely asynchronous
to the rest of the normal GitLab pipeline, so unfortunately if Travis
hasn't even started the job yet, we see nothing :=(

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


