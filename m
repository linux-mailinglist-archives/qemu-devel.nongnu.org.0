Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E85FC34A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:50:57 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYO8-0008NX-Rh
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiYKT-0005c6-1K
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiYKR-0006xs-5a
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665568025;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiozS8U6AytZCUpgYDUhmFN5WWmZA/2oSrsQoKkjbNE=;
 b=F1cxzvdVR/tIcQIpeFfdFZijhE25o//gEQTe96hyqjU/RrYrAJ1BhggsqJV07vi2BXby+b
 wpqmSo3KByI1pzXFP5H7xbbWTT7Am2hhNz+A4vlbe0AzaFwAtw52f6qJ8bPzeyk3OooBhq
 wOjkN4Fu4izrvzoyq3DgvVjgOI48Doo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-WdwF4mofNBmFDv5RMT-16A-1; Wed, 12 Oct 2022 05:47:04 -0400
X-MC-Unique: WdwF4mofNBmFDv5RMT-16A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C861C068C9
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 09:47:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 469794099B51;
 Wed, 12 Oct 2022 09:47:03 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:47:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] build: disable container-based cross compilers by default
Message-ID: <Y0aNFOjosNk4SsaA@redhat.com>
References: <20221012090855.359847-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221012090855.359847-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 11:08:55AM +0200, Paolo Bonzini wrote:
> Container-based cross compilers have some issues which were overlooked
> when they were only used for TCG tests, but are more visible since
> firmware builds try to use them:
> 
> - Downloading and building containers as part of make adds a
>   very long task to the build, unless you are on a fast network.
>   Container images can be hundreds of MBs.
> 
> - Verbose progress information from the container builds
>   is printed on stderr and messes up other output from
>   make/ninja
> 
> - There seem to be some rough edges around failure too.
> 
> So, make container builds opt-in.
> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml                       | 16 ++++++++--------
>  .gitlab-ci.d/crossbuilds.yml                     |  2 +-
>  .../custom-runners/ubuntu-20.04-s390x.yml        |  2 +-
>  .../custom-runners/ubuntu-22.04-aarch64.yml      |  2 +-
>  configure                                        |  4 ++--
>  5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 6c05c46397..41742ae962 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -263,7 +263,7 @@ build-user:
>      job: amd64-debian-user-cross-container
>    variables:
>      IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --disable-tools --disable-system
> +    CONFIGURE_ARGS: --disable-tools --disable-system --enable-containers
>      MAKE_CHECK_ARGS: check-tcg

Are you sure these jobs wer using containers in the first place ?

A standard gitlab CI environment isn't able to use normal docker,
and the build jobs aren't configured with the docker-in-docker
service. So I'd be surprised if any were using the container
logic.

I guess we auto-detect if it works, so silently skip them, but
its probably misleading to add --enable-containers to an env
we don't expect to use them.


> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index 0c835939db..24bca3f995 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -16,7 +16,7 @@ ubuntu-20.04-s390x-all-linux-static:
>   # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
>   - mkdir build
>   - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --enable-containers
>     || { cat config.log meson-logs/meson-log.txt; exit 1; }
>   - make --output-sync -j`nproc`
>   - make --output-sync -j`nproc` check V=1
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> index ce0b18af6f..db0c919fab 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> @@ -16,7 +16,7 @@ ubuntu-22.04-aarch64-all-linux-static:
>   - cd build
>   # Disable -static-pie due to build error with system libc:
>   # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
> - - ../configure --enable-debug --static --disable-system --disable-pie
> + - ../configure --enable-debug --static --disable-system --disable-pie --enable-containers
>     || { cat config.log meson-logs/meson-log.txt; exit 1; }
>   - make --output-sync -j`nproc --ignore=40`
>   - make --output-sync -j`nproc --ignore=40` check V=1


These changes are likely ok, as the custom runners are bare metal
so can use containers normally, provided docker/podman is installed.

> diff --git a/configure b/configure
> index baa69189f0..6fa158a0d4 100755
> --- a/configure
> +++ b/configure
> @@ -227,7 +227,7 @@ cross_prefix=""
>  host_cc="cc"
>  stack_protector=""
>  safe_stack=""
> -use_containers="yes"
> +use_containers="no"
>  gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
>  
>  if test -e "$source_path/.git"
> @@ -1034,7 +1034,7 @@ Advanced options (experts only):
>                             ucontext, sigaltstack, windows
>    --enable-plugins
>                             enable plugins via shared library loading
> -  --disable-containers     don't use containers for cross-building
> +  --enable-containers      use containers for cross-building
>    --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
>  EOF
>    meson_options_help
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


