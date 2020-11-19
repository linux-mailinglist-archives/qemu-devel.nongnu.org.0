Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C622D2B8ECB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:31:32 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgHr-0002uC-TD
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfgGY-0002BC-KM
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfgGT-0001gO-O0
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605778202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gWBxqm8RqSGoKi9/4hzvBeC3CuU5MZ7bq/DhbpUowWc=;
 b=F0TNSjcbvxF7MiPSGr59BDU8F/XL9rv2buk0oW5qjnIp3dYmGTcGYV+4+5xh02ut7I6J47
 D247IUp/ny9/lhUpEH9ewPCquGy576ApPV/wNCl6pGH0CQ9ncdYgdN2hfQPmj0P7AkXA34
 N26TGXRExxkn2G8OKMGhPCeVrWNTjWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-AXxJQVESMHuGyj9ECfKcQA-1; Thu, 19 Nov 2020 04:29:47 -0500
X-MC-Unique: AXxJQVESMHuGyj9ECfKcQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AA63FF2;
 Thu, 19 Nov 2020 09:29:46 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.ams2.redhat.com [10.36.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2925C1A1;
 Thu, 19 Nov 2020 09:29:40 +0000 (UTC)
Date: Thu, 19 Nov 2020 09:29:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: AL Yu-Chen Cho <acho@suse.com>
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Message-ID: <20201119092937.GB579364@redhat.com>
References: <20201116113046.11362-1-acho@suse.com>
 <20201117065719.30150-1-acho@suse.com>
 <877a38a0-0f39-eba7-618a-658f16fe56bc@redhat.com>
 <d225bed3fbd208b305cf79d7a8c5e108db53e655.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d225bed3fbd208b305cf79d7a8c5e108db53e655.camel@suse.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, lyan@suse.com, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:37:50PM +0800, AL Yu-Chen Cho wrote:
> On Tue, 2020-11-17 at 12:51 +0100, Thomas Huth wrote:
> > On 17/11/2020 07.57, Cho, Yu-Chen wrote:
> > > Add build-system-opensuse jobs and add opensuse-leap.docker
> > > dockerfile.
> > > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> > > 
> > > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > > ---
> > >  .gitlab-ci.d/containers.yml                   |  5 ++
> > >  .gitlab-ci.yml                                | 30 +++++++
> > >  tests/docker/dockerfiles/opensuse-leap.docker | 88
> > > +++++++++++++++++++
> > >  3 files changed, 123 insertions(+)
> > >  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> > > 
> > > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
> > > ci.d/containers.yml
> > > index 11d079ea58..082624a6fa 100644
> > > --- a/.gitlab-ci.d/containers.yml
> > > +++ b/.gitlab-ci.d/containers.yml
> > > @@ -246,3 +246,8 @@ amd64-ubuntu-container:
> > >    <<: *container_job_definition
> > >    variables:
> > >      NAME: ubuntu
> > > +
> > > +amd64-opensuse-leap-container:
> > > +  <<: *container_job_definition
> > > +  variables:
> > > +    NAME: opensuse-leap
> > > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > > index 9a8b375188..bf4759296a 100644
> > > --- a/.gitlab-ci.yml
> > > +++ b/.gitlab-ci.yml
> > > @@ -195,6 +195,36 @@ acceptance-system-centos:
> > >      MAKE_CHECK_ARGS: check-acceptance
> > >    <<: *acceptance_definition
> > >  
> > > +build-system-opensuse:
> > > +  <<: *native_build_job_definition
> > > +  variables:
> > > +    IMAGE: opensuse-leap
> > > +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> > > +    MAKE_CHECK_ARGS: check-build
> > > +  artifacts:
> > > +    expire_in: 2 days
> > > +    paths:
> > > +      - build
> > > +
> > > +check-system-opensuse:
> > > +  <<: *native_test_job_definition
> > > +  needs:
> > > +    - job: build-system-opensuse
> > > +      artifacts: true
> > > +  variables:
> > > +    IMAGE: opensuse-leap
> > > +    MAKE_CHECK_ARGS: check
> > > +
> > > +acceptance-system-opensuse:
> > > +  <<: *native_test_job_definition
> > > +  needs:
> > > +    - job: build-system-opensuse
> > > +      artifacts: true
> > > +  variables:
> > > +    IMAGE: opensuse-leap
> > > +    MAKE_CHECK_ARGS: check-acceptance
> > > +  <<: *acceptance_definition
> > > +
> > >  build-disabled:
> > >    <<: *native_build_job_definition
> > >    variables:
> > > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
> > > b/tests/docker/dockerfiles/opensuse-leap.docker
> > > new file mode 100644
> > > index 0000000000..712eb4fe3a
> > > --- /dev/null
> > > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> > > @@ -0,0 +1,88 @@
> > > +FROM opensuse/leap:15.2
> > > +
> > > +RUN zypper update -y
> > > +
> > > +# Please keep this list sorted alphabetically
> > > +ENV PACKAGES \
> > > +    bc \
> > > +    brlapi-devel \
> > > +    bzip2 \
> > > +    libzip-devel \
> > > +    ccache \
> > > +    clang \
> > > +    cyrus-sasl-devel \
> > > +    dbus-1 \
> > > +    device-mapper-devel \
> > > +    gcc \
> > > +    gcc-c++ \
> > > +    mkisofs \
> > > +    gettext-runtime \
> > > +    git \
> > > +    glib2-devel \
> > > +    glusterfs-devel \
> > > +    libgnutls-devel \
> > > +    gtk3-devel \
> > > +    hostname \
> > > +    libaio-devel \
> > > +    libasan5 \
> > > +    libattr-devel \
> > > +    libblockdev-devel \
> > > +    libcap-ng-devel \
> > > +    libcurl-devel \
> > > +    libepoxy-devel \
> > > +    libfdt-devel \
> > > +    libiscsi-devel \
> > > +    libjpeg8-devel \
> > > +    libpmem-devel \
> > > +    libpng16-devel \
> > > +    librbd-devel \
> > > +    libseccomp-devel \
> > > +    libssh-devel \
> > > +    libubsan0 \
> > > +    libudev-devel \
> > > +    libxml2-devel \
> > > +    libzstd-devel \
> > > +    llvm \
> > > +    lzo-devel \
> > > +    make \
> > > +    mingw32-filesystem \
> > > +    glibc-devel-32bit \
> > > +    libSDL2_image-devel \
> > > +    mingw64-binutils \
> > > +    nmap \
> > > +    ncat \
> > > +    ncurses-devel \
> > > +    libnettle-devel \
> > > +    ninja \
> > > +    mozilla-nss-devel \
> > > +    libnuma-devel \
> > > +    perl \
> > > +    libpixman-1-0-devel \
> > > +    python3-base \
> > > +    python3-PyYAML \
> > > +    python3-numpy \
> > > +    python3-opencv \
> > > +    python3-Pillow \
> > > +    python3-pip \
> > > +    python3-Sphinx \
> > > +    python3-virtualenv \
> > > +    rdma-core-devel \
> > > +    libSDL2-devel \
> > > +    snappy-devel \
> > > +    sparse \
> > > +    libspice-server-devel \
> > > +    systemd-devel \
> > > +    systemtap-sdt-devel \
> > > +    tar \
> > > +    tesseract-ocr \
> > > +    tesseract-ocr-traineddata-english \
> > > +    usbredir-devel \
> > > +    virglrenderer-devel \
> > > +    libvte-2_91-0 \
> > > +    which \
> > > +    xen-devel \
> > > +    zlib-devel
> > > +ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
> > > +
> > > +RUN zypper  --non-interactive install -y $PACKAGES
> > > +RUN rpm -q $PACKAGES | sort > /packages.txt
> > 
> > Thanks, I gave it a try now and it seems to work fine so far ... but
> > the
> > initial creation of the container was quite slow, 28 minutes, that's
> > quite a
> > bit more from what I've seen with the other containers so far:
> > 
> >  https://gitlab.com/huth/qemu/-/jobs/853630446
> > 
> > (other containers took e.g. only 10 minutes like
> > https://gitlab.com/huth/qemu/-/jobs/853630446 or 15 minutes like
> > https://gitlab.com/qemu-project/qemu/-/jobs/812284100)
> > 
> > Did I maybe just hit a bad point in time?
> > 
> 
> No, Thanks for your suggestion, I think I can decrease the docker build
> duration.
> 
> 
> > Or would it make sense to trim the list of packages that need to be
> > installed?
> 
> yes, I already started to trim, will submit v2 sson.
> 
> > 
> > For example, unless you want to test m68k-softmmu in this container,
> > too,
> > you don't need tesseract-ocr.
> > 
> > And why do you need mozilla-nss-devel ?
> > 
> > And I think you could also drop the mingw packages for now, unless
> > you want
> > to cross-compile some Windows binaries with this container?
> > 
> 
> yes, no problem. The origin plan is add some cross-compiler after this
> patch, and that I am not sure which one way to add it is that best (
> and that would not use the resource to create the docker image again.
> but I think I should patch it later.

We already have cross compiler testing with the Fedora (mingw) and Debian
images (non-x86 linux). I don't think we want to add more cross compiler
stuff if it just duplicating coverage we already haev.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


