Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C870E3210EB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:40:51 +0100 (CET)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4tm-0007j2-EQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lE4r7-0007E5-8A
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lE4r3-0006ko-Oa
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613975880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MW7LB62319+t2qO563vB2wtvgccXyx92CfhSzgrQqc=;
 b=NDpnrsJnyrAL2/ms5dHWGasKTOzs+KI05EbWI8bHFam6QfoQID4PAYC2g5a857nb9Ophin
 n+VfAvXBTgeDf4DxYfI3dsIJMCJyKGk04Jx4qhBBWR2mYQ7TfEC6mSU/C6KdaF8KWDgXXZ
 1yGGnHnk7swSvPuwP6WME2Zd/wcxNFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-JoIODEilOoqE91IzZZPrSQ-1; Mon, 22 Feb 2021 01:36:38 -0500
X-MC-Unique: JoIODEilOoqE91IzZZPrSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2055DBBEE3;
 Mon, 22 Feb 2021 06:36:37 +0000 (UTC)
Received: from nautilus.local (unknown [10.40.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D305C1A1;
 Mon, 22 Feb 2021 06:36:30 +0000 (UTC)
Date: Mon, 22 Feb 2021 07:36:28 +0100
From: Erik Skultety <eskultet@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
Message-ID: <YDNQ7H6EMHroecPJ@nautilus.local>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-4-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-4-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 04:58:37PM -0500, Cleber Rosa wrote:
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
> 
> The playbook introduced here covers a number of different Linux
> distributions and FreeBSD, and are intended to provide a reproducible
> environment.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/ci.rst                  | 58 ++++++++++++++++++++++++++
>  scripts/ci/setup/.gitignore        |  1 +
>  scripts/ci/setup/gitlab-runner.yml | 65 ++++++++++++++++++++++++++++++
>  scripts/ci/setup/vars.yml.template | 13 ++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/gitlab-runner.yml
>  create mode 100644 scripts/ci/setup/vars.yml.template
> 
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index a556558435..9f9c4bd3f9 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -56,3 +56,61 @@ To run the playbook, execute::
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

I think the word order should be "on GitLab's web UI navigate to:"

> +
> + * Settings (the gears like icon), then
> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * Under "Set up a specific Runner manually", look for the value under
> +   "Use the following registration token during setup"
> +
> +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> +``scripts/ci/setup/vars.yml``.  Then, set the
> +``gitlab_runner_registration_token`` variable to the value obtained
> +earlier.
> +
> +.. note:: gitlab-runner is not available from the standard location
> +          for all OS and architectures combinations.  For some systems,
> +          a custom build may be necessary.  Some builds are avaiable

s/avaiable/available

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
> + * uncheck the "Run untagged jobs" check box
> + * give it a better Description
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..f112d05dd0
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1 @@
> +vars.yml
> \ No newline at end of file
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> new file mode 100644
> index 0000000000..ab1944965f
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,65 @@
> +---
> +- name: Installation of gitlab-runner
> +  hosts: all
> +  vars_files:
> +    - vars.yml
> +  tasks:
> +    - debug:
> +        msg: 'Checking for a valid GitLab registration token'
> +      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
> +
> +    - name: Checks the availability of official gitlab-runner builds in the archive
> +      uri:
> +        url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-linux-386
> +        method: HEAD
> +        status_code:
> +          - 200
> +          - 403
> +      register: gitlab_runner_available_archive
> +
> +    - name: Update base url
> +      set_fact:
> +        gitlab_runner_base_url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-
> +      when: gitlab_runner_available_archive.status == 200
> +    - debug:
> +        msg: Base gitlab-runner url is {{ gitlab_runner_base_url  }}
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

Totally unimportant (you may as well ignore this comment), but depending on
how much in sync you want to be with libvirt's playbook, the user:group we
create is gitlab:gitlab.

> +
> +    - name: Remove the .bash_logout file when on Ubuntu systems
> +      file:
> +        path: /home/gitlab-runner/.bash_logout
> +        state: absent
> +      when: "ansible_facts['distribution'] == 'Ubuntu'"
> +
> +    - name: Downloads the matching gitlab-runner
> +      get_url:
> +        dest: /usr/local/bin/gitlab-runner
> +        url: "{{ gitlab_runner_base_url }}{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
> +        owner: gitlab-runner
> +        group: gitlab-runner
> +        mode: u=rwx,g=rwx,o=rx
> +
> +    - name: Register the gitlab-runner
> +      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell  --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
> +
> +    - name: Install the gitlab-runner service using its own functionality
> +      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner

I'm pretty sure I pointed this out in previous versions, but according to the
docs ^this won't install the runner on FreeBSD as a service. IIRC the answer
was that FreeBSD is not in the priority distro list at the moment and that it
can always be adjusted further down the road - that is fair, no objection, but
then the commit message says that this playbook is creating a reproducible
environment and covers both Linux and FreeBSD which is not true in its
entirety, so either drop it from the commit message or add a small comment here
that the command would actually only work as expected on Linux.

Reviewed-by: Erik Skultety <eskultet@redhat.com>

> +      register: gitlab_runner_install_service_result
> +      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
> +
> +    - name: Enable the gitlab-runner service
> +      service:
> +        name: gitlab-runner
> +        state: started
> +        enabled: yes
> diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
> new file mode 100644
> index 0000000000..621435d030
> --- /dev/null
> +++ b/scripts/ci/setup/vars.yml.template
> @@ -0,0 +1,13 @@
> +# The version of the gitlab-runner to use
> +gitlab_runner_version: 13.1.1
> +# The base location of gitlab-runner binaries, this will be suffixed by $OS-$ARCH
> +gitlab_runner_base_url: https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-
> +# The URL of the gitlab server to use, usually https://gitlab.com unless you're
> +# using a private GitLab instance
> +gitlab_runner_server_url: https://gitlab.com
> +# Defaults to linux, checks can be used to change this
> +gitlab_runner_os: linux
> +# Defaults to amd64 (x86_64), checks can be used to change this
> +gitlab_runner_arch: amd64
> +# A unique token made available by GitLab to your project for registering runners
> +gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
> -- 
> 2.25.4
> 


