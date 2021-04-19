Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6748363B16
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:42:25 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMfv-0003pa-P1
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMdn-0003Bc-3z
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMdi-0006y8-TN
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618810805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ho8RfTUhX9QnIEXLh6BFVdaWZmtr4x680MevPM/JjBg=;
 b=MvqXsEAxfYwk5USiORRxjNIDHgzCyGoPQV8N4OLHhY4leFEf+WLy/kp+nEejOx3WL7u+Ct
 eaAyx/keBCC7xCu9kLVCnWI90gkAcqjEvIN7OKusbSL3DtHkwVdfAk8FGdzD33jsACtZUx
 mByOEK07DEeJSDIDvN3VhaFFZWx9Vj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-2dHEzH8ePSCWNMyMsnWHhA-1; Mon, 19 Apr 2021 01:40:02 -0400
X-MC-Unique: 2dHEzH8ePSCWNMyMsnWHhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCEB18397AF;
 Mon, 19 Apr 2021 05:40:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAD44107D5C6;
 Mon, 19 Apr 2021 05:39:49 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-11-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/15] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
Message-ID: <b41d72b2-d2b1-24c2-7426-3838f1b2c7b9@redhat.com>
Date: Mon, 19 Apr 2021 07:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418233448.1267991-11-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
> Extract the build/test jobs run by default on the mainstream
> CI into a new file (buildtest.yml) and their templates into
> (buildtest-template.yml), to be able to reuse the templates
> without having to run all these mainstream jobs by default.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml |  80 +++
>   .gitlab-ci.d/buildtest.yml          | 744 +++++++++++++++++++++++++
>   .gitlab-ci.yml                      | 824 +---------------------------
>   3 files changed, 825 insertions(+), 823 deletions(-)
>   create mode 100644 .gitlab-ci.d/buildtest-template.yml
>   create mode 100644 .gitlab-ci.d/buildtest.yml

I like the idea, the main .gitlab-ci.yml was way to crowded already anyway.

Not sure if "buildtest.yml" is such a good name (since it's not only about 
building, but also about testing), but I fail to come up with a better 
suggestion...

Just a suggestion for discussion, not sure whether it's such a good idea 
yet: Maybe we could split it up even further into "system.yml" (with the 
various jobs that only test the "softmmu" binaries), "user.yml" (with the 
--disable-system jobs) and "misc.yml" (with mixed jobs) ?

> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> new file mode 100644
> index 00000000000..b24a153d904
> --- /dev/null
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -0,0 +1,80 @@
> +.native_build_job_template:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  before_script:
> +    - JOBS=$(expr $(nproc) + 1)
> +  script:
> +    - mkdir build
> +    - cd build
> +    - if test -n "$TARGETS";
> +      then
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
> +      else
> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
> +      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
> +    - if test -n "$LD_JOBS";
> +      then
> +        meson configure . -Dbackend_max_links="$LD_JOBS" ;
> +      fi || exit 1;
> +    - make -j"$JOBS"
> +    - if test -n "$MAKE_CHECK_ARGS";
> +      then
> +        make -j"$JOBS" $MAKE_CHECK_ARGS ;
> +      fi
> +
> +.native_test_job_template:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - scripts/git-submodule.sh update
> +        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
> +    - cd build
> +    - find . -type f -exec touch {} +
> +    # Avoid recompiling by hiding ninja with NINJA=":"
> +    - make NINJA=":" $MAKE_CHECK_ARGS
> +
> +.integration_test_job_template:
> +  cache:
> +    key: "${CI_JOB_NAME}-cache"
> +    paths:
> +      - ${CI_PROJECT_DIR}/avocado-cache
> +    policy: pull-push
> +  artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    when: always
> +    expire_in: 2 days
> +    paths:
> +      - build/tests/results/latest/results.xml
> +      - build/tests/results/latest/test-results
> +    reports:
> +      junit: build/tests/results/latest/results.xml
> +  before_script:
> +    - mkdir -p ~/.config/avocado
> +    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
> +    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
> +           >> ~/.config/avocado/avocado.conf
> +    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
> +           >> ~/.config/avocado/avocado.conf
> +    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
> +        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
> +      fi
> +    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
> +  after_script:
> +    - cd build
> +    - du -chs ${CI_PROJECT_DIR}/avocado-cache
> +
> +build-system-alpine:
> +  extends: .native_build_job_template
> +  needs:
> +    - job: amd64-alpine-container
> +  variables:
> +    IMAGE: alpine
> +    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
> +      moxie-softmmu microblazeel-softmmu mips64el-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - .git-submodule-status
> +      - build

build-system-alpine should certainly not go into the template file, but into 
the file below instead.

> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> new file mode 100644
> index 00000000000..c24553eab05
> --- /dev/null
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -0,0 +1,744 @@
[...]
> +check-patch:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> +  needs:
> +    job: amd64-centos8-container
> +  script: .gitlab-ci.d/check-patch.py
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +  variables:
> +    GIT_DEPTH: 1000
> +  allow_failure: true
> +
> +check-dco:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> +  needs:
> +    job: amd64-centos8-container
> +  script: .gitlab-ci.d/check-dco.py
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +  variables:
> +    GIT_DEPTH: 1000

These two should not be here anymore since they have been handled in patch 
08/15 already.

 > +# No targets are built here, just tools, docs, and unit tests. This
 > +# also feeds into the eventual documentation deployment steps later
 > +build-tools-and-docs-debian:
 > +  extends: .native_build_job_template
 > +  needs:
 > +    job: amd64-debian-container
 > +  variables:
 > +    IMAGE: debian-amd64
 > +    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
 > +    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs 
--enable-tools
 > +  artifacts:
 > +    expire_in: 2 days
 > +    paths:
 > +      - build
 > +
 > +# Prepare for GitLab pages deployment. Anything copied into the
 > +# "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 > +pages:
 > +  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
 > +  stage: test
 > +  needs:
 > +    - job: build-tools-and-docs-debian
 > +  script:
 > +    - mkdir -p public
 > +    # HTML-ised source tree
 > +    - make gtags
 > +    - htags -anT --tree-view=filetree -m qemu_init
 > +        -t "Welcome to the QEMU sourcecode"
 > +    - mv HTML public/src
 > +    # Project documentation
 > +    - make -C build install DESTDIR=$(pwd)/temp-install
 > +    - mv temp-install/usr/local/share/doc/qemu/* public/
 > +  artifacts:
 > +    paths:
 > +      - public

I think the "pages" job should maybe rather go into a separate file instead 
(maybe together with the build-tools-and-docs-debian job)?

  Thomas


