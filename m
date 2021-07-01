Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE3A3B91B4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:40:12 +0200 (CEST)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyvzH-00069n-LP
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyvwp-0003wM-EU
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:37:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyvwm-00037O-Mm
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:37:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f14so7659211wrs.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=i5bSq95R6nPAjTuAREsjx9dsaUu95/7iPQt+iVBIIHI=;
 b=ugjrmuPVfcF8VQ3u40BPUNFDfyXqUuziFaxX5DA/ftsFaL/czz+b+7ScD1PHyOckuJ
 0HIqIvjZq+GaTulWdKsxvmdcsBXNrT2YL2EW3JQbIJywZ9jeb7SiiNCLa+7gI0VXtbr5
 hnvvKR6D2zlKQ5HCJkCeZ1CHwv11u5HtU6eUH/3ExOcVrDu2D8pErLGL6bUbVCFSwMSI
 XsdnvvNfgnhQiycMiOdUFEkkUnklStuuTdJLxnv7IhMMJVq0uzlYzgTtp3wYNUVz6gdf
 DIbBRsVnjQWrZQ2IiULe4rXKKkgExIyq6CDVHqLYRNmp5dIWFL7FF5SP7XieG2Qs7KeL
 E8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=i5bSq95R6nPAjTuAREsjx9dsaUu95/7iPQt+iVBIIHI=;
 b=op6ERJQV48k1FYafEae8neJNUFmEsUbR64M3RzmKuCEgkf5HuyQw+k48W4uMPODFlg
 cTjxKZcKNcimh1gdpvj9Qgdf1FRc+NUbZv4pPd58aT15+8O+CoCqIGIFMp/8NmG5T+12
 /AfyXYOj+y7cA/QIYKg7YjYmaYfBBgYDAucqrmwBWSM5yoy3fRm4vGCRrNy+ba8sp3AZ
 /UW/6rvQSlExB0YzFe3aZAQDloRvG6vEkloosJh4zOa6FgYJaQfR/mISO7v4j4e/h/TS
 1/wc4zzI5SwK/f2ILmbKYbd08iuuEcsMnlEG1z8XprhfyC7D7Nr7G0oykQrsql/I0Y/r
 w6/A==
X-Gm-Message-State: AOAM531iXeJ0BYZ7MOUdQOTO3iw+pwcTSh0x+tGqteHaNM2LNf2Yj2KS
 dPssg86l8F7M7E7qtq5WSovvGA==
X-Google-Smtp-Source: ABdhPJyRQrslDKn3vMjBpbUnb+8fG8WdKQgpJnavfwCvSs3DEx/knOOnCSgrLCsbfPV4OV7gpcuKKw==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr46252230wri.5.1625143054088; 
 Thu, 01 Jul 2021 05:37:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u18sm22640643wmj.15.2021.07.01.05.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 05:37:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 515A21FF7E;
 Thu,  1 Jul 2021 13:37:32 +0100 (BST)
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-3-crosa@redhat.com> <87v95vpp5d.fsf@linaro.org>
 <CAKJDGDaErDRt+3=Gjk7emgpkbapdPS-Xo0fvj3AFDdLyyARG-A@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v7 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Thu, 01 Jul 2021 13:35:44 +0100
In-reply-to: <CAKJDGDaErDRt+3=Gjk7emgpkbapdPS-Xo0fvj3AFDdLyyARG-A@mail.gmail.com>
Message-ID: <87h7hep5v7.fsf@linaro.org>
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
 =?utf-8?Q?Daniel_P=20?= =?utf-8?Q?=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Willian Rampazzo <wrampazz@redhat.com> writes:

> On Wed, Jun 30, 2021 at 8:28 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Cleber Rosa <crosa@redhat.com> writes:
>>
>> > To run basic jobs on custom runners, the environment needs to be
>> > properly set up.  The most common requirement is having the right
>> > packages installed.
>> >
>> > The playbook introduced here covers the QEMU's project s390x and
>> > aarch64 machines.  At the time this is being proposed, those machines
>> > have already had this playbook applied to them.
>> >
>> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> > ---
>> >  docs/devel/ci.rst                      |  40 +++++++++
>> >  scripts/ci/setup/.gitignore            |   2 +
>> >  scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
>> >  scripts/ci/setup/inventory.template    |   1 +
>> >  4 files changed, 159 insertions(+)
>> >  create mode 100644 scripts/ci/setup/.gitignore
>> >  create mode 100644 scripts/ci/setup/build-environment.yml
>> >  create mode 100644 scripts/ci/setup/inventory.template
>> >
>> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> > index 064ffa9988..bfedbb1025 100644
>> > --- a/docs/devel/ci.rst
>> > +++ b/docs/devel/ci.rst
>> > @@ -30,3 +30,43 @@ The GitLab CI jobs definition for the custom runner=
s are located under::
>> >  Custom runners entail custom machines.  To see a list of the machines
>> >  currently deployed in the QEMU GitLab CI and their maintainers, please
>> >  refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
>> > +
>> > +Machine Setup Howto
>> > +-------------------
>> > +
>> > +For all Linux based systems, the setup can be mostly automated by the
>> > +execution of two Ansible playbooks.  Create an ``inventory`` file
>> > +under ``scripts/ci/setup``, such as this::
>> > +
>> > +  fully.qualified.domain
>> > +  other.machine.hostname
>> > +
>> > +You may need to set some variables in the inventory file itself.  One
>> > +very common need is to tell Ansible to use a Python 3 interpreter on
>> > +those hosts.  This would look like::
>> > +
>> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
>> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
>>
>> I was able to put root@foo for the machines I had in my .ssh/config
>>
>> > +
>> > +Build environment
>> > +~~~~~~~~~~~~~~~~~
>> > +
>> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>> > +set up machines with the environment needed to perform builds and run
>> > +QEMU tests.  This playbook consists on the installation of various
>> > +required packages (and a general package update while at it).  It
>> > +currently covers a number of different Linux distributions, but it can
>> > +be expanded to cover other systems.
>> > +
>> > +The minimum required version of Ansible successfully tested in this
>> > +playbook is 2.8.0 (a version check is embedded within the playbook
>> > +itself).  To run the playbook, execute::
>> > +
>> > +  cd scripts/ci/setup
>> > +  ansible-playbook -i inventory build-environment.yml
>> > +
>> > +Please note that most of the tasks in the playbook require superuser
>> > +privileges, such as those from the ``root`` account or those obtained
>> > +by ``sudo``.  If necessary, please refer to ``ansible-playbook``
>> > +options such as ``--become``, ``--become-method``, ``--become-user``
>> > +and ``--ask-become-pass``.
>>
>> If the above works maybe worth mentioning here because just having root
>> ssh is probably the easiest way to manage a box.
>
> If the host is internet-facing, there are lots of recommendations to
> disable root access using ssh (eg.
> https://www.redhat.com/sysadmin/administering-remote-systems). There
> are also recommendations from NIST and SANS.
>
> So, to avoid an unintended creation of an attack vector in the custom
> runners, I would personally prefer to let just the ansible tricks in
> the documentation than mentioning it is possible (and maybe easier) to
> enable root access thru ssh.

I agree you don't want remote password based authentication. I use
key-based authentication because it seems easier to log in directly as
root than to keep trusting my user password to the remote console to
gain sudo privileges. Anyway either way I'm happy.

--=20
Alex Benn=C3=A9e

