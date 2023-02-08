Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55B68F5FA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoVl-0006v4-50; Wed, 08 Feb 2023 12:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoVi-0006uV-Pl
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoVg-0002Bg-Nu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675878331;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UdA+52zL3Xdd/OVyTK7jjKlrn8c3RpurIGUU4aISXZY=;
 b=bH/2U2xON6SesEHvyvmqQrhxbhGmkwNbNfiyDFXloZBQ4hUh1jbMciNmoqa/4x3+CykHFx
 aarOjtcnk/c/evkDe280N4P450KdtB5hUSn/wnTIf/GG4bcDdMXnDeimGoKVzhcGHw/Ygq
 oKgJz3BE8ulvx5O2XiyCBHdO20iqmsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-c4QSv1rZOSq9h2SCg7uhcQ-1; Wed, 08 Feb 2023 12:45:30 -0500
X-MC-Unique: c4QSv1rZOSq9h2SCg7uhcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBBF8100F906;
 Wed,  8 Feb 2023 17:45:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9B7240C83B6;
 Wed,  8 Feb 2023 17:45:28 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:45:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 4/4] ci, docker: update CentOS and OpenSUSE Python to
 non-EOL versions
Message-ID: <Y+PftgKNWUVHyyKq@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
 <20230117091638.50523-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117091638.50523-5-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 17, 2023 at 10:16:38AM +0100, Paolo Bonzini wrote:
> Python 3.6 is at end-of-life.  Update the libvirt-ci module to a
> version that supports overrides for targets and package mappings;
> this way, QEMU can use the newer versions provided by CentOS 8 (Python
> 3.8) and OpenSUSE 15.3 (Python 3.9).
> 
> One unexpected issue is that sphinx-rtd-theme does not want versions
> of docutils starting with 0.18.  For distro-installed packages we can
> assume that the packager knew this, but when installing from PyPI the
> package version needs to be constrained by hand.  In order to do this,
> add the docutils package explicitly to the qemu project file.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
>  .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
>  scripts/ci/setup/build-environment.yml        |  2 +-
>  tests/docker/dockerfiles/alpine.docker        |  1 +
>  tests/docker/dockerfiles/centos8.docker       | 23 +++---
>  .../dockerfiles/debian-amd64-cross.docker     |  1 +
>  tests/docker/dockerfiles/debian-amd64.docker  |  1 +
>  .../dockerfiles/debian-arm64-cross.docker     |  1 +
>  .../dockerfiles/debian-armel-cross.docker     |  1 +
>  .../dockerfiles/debian-armhf-cross.docker     |  1 +
>  .../dockerfiles/debian-mips64el-cross.docker  |  1 +
>  .../dockerfiles/debian-mipsel-cross.docker    |  1 +
>  .../dockerfiles/debian-ppc64el-cross.docker   |  1 +
>  .../dockerfiles/debian-s390x-cross.docker     |  1 +
>  .../dockerfiles/fedora-win32-cross.docker     |  1 +
>  .../dockerfiles/fedora-win64-cross.docker     |  1 +
>  tests/docker/dockerfiles/fedora.docker        |  1 +
>  tests/docker/dockerfiles/opensuse-leap.docker | 23 +++---
>  tests/docker/dockerfiles/ubuntu2004.docker    |  3 +-
>  tests/lcitool/mappings.yml                    | 80 +++++++++++++++++++
>  tests/lcitool/projects/qemu.yml               |  1 +
>  tests/lcitool/targets/centos-stream-8.yml     |  3 +
>  tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
>  24 files changed, 131 insertions(+), 26 deletions(-)
>  create mode 100644 tests/lcitool/mappings.yml
>  create mode 100644 tests/lcitool/targets/centos-stream-8.yml
>  create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

Could you also update docs/devel/testing.rst where it talks
about lcitool, to give guidance about the local mappings/targets
overrides, vs the upstream mappings/targets usage. Most of the
time for new deps, we should continue to change the upstream
one, only using the local override where QEMU needs to diverge,
so that we maximise sharing.

The actual tests/ dir changes look ok to me

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


