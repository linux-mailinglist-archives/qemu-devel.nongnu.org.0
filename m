Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB1493F47
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:46:47 +0100 (CET)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAF2k-00051P-B2
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAEqb-0008TU-93
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAEqZ-0002uz-0e
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642613650;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTOwqVxkd0IiT/YpPPyW75ZqSocHqoHR1iX9GQyfH4c=;
 b=U6NIOTIOwmEyA1DO08PMfzbEszbNcy4DpAgsSX6rwnjzuFO2gDUzcHyODP4te20dtUW5UW
 1+DkJ/cgh9hyIyKguFk+k9Ej/9KiG57+llCHnG8EvLhiLZ5y99hMDfxMzrPmyGf7Jy/d23
 33pSjrJGbs7OGqZlZ6ZJkFasUjoeIrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-aLhjHLYVNUmCQyS8yLEcEQ-1; Wed, 19 Jan 2022 12:33:59 -0500
X-MC-Unique: aLhjHLYVNUmCQyS8yLEcEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D1939346;
 Wed, 19 Jan 2022 17:33:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0A11F438;
 Wed, 19 Jan 2022 17:33:56 +0000 (UTC)
Date: Wed, 19 Jan 2022 17:33:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] tests: Refresh lcitool submodule
Message-ID: <YehLgVvAW5SFIZli@redhat.com>
References: <20220110124638.610145-1-f4bug@amsat.org>
 <20220110124638.610145-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220110124638.610145-3-f4bug@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 01:46:38PM +0100, Philippe Mathieu-Daudé wrote:
> Refresh lcitool submodule and the generated files by running:
> 
>   $ make lcitool-refresh
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/docker/dockerfiles/alpine.docker        | 3 ++-
>  tests/docker/dockerfiles/centos8.docker       | 3 +--
>  tests/docker/dockerfiles/fedora.docker        | 3 +--
>  tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
>  tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>  tests/lcitool/libvirt-ci                      | 2 +-
>  7 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index eb2251c81c8..9d7f74fc51e 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile alpine-edge qemu
> +#  $ lcitool dockerfile --layers all alpine-edge qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> @@ -109,6 +109,7 @@ RUN apk update && \
>          zlib-dev \
>          zlib-static \
>          zstd-dev && \
> +    apk list | sort > /packages.txt && \
>      mkdir -p /usr/libexec/ccache-wrappers && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index cbb909d02b3..fde6a036263 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile centos-8 qemu
> +#  $ lcitool dockerfile --layers all centos-8 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> @@ -69,7 +69,6 @@ RUN dnf update -y && \
>          libssh-devel \
>          libtasn1-devel \
>          libubsan \
> -        libudev-devel \
>          liburing-devel \
>          libusbx-devel \
>          libxml2-devel \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 60207f3da38..82f504e40d6 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile fedora-35 qemu
> +#  $ lcitool dockerfile --layers all fedora-35 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> @@ -77,7 +77,6 @@ exec "$@"' > /usr/bin/nosync && \
>          libssh-devel \
>          libtasn1-devel \
>          libubsan \
> -        libudev-devel \
>          liburing-devel \
>          libusbx-devel \
>          libxml2-devel \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index f57d8cfb299..30e7038148a 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile opensuse-leap-152 qemu
> +#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 0ffa3c4d4b5..4ea272d143b 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile ubuntu-1804 qemu
> +#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 4e562dfdcd3..90988b2bc53 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -1,6 +1,6 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile ubuntu-2004 qemu
> +#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>  
> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
> index 29cec2153b9..8f48e54238d 160000
> --- a/tests/lcitool/libvirt-ci
> +++ b/tests/lcitool/libvirt-ci
> @@ -1 +1 @@
> -Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
> +Subproject commit 8f48e54238d28d7a427a541d6dbe56432e3c4660

If you update that further you'll get the commit you added to
support macos-12.


regardless

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


