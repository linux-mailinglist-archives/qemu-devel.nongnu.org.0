Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B82E0E46
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:40:09 +0100 (CET)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krmZs-0002hx-69
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krmXC-0001xL-Cy
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krmX8-0001J4-58
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608662237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KnUynINZvlhXu4rZ2TlOFkmFyLhwXfee/nZ1xxVsBU=;
 b=cowNNl0Nq/95dMlC4HRZAiau6qqyD6UwOhPF8kSNZCUJ7uXUWHoXZsHn8TPyJB2ORfx7VH
 tHwSqQ8qY4nU3zZn50rI4n6XneZDWYLUWRLX3Ksk8mngyYOE5z8NOlsU7wKf0GjZpgipYq
 pabTAhXEj/np4sdicvxuuZzCfWwRwlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-RGdxtGI_MfG43c_rpkKVSQ-1; Tue, 22 Dec 2020 13:37:14 -0500
X-MC-Unique: RGdxtGI_MfG43c_rpkKVSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4289ABBEE2;
 Tue, 22 Dec 2020 18:37:12 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4549760BF1;
 Tue, 22 Dec 2020 18:37:05 +0000 (UTC)
Subject: Re: [PATCH 1/9] tests/docker: Add dockerfile for Alpine Linux
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-2-jiaxun.yang@flygoat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <db01b083-6b48-3e88-f46f-22191927acf3@redhat.com>
Date: Tue, 22 Dec 2020 15:37:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221005318.11866-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/20/20 9:53 PM, Jiaxun Yang wrote:
> Alpine Linux[1] is a security-oriented, lightweight Linux distribution
> based on musl libc and busybox.
>
> It it popular among Docker guests and embedded applications.
>
> Adding it to test against different libc.
>
> [1]: https://alpinelinux.org/
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   tests/docker/dockerfiles/alpine.docker | 56 ++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/alpine.docker

Unless one passes `NOUSER=1` as an argument (e.g. `make NOUSER=1 
docker-image-alpine`) then the image build is going to fail due to the 
lack of useradd command on the base Alpine image. See the error below. 
As a result do build inside the container will fail (e.g. `make 
docker-test-build@alpine`). Apparently this issue can be solved by 
installing the "shadow" package in the image.

Without applying the patches 02-08 the build will fail on Alpine (tested 
with `make docker-test-build@alpine`). Actually patch 08 did not apply 
on master tree (error: patch failed: tests/migration/stress.c:174) so I 
could not successfully build it in the container.

I suggest that you move the patch 01 later on this series, just after 
all build issues are fixed so that it can be built inside the container.

---

$ make docker-image-alpine
   BUILD   alpine
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/alpine...
   manifest unknown: manifest unknown
Error: unable to pull registry.gitlab.com/qemu-project/qemu/qemu/alpine: 
Error initializing source 
docker://registry.gitlab.com/qemu-project/qemu/qemu/alpine:latest: Error 
reading manifest latest in 
registry.gitlab.com/qemu-project/qemu/qemu/alpine: manifest unknown: 
manifest unknown
/bin/sh: useradd: not found
Error: error building at STEP "RUN id wmoschet 2>/dev/null || useradd -u 
1000 -U wmoschet": error while running runtime: exit status 127
Traceback (most recent call last):
   File "/home/wmoschet/src/qemu/tests/docker/docker.py", line 709, in 
<module>
     sys.exit(main())
   File "/home/wmoschet/src/qemu/tests/docker/docker.py", line 705, in main
     return args.cmdobj.run(args, argv)
   File "/home/wmoschet/src/qemu/tests/docker/docker.py", line 498, in run
     dkr.build_image(tag, docker_dir, dockerfile,
   File "/home/wmoschet/src/qemu/tests/docker/docker.py", line 353, in 
build_image
     self._do_check(build_args,
   File "/home/wmoschet/src/qemu/tests/docker/docker.py", line 244, in 
_do_check
     return subprocess.check_call(self._command + cmd, **kwargs)
   File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
     raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['podman', 'build', '-t', 
'qemu/alpine', '-f', '/tmp/docker_build063jqidd/tmpn9zbbxzu.docker', 
'--cache-from', 'registry.gitlab.com/qemu-project/qemu/qemu/alpine', 
'/tmp/docker_build063jqidd']' returned non-zero exit status 125.
make: *** [/home/wmoschet/src/qemu/tests/docker/Makefile.include:62: 
docker-image-alpine] Error 1
---

>
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> new file mode 100644
> index 0000000000..a1b80f08d2
> --- /dev/null
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -0,0 +1,56 @@
> +
> +FROM alpine:edge
> +
> +RUN apk update
> +RUN apk upgrade
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +	alsa-lib-dev \
> +	bash \
> +	bison \
> +	build-base \
> +	coreutils \
> +	curl-dev \
> +	flex \
> +	git \
> +	glib-dev \
> +	glib-static \
> +	gnutls-dev \
> +	gtk+3.0-dev \
> +	libaio-dev \
> +	libcap-dev \
> +	libcap-ng-dev \
> +	libjpeg-turbo-dev \
> +	libnfs-dev \
> +	libpng-dev \
> +	libseccomp-dev \
> +	libssh-dev \
> +	libusb-dev \
> +	libxml2-dev \
> +	linux-headers \
> +	lzo-dev \
> +	mesa-dev \
> +	mesa-egl \
> +	mesa-gbm \
> +	meson \
> +	ncurses-dev \
> +	ninja \
> +	paxmark \
> +	perl \
> +	pulseaudio-dev \
> +	python3 \
> +	py3-sphinx \
> +	snappy-dev \

To solve the problem I mentioned above:

diff --git a/tests/docker/dockerfiles/alpine.docker 
b/tests/docker/dockerfiles/alpine.docker
index a1b80f08d2..5be5198d00 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -41,6 +41,7 @@ ENV PACKAGES \
         pulseaudio-dev \
         python3 \
         py3-sphinx \
+       shadow \
         snappy-dev \
         spice-dev \
         texinfo \

> +	spice-dev \
> +	texinfo \
> +	usbredir-dev \
> +	util-linux-dev \
> +	vde2-dev \
> +	virglrenderer-dev \
> +	vte3-dev \
> +	xfsprogs-dev \
> +	zlib-dev \
> +	zlib-static
> +
> +RUN apk add $PACKAGES


