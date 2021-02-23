Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A078322C8F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:40:43 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYri-0008W2-Cq
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEYqO-0007fs-3c
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:39:21 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEYpp-0006XP-Pr
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:39:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so2685405wml.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qBrwfzMobrzqlCgf46Khz4bUNfUDWzwL53zOb7BJ03I=;
 b=ga+5k7y3LrdMtcvgS4/9yrjgts2qFH0XykuW/KGbIQZB2HiRLdlrkpP3s8ophG0tln
 +HrqEhccw/NG2CJh7MEqUFRr1wvMsZGlJym2RsqNfx6TAM5fAqcOoNoOBM4lcu0qdMjt
 7VLypB+xrSjNnlIOuAkoMZflGBzYoepT6QbI6nVN4ZVbhcpD3T4nfjmvBrwI1P28SrM0
 JsiAvf9JfXYsolJN/ct02/Su97h67/8br/5RFB/bWPiPctN/Ag0l0INYnSAHjDV0R/Uh
 n8G0LPu/AjlPLGKmh/1n+SuKPnT3PlWQo981vtGchfIbEbLMZBfu0pKsZ9Wa8ekQF0jc
 7xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qBrwfzMobrzqlCgf46Khz4bUNfUDWzwL53zOb7BJ03I=;
 b=YDT7TNqcLEwO6rBjC3pcXwu/RHHsXMkTf3aOrSt/1HSTcR/lULJigEGL2eu0xZZN0Z
 4w0f0srBh0y8gGjjvA1pWUY2nvNWDpJXS1aWJUYvLxBWskoeKklUWjXYRAeMfO92N39l
 uS0nA3Lue+zqGxUNo51SXkALUXx6BYJ642SKaGvmait2Vs/cZuqaN1kkyyyz+OZvmQiY
 6q+e2rs9ijh0aZC7CMkhhec+mc1F3/D9W0d1AUbxeuHx966sfHfCFK3ga29WUo20Iju+
 gtwfX1X3iR/XyMlf1EGkNoAUtbrvwbzV5ayfFQlT+6H0vgy2gBwGXR7IcozWIYZsIBVN
 +ufA==
X-Gm-Message-State: AOAM531y+Kh6SAGxGolQmKaHKg7kzLGw4n6gANIbSYOe/yhSLzfii/TZ
 osUQuD8PLvin59IA3SAuJjsl4Q==
X-Google-Smtp-Source: ABdhPJyCBc/igeVRkFXdx+fkuYORTp4cWSLVrJNdnteXIThkNgYUBykONZPW+0Y0Uo1gETx6wZ+z+A==
X-Received: by 2002:a1c:5412:: with SMTP id i18mr24492023wmb.179.1614091124187; 
 Tue, 23 Feb 2021 06:38:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d20sm34709471wrc.12.2021.02.23.06.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 06:38:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 498251FF7E;
 Tue, 23 Feb 2021 14:38:42 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 14:01:53 +0000
In-reply-to: <20210219215838.752547-3-crosa@redhat.com>
Message-ID: <87im6i4znx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

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
>  docs/devel/ci.rst                      | 30 ++++++++++
>  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
>  scripts/ci/setup/inventory             |  1 +
>  3 files changed, 107 insertions(+)
>  create mode 100644 scripts/ci/setup/build-environment.yml
>  create mode 100644 scripts/ci/setup/inventory
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 585b7bf4b8..a556558435 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>  The GitLab CI jobs definition for the custom runners are located under::
>=20=20
>    .gitlab-ci.d/custom-runners.yml
> +
> +Machine Setup Howto
> +-------------------
> +
> +For all Linux based systems, the setup can be mostly automated by the
> +execution of two Ansible playbooks.  Start by adding your machines to
> +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> +
> +  fully.qualified.domain
> +  other.machine.hostname

Is this really needed? Can't the host list be passed in the command
line? I find it off to imagine users wanting to configure whole fleets
of runners.

> +
> +You may need to set some variables in the inventory file itself.  One
> +very common need is to tell Ansible to use a Python 3 interpreter on
> +those hosts.  This would look like::
> +
> +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
> +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
> +
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

So I got somewhat there with a direct command line invocation:

  ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/setu=
p/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/python3'

although for some reason a single host -i fails...

> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/bu=
ild-environment.yml
> new file mode 100644
> index 0000000000..0197e0a48b
> --- /dev/null
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -0,0 +1,76 @@
> +---
> +- name: Installation of basic packages to build QEMU
> +  hosts: all
> +  tasks:
> +    - name: Update apt cache
> +      apt:
> +        update_cache: yes
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'

So are we limiting to Ubuntu here rather than say a Debian base?

> +
> +    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> +          - ccache
> +          - clang
> +          - gcc
> +          - gettext
> +          - git
> +          - glusterfs-common
> +          - libaio-dev
> +          - libattr1-dev
> +          - libbrlapi-dev
> +          - libbz2-dev
> +          - libcacard-dev
> +          - libcap-ng-dev
> +          - libcurl4-gnutls-dev
> +          - libdrm-dev
> +          - libepoxy-dev
> +          - libfdt-dev
> +          - libgbm-dev
> +          - libgtk-3-dev
> +          - libibverbs-dev
> +          - libiscsi-dev
> +          - libjemalloc-dev
> +          - libjpeg-turbo8-dev
> +          - liblzo2-dev
> +          - libncurses5-dev
> +          - libncursesw5-dev
> +          - libnfs-dev
> +          - libnss3-dev
> +          - libnuma-dev
> +          - libpixman-1-dev
> +          - librados-dev
> +          - librbd-dev
> +          - librdmacm-dev
> +          - libsasl2-dev
> +          - libsdl2-dev
> +          - libseccomp-dev
> +          - libsnappy-dev
> +          - libspice-protocol-dev
> +          - libssh-dev
> +          - libusb-1.0-0-dev
> +          - libusbredirhost-dev
> +          - libvdeplug-dev
> +          - libvte-2.91-dev
> +          - libzstd-dev
> +          - make
> +          - ninja-build
> +          - python3-yaml
> +          - python3-sphinx
> +          - sparse
> +          - xfslibs-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +
> +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-=
s390x
> +      package:
> +        name:
> +          - libspice-server-dev
> +          - libxen-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +        - ansible_facts['architecture'] !=3D 's390x'
> diff --git a/scripts/ci/setup/inventory b/scripts/ci/setup/inventory
> new file mode 100644
> index 0000000000..2fbb50c4a8
> --- /dev/null
> +++ b/scripts/ci/setup/inventory
> @@ -0,0 +1 @@
> +localhost

I'm not sure we should have a default here because it will inevitably
cause someone to do something to their machine when trying to setup a
runner.

--=20
Alex Benn=C3=A9e

