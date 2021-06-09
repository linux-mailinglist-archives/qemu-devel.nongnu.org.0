Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49F3A1C5C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:48:18 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2JN-00071X-KK
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr2I7-0005gg-Eu
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr2I3-0004QP-Jt
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623260815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4CElq5pBdt/lEx5swQm2dxP2qTkZiA5jixQPvRQKiY=;
 b=YvYk3JLiwSsvzWgdKsspC6FL71rI17wvDVUmSaLe9KT6q/cJeHOhHfuy/aiL3G+yIOCpvi
 OyUcV08gmqBRz9AHMZmqBHj63F3kxQ8InJY+nPut0U+Di+NxApNOn6FF8mZiucALkungWU
 j78yor3B4oICLiQKKUvwPGJ8ok+rem8=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-88x0vG42OAmse8Do-_8XYg-1; Wed, 09 Jun 2021 13:46:48 -0400
X-MC-Unique: 88x0vG42OAmse8Do-_8XYg-1
Received: by mail-vs1-f69.google.com with SMTP id
 e26-20020a67eb9a0000b029025e73f153d5so288881vso.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H4CElq5pBdt/lEx5swQm2dxP2qTkZiA5jixQPvRQKiY=;
 b=OeJVoeVQIz73oxzGFCS82JwFAz27GAcHENi2P1vYSxM7YNqSi49Xa7ECNQ1+mocBy7
 6y62LUB5vzYkigS8fF2yHPAHJa/rxPZLJW5y2dh4oOV1V9+fGB/9ULAvEM1ZIkMTAjvy
 5FJh/vjxucnMsnUthK2hPRn9MiSW340AEdDJGk4q/1aJm8qbZgw5GmyPjcs5p+RalI9u
 Cw37WFdt4TdJW7y8kHLAQFQUvviMCzkodM3L2OrM3MM2+wp0M8erSkm6u1Zv2x682acb
 xEyY4O1KdmrDJU7q9Saq3NcIuAkeeHec+N84UsSnXwyG4sjPstAp+HeJmgHhdEJAAspK
 8UCQ==
X-Gm-Message-State: AOAM533SFqv5x1OmtSS2GiggOj5CGimkcBH7m8RTsSd0/5U1NniGPce3
 MBZqd+9rm0zNCgDymAFdMl0wpfvpAV1mO0txrZD4LaF/Vawktoc1xh5M7R/jSsStILeCZe+k16M
 ZMq/8QrNRLff/CoIq/DjKt1UU6vdELnk=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1114296uam.5.1623260808227;
 Wed, 09 Jun 2021 10:46:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPTHGr9Mhzc1LIUnNE2JwYM4qgZkNl3fVi33Pqs092nYgqmNClqIFqyuhgYYW+l1p4hvHIUv1xG3LIgPU3WcI=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1114243uam.5.1623260807857;
 Wed, 09 Jun 2021 10:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
In-Reply-To: <20210608031425.833536-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 9 Jun 2021 14:46:21 -0300
Message-ID: <CAKJDGDYkfWNQNhRH6KnjTEmbefhoaaEbQgTCtUJimw9Uwr14fw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
>
> The playbook introduced here covers the Linux distributions and
> has been primarily tested on OS/machines that the QEMU project
> has available to act as runners, namely:
>
>  * Ubuntu 20.04 on aarch64
>  * Ubuntu 18.04 on s390x
>
> But, it should work on all other Linux distributions.  Earlier
> versions were tested on FreeBSD too, so chances of success are
> high.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
>  scripts/ci/setup/.gitignore        |  1 +
>  scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
>  scripts/ci/setup/vars.yml.template | 12 ++++++
>  4 files changed, 131 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/gitlab-runner.yml
>  create mode 100644 scripts/ci/setup/vars.yml.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 35c6b5e269..bbd89e54d7 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -56,3 +56,60 @@ To run the playbook, execute::
>
>    cd scripts/ci/setup
>    ansible-playbook -i inventory build-environment.yml
> +
> +gitlab-runner setup and registration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The gitlab-runner agent needs to be installed on each machine that
> +will run jobs.  The association between a machine and a GitLab project
> +happens with a registration token.  To find the registration token for
> +your repository/project, navigate on GitLab's web UI to:
> +
> + * Settings (the gears like icon), then

* Settings (the gears like icon in the end of the left menu), then

I took some time to find it as it was hidden at the end of the scrolling.

> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * Under "Set up a specific Runner manually", look for the value under
> +   "Use the following registration token during setup"

For me, it shows: "And this registration token:"

> +
> +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> +``scripts/ci/setup/vars.yml``.  Then, set the
> +``gitlab_runner_registration_token`` variable to the value obtained
> +earlier.
> +
> +.. note:: gitlab-runner is not available from the standard location
> +          for all OS and architectures combinations.  For some systems,
> +          a custom build may be necessary.  Some builds are avaiable

If you keep this block (see comment from Wainer), s/avaiable/available/

> +          at https://cleber.fedorapeople.org/gitlab-runner/ and this
> +          URI may be used as a value on ``vars.yml``
> +
> +To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory gitlab-runner.yml
> +
> +Following the registration, it's necessary to configure the runner tags,
> +and optionally other configurations on the GitLab UI.  Navigate to:
> +
> + * Settings (the gears like icon), then
> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * "Runners activated for this project", then
> + * Click on the "Edit" icon (next to the "Lock" Icon)
> +
> +Under tags, add values matching the jobs a runner should run.  For a
> +Ubuntu 20.04 aarch64 system, the tags should be set as::
> +
> +  ubuntu_20.04,aarch64
> +
> +Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
> +would contain::
> +
> +  ubuntu-20.04-aarch64-all:
> +   tags:
> +   - ubuntu_20.04
> +   - aarch64
> +
> +It's also recommended to:
> +
> + * increase the "Maximum job timeout" to something like ``2h``
> + * give it a better Description
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..f112d05dd0
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1 @@
> +vars.yml
> \ No newline at end of file
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab=
-runner.yml
> new file mode 100644
> index 0000000000..98dab92bb5
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,61 @@
> +---
> +- name: Installation of gitlab-runner
> +  hosts: all
> +  vars_files:
> +    - vars.yml
> +  tasks:
> +    - debug:
> +        msg: 'Checking for a valid GitLab registration token'
> +      failed_when: "gitlab_runner_registration_token =3D=3D 'PLEASE_PROV=
IDE_A_VALID_TOKEN'"
> +
> +    - name: Create a group for the gitlab-runner service
> +      group:
> +        name: gitlab-runner
> +
> +    - name: Create a user for the gitlab-runner service
> +      user:
> +        user: gitlab-runner
> +        group: gitlab-runner
> +        comment: GitLab Runner
> +        home: /home/gitlab-runner
> +        shell: /bin/bash
> +
> +    - name: Remove the .bash_logout file when on Ubuntu systems
> +      file:
> +        path: /home/gitlab-runner/.bash_logout
> +        state: absent
> +      when: "ansible_facts['distribution'] =3D=3D 'Ubuntu'"
> +
> +    - name: Set the Operating System for gitlab-runner
> +      set_fact:
> +        gitlab_runner_os: "{{ ansible_facts[\"system\"]|lower }}"
> +    - debug:
> +        msg: gitlab-runner OS is {{ gitlab_runner_os }}
> +
> +    - name: Set the architecture for gitlab-runner
> +      set_fact:
> +        gitlab_runner_arch: "{{ ansible_to_gitlab_arch[ansible_facts[\"a=
rchitecture\"]] }}"
> +    - debug:
> +        msg: gitlab-runner arch is {{ gitlab_runner_arch }}
> +
> +    - name: Download the matching gitlab-runner
> +      get_url:
> +        dest: /usr/local/bin/gitlab-runner
> +        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitla=
b_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitla=
b_runner_arch }}"
> +        owner: gitlab-runner
> +        group: gitlab-runner
> +        mode: u=3Drwx,g=3Drwx,o=3Drx
> +
> +    - name: Register the gitlab-runner
> +      command: "/usr/local/bin/gitlab-runner register --non-interactive =
--url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_=
registration_token }} --executor shell --tag-list {{ ansible_facts[\"archit=
ecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\=
"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\=
"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"arch=
itecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
> +
> +    - name: Install the gitlab-runner service using its own functionalit=
y
> +      command: /usr/local/bin/gitlab-runner install --user gitlab-runner=
 --working-directory /home/gitlab-runner
> +      register: gitlab_runner_install_service_result
> +      failed_when: "gitlab_runner_install_service_result.rc !=3D 0 and \=
"already exists\" not in gitlab_runner_install_service_result.stderr"
> +
> +    - name: Enable the gitlab-runner service
> +      service:
> +        name: gitlab-runner
> +        state: started
> +        enabled: yes
> diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.y=
ml.template
> new file mode 100644
> index 0000000000..e48089761f
> --- /dev/null
> +++ b/scripts/ci/setup/vars.yml.template
> @@ -0,0 +1,12 @@
> +# The version of the gitlab-runner to use
> +gitlab_runner_version: 13.12.0
> +# The URL of the gitlab server to use, usually https://gitlab.com unless=
 you're
> +# using a private GitLab instance
> +gitlab_runner_server_url: https://gitlab.com
> +# A mapping of the ansible to gitlab architecture nomenclature
> +ansible_to_gitlab_arch:
> +  x86_64: amd64
> +  aarch64: arm64
> +  s390x: s390x
> +# A unique token made available by GitLab to your project for registerin=
g runners
> +gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
> --
> 2.25.4
>

With my suggestions and Wainer's:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>


