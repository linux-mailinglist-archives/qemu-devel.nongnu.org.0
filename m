Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEB33B7AD9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 02:05:48 +0200 (CEST)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNje-0000D4-RD
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 20:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNiZ-0007yi-6X
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNiW-0008Gc-5s
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625011474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcSsz+vl8Aar+m4TzpyoQRBGaHycJIrVjl+no3Std/A=;
 b=FhiSsN2Dt9H23UAFzT85W4JWnt10CKeA1B00ETvB03VlHsUo67rkUEgi0gGiozfYPKw34x
 8Keq5ar0zw4T7FCcxrhDIzdCIvnZ+VcQlajVUCnG4cAFA8MGyoakwNqmEtgbplw9Hf7SLV
 M+XnZg6a9WX2uL1f4LECnSkvP08Wjdg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-MNVSeo2ZOMG8_4h0lEl4_w-1; Tue, 29 Jun 2021 20:04:33 -0400
X-MC-Unique: MNVSeo2ZOMG8_4h0lEl4_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 o8-20020aa7dd480000b02903954c05c938so221328edw.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 17:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pcSsz+vl8Aar+m4TzpyoQRBGaHycJIrVjl+no3Std/A=;
 b=gC9MuQQtvSOYxzx7KVGL0seav/JO6kJP3m6lQ1EI/piipYuR7Ke2Y3Addg3pDTnpgX
 NuUHUqBY+zzlZEThYtxCb1eJRNF6AqKv7d71sMXhCyMBsMb6oo4ZBzvWNxxrkCFQlEoM
 qh2kHdoUCiVP8w4pS2QPnuBUpU30dsFAdAp8V762UhRN4/Phxglw6NQ1XYERcBX5gikl
 KPNikNSiyR3G9mUUElJSuaVaJVJikqh94xmgD4eMSkeNbIUcme9USoDjW7Hia2PKeeo9
 lKmcwa2EXeyMl2O4xmn7J6ZK33l0LjK3MlD2G9mNsc4VXkFXG6Zxr0tsQxF3edSrOFI2
 ObRg==
X-Gm-Message-State: AOAM531jrrhupM/2WRDS2+H7MAZ1rd1SDDk8/4s9RVbfPYCwwO29edFR
 vOah1RrKOh2sdLoalAyoUqGQc7N+IhQp7oJphL2QJXx9m1tNkZ1R7lGBWRul8D3A5a9Qs0fFpfl
 DHYUohPwt5DJ0/cQQLHyvrdSH8jK0fto=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr31539971eji.6.1625011471949; 
 Tue, 29 Jun 2021 17:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Ho+9PyyqbMPH6oBFYauo1JSLdEeKacDYr08asRtqjagf+e1Ua2/GleiaLdgMr2lisJ72w8ct6re4D9hpC3w=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr31539933eji.6.1625011471670; 
 Tue, 29 Jun 2021 17:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
 <CAKJDGDYkfWNQNhRH6KnjTEmbefhoaaEbQgTCtUJimw9Uwr14fw@mail.gmail.com>
In-Reply-To: <CAKJDGDYkfWNQNhRH6KnjTEmbefhoaaEbQgTCtUJimw9Uwr14fw@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 20:04:20 -0400
Message-ID: <CA+bd_6Ktq=2+kqn+kmjkv9_Q=GEd9euzvKbJtJ003M9oXrmJ5w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Willian Rampazzo <wrampazz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 1:46 PM Willian Rampazzo <wrampazz@redhat.com> wrote=
:
>
> On Tue, Jun 8, 2021 at 12:14 AM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > To have the jobs dispatched to custom runners, gitlab-runner must
> > be installed, active as a service and properly configured.  The
> > variables file and playbook introduced here should help with those
> > steps.
> >
> > The playbook introduced here covers the Linux distributions and
> > has been primarily tested on OS/machines that the QEMU project
> > has available to act as runners, namely:
> >
> >  * Ubuntu 20.04 on aarch64
> >  * Ubuntu 18.04 on s390x
> >
> > But, it should work on all other Linux distributions.  Earlier
> > versions were tested on FreeBSD too, so chances of success are
> > high.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
> >  scripts/ci/setup/.gitignore        |  1 +
> >  scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
> >  scripts/ci/setup/vars.yml.template | 12 ++++++
> >  4 files changed, 131 insertions(+)
> >  create mode 100644 scripts/ci/setup/.gitignore
> >  create mode 100644 scripts/ci/setup/gitlab-runner.yml
> >  create mode 100644 scripts/ci/setup/vars.yml.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 35c6b5e269..bbd89e54d7 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -56,3 +56,60 @@ To run the playbook, execute::
> >
> >    cd scripts/ci/setup
> >    ansible-playbook -i inventory build-environment.yml
> > +
> > +gitlab-runner setup and registration
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The gitlab-runner agent needs to be installed on each machine that
> > +will run jobs.  The association between a machine and a GitLab project
> > +happens with a registration token.  To find the registration token for
> > +your repository/project, navigate on GitLab's web UI to:
> > +
> > + * Settings (the gears like icon), then
>
> * Settings (the gears like icon in the end of the left menu), then
>

ACK.  What about:

" * Settings (the gears-like icon at the bottom of the left hand side
   vertical toolbar), then"

> I took some time to find it as it was hidden at the end of the scrolling.
>
> > + * CI/CD, then
> > + * Runners, and click on the "Expand" button, then
> > + * Under "Set up a specific Runner manually", look for the value under
> > +   "Use the following registration token during setup"
>
> For me, it shows: "And this registration token:"
>

Right, it must have changed.  Updating it on v7.

> > +
> > +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> > +``scripts/ci/setup/vars.yml``.  Then, set the
> > +``gitlab_runner_registration_token`` variable to the value obtained
> > +earlier.
> > +
> > +.. note:: gitlab-runner is not available from the standard location
> > +          for all OS and architectures combinations.  For some systems=
,
> > +          a custom build may be necessary.  Some builds are avaiable
>
> If you keep this block (see comment from Wainer), s/avaiable/available/
>

I'd rather remove it, but thanks for spotting the typo.

> > +          at https://cleber.fedorapeople.org/gitlab-runner/ and this
> > +          URI may be used as a value on ``vars.yml``
> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory gitlab-runner.yml
> > +
> > +Following the registration, it's necessary to configure the runner tag=
s,
> > +and optionally other configurations on the GitLab UI.  Navigate to:
> > +
> > + * Settings (the gears like icon), then
> > + * CI/CD, then
> > + * Runners, and click on the "Expand" button, then
> > + * "Runners activated for this project", then
> > + * Click on the "Edit" icon (next to the "Lock" Icon)
> > +
> > +Under tags, add values matching the jobs a runner should run.  For a
> > +Ubuntu 20.04 aarch64 system, the tags should be set as::
> > +
> > +  ubuntu_20.04,aarch64
> > +
> > +Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
> > +would contain::
> > +
> > +  ubuntu-20.04-aarch64-all:
> > +   tags:
> > +   - ubuntu_20.04
> > +   - aarch64
> > +
> > +It's also recommended to:
> > +
> > + * increase the "Maximum job timeout" to something like ``2h``
> > + * give it a better Description
> > diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> > new file mode 100644
> > index 0000000000..f112d05dd0
> > --- /dev/null
> > +++ b/scripts/ci/setup/.gitignore
> > @@ -0,0 +1 @@
> > +vars.yml
> > \ No newline at end of file
> > diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitl=
ab-runner.yml
> > new file mode 100644
> > index 0000000000..98dab92bb5
> > --- /dev/null
> > +++ b/scripts/ci/setup/gitlab-runner.yml
> > @@ -0,0 +1,61 @@
> > +---
> > +- name: Installation of gitlab-runner
> > +  hosts: all
> > +  vars_files:
> > +    - vars.yml
> > +  tasks:
> > +    - debug:
> > +        msg: 'Checking for a valid GitLab registration token'
> > +      failed_when: "gitlab_runner_registration_token =3D=3D 'PLEASE_PR=
OVIDE_A_VALID_TOKEN'"
> > +
> > +    - name: Create a group for the gitlab-runner service
> > +      group:
> > +        name: gitlab-runner
> > +
> > +    - name: Create a user for the gitlab-runner service
> > +      user:
> > +        user: gitlab-runner
> > +        group: gitlab-runner
> > +        comment: GitLab Runner
> > +        home: /home/gitlab-runner
> > +        shell: /bin/bash
> > +
> > +    - name: Remove the .bash_logout file when on Ubuntu systems
> > +      file:
> > +        path: /home/gitlab-runner/.bash_logout
> > +        state: absent
> > +      when: "ansible_facts['distribution'] =3D=3D 'Ubuntu'"
> > +
> > +    - name: Set the Operating System for gitlab-runner
> > +      set_fact:
> > +        gitlab_runner_os: "{{ ansible_facts[\"system\"]|lower }}"
> > +    - debug:
> > +        msg: gitlab-runner OS is {{ gitlab_runner_os }}
> > +
> > +    - name: Set the architecture for gitlab-runner
> > +      set_fact:
> > +        gitlab_runner_arch: "{{ ansible_to_gitlab_arch[ansible_facts[\=
"architecture\"]] }}"
> > +    - debug:
> > +        msg: gitlab-runner arch is {{ gitlab_runner_arch }}
> > +
> > +    - name: Download the matching gitlab-runner
> > +      get_url:
> > +        dest: /usr/local/bin/gitlab-runner
> > +        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ git=
lab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ git=
lab_runner_arch }}"
> > +        owner: gitlab-runner
> > +        group: gitlab-runner
> > +        mode: u=3Drwx,g=3Drwx,o=3Drx
> > +
> > +    - name: Register the gitlab-runner
> > +      command: "/usr/local/bin/gitlab-runner register --non-interactiv=
e --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runne=
r_registration_token }} --executor shell --tag-list {{ ansible_facts[\"arch=
itecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts=
[\"distribution_version\"] }} --description '{{ ansible_facts[\"distributio=
n\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"ar=
chitecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
> > +
> > +    - name: Install the gitlab-runner service using its own functional=
ity
> > +      command: /usr/local/bin/gitlab-runner install --user gitlab-runn=
er --working-directory /home/gitlab-runner
> > +      register: gitlab_runner_install_service_result
> > +      failed_when: "gitlab_runner_install_service_result.rc !=3D 0 and=
 \"already exists\" not in gitlab_runner_install_service_result.stderr"
> > +
> > +    - name: Enable the gitlab-runner service
> > +      service:
> > +        name: gitlab-runner
> > +        state: started
> > +        enabled: yes
> > diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars=
.yml.template
> > new file mode 100644
> > index 0000000000..e48089761f
> > --- /dev/null
> > +++ b/scripts/ci/setup/vars.yml.template
> > @@ -0,0 +1,12 @@
> > +# The version of the gitlab-runner to use
> > +gitlab_runner_version: 13.12.0
> > +# The URL of the gitlab server to use, usually https://gitlab.com unle=
ss you're
> > +# using a private GitLab instance
> > +gitlab_runner_server_url: https://gitlab.com
> > +# A mapping of the ansible to gitlab architecture nomenclature
> > +ansible_to_gitlab_arch:
> > +  x86_64: amd64
> > +  aarch64: arm64
> > +  s390x: s390x
> > +# A unique token made available by GitLab to your project for register=
ing runners
> > +gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
> > --
> > 2.25.4
> >
>
> With my suggestions and Wainer's:
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>
>


