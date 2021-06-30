Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A03B89CB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 22:37:22 +0200 (CEST)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lygxV-00076A-1r
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 16:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lygw3-0006OE-S5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lygw0-0000uC-88
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625085346;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zko0I0Nm6E7/Q/hmDMszaRa9qFPLD4WoWB3YH4Rs5TM=;
 b=PRKhBpOye4ilgmXZPl3Hoq4oBT817sX/+EyFt6NLi4yx5RlJ1mXHly4+RCr2mESTuU6C7J
 AWAnkELHy0GoumVFnwZmWuc7VyXIOw4hLw86TWrZZPb+5ekKsc7dOOSt63XCaAJmdxRMAp
 wl9way5gbahA1ZYbdvqigCHXWlMDowk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-BAgWrwchPvaqFRcKwSn9mw-1; Wed, 30 Jun 2021 16:35:35 -0400
X-MC-Unique: BAgWrwchPvaqFRcKwSn9mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A6D8030D7;
 Wed, 30 Jun 2021 20:35:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E44A6604CD;
 Wed, 30 Jun 2021 20:35:24 +0000 (UTC)
Date: Wed, 30 Jun 2021 21:35:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 2/3] gitlab: support for FreeBSD 12, 13 and macOS 11 via
 cirrus-run
Message-ID: <YNzViRJ1S4G0U5tG@redhat.com>
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-3-berrange@redhat.com>
 <ead03192-5ec8-f53e-34d2-4e3a0275f3a8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ead03192-5ec8-f53e-34d2-4e3a0275f3a8@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 03:58:57PM -0300, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 6/25/21 2:22 PM, Daniel P. Berrangé wrote:
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
> > 
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
> 
> Reading 'TEMPORARILY_DISABLED' I immediately think the job is malfunctioning
> or under maintenance.

Actually this is cruft that I mistakenly copied from libvirt's rules.

> But since the plan is to keep it running as 'non-gate' until it proves
> reliable, so maybe you could rename the variable to 'NON_GATE' or
> 'STAGING_JOB' (i.e. some words to better express the intent).

We can just remove the 'if $TEMPORARILY_DISABLED' bit and
have only the 'allow_failure: true' bit


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


