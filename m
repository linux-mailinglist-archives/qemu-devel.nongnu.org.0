Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35076348EC5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:16:03 +0100 (CET)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNy6-0001FQ-9n
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lPNwY-0000lA-OU
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lPNwT-0005eu-Pg
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616670859;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AAhzLWK6a4+EXvN1D5TDf6TOUNStm3nVAYBNy+9XV2w=;
 b=T48jqRRnikQSKA3inmjsGASuSEcxGppgBTkBddrFAY0iDdR5p6AAUd5RnD373RYChQICbf
 qKt8TGBTb03swAd9X7pHBirha9gdANTLOgjmtX3guoEMV5xS2vGMMdO0yWUEczzMt4qpuL
 Ks6+2oZageIlepUgtNS9evrk2Brc3ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-B82jSOLON7mOXDE8LnQwKg-1; Thu, 25 Mar 2021 07:14:12 -0400
X-MC-Unique: B82jSOLON7mOXDE8LnQwKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B91287A82A;
 Thu, 25 Mar 2021 11:14:08 +0000 (UTC)
Received: from redhat.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A4619C44;
 Thu, 25 Mar 2021 11:14:06 +0000 (UTC)
Date: Thu, 25 Mar 2021 11:14:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: gitlab-ci: Only build /staging branch?
Message-ID: <YFxwe7nMeMKyIep1@redhat.com>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
 <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
 <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
 <CAFEAcA_GGr-BT713cWLbJCvMBdw_gn6+aMdPnb=5iN-eSP9nkw@mail.gmail.com>
 <a70af3b7-4500-edd3-9a85-242783b24b2a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a70af3b7-4500-edd3-9a85-242783b24b2a@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 25, 2021 at 12:05:32PM +0100, Paolo Bonzini wrote:
> On 25/03/21 11:34, Peter Maydell wrote:
> > It needs to be faster. Mostly I do check the gitlab CI pipeline
> > status, but in the run-up to getting rc0 out I stopped waiting
> > for the gitlab CI job to finish, because I was continually finding
> > that I kicked off a run, my local build-tests would complete within
> > an hour or so, and the gitlab CI jobs were still pending, barely
> > started, etc. Turnaround on testing a merge must be 90 minutes or
> > less, especially during release periods, because there are always
> > a huge number of merges that arrive for me to test in the last
> > couple of days before freeze.
> 
> Perhaps we could script it so that if the pipeline passes the merge to
> master is done automatically.

No need to script it, that functionality already exists in GitLab.

Push to the staging branch, and open a merge request for applying
staging -> master, and enable "merge when pipeline succeeds".

You can actually do this all in one command

https://docs.gitlab.com/ee/user/project/push_options.html

  git push \
     -o merge_request.create \
     -o merge_request.target=master \
     -o merge_request.merge_when_pipeline_succeeds \
     origin staging


The gitlab-ci.yml file could then be configured so that pipeline
jobs are associated with a merge request, rather than push event.
This will avoid the pipeline being re-run on master after the
merge.

If you enable "merge trains" option in the repo, then you can
even push to multiple branches concurrently, and gitlab will
serialize the CI pipelines from each merge request in turn,
(assuming no conflicts between then).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


