Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40543B7AFD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 02:32:02 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyO92-0007FY-8x
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 20:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyO7s-0006ZK-EZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyO7p-0000PU-0h
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625013043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U2vTv/yrhk68IYCxSuRNngjA2tLbArIeOtWIhwsOkdM=;
 b=FIXOIPUoBXUpzOIFgc3e7f8G5TJ+Qm4+DhAIB7vAs8wr+l+4EJNfGT0zeDOWHq1H5QA5tQ
 Oia0K4q1AsZQR7AQ+9AErgjMn2FDbcWPaXAjja0fXMml7K58Y/UnI69eH7V5jGuInf6JX+
 vPSYx0odDPIwIGygqQhsTmeAU4h3q6o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467--D7PEUC4OYWGnMxKcCpDWA-1; Tue, 29 Jun 2021 20:30:40 -0400
X-MC-Unique: -D7PEUC4OYWGnMxKcCpDWA-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn22-20020a1709070d16b02904baf8000951so148334ejc.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 17:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2vTv/yrhk68IYCxSuRNngjA2tLbArIeOtWIhwsOkdM=;
 b=Mo4n9uQKfYjFbMIBa8H1/BB25bWHRCS/mNoYP8DlG/hgGlYP8GKDhgFfSB3S51qS73
 8R5iM4+YoagPduZ4SNUZ7Q03NhfMZIwKmjgWvmKpUAY7L4OooBRgZp1vqwGvT/ANRh8n
 1kweA4mvTglksWTmzpiMRVlGaSawLaMK1at5rbHTe/POMQncjled7Ak7qN2ETuunlImi
 j4XFvXupxxan7YIRDEADDypLAfO34Dv4xKNNf9xBk9xNlDqMf/TB4sWyl70GU0WSDG0h
 EIQl24x0ZSuus2GDLw/mUtwr3SVTzET3Z6Le3V5cYXME25N768+P+tCmG/sFvS595/Qn
 ekOw==
X-Gm-Message-State: AOAM531Sod76BunkhiaD0TLEFZIb7+5Zn5TY9L6g+HsvjKVGl0mTAxKU
 eXyEluYO0mly/WMg6KlgPCvfzsLRkBro+wYHJXykU92KOfuHZjzW0eTIWJUmR0a6HbZMYb7eIif
 ZMoxfEKzEGDI67lb9lBtg7vaxVx6B+OE=
X-Received: by 2002:a17:906:b201:: with SMTP id
 p1mr11224057ejz.30.1625013039010; 
 Tue, 29 Jun 2021 17:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx02UiekCSlVJT8TMkZuF5waQKID569L7TbLOOTTZiym7SFyCekMcYauKyHOyVTycnTZy4CupB5mCQVtEkzFN8=
X-Received: by 2002:a17:906:b201:: with SMTP id
 p1mr11224035ejz.30.1625013038759; 
 Tue, 29 Jun 2021 17:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <3444dc10-a1a7-a5ff-71df-c3fab2b0aa7d@redhat.com>
In-Reply-To: <3444dc10-a1a7-a5ff-71df-c3fab2b0aa7d@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 20:30:28 -0400
Message-ID: <CA+bd_6Kgv3b=3PD-e0UUwHdQyjRmprzO5is0WMRXzUrcbYj4qQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 2:27 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 6/8/21 12:14 AM, Cleber Rosa wrote:
> > The QEMU project has two machines (aarch64 and s390x) that can be used
> > for jobs that do build and run tests.  This introduces those jobs,
> > which are a mapping of custom scripts used for the same purpose.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
> >   1 file changed, 208 insertions(+)
> >
> > diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> > index a07b27384c..061d3cdfed 100644
> > --- a/.gitlab-ci.d/custom-runners.yml
> > +++ b/.gitlab-ci.d/custom-runners.yml
> > @@ -12,3 +12,211 @@
> >   # guarantees a fresh repository on each job run.
> >   variables:
> >     GIT_STRATEGY: clone
> > +
> > +# All ubuntu-18.04 jobs should run successfully in an environment
> > +# setup by the scripts/ci/setup/build-environment.yml task
> > +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> > +ubuntu-18.04-s390x-all-linux-static:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
>
> Should it restrict the job for pushes to qemu-project only? If yes, then
> it probably needs the statement:
>
> '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>

I'm not sure we should.  In theory, if people have access to other
machines on their own accounts, they should be able to trigger the
same jobs just by using the "staging" prefix.

> If you change that here, you will end it changing all over the jobs. In
> general, there are many boilerplates in this file. I'm ok to merge it as
> is as long as it is followed by another series to refactor the code.
>

Absolutely, as mentioned before, this is a straightforward mapping of
Peter's jobs, so I don't want to go over too many inderaction and
abstraction levels initially.

> > + script:
> > + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> > + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> > + - mkdir build
> > + - cd build
> > + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=1
> > + - make --output-sync -j`nproc` check-tcg V=1
> > +
> > +ubuntu-18.04-s390x-all:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > + script:
> > + - mkdir build
> > + - cd build
> > + - ../configure --disable-libssh
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=1
> > +
> > +ubuntu-18.04-s390x-alldbg:
> Maybe we don't need both ubuntu-18.04-s390x-all and
> ubuntu-18.04-s390x-alldbg jobs.
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > + script:
> > + - mkdir build
> > + - cd build
> > + - ../configure --enable-debug --disable-libssh
> > + - make clean
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=1
> > +ubuntu-18.04-s390x-clang:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > +   when: manual
> > + script:
> > + - mkdir build
> > + - cd build
> > + - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=1
> > +
> > +ubuntu-18.04-s390x-tci:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > + script:
> > + - mkdir build
> > + - cd build
> > + - ../configure --disable-libssh --enable-tcg-interpreter
> > + - make --output-sync -j`nproc`
> I think it needs to `make check-tcg` at least. See "build-tci" in
> `.gitlab-ci.d/buildtest.yml` for other tests being executed on shared
> runners.
> > +
> > +ubuntu-18.04-s390x-notcg:
> The "build-tcg-disabled" in `.gitlab-ci.d/buildtest.yml` could be
> mimic-ed here too.

These are straightforward mappings of Peter's jobs... I honestly don't
think we should deviate any further at this time.  Let me know if you
think I'm missing something though.

Thanks for the review!
- Cleber.


