Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFA476F0E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:43:07 +0100 (CET)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoE6-0004Ls-7l
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoCc-0002l2-3n
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoCW-00081Z-3p
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651276;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MjnUzwxzZIgTkDi0kJLg4GlOZUFKcs3rHByht0qPN0o=;
 b=fzfHzsxqRmVx7ez5hzTHTpxyPOwWiusBchHgbcO6x+EWL1HGVLDKW4+Es6kNyo6Ty/kWM6
 e2NIrR1oOqVVxk1fCpCH7hoQa06yKO2Q1oU3IplpGCQ1I06tJ0nMvgAbsMvSrhRg6QGh6z
 99BdaM1Ag1Pir0j8ixyswOo3oEcP2l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Ht5XBRddMQ-DHSBLhjAL1A-1; Thu, 16 Dec 2021 05:41:12 -0500
X-MC-Unique: Ht5XBRddMQ-DHSBLhjAL1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E115B81EE60;
 Thu, 16 Dec 2021 10:41:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 693373491F;
 Thu, 16 Dec 2021 10:41:03 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:41:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC qemu.qmp PATCH 00/24] Python: Fork qemu.qmp Python lib into
 independent repo
Message-ID: <YbsXvBwgSuCuhzK/@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 04:06:10PM -0500, John Snow wrote:
> Hi, this series is part of an effort to publish the qemu.qmp package on
> PyPI. It is the second of three series to complete this work:
> 
>     (1) Switch the new Async QMP library in to python/qemu/qmp
> --> (2) Fork python/qemu/qmp out into its own repository,
>         with updated GitLab CI/CD targets to build packages.
>     (3) Update qemu.git to install qemu.qmp from PyPI,
>         and then delete python/qemu/qmp.
> 
> This series is not meant to apply to qemu.git, rather -- it's the series
> that performs the split and would apply to a brand new repository.
> 
> I am submitting it to the QEMU mailing list for these reasons:
> 
> (1) To more broadly announce my intentions, and as reference alongside
> series #1 and #3 detailed above.
> 
> (2) To ask for permission to become the maintainer of a
> 'qemu-project/qemu.qmp' repository, where I would like to host this
> subproject.

I'd say we need 3 designated maintainers as a minimum for redundancy.

> (3) To ask for review on the README.rst file which details my intended
> contribution guidelines for this subproject.
> 
> (4) To ask for review on the .gitlab-ci.d/ files and other repo-level
> CI/CD ephemera, including and especially the docs-building process.  I
> think the generated docs are still ugly, and I'd like to upload them to
> readthedocs, among other things -- hence the RFC quality of this series.

> Some review/RFC notes:
> 
> - I use jsnow/qemu.qmp as the repo name throughout the series; that will
>   have to be changed eventually, but for the purposes of prototyping, it
>   was nicer to have a fully working series.
> 
> - I'm planning on using gitlab issues and MRs for the subproject.

Great !

> - I plan to version this lib independently, starting at 0.0.1 for the
>   initial public release and bumping only the micro version for every
>   last release. I plan to bump the minor version once it hits a "beta"
>   state. There will be no cross-versioning against QEMU. I don't plan to
>   publish new releases during QEMU freezes.

IMHO if we're saying that QEMU is going to use this library straight
from PyPI from the start, then we're defacto considering it staable
from the start too. We can't accept changes published to PyPI that
are going to be incompatible with existing QEMU.

If that isn't acceptable, then QEMU is going to have to be pinned to
a very specific version from PyPi, and explicitly not pull the
latest.

> - Docs are not yet uploaded anywhere (GitLab pages, readthedocs?)

Since we're already using gitlab, personally I'd just setup a 'pages'
job and assign a qemu.org sub-domain to gitlab pages service.

> - Tags on a commit trigger two pipelines; this causes one of the package
>   builds to fail as the version number will be duplicated in this
>   case. Not entirely sure how I want to fix this yet ...

If you dont have any 'rules:' stanza gitlab creates a pipeline
for any 'push' event - this means pushes of branch commits or
pushes of tags.

To remove the duplicates we need to filter based on certain
standard variables - CI_COMMIT_BRANCH or CI_COMMIT_TAG

  rules:
    - if '$CI_PIPELINE_SOURCE != "push"'
      when: never
    - if '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_BRANCH'
      when: never
    - if '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_BRANCH'
      when: on_success
    - when: never
    

will cull jobs for pushes of branch commit, leaving pipelines
for tag pushes. It can get arbitrarily more complicated depending
on what you need to achieve.


Since we're going to use merge requests, we should be aiming to
*NOT* run pipelines on branch commit pushes for forks. We only
want pipelines attached to the merge request.

You'll need pipelines on pushes of tags for the post-merge publishing
jobs potentially, unless you want todo that on a nightly schedule

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


