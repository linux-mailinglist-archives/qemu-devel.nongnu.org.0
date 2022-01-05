Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2B4855C7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:23:46 +0100 (CET)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n588f-00075a-CW
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1n57Fy-00010Z-0h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:27:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1n57Fv-0001XH-Cv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641392829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgzr176F9gFLOQ+qzvEVllgnP14gFhzn4TQnawrJplg=;
 b=LzVhn2hzQy05xZXOEF3IJeQvyjqVK2HSSvvfboWlcaSLRa9sTz8+EJ5AhSPgdrEYBErCI+
 kKcse7R666O+p8qcXqDIlNlgpMDoNc2ITPixmE+OoyAirqHlV2O0Zr+BUPWEGkN5vlvXp6
 vDLzuA/Vb/G/gE97dhHWNQeBLdQzPbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-pTqLyFHgPe2N1c1XU6SiNg-1; Wed, 05 Jan 2022 09:27:05 -0500
X-MC-Unique: pTqLyFHgPe2N1c1XU6SiNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95B59190D340;
 Wed,  5 Jan 2022 14:27:04 +0000 (UTC)
Received: from localhost (unknown [10.2.17.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 859F05DD0D;
 Wed,  5 Jan 2022 14:26:56 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:26:55 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 20/34] tests/docker: add libfuse3 development headers
Message-ID: <20220105142655.GS1127@redhat.com>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-21-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220105135009.1584676-21-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 Hanna Reitz <hreitz@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:49:55PM +0000, Alex Bennée wrote:
> From: Stefan Hajnoczi <stefanha@redhat.com>
> 
> The FUSE exports feature is not built because most container images do
> not have libfuse3 development headers installed. Add the necessary
> packages to the Dockerfiles.
> 
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> Tested-by: Beraldo Leal <bleal@redhat.com>
> Message-Id: <20211207160025.52466-1-stefanha@redhat.com>
> [AJB: migrate to lcitool qemu.yml and regenerate]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


I checked all the package names and they look good, so:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

>  tests/docker/dockerfiles/alpine.docker        | 1 +
>  tests/docker/dockerfiles/centos8.docker       | 1 +
>  tests/docker/dockerfiles/fedora.docker        | 1 +
>  tests/docker/dockerfiles/opensuse-leap.docker | 1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 +
>  tests/lcitool/projects/qemu.yml               | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 97c7a88d1f..eb2251c81c 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -29,6 +29,7 @@ RUN apk update && \
>          dtc-dev \
>          eudev-dev \
>          findutils \
> +        fuse3-dev \
>          g++ \
>          gcc \
>          gcovr \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 3c62b62a99..cbb909d02b 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -30,6 +30,7 @@ RUN dnf update -y && \
>          device-mapper-multipath-devel \
>          diffutils \
>          findutils \
> +        fuse3-devel \
>          gcc \
>          gcc-c++ \
>          genisoimage \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 6784878b56..60207f3da3 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -37,6 +37,7 @@ exec "$@"' > /usr/bin/nosync && \
>          device-mapper-multipath-devel \
>          diffutils \
>          findutils \
> +        fuse3-devel \
>          gcc \
>          gcc-c++ \
>          gcovr \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 5510bdf19c..f57d8cfb29 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -22,6 +22,7 @@ RUN zypper update -y && \
>             dbus-1 \
>             diffutils \
>             findutils \
> +           fuse3-devel \
>             gcc \
>             gcc-c++ \
>             gcovr \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 40402b91fe..4e562dfdcd 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -46,6 +46,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>              libepoxy-dev \
>              libfdt-dev \
>              libffi-dev \
> +            libfuse3-dev \
>              libgbm-dev \
>              libgcrypt20-dev \
>              libglib2.0-dev \
> diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
> index 2e2271510e..ed5ab1407a 100644
> --- a/tests/lcitool/projects/qemu.yml
> +++ b/tests/lcitool/projects/qemu.yml
> @@ -18,6 +18,7 @@ packages:
>   - diffutils
>   - dtrace
>   - findutils
> + - fuse3
>   - g++
>   - gcc
>   - gcovr
> -- 
> 2.30.2

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


