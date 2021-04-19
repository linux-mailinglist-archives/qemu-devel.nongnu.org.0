Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D83648B1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:59:57 +0200 (CEST)
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXFc-0000vg-Mw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXES-0000Le-JA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:58:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXEQ-00020W-O7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618851522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu2M5lwdvZL907fz+B+0BiC7VljxEHSJaLnzxjcx/8g=;
 b=ZSpDnbDBcIT5VV5esCAs8L8N4sS3u6UgM8BZVV9qnaHeE2kK3UXrPf9X8NRE8rWg8b3+ZX
 DTYhzOI/cqNDw4TmY8F5RcrbtQJvaNE6hpCNVIGEo6pT5pRodC7pWmKLDGlI8uEv2ngjp1
 UVerg5W/OlsX/GB0HFQY9+PnPr+XqEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-ECOjVUtOPqWCqx0ECD8TKQ-1; Mon, 19 Apr 2021 12:58:36 -0400
X-MC-Unique: ECOjVUtOPqWCqx0ECD8TKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55AEF8DFFD5;
 Mon, 19 Apr 2021 16:58:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34CC619C79;
 Mon, 19 Apr 2021 16:58:17 +0000 (UTC)
Date: Mon, 19 Apr 2021 17:58:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
Message-ID: <YH22p6fcgMcVjUOz@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
 <877dky9rqt.fsf@linaro.org> <YH2uQADHTM4pBMi1@redhat.com>
 <534d7a2c-9377-01b6-cc9f-cd1f5aaaac00@amsat.org>
MIME-Version: 1.0
In-Reply-To: <534d7a2c-9377-01b6-cc9f-cd1f5aaaac00@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Huth <thuth@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 06:46:49PM +0200, Philippe Mathieu-Daudé wrote:
> On 4/19/21 6:22 PM, Daniel P. Berrangé wrote:
> > On Mon, Apr 19, 2021 at 04:57:55PM +0100, Alex Bennée wrote:
> >>
> >> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> >>
> >>> Forks run the same jobs than mainstream, which might be overkill.
> >>> Allow them to easily rebase their custom set, while keeping using
> >>> the mainstream templates, and ability to pick specific jobs from
> >>> the mainstream set.
> >>>
> >>> To switch to your set, simply add your .gitlab-ci.yml as
> >>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
> >>> is your gitlab 'namespace', usually username). This file will be
> >>> used instead of the default mainstream set.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>> ---
> >>>  .gitlab-ci.yml | 7 ++++++-
> >>>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> >>> index 718c8e004be..35fd35075db 100644
> >>> --- a/.gitlab-ci.yml
> >>> +++ b/.gitlab-ci.yml
> >>> @@ -9,7 +9,12 @@ generate-config:
> >>>      paths:
> >>>        - generated-config.yml
> >>>    script:
> >>> -    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
> >>> +    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
> >>> +      then
> >>> +        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml ;
> >>> +      else
> >>> +        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
> >>> +      fi
> >>
> >> This is going to be a little clunky. I can see a use for the static
> >> forks that Danial proposes but I guess what is needed is a little
> >> expressiveness. So how to express things like:
> >>
> >>  - I've only touched stuff in linux-user, so run only linux-user tests
> > 
> > This can be done with "rules" matching on files, but *only* if the
> > pipeline trigger is a merge request - specifically not a git branch
> > push, as the latter doesn't have the semantics you expect wrt
> > determining the "ancestor" to compare against. It only looks at commits
> > in the push, not those which may already have previously been pushed
> > on the branch.
> > 
> >>  - I'm working on KVM, run all KVM enabled builds and tests
> >>
> >>  - I've changed the core TCG code, run everything that exercises that
> >>
> >>  - I'm working on ARM, only build and run jobs that have ARM targets
> > 
> > If the stuff you work on is fairly static, we could potentially
> > allow env variables to be set by the user in their fork, which
> > the CI jobs use to filter jobs.
> > 
> >> I think we should define a minimum set of lightweight smoke tests that
> >> get the most bang for buck for catching sillies. I think checkpatch and
> >> dco checking should probably be in there - and maybe one of the bog
> >> standard build everything builds (maybe a random ../configure; make;
> >> make check on one of the supported LTS targets).
> > 
> > Could we have allow an env var  "QEMU_CI_SMOKE_TEST=1" which can be
> > set when pushing:
> > 
> >    git push  -o ci.variable="QEMU_CI_SMOKE_TEST=1"
> > 
> > 
> > which causes it to only do the minimum neccessary.
> > 
> > Alternatively, invert this, so do minimum smoke test by default
> > and require an env to run the full test. QEMU_CI_MAX=1
> > 
> > Potentially allow also  "QEMU_CI_EXTRA_JOBS=foo,bar,wizz"
> > to match against job jnames ?
> 
> Is that what you mean?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758340.html

Sort of - this is more implementing high level tags - I was actally
suggesting the explicit job names here.

eg if I see that my pull request to peter has failed on  job "foo",
then when testing fixes it is easier if I can just say run job "foo",
instead of trying to figure out which high level tag happens to pull
in job "foo".

The two approaches probably aren't mutually exclusive though.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


