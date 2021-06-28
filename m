Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E93B5A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 10:35:10 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxmjV-0004wP-Is
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 04:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxmi6-0004GB-7N
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxmi2-0000dY-6L
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624869217;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxPVAdLCp6ojccipo8zy+dBGLSbC1bVrv97icuKb2JE=;
 b=LGFiTN/qm9JAVDyTknS8xka+Zj7INOAJLdme+jQe8MDVkcyt9XIEB+O9dvfQtANWefrit6
 0MZZLbuQypUC85CeK2WhOhqoWNOCyISuZ/W8wTye9mIzUis4OvlSzURcaqER/AMXT8N0M5
 gDQXz6bUR6j/wHYweph8qKZP7nlkVoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-dgWwQbnmOZOTlWbv4UlqVA-1; Mon, 28 Jun 2021 04:33:33 -0400
X-MC-Unique: dgWwQbnmOZOTlWbv4UlqVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17DEB80430D;
 Mon, 28 Jun 2021 08:33:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAA23B04;
 Mon, 28 Jun 2021 08:33:22 +0000 (UTC)
Date: Mon, 28 Jun 2021 09:33:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] gitlab: support for FreeBSD 12, 13 and macOS 11 via
 cirrus-run
Message-ID: <YNmJUCaNI88SYYOO@redhat.com>
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-3-berrange@redhat.com>
 <bc459548-6afa-dc35-696f-4757431fbb46@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc459548-6afa-dc35-696f-4757431fbb46@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 09:28:18AM +0200, Thomas Huth wrote:
> On 25/06/2021 19.22, Daniel P. Berrangé wrote:
> > This adds support for running 4 jobs via Cirrus CI runners:
> > 
> >   * FreeBSD 12
> >   * FreeBSD 13
> >   * macOS 11 with default XCode
> >   * macOS 11 with latest XCode
> > 
> > The gitlab job uses a container published by the libvirt-ci
> > project (https://gitlab.com/libvirt/libvirt-ci) that contains
> > the 'cirrus-run' command. This accepts a short yaml file that
> > describes a single Cirrus CI job, runs it using the Cirrus CI
> > REST API, and reports any output to the console.
> > 
> > In this way Cirrus CI is effectively working as an indirect
> > custom runner for GitLab CI pipelines. The key benefit is that
> > Cirrus CI job results affect the GitLab CI pipeline result and
> > so the user only has look at one CI dashboard.
> 
> Cool, thanks for tackling this!
> 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   .gitlab-ci.d/cirrus.yml             | 103 ++++++++++++++++++++++++++++
> >   .gitlab-ci.d/cirrus/README.rst      |  54 +++++++++++++++
> >   .gitlab-ci.d/cirrus/build.yml       |  35 ++++++++++
> >   .gitlab-ci.d/cirrus/freebsd-12.vars |  13 ++++
> >   .gitlab-ci.d/cirrus/freebsd-13.vars |  13 ++++
> >   .gitlab-ci.d/cirrus/macos-11.vars   |  15 ++++
> >   .gitlab-ci.d/qemu-project.yml       |   1 +
> >   7 files changed, 234 insertions(+)
> >   create mode 100644 .gitlab-ci.d/cirrus.yml
> >   create mode 100644 .gitlab-ci.d/cirrus/README.rst
> >   create mode 100644 .gitlab-ci.d/cirrus/build.yml
> >   create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
> >   create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars
> >   create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars
> > 
> > diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> > new file mode 100644
> > index 0000000000..d7b4cce79b
> > --- /dev/null
> > +++ b/.gitlab-ci.d/cirrus.yml
> > @@ -0,0 +1,103 @@
> > +# Jobs that we delegate to Cirrus CI because they require an operating
> > +# system other than Linux. These jobs will only run if the required
> > +# setup has been performed on the GitLab account.
> > +#
> > +# The Cirrus CI configuration is generated by replacing target-specific
> > +# variables in a generic template: some of these variables are provided
> > +# when the GitLab CI job is defined, others are taken from a shell
> > +# snippet generated using lcitool.
> > +#
> > +# Note that the $PATH environment variable has to be treated with
> > +# special care, because we can't just override it at the GitLab CI job
> > +# definition level or we risk breaking it completely.
> > +.cirrus_build_job:
> > +  stage: build
> > +  image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
> > +  needs: []
> > +  script:
> > +    - source .gitlab-ci.d/cirrus/$NAME.vars
> > +    - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
> > +          -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
> > +          -e "s|[@]CI_COMMIT_SHA@|$CI_COMMIT_SHA|g"
> > +          -e "s|[@]CIRRUS_VM_INSTANCE_TYPE@|$CIRRUS_VM_INSTANCE_TYPE|g"
> > +          -e "s|[@]CIRRUS_VM_IMAGE_SELECTOR@|$CIRRUS_VM_IMAGE_SELECTOR|g"
> > +          -e "s|[@]CIRRUS_VM_IMAGE_NAME@|$CIRRUS_VM_IMAGE_NAME|g"
> > +          -e "s|[@]CIRRUS_VM_CPUS@|$CIRRUS_VM_CPUS|g"
> > +          -e "s|[@]CIRRUS_VM_RAM@|$CIRRUS_VM_RAM|g"
> > +          -e "s|[@]UPDATE_COMMAND@|$UPDATE_COMMAND|g"
> > +          -e "s|[@]INSTALL_COMMAND@|$INSTALL_COMMAND|g"
> > +          -e "s|[@]PATH@|$PATH_EXTRA${PATH_EXTRA:+:}\$PATH|g"
> > +          -e "s|[@]PKG_CONFIG_PATH@|$PKG_CONFIG_PATH|g"
> > +          -e "s|[@]PKGS@|$PKGS|g"
> > +          -e "s|[@]MAKE@|$MAKE|g"
> > +          -e "s|[@]PYTHON@|$PYTHON|g"
> > +          -e "s|[@]PIP3@|$PIP3|g"
> > +          -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
> > +          -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
> > +          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
> > +      <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
> > +    - cat .gitlab-ci.d/cirrus/$NAME.yml
> > +    - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
> > +  rules:
> > +    - if: "$TEMPORARILY_DISABLED"
> > +      allow_failure: true
> > +    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
> > +
> > +x64-freebsd-12-build:
> > +  extends: .cirrus_build_job
> > +  variables:
> > +    NAME: freebsd-12
> > +    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> > +    CIRRUS_VM_IMAGE_SELECTOR: image_family
> > +    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
> > +    CIRRUS_VM_CPUS: 8
> > +    CIRRUS_VM_RAM: 8G
> > +    UPDATE_COMMAND: pkg update
> > +    INSTALL_COMMAND: pkg install -y
> > +    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> > +    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> > +    CONFIGURE_ARGS: --disable-gnutls
> > +    TEST_TARGETS: check
> > +
> > +x64-freebsd-13-build:
> > +  extends: .cirrus_build_job
> > +  variables:
> > +    NAME: freebsd-13
> > +    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> > +    CIRRUS_VM_IMAGE_SELECTOR: image_family
> > +    CIRRUS_VM_IMAGE_NAME: freebsd-13-0
> > +    CIRRUS_VM_CPUS: 8
> > +    CIRRUS_VM_RAM: 8G
> > +    UPDATE_COMMAND: pkg update
> > +    INSTALL_COMMAND: pkg install -y
> > +    TEST_TARGETS: check
> > +
> > +x64-macos-11-base-build:
> > +  extends: .cirrus_build_job
> > +  variables:
> > +    NAME: macos-11
> > +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> > +    CIRRUS_VM_IMAGE_SELECTOR: image
> > +    CIRRUS_VM_IMAGE_NAME: big-sur-base
> > +    CIRRUS_VM_CPUS: 12
> > +    CIRRUS_VM_RAM: 24G
> > +    UPDATE_COMMAND: brew update
> > +    INSTALL_COMMAND: brew install
> > +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> > +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> > +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
> > +
> > +x64-macos-11-xcode-build:
> > +  extends: .cirrus_build_job
> > +  variables:
> > +    NAME: macos-11
> > +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> > +    CIRRUS_VM_IMAGE_SELECTOR: image
> > +    CIRRUS_VM_IMAGE_NAME: big-sur-xcode
> > +    CIRRUS_VM_CPUS: 12
> > +    CIRRUS_VM_RAM: 24G
> > +    UPDATE_COMMAND: brew update
> > +    INSTALL_COMMAND: brew install
> > +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> > +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> > +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
> 
> Not directly related to your patch, but I wonder whether we really gain much
> by having two macos build jobs in our CI ... they seem to be very similar,
> e.g. compare the output of the "configure" step of the "macos" and the
> "macos_xcode" job here:
> 
>  https://cirrus-ci.com/build/4919300914937856
> 
> The diff basically looks like this:

snip


Looking back, the 2nd job was added by


commit fc84471ae2867823f56b1ad1705de324c2d8b725
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Wed Oct 16 19:27:13 2019 +0100

    cirrus.yml: add latest Xcode build target
    
    CirrusCI provides a mojave-xcode alias for the latest Xcode available.
    Let's use it to make sure we track the latest releases.
    

At the time this was added there was likely a significant difference
in XCode versions.

Since that time, both images were upgraded to catalina, instead of
mojave, and that appears to have eliminated the differences. My
changes upgrade again to big-sur.

So yes, we can drop the 2nd job at this time,


> > diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> > new file mode 100644
> > index 0000000000..857bdc5536
> > --- /dev/null
> > +++ b/.gitlab-ci.d/cirrus/build.yml
> > @@ -0,0 +1,35 @@
> > +@CIRRUS_VM_INSTANCE_TYPE@:
> > +  @CIRRUS_VM_IMAGE_SELECTOR@: @CIRRUS_VM_IMAGE_NAME@
> > +  cpu: @CIRRUS_VM_CPUS@
> > +  memory: @CIRRUS_VM_RAM@
> > +
> > +env:
> > +  CIRRUS_CLONE_DEPTH: 1
> > +  CI_REPOSITORY_URL: "@CI_REPOSITORY_URL@"
> > +  CI_COMMIT_REF_NAME: "@CI_COMMIT_REF_NAME@"
> > +  CI_COMMIT_SHA: "@CI_COMMIT_SHA@"
> > +  PATH: "@PATH@"
> > +  PKG_CONFIG_PATH: "@PKG_CONFIG_PATH@"
> > +  PYTHON: "@PYTHON@"
> > +  MAKE: "@MAKE@"
> > +  CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
> > +
> > +build_task:
> > +  install_script:
> > +    - @UPDATE_COMMAND@
> > +    - @INSTALL_COMMAND@ @PKGS@
> > +    - if test -n "@PYPI_PKGS@" ; then @PIP3@ install @PYPI_PKGS@ ; fi
> > +  clone_script:
> > +    - git clone --depth 100 "$CI_REPOSITORY_URL" .
> > +    - git fetch origin "$CI_COMMIT_REF_NAME"
> > +    - git reset --hard "$CI_COMMIT_SHA"
> > +  build_script:
> > +    - mkdir build
> > +    - cd build
> > +    - ../configure --enable-werror $CONFIGURE_ARGS
> > +      || { cat config.log meson-logs/meson-log.txt; exit 1; }
> > +    - $MAKE -j$(sysctl -n hw.ncpu)
> > +    - for TARGET in $TEST_TARGETS ;
> > +      do
> > +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
> > +      done
> 
> You seem to try to enable ccache in the other files (e.g. by extending the
> PATH) ... however, I don't see where you try to save the ccache directory
> between the runs... so I guess that ccache won't be working with this setup
> yet? In that case, I'd recommend to rather drop the other ccache changes
> again, since the initial run with ccache (where the cache gets populated) is
> rather slower than compiling without ccache.

I'll examine that. I think the path change is harmless though, because it
points to a location that I don't think exists. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


