Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B415A26FA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:40:50 +0200 (CEST)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXhh-00079T-B8
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRXbD-0003Sw-Ft
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRXbB-0000um-1M
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661513643;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bMERgVCSt7tzGlc2NWjyuGCU/xYLtTcCmyvDvP0O7GM=;
 b=ILk8ks/BVB9sOUMDxgvG6lCQMT8J0Okiifvvv3AFdJHZPXJivq25km+b408TlPyUqb+23P
 GsD3P6fsxyKDvYGEUxjovBBe5XOAMg75bvvCJGdLue3s0ma0/o/bExUsDaiZLEL3Og/5zC
 RE5/F8XIfBNgOV+OSsBB88z+uUrnT8s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-hKtogr6PP2WyV-R6YuQeEQ-1; Fri, 26 Aug 2022 07:34:01 -0400
X-MC-Unique: hKtogr6PP2WyV-R6YuQeEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57BFA2919ECA;
 Fri, 26 Aug 2022 11:34:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B531C15BB3;
 Fri, 26 Aug 2022 11:33:58 +0000 (UTC)
Date: Fri, 26 Aug 2022 12:33:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 50/51] .gitlab-ci.d/windows.yml: Increase the timeout to
 the runner limit
Message-ID: <YwivowucJdByBPUG@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-51-bmeng.cn@gmail.com>
 <c04114e2-f7ba-c985-f4ff-955b0f82e716@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c04114e2-f7ba-c985-f4ff-955b0f82e716@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 25, 2022 at 10:18:06AM +0200, Thomas Huth wrote:
> On 24/08/2022 11.40, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> > 
> > commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> > changed to compile QEMU with the --without-default-devices switch for
> > the msys2-64bit job, due to the build could not complete within the
> > project timeout (1h), and also mentioned that a bigger timeout was
> > getting ignored on the shared Gitlab-CI Windows runners.
> > 
> > However as of today it seems the shared Gitlab-CI Windows runners does
> > honor the job timeout, and the runner has the timeout limit of 2h, so
> > let's increase the timeout to the runner limit and drop the configure
> > switch "--without-default-devices" to get a larger build coverage.
> > 
> > As a result of this, the check-qtest starts running on Windows in CI.
> > 
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> > 
> >   .gitlab-ci.d/windows.yml | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index c4bde758be..d4fd821b5f 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -10,7 +10,7 @@
> >         - ${CI_PROJECT_DIR}/msys64/var/cache
> >     needs: []
> >     stage: build
> > -  timeout: 70m
> > +  timeout: 2h
> 
> IMHO 2 hours are too long ... we're normally trying to limit the time of
> each job to 1h only and only extend it a little bit if we cannot really
> make, but we should not double the amount of time here. The highest timeout
> that we currently have are 90 minutes ... would that still be OK for this
> job, too? If so, please use 90 minutes here. Otherwise, it might still be
> necessary to cut down this job here and there a little bit...

Also note that 90 minutes is not considered the typical execution
time. For a 90 minute timeout, we should expect the job to run
much quicker than that under normal CI load. eg a 90 minute timeout
should imply a job typically runs in 60-70 minutes, leaving some slack.

IMHO if normal execution of a job takes >60 minutes, we need to
turn off features in CI to get it faster, or split it across
multiple jobs, not increase the timeout even more.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


