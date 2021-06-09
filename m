Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC343A1B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:18:11 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1qE-0005ey-Qs
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr1or-00049A-4q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr1op-000585-A9
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623258999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eMVXuFLz1Jod4/zjMTmxzUD17NRDOg/QFtyQ2DPKkg=;
 b=O8tAZdQm2SfYsaSfs3u2PQzbUuHr2HQOcYTUerbE9feYeefkZyahZliE5Mx1rbmgvGnTbw
 OnxFfFPXT3Yp7xA2KODbiElu6iDEYQldUWoVAb9aSgPGHpzCFc1psjWJkhl7NTXiLKjaWb
 TvV4iuEh5PV/49NNdSOF8R+blvrtzKI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-NNL_MhKnO8C4Vt_7vMZ8_g-1; Wed, 09 Jun 2021 13:16:38 -0400
X-MC-Unique: NNL_MhKnO8C4Vt_7vMZ8_g-1
Received: by mail-ua1-f71.google.com with SMTP id
 f15-20020a9f2bcf0000b02901f8fe91b89cso211382uaj.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eMVXuFLz1Jod4/zjMTmxzUD17NRDOg/QFtyQ2DPKkg=;
 b=sQlUlRN9PSTptKmQIB8BWTtRUHpB/6wh/ONmt8QPX9CxDOztMsDQouWhVU//BmGuHj
 Q9RiY3nFsa5kTV60uPd+5PD3w+nzvfYoCZXdloTEZmRYWf+3LwqbhtGx/mv+elDk0a+p
 gUbjB5nCvYD93B0FOvqEL83FicV0iawYEg3CIWdUylQTDpNPX0UceQldrGZ8aogKBLVB
 PKusfbm3+Tf7UzSOiSzb2mfKpugitEc9o80u6OsQD0WMt+5jb8IhuGDFMhP/1TgEr+z/
 LMPB+IJRh1ofwT1l6JTyu9hdOcYTFvPsBvmrVEa/nBVjLkftX0ic79rM+vJUpt7qsxZw
 VDgg==
X-Gm-Message-State: AOAM530k4PPUAvEp9zA9XtbTYn8tHk43WqKnh2DeYrmJ4AqIvXc4Y8eR
 RWFHI75a2n05pJwkYVrNxR9dqYPzpJfi0w8nfSfIvPAISS8fGXVbAHsnL9KwqGpYkvLnzzCSfMo
 Rgllkw53vSMIsgyxJWQqnTISduzoMlC4=
X-Received: by 2002:a67:f357:: with SMTP id p23mr855871vsm.50.1623258997719;
 Wed, 09 Jun 2021 10:16:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfnBENvHDkT6L7y5qtqUnqvVg0IQ1FjlAgLWm9vtsF4GZ2JEZIJHB56qYqcSN0e1lPiPTeiSpxi0CpVSVo81s=
X-Received: by 2002:a67:f357:: with SMTP id p23mr855838vsm.50.1623258997454;
 Wed, 09 Jun 2021 10:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
In-Reply-To: <20210608031425.833536-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 9 Jun 2021 14:16:11 -0300
Message-ID: <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 12:14 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> To run basic jobs on custom runners, the environment needs to be
> properly set up.  The most common requirement is having the right
> packages installed.
>
> The playbook introduced here covers the QEMU's project s390x and
> aarch64 machines.  At the time this is being proposed, those machines
> have already had this playbook applied to them.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/ci.rst                      | 30 ++++++++
>  scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>  scripts/ci/setup/inventory.template    |  1 +
>  3 files changed, 129 insertions(+)
>  create mode 100644 scripts/ci/setup/build-environment.yml
>  create mode 100644 scripts/ci/setup/inventory.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 585b7bf4b8..35c6b5e269 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>  The GitLab CI jobs definition for the custom runners are located under::
>
>    .gitlab-ci.d/custom-runners.yml
> +
> +Machine Setup Howto
> +-------------------
> +
> +For all Linux based systems, the setup can be mostly automated by the
> +execution of two Ansible playbooks.  Create an ``inventory`` file
> +under ``scripts/ci/setup``, such as this::
> +
> +  fully.qualified.domain
> +  other.machine.hostname
> +
> +You may need to set some variables in the inventory file itself.  One
> +very common need is to tell Ansible to use a Python 3 interpreter on
> +those hosts.  This would look like::
> +
> +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
> +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
> +

As I mentioned to Wainer, my suggestion is to include a comment about
ansible_become=yes and
ansible_become_password= variables as some systems may need it.

> +Build environment
> +~~~~~~~~~~~~~~~~~
> +
> +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> +set up machines with the environment needed to perform builds and run
> +QEMU tests.  It covers a number of different Linux distributions and
> +FreeBSD.
> +
> +To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory build-environment.yml
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> new file mode 100644
> index 0000000000..664f2f0519
> --- /dev/null
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -0,0 +1,98 @@
> +---
> +- name: Installation of basic packages to build QEMU
> +  hosts: all
> +  tasks:
> +    - name: Update apt cache
> +      apt:
> +        update_cache: yes

On a freshly installed Ubuntu 20.04, the script failed for me with
dependency messages on the apt side. After I updated the packages on
the system, the playbook worked without problems.

So, my suggestion is to add the "update = yes" here, or add a note in
the documentation asking the user to update the system before running
the playbook.

Except for the above comment and Wainer's comments, it looks good to
me. With these changes:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>


