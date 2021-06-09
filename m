Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7743A15CB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:37:34 +0200 (CEST)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyOj-00006L-LB
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqyNi-0007rS-Qy
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:36:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqyNg-0001Ga-V9
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:36:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i94so20490706wri.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=EcuJj1/iWK7UUQ2qG43NAhytAidVjoE8KbUIdqxeAFU=;
 b=LCPLLV+IUlKQ64DFa2yFk9pwtX4FcnS9iwi0UsbGt2Quk7jz1cY7PmtmEBqjaCUmA+
 MWhburfUZC6QTHokmM7EHkrLX7IL8UgLumOC9bwQ/+FT+fpxectqgP/XE1FbHfesyuun
 XpxOUo8ybMz+h7s7b3l9ziTcRSbZXOmD2+9qsV/lDevMVSt4Nl3Uv0MOxRB+Cf3y4yXl
 nmTN4xndjwYfpXySJz/+6YwqkT8eMan++xHcEamD6UInkvvU3g1jOruSw4oG4XuSvpn/
 RM8O2N7DLNhe8CmkdvNAQ2R6RCykP33GVPGfpLVV59cqvsMbXzYhg7JDB6TsnOxN5TJG
 Tn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=EcuJj1/iWK7UUQ2qG43NAhytAidVjoE8KbUIdqxeAFU=;
 b=WsCs2HLNuVGlFkqRc0Hnf/vr82LNqrZUoDgOxpSpBYXA8DCu0ipz04YFxb9ZyiD83s
 MrcQHulWuvTwFgTJ0u0B2kbIgub38qEGpYbLbYIi+imyCSk7dGi7kqvOn6zEUF37NXZd
 0shwGvEZG1MR4NwLRU63dACQ3etqJrIZzJd73hXCOs/yfPwkrS2FQByl3GRQ9hJhxMty
 uVD2vr2Mi0YULxFFaXlqGvzUQvFuapsSXC0B+LXu5/++XEvtVwkxSlxmhJOUWVYOHVk0
 dcZ9kMcNMMiiXKY3VK1NnVzEM4Zyr9A6XQP97LJPb1yUwpzqXJPGtXOYEAmg4gRZ+BE6
 zTVA==
X-Gm-Message-State: AOAM533s7QIaHQEZeV9zRdzjsOWP2riP1P8D9HD9x0HeBjiz0m9MJrzG
 8e+0q0C2EIKc7QAiP00IWz/DBw==
X-Google-Smtp-Source: ABdhPJynAn/Bsv5ejRiGHZdpeyfz5c+nzWvFaDYB0iR7Thr1OV9r8duyNKPotOgeEijJDk15qAOJcw==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr19941063wrt.124.1623245787081; 
 Wed, 09 Jun 2021 06:36:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d131sm6429167wmd.4.2021.06.09.06.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 06:36:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592081FF7E;
 Wed,  9 Jun 2021 14:36:25 +0100 (BST)
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Wed, 09 Jun 2021 14:31:37 +0100
In-reply-to: <20210608031425.833536-3-crosa@redhat.com>
Message-ID: <87wnr3i2hy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
 =?utf-8?Q?Daniel_P_=2E?= =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
>=20=20
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

I tried this to re-update aarch64.ci.qemu.org and another ubuntu box I
have up and running as a VM and I got a failure when checking facts:

  14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A1=
=E2=80=A6(+1/-1) + ansible-playbook -i inventory build-environment.yml

  PLAY [Installation of basic packages to build QEMU] *********************=
***************************************************************************=
*************************

  TASK [Gathering Facts] **************************************************=
***************************************************************************=
*************************
  ok: [aarch64.ci.qemu.org]
  ok: [hackbox-ubuntu-2004]

  TASK [Update apt cache] *************************************************=
***************************************************************************=
*************************
  fatal: [aarch64.ci.qemu.org]: FAILED! =3D> {"msg": "The conditional check=
 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: err=
or while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ubun=
tu'): 'dict object' has no attribute 'distribution'\n\nThe error appears to=
 have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.=
yml': line 5, column 7, but may\nbe elsewhere in the file depending on the =
exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n   =
 - name: Update apt cache\n      ^ here\n"}
  fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional check=
 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: err=
or while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ubun=
tu'): 'dict object' has no attribute 'distribution'\n\nThe error appears to=
 have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.=
yml': line 5, column 7, but may\nbe elsewhere in the file depending on the =
exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n   =
 - name: Update apt cache\n      ^ here\n"}
          to retry, use: --limit @/home/alex/lsrc/qemu.git/scripts/ci/setup=
/build-environment.retry

  PLAY RECAP **************************************************************=
***************************************************************************=
*************************
  aarch64.ci.qemu.org        : ok=3D1    changed=3D0    unreachable=3D0    =
failed=3D1
  hackbox-ubuntu-2004        : ok=3D1    changed=3D0    unreachable=3D0    =
failed=3D1


--=20
Alex Benn=C3=A9e

