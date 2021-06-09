Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC53A1B8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:12:47 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1l0-00029O-CL
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lr1i0-0007gQ-Rq
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lr1hx-00024f-Vm
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623258576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jglorGf4nio5d04OHEy+7IAbhf0+dMrook4iLwA2lIQ=;
 b=BC/4dAzQ9zb0niIPqdcV0Pn/fzZD/tGt5q7YzXJ5bzOQuAxqLXjkdLfEhRebzdTJ7G3lry
 7tALbOLBtGV6rtCU3CwKT14Rc8tI7qbAX5B0G0zd5Ts0+zaSwR/ToC1DqCprTRU9i3CfKG
 Kkt719Hr+i6Xx/LmEBi+TBk7E2aJIDc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-xPsE-kHXNYW6mIgIQICV0w-1; Wed, 09 Jun 2021 13:09:34 -0400
X-MC-Unique: xPsE-kHXNYW6mIgIQICV0w-1
Received: by mail-ed1-f69.google.com with SMTP id
 u26-20020a05640207dab02903935beb5c71so6874729edy.3
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jglorGf4nio5d04OHEy+7IAbhf0+dMrook4iLwA2lIQ=;
 b=c62vy/Yy5Rz9Pi4yozUBhWgsRxCSUk5q0CiRkL43byTMNtLHv05yNnXDOm7hvlMqBh
 B3cSJxVqOFVxVzZKvTtyD4IqTBFRFwWXPE35y9OOlGfQvB/tV4ZS3Hezsh6BVJKrKFdN
 osTrA/V+QxlF5bRAyVmysM2xgaYt1Hknt94zNKqDM9+CV1bG2V7F9Zo7bqqqwzbxCwV7
 L2FATtHJ0HHW6B6f43W2N2Pv6ptEMdchfAsKk6f6dqDEUfJoPUCHtz9l9QqnYUA4uTZa
 fiEDtMdkRLszM+kdZzeA9jc/gpzHSluaxX5gxcluaBTVJq5/tix1gxIlGHsTI9XzML6d
 Mtcw==
X-Gm-Message-State: AOAM531iMk2MJWkIop3iYjZX9YVAzCKMxtH67eg9FldBgSIYvVnIvRO1
 qSaySdLlVOVINTgKVzHDDyCtsirBNvITh/BygErDfETRNko0tnmmL8m2gQpFrFlIUJa9XuXuhuw
 dHl3Y6ZbfZJj1BXGjZIoYKvzYSlStJjw=
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr879746ejk.30.1623258573323; 
 Wed, 09 Jun 2021 10:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxANrspJ77Wo1KlEdsritFJDOTdOCKWbTanvSqWC9Go+9BqrYYMU0LjSKQYkNn6dm9zgcjrH4pejc0Jk5DO/gg=
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr879712ejk.30.1623258573098; 
 Wed, 09 Jun 2021 10:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <87wnr3i2hy.fsf@linaro.org>
 <CA+bd_6JO2URtPSAe4faWx_0ybWAXVki45ho7vh1oHo2jyi59zw@mail.gmail.com>
 <87tum7hxdz.fsf@linaro.org>
In-Reply-To: <87tum7hxdz.fsf@linaro.org>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Wed, 9 Jun 2021 13:09:22 -0400
Message-ID: <CA+bd_6KUCZp=v8p5GOiajdAZ+F5iRsAeC7Xcmvv=3Vxd5y0_Tw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a0e37b05c4585651"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a0e37b05c4585651
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2021 at 11:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Cleber Rosa Junior <crosa@redhat.com> writes:
>
> > On Wed, Jun 9, 2021 at 9:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> >
> >  Cleber Rosa <crosa@redhat.com> writes:
> >
> >  > To run basic jobs on custom runners, the environment needs to be
> >  > properly set up.  The most common requirement is having the right
> >  > packages installed.
> >  >
> >  > The playbook introduced here covers the QEMU's project s390x and
> >  > aarch64 machines.  At the time this is being proposed, those machine=
s
> >  > have already had this playbook applied to them.
> >  >
> >  > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >  > ---
> >  >  docs/devel/ci.rst                      | 30 ++++++++
> >  >  scripts/ci/setup/build-environment.yml | 98
> ++++++++++++++++++++++++++
> >  >  scripts/ci/setup/inventory.template    |  1 +
> >  >  3 files changed, 129 insertions(+)
> >  >  create mode 100644 scripts/ci/setup/build-environment.yml
> >  >  create mode 100644 scripts/ci/setup/inventory.template
> >  >
> >  > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> >  > index 585b7bf4b8..35c6b5e269 100644
> >  > --- a/docs/devel/ci.rst
> >  > +++ b/docs/devel/ci.rst
> >  > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >  >  The GitLab CI jobs definition for the custom runners are located
> under::
> >  >
> >  >    .gitlab-ci.d/custom-runners.yml
> >  > +
> >  > +Machine Setup Howto
> >  > +-------------------
> >  > +
> >  > +For all Linux based systems, the setup can be mostly automated by t=
he
> >  > +execution of two Ansible playbooks.  Create an ``inventory`` file
> >  > +under ``scripts/ci/setup``, such as this::
> >  > +
> >  > +  fully.qualified.domain
> >  > +  other.machine.hostname
> >  > +
> >  > +You may need to set some variables in the inventory file itself.  O=
ne
> >  > +very common need is to tell Ansible to use a Python 3 interpreter o=
n
> >  > +those hosts.  This would look like::
> >  > +
> >  > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/pyth=
on3
> >  > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/pyth=
on3
> >  > +
> >  > +Build environment
> >  > +~~~~~~~~~~~~~~~~~
> >  > +
> >  > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook wil=
l
> >  > +set up machines with the environment needed to perform builds and r=
un
> >  > +QEMU tests.  It covers a number of different Linux distributions an=
d
> >  > +FreeBSD.
> >  > +
> >  > +To run the playbook, execute::
> >  > +
> >  > +  cd scripts/ci/setup
> >  > +  ansible-playbook -i inventory build-environment.yml
> >
> >  I tried this to re-update aarch64.ci.qemu.org and another ubuntu box I
> >  have up and running as a VM and I got a failure when checking facts:
> >
> >    14:26:26 [alex@zen:~/l/q/s/c/setup]
> review/custom-runners-v6|=E2=9C=9A1=E2=80=A6(+1/-1) + ansible-playbook -i=
 inventory
> build-environment.yml
> >
> >    PLAY [Installation of basic packages to build QEMU]
> >
> *************************************************************************=
************************************************
> >
> >    TASK [Gathering Facts]
> >
> *************************************************************************=
***************************************************************************=
**
> >
> >    ok: [aarch64.ci.qemu.org]
> >    ok: [hackbox-ubuntu-2004]
> >
> >    TASK [Update apt cache]
> >
> *************************************************************************=
***************************************************************************=
*
> >
> >    fatal: [aarch64.ci.qemu.org]: FAILED! =3D> {"msg": "The conditional
> check 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error
> >  was: error while evaluating conditional (ansible_facts['distribution']
> =3D=3D 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
> >  error appears to have been in
> '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml': line 5=
,
> column 7, but may\nbe
> >  elsewhere in the file depending on the exact syntax problem.\n\nThe
> offending line appears to be:\n\n  tasks:\n    - name: Update apt
> >  cache\n      ^ here\n"}
> >    fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional
> check 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error
> >  was: error while evaluating conditional (ansible_facts['distribution']
> =3D=3D 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
> >  error appears to have been in
> '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml': line 5=
,
> column 7, but may\nbe
> >  elsewhere in the file depending on the exact syntax problem.\n\nThe
> offending line appears to be:\n\n  tasks:\n    - name: Update apt
> >  cache\n      ^ here\n"}
> >            to retry, use: --limit
> @/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.retry
> >
> >    PLAY RECAP
> >
> *************************************************************************=
***************************************************************************=
**************
> >
> >    aarch64.ci.qemu.org        : ok=3D1    changed=3D0    unreachable=3D=
0
> failed=3D1
> >    hackbox-ubuntu-2004        : ok=3D1    changed=3D0    unreachable=3D=
0
> failed=3D1
> >
> > Hi Alex,
> >
> > Thanks for checking this version out.  It looks like this is similar to
> what happened to you during v5 and hackmox-ubuntu-2004.  Because I
> > had no issues running the playbook against aarch64.ci.qemu.org, I am
> now betting that this is an issue with the ansible installation on the
> > "controller" machine, that is, the one that drives the playbook
> execution (the "zen" host, according to your output).
> >
> > About the error, the syntax itself is correct[1], but I bet there may b=
e
> differences between ansible versions.  Could you please share the
> > output of "ansible --version" on that machine?
>
> 15:41:21 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A1=
=E2=80=A6(+1/-1) 4
> + ansible --version
> ansible 2.7.7
>   config file =3D /etc/ansible/ansible.cfg
>   configured module search path =3D ['/home/alex/.ansible/plugins/modules=
',
> '/usr/share/ansible/plugins/modules']
>   ansible python module location =3D /usr/lib/python3/dist-packages/ansib=
le
>   executable location =3D /usr/bin/ansible
>   python version =3D 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]
>
> My machine is Debian stable (aka Buster)
>
>
Hi Alex,

I found out, the hard way, that one will need ansible 2.8.x.  I'll make a
note about that in the documentation. Long version:

I was able to replicate this on Debian stable, using the exact same
versions as you did.  Then I tried the latest ansible 2.7.18 (the latest in
the 2.7.x series), installed with "pip install ansible=3D=3D2.7.18 --user".
Still, the exact same issue.

Then, still on Debian stable, I tried 2.8.20 (installed with "pip install
ansible=3D=3D2.8.20 --user"), and the playbook execution completed successf=
ully.

I went through the 2.7x. and 2.8.x changelogs, and I could not spot one
clear entry about the change in behavior though.

Thanks,
- Cleber.


> >
> > Thanks again,
> > - Cleber.
> >
> > [1] -
> https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals=
.html#ansible-facts-distribution
> >
> >  --
> >  Alex Benn=C3=A9e
>
>
> --
> Alex Benn=C3=A9e
>
>

--000000000000a0e37b05c4585651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 2021 at 11:26 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Cleber Rosa Junior &lt;<a href=3D"mailto:crosa@redhat.com" target=3D"_blank=
">crosa@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Wed, Jun 9, 2021 at 9:36 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;=C2=A0 Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=3D"_b=
lank">crosa@redhat.com</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; To run basic jobs on custom runners, the environment needs =
to be<br>
&gt;=C2=A0 &gt; properly set up.=C2=A0 The most common requirement is havin=
g the right<br>
&gt;=C2=A0 &gt; packages installed.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; The playbook introduced here covers the QEMU&#39;s project =
s390x and<br>
&gt;=C2=A0 &gt; aarch64 machines.=C2=A0 At the time this is being proposed,=
 those machines<br>
&gt;=C2=A0 &gt; have already had this playbook applied to them.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redh=
at.com" target=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt;=C2=A0 &gt; ---<br>
&gt;=C2=A0 &gt;=C2=A0 docs/devel/ci.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 ++++++++<br>
&gt;=C2=A0 &gt;=C2=A0 scripts/ci/setup/build-environment.yml | 98 +++++++++=
+++++++++++++++++<br>
&gt;=C2=A0 &gt;=C2=A0 scripts/ci/setup/inventory.template=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 &gt;=C2=A0 3 files changed, 129 insertions(+)<br>
&gt;=C2=A0 &gt;=C2=A0 create mode 100644 scripts/ci/setup/build-environment=
.yml<br>
&gt;=C2=A0 &gt;=C2=A0 create mode 100644 scripts/ci/setup/inventory.templat=
e<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst<br>
&gt;=C2=A0 &gt; index 585b7bf4b8..35c6b5e269 100644<br>
&gt;=C2=A0 &gt; --- a/docs/devel/ci.rst<br>
&gt;=C2=A0 &gt; +++ b/docs/devel/ci.rst<br>
&gt;=C2=A0 &gt; @@ -26,3 +26,33 @@ gitlab-runner, is called a &quot;custom =
runner&quot;.<br>
&gt;=C2=A0 &gt;=C2=A0 The GitLab CI jobs definition for the custom runners =
are located under::<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 .gitlab-ci.d/custom-runners.yml<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +Machine Setup Howto<br>
&gt;=C2=A0 &gt; +-------------------<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +For all Linux based systems, the setup can be mostly autom=
ated by the<br>
&gt;=C2=A0 &gt; +execution of two Ansible playbooks.=C2=A0 Create an ``inve=
ntory`` file<br>
&gt;=C2=A0 &gt; +under ``scripts/ci/setup``, such as this::<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 fully.qualified.domain<br>
&gt;=C2=A0 &gt; +=C2=A0 other.machine.hostname<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +You may need to set some variables in the inventory file i=
tself.=C2=A0 One<br>
&gt;=C2=A0 &gt; +very common need is to tell Ansible to use a Python 3 inte=
rpreter on<br>
&gt;=C2=A0 &gt; +those hosts.=C2=A0 This would look like::<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 fully.qualified.domain ansible_python_interpreter=
=3D/usr/bin/python3<br>
&gt;=C2=A0 &gt; +=C2=A0 other.machine.hostname ansible_python_interpreter=
=3D/usr/bin/python3<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +Build environment<br>
&gt;=C2=A0 &gt; +~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +The ``scripts/ci/setup/build-environment.yml`` Ansible pla=
ybook will<br>
&gt;=C2=A0 &gt; +set up machines with the environment needed to perform bui=
lds and run<br>
&gt;=C2=A0 &gt; +QEMU tests.=C2=A0 It covers a number of different Linux di=
stributions and<br>
&gt;=C2=A0 &gt; +FreeBSD.<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +To run the playbook, execute::<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 cd scripts/ci/setup<br>
&gt;=C2=A0 &gt; +=C2=A0 ansible-playbook -i inventory build-environment.yml=
<br>
&gt;<br>
&gt;=C2=A0 I tried this to re-update <a href=3D"http://aarch64.ci.qemu.org"=
 rel=3D"noreferrer" target=3D"_blank">aarch64.ci.qemu.org</a> and another u=
buntu box I<br>
&gt;=C2=A0 have up and running as a VM and I got a failure when checking fa=
cts:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners=
-v6|=E2=9C=9A1=E2=80=A6(+1/-1) + ansible-playbook -i inventory build-enviro=
nment.yml<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 PLAY [Installation of basic packages to build QEMU]<br>
&gt;=C2=A0 ****************************************************************=
*********************************************************<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 TASK [Gathering Facts]<br>
&gt;=C2=A0 ****************************************************************=
***************************************************************************=
***********<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 ok: [<a href=3D"http://aarch64.ci.qemu.org" rel=3D"norefe=
rrer" target=3D"_blank">aarch64.ci.qemu.org</a>]<br>
&gt;=C2=A0 =C2=A0 ok: [hackbox-ubuntu-2004]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 TASK [Update apt cache]<br>
&gt;=C2=A0 ****************************************************************=
***************************************************************************=
**********<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 fatal: [<a href=3D"http://aarch64.ci.qemu.org" rel=3D"nor=
eferrer" target=3D"_blank">aarch64.ci.qemu.org</a>]: FAILED! =3D&gt; {&quot=
;msg&quot;: &quot;The conditional check &#39;ansible_facts[&#39;distributio=
n&#39;] =3D=3D &#39;Ubuntu&#39;&#39; failed. The error<br>
&gt;=C2=A0 was: error while evaluating conditional (ansible_facts[&#39;dist=
ribution&#39;] =3D=3D &#39;Ubuntu&#39;): &#39;dict object&#39; has no attri=
bute &#39;distribution&#39;\n\nThe<br>
&gt;=C2=A0 error appears to have been in &#39;/home/alex/lsrc/qemu.git/scri=
pts/ci/setup/build-environment.yml&#39;: line 5, column 7, but may\nbe<br>
&gt;=C2=A0 elsewhere in the file depending on the exact syntax problem.\n\n=
The offending line appears to be:\n\n=C2=A0 tasks:\n=C2=A0 =C2=A0 - name: U=
pdate apt<br>
&gt;=C2=A0 cache\n=C2=A0 =C2=A0 =C2=A0 ^ here\n&quot;}<br>
&gt;=C2=A0 =C2=A0 fatal: [hackbox-ubuntu-2004]: FAILED! =3D&gt; {&quot;msg&=
quot;: &quot;The conditional check &#39;ansible_facts[&#39;distribution&#39=
;] =3D=3D &#39;Ubuntu&#39;&#39; failed. The error<br>
&gt;=C2=A0 was: error while evaluating conditional (ansible_facts[&#39;dist=
ribution&#39;] =3D=3D &#39;Ubuntu&#39;): &#39;dict object&#39; has no attri=
bute &#39;distribution&#39;\n\nThe<br>
&gt;=C2=A0 error appears to have been in &#39;/home/alex/lsrc/qemu.git/scri=
pts/ci/setup/build-environment.yml&#39;: line 5, column 7, but may\nbe<br>
&gt;=C2=A0 elsewhere in the file depending on the exact syntax problem.\n\n=
The offending line appears to be:\n\n=C2=A0 tasks:\n=C2=A0 =C2=A0 - name: U=
pdate apt<br>
&gt;=C2=A0 cache\n=C2=A0 =C2=A0 =C2=A0 ^ here\n&quot;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to retry, use: --limit @/home=
/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.retry<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 PLAY RECAP<br>
&gt;=C2=A0 ****************************************************************=
***************************************************************************=
***********************<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 <a href=3D"http://aarch64.ci.qemu.org" rel=3D"noreferrer"=
 target=3D"_blank">aarch64.ci.qemu.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 : ok=
=3D1=C2=A0 =C2=A0 changed=3D0=C2=A0 =C2=A0 unreachable=3D0=C2=A0 =C2=A0 fai=
led=3D1<br>
&gt;=C2=A0 =C2=A0 hackbox-ubuntu-2004=C2=A0 =C2=A0 =C2=A0 =C2=A0 : ok=3D1=
=C2=A0 =C2=A0 changed=3D0=C2=A0 =C2=A0 unreachable=3D0=C2=A0 =C2=A0 failed=
=3D1<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Thanks for checking this version out.=C2=A0 It looks like this is simi=
lar to what happened to you during v5 and hackmox-ubuntu-2004.=C2=A0 Becaus=
e I<br>
&gt; had no issues running the playbook against <a href=3D"http://aarch64.c=
i.qemu.org" rel=3D"noreferrer" target=3D"_blank">aarch64.ci.qemu.org</a>, I=
 am now betting that this is an issue with the ansible installation on the<=
br>
&gt; &quot;controller&quot; machine, that is, the one that drives the playb=
ook execution (the &quot;zen&quot; host, according to your output).<br>
&gt;<br>
&gt; About the error, the syntax itself is correct[1], but I bet there may =
be differences between ansible versions.=C2=A0 Could you please share the<b=
r>
&gt; output of &quot;ansible --version&quot; on that machine?<br>
<br>
15:41:21 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A1=E2=
=80=A6(+1/-1) 4 + ansible --version<br>
ansible 2.7.7<br>
=C2=A0 config file =3D /etc/ansible/ansible.cfg<br>
=C2=A0 configured module search path =3D [&#39;/home/alex/.ansible/plugins/=
modules&#39;, &#39;/usr/share/ansible/plugins/modules&#39;]<br>
=C2=A0 ansible python module location =3D /usr/lib/python3/dist-packages/an=
sible<br>
=C2=A0 executable location =3D /usr/bin/ansible<br>
=C2=A0 python version =3D 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0=
]<br>
<br>
My machine is Debian stable (aka Buster)<br>
<br></blockquote><div><br></div><div>Hi Alex,</div><div><br></div><div>I fo=
und out, the hard way, that one will need ansible 2.8.x.=C2=A0 I&#39;ll mak=
e a note about that in the documentation. Long version:</div><div><br></div=
><div>I was able to replicate this on Debian stable, using the exact same v=
ersions as you did.=C2=A0 Then I tried the latest ansible 2.7.18 (the lates=
t in the 2.7.x series), installed with &quot;pip install ansible=3D=3D2.7.1=
8 --user&quot;.=C2=A0 Still, the exact same issue.</div><div><br></div><div=
>Then, still on Debian stable, I tried 2.8.20 (installed with &quot;pip ins=
tall ansible=3D=3D2.8.20 --user&quot;), and the playbook execution complete=
d successfully.</div><div><br></div><div>I went through the 2.7x. and 2.8.x=
 changelogs, and I could not spot one clear entry about the change in behav=
ior though.</div><div><br></div><div>Thanks,</div><div>- Cleber.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Thanks again,<br>
&gt; - Cleber.<br>
&gt;<br>
&gt; [1] - <a href=3D"https://docs.ansible.com/ansible/latest/user_guide/pl=
aybooks_conditionals.html#ansible-facts-distribution" rel=3D"noreferrer" ta=
rget=3D"_blank">https://docs.ansible.com/ansible/latest/user_guide/playbook=
s_conditionals.html#ansible-facts-distribution</a><br>
&gt;=C2=A0 <br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 Alex Benn=C3=A9e<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div>

--000000000000a0e37b05c4585651--


