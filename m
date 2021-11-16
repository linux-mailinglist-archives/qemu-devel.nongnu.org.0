Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E245395A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 19:22:22 +0100 (CET)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn364-0007W7-TQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 13:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn35C-0006Uh-05
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 13:21:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn358-0003OI-AO
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 13:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637086880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiswYZEWQK1T15l6I6SDmYviAUGssW1/QY7SBlz24gE=;
 b=EkYtxinTUsh3/rjC2onmArITDItBGD4QPksP+lXGl1Hfmi5g6BqZDj4f6GkO6UmbpB0wn+
 EEMVqnVasiKDGT/q2P/LOwNwKkVoTZADkrcfrYzoRsI7UfB0vtBZG+uezEWhGE6g9lxALU
 ro08VN+0hmxQUQA79fWHHMjA0JGh3TI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-5oDtGLCQOfS9XVrVVbrInA-1; Tue, 16 Nov 2021 13:21:02 -0500
X-MC-Unique: 5oDtGLCQOfS9XVrVVbrInA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726B71023F4D;
 Tue, 16 Nov 2021 18:21:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5B773AEA;
 Tue, 16 Nov 2021 18:20:44 +0000 (UTC)
Date: Tue, 16 Nov 2021 18:20:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
Message-ID: <YZP2esl/18WDQHlQ@redhat.com>
References: <20211116163309.246602-1-thuth@redhat.com>
 <YZPhHt4JFcz41YFJ@redhat.com>
 <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
 <632a5f2e-3e5d-1ed7-e27f-82571e374043@redhat.com>
 <a97f6776-aaef-b4da-04ec-dcb1fcd25902@linaro.org>
MIME-Version: 1.0
In-Reply-To: <a97f6776-aaef-b4da-04ec-dcb1fcd25902@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 06:36:50PM +0100, Richard Henderson wrote:
> On 11/16/21 6:22 PM, Thomas Huth wrote:
> > On 16/11/2021 18.09, Philippe Mathieu-Daudé wrote:
> > > On 11/16/21 17:49, Daniel P. Berrangé wrote:
> > > > On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
> > > > > The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
> > > > > be scheduled, so while the build test itself finishes within 60 minutes,
> > > > > the total run time of the jobs can be longer due to this waiting time.
> > > > > Thus let's increase the timeout on the gitlab side a little bit, so
> > > > > that these jobs are not marked as failing just because of the delay.
> > ...>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> > > > > index e7b25e7427..22d42585e4 100644
> > > > > --- a/.gitlab-ci.d/cirrus.yml
> > > > > +++ b/.gitlab-ci.d/cirrus.yml
> > > > > @@ -14,6 +14,7 @@
> > > > >     stage: build
> > > > >     image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
> > > > >     needs: []
> > > > > +  timeout: 80m
> > > > >     allow_failure: true
> > > > >     script:
> > > > >       - source .gitlab-ci.d/cirrus/$NAME.vars
> > > > 
> > > > Whether 80 or 100 minute, consider it
> > > > 
> > > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > 
> > > This pipeline took 1h51m09s:
> > > https://gitlab.com/qemu-project/qemu/-/pipelines/409666733/builds
> > > But Richard restarted unstable jobs, which probably added time
> > > to the total.
> > > 
> > > IIRC from a maintainer perspective 1h15 is the upper limit.
> > > 80m fits, 100m is over.
> > 
> > I think I agree ... I normally don't want to wait more than a little bit
> > more than one hour, so 100 minutes feels too long already. We already
> > have some 70m timeouts in other jobs, and one 80 minute timeout in
> > .gitlab-ci.d/crossbuild-template.yml, so I'd say 80 minutes are really
> > the upper boundary that we should use.
> 
> We are also talking apples and oranges:
> Gitlab timeouts are on the amount of time the job runs.
> Cirrus timeouts appear to be on the amount of time the job is queued.
> 
> If cirrus would just not start accounting until the thing runs we'd be fine.

Unfortunately it isn't that easy. Our cirrus CI jobs are launched using
the cirrus-run tool, from a gitlab job. The timeouts we're usually
hitting are from the gitlab job which is sitting around waiting for
the cirrus job it launched to finish, so it can report back stats.

Cirrus CI does itself have a job timeout, but I'm not aware of us
hitting that typically, unless i'm misinterpreting something.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


