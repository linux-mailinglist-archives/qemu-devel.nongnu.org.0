Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EFA2929AC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 16:43:57 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUWOC-0003cm-Uf
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 10:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUWNR-0003CM-B9
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUWNO-000730-SX
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603118584;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hvWJ8KmBvJi0UFrWY7Yv5gI0Zdeh8FIVq/wYN5Cb8ic=;
 b=KaMXgGFf8bW0wl5r6DiMESlCeLTpLCrXhCk8/9PDdYITqn2dPi6Ke0pm+iD6gP/kLWZwI8
 MJ1JbE6OA1iCKarhqA39XeCmfhodvY0TCvJ12ahVit/m+J6jCcksYrLHR9y+n/f8rLPf9j
 38Q9O1yDM0mei39+qL319aX3dUzI9Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-YNuWkwAZNoeELddLs_nmPw-1; Mon, 19 Oct 2020 10:42:58 -0400
X-MC-Unique: YNuWkwAZNoeELddLs_nmPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD225CCE09;
 Mon, 19 Oct 2020 14:42:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC32A5D9D2;
 Mon, 19 Oct 2020 14:42:55 +0000 (UTC)
Date: Mon, 19 Oct 2020 15:42:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/2] travis: Check if docs can be built with multiple
 Sphinx versions
Message-ID: <20201019144252.GK236912@redhat.com>
References: <20201019143109.1034864-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201019143109.1034864-1-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 19, 2020 at 10:31:08AM -0400, Eduardo Habkost wrote:
> Add new jobs to .travis.yml to test if docs can be built with
> multiple Sphinx versions: 1.6.1, latest 1.x, 2.0.0, and latest
> 2.x.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  .travis.yml | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 1054ec5d29..f5208301d6 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -181,6 +181,43 @@ jobs:
>              - perl
>  
>  
> +    # Check we can build docs with multiple Sphinx versions.
> +    # We need --sphinx-build=sphinx-build to ensure we use the
> +    # sphinx-build binary installed by pip.
> +
> +    # 1.6.1 is the oldest Sphinx version we support
> +    - name: "docs (Sphinx 1.6.1)"
> +      env:
> +        - CONFIG="--enable-docs --sphinx-build=sphinx-build"
> +      install:
> +        - pip install -q sphinx==1.6.1
> +      script:
> +        - make -j${JOBS} sphinxdocs
> +    - name: "docs (Sphinx 1.x)"
> +      env:
> +        - CONFIG="--enable-docs --sphinx-build=sphinx-build"
> +      install:
> +        # install latest 1.x version
> +        - pip install -q 'sphinx>=1.0,<2.0'
> +      script:
> +        - make -j${JOBS} sphinxdocs
> +    - name: "docs (Sphinx 2.0.0)"
> +      env:
> +        - CONFIG="--enable-docs --sphinx-build=sphinx-build"
> +      install:
> +        - pip install -q sphinx==2.0.0
> +      script:
> +        - make -j${JOBS} sphinxdocs
> +    - name: "docs (Sphinx 2.x)"
> +      env:
> +        - CONFIG="--enable-docs --sphinx-build=sphinx-build"
> +      install:
> +        # install latest 2.x version
> +        - pip install -q 'sphinx>=2.0,<3.0'
> +      script:
> +        - make -j${JOBS} sphinxdocs

We shouldn't be adding new jobs to Travis CI.

In terms of sphinx versions, we only need to care about versions
that correspond to our supported distro platforms. We have dockerfiles
that we build in GitLab CI for all our important Linux platforms. Some,
but not all,  of the dockerfiles include sphinx already.

IOW, we should add the sphinx RPM to all the dockerfiles that don't
already contain it - centos are the most notable ones missing it.

Then we should make sure there are GitLab CI jobs are trigger the
docs build in all distros that are needed to give this level of
coverage. There shouldn't be a need to install stuff from pip in
this case.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


