Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604023B749B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:45:44 +0200 (CEST)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEzf-0003Qy-20
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyErz-0007PC-7J
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyErx-0006Ov-7Q
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624977464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mtFL1LLSZRcXTumkaYMNkTYN0P757/09+lletHVmNdQ=;
 b=fLfudSsUwRpE7aH/4DJEmlGBaLZ5bdyAq1T8NfoFR0lLzlCR9kSZKOj4pvJcww1NRCkznW
 whqCY3TkSPAycE0zExD82ROr7mVfpenA+2qs+/kydsDrPSeqD9qogd4tDWEviWguZuef/A
 Lx4eYLWGRnj2BT0BsnBqK+Y6p7HUFoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-CZLkXiCrNKCTlWbNRvQZ-w-1; Tue, 29 Jun 2021 10:37:28 -0400
X-MC-Unique: CZLkXiCrNKCTlWbNRvQZ-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD1E4804143;
 Tue, 29 Jun 2021 14:37:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6337010023B0;
 Tue, 29 Jun 2021 14:37:24 +0000 (UTC)
Date: Tue, 29 Jun 2021 15:37:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>
Subject: Re: [PATCH v5 14/14] gitlab-ci: do not use qemu-project Docker
 registry
Message-ID: <YNswId7vQL/zYJCR@redhat.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-15-ale.qemu@rev.ng>
MIME-Version: 1.0
In-Reply-To: <20210619093713.1845446-15-ale.qemu@rev.ng>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 11:37:13AM +0200, Alessandro Di Federico via wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> This commit is necessary in order to use container built by the current
> run of the CI. If we don't do this, we use official containers which are
> not affected by the additional dependencies we're introducing.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  .gitlab-ci.d/container-cross.yml    | 2 +-
>  .gitlab-ci.d/container-template.yml | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 0fcebe363a..eb134e927d 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -63,7 +63,7 @@ hexagon-cross-container:
>      - docker:dind
>    before_script:
>      - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> -    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
> +    - export COMMON_TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"

This isn't right.

We have either one or two images.  If this is a new user fork,
we only have the $COMMON_TAG image in the main QEMU registry.
If this is a existing fork, we might have two images, one in
the main QEMU registry and one in the user's fork registry.
Both of the images are to be used as a cache source, with
the container tools figuring out which has matching image
layers, if any.

This proposed change makes TAG and COMMON_TAG identical
which means we loose inheritance from the main QEMU
registry, which almost always has suitable cached content.


>      - docker info
>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
>    script:
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index 1baecd9460..c85ae377b8 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -5,7 +5,7 @@
>      - docker:dind
>    before_script:
>      - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> -    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> +    - export COMMON_TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
>      - apk add python3
>      - docker info
>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"

Again this is wrong.


> @@ -14,7 +14,7 @@
>      - echo "COMMON_TAG:$COMMON_TAG"
>      - ./tests/docker/docker.py --engine docker build
>            -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> -          -r $CI_REGISTRY/qemu-project/qemu
> +          -r $CI_REGISTRY_IMAGE

I'm not sure about this one though.

>      - docker tag "qemu/$NAME" "$TAG"
>      - docker push "$TAG"
>    after_script:

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


