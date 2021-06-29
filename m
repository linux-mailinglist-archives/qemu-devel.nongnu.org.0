Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E193B74D7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:08:45 +0200 (CEST)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFLv-0007oD-M5
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyFKQ-0006Io-E1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyFKM-0008MS-V3
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624979225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pitnYHzeP1NNuJO9ai30Du9h4dxT5GKZ5PCQmrHrkQw=;
 b=BIf45BBf+DKRoILcDyJV3Kh1gob2VgsTcg/DR8LLW/2D5hnUHFhx54Pff3+gZhkI/HTHP3
 j0b8ZIj3d4jNbsXBTIOzqu/V2SizZU/jyyNmXzdnqx2AivXLzCdZ8M2bFswFs9+uU88KrS
 LKFSmqxmjupZxwf37LSYXPP2uI6HV3U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-x7VE12WzNiyPqzMcawjEqA-1; Tue, 29 Jun 2021 11:06:58 -0400
X-MC-Unique: x7VE12WzNiyPqzMcawjEqA-1
Received: by mail-ed1-f72.google.com with SMTP id
 s6-20020a0564020146b029039578926b8cso2265089edu.20
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pitnYHzeP1NNuJO9ai30Du9h4dxT5GKZ5PCQmrHrkQw=;
 b=bRqupE/o0x/u/iDOLFtnCFKi4Og7T1Nzdb4JL4tiHLWzWWdj1Kgeh9NBJwyQlJIFG6
 MnL5zWpfbOQcNKvluHLnXT2P5f4yI/tNchMwdRspjsrSdMCn5lFjwz25k2IWxiNNTZhr
 DlHvtvz0Q1AFsLnWJ1J3Cri3ZOCR7lyfe50u1EjwErbGFRvJanzEd/8CoXO2f7P72BK6
 6pZh6/h3gTngq+clV5n1YvAqDgD3v4Lzk/9LfAGKm3xKB0orvYsKUjMSx5n43gPosH2q
 egCQ8LZKG6SDEfQW/JUXHoqbfR75KmT8MFX1XpUTU0GqsqLK/q2OQB9HomLgtQ6u5jgH
 EFAg==
X-Gm-Message-State: AOAM532hVJBiwjBYM2pQB2JFtLFGwdcHoxcG+4IfZIl5j0hLyKLwcxEN
 Ird82BGNVJBNJ0tQEDFEc9/78j4nAclOLUmgiaPAz4PYNR5lQWnC5ikEKw93O+NCLbaJcB4mZU8
 caueX0msPGP8+ejpKMNFczzzP3XyJZjk=
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr37978443edc.231.1624979216936; 
 Tue, 29 Jun 2021 08:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY8hqiWUpx9piq+X4PPachPXbRn/+FSLHKyhcAs0qCOy3TiqLl0wsQPXlXykqEkizaD9pbu4ocNr05wDt149U=
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr37978402edc.231.1624979216703; 
 Tue, 29 Jun 2021 08:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
In-Reply-To: <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 11:06:45 -0400
Message-ID: <CA+bd_6KODRdaK7NnFU-ZFesn2-4bNJSZQoypmBNDmUN_x03bmg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
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

On Tue, Jun 8, 2021 at 2:48 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 6/8/21 12:14 AM, Cleber Rosa wrote:
> > To run basic jobs on custom runners, the environment needs to be
> > properly set up.  The most common requirement is having the right
> > packages installed.
> >
> > The playbook introduced here covers the QEMU's project s390x and
> > aarch64 machines.  At the time this is being proposed, those machines
> > have already had this playbook applied to them.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   docs/devel/ci.rst                      | 30 ++++++++
> >   scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
> >   scripts/ci/setup/inventory.template    |  1 +
> >   3 files changed, 129 insertions(+)
> >   create mode 100644 scripts/ci/setup/build-environment.yml
> >   create mode 100644 scripts/ci/setup/inventory.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 585b7bf4b8..35c6b5e269 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >   The GitLab CI jobs definition for the custom runners are located under::
> >
> >     .gitlab-ci.d/custom-runners.yml
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Create an ``inventory`` file
> > +under ``scripts/ci/setup``, such as this::
> Missing to mention the template file.
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
> > +
> > +You may need to set some variables in the inventory file itself.  One
> > +very common need is to tell Ansible to use a Python 3 interpreter on
> > +those hosts.  This would look like::
> > +
> > +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
> > +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
> > +
> > +Build environment
> > +~~~~~~~~~~~~~~~~~
> > +
> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > +set up machines with the environment needed to perform builds and run
> > +QEMU tests.  It covers a number of different Linux distributions and
> > +FreeBSD.
> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory build-environment.yml
> > diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> > new file mode 100644
> > index 0000000000..664f2f0519
> > --- /dev/null
> > +++ b/scripts/ci/setup/build-environment.yml
> > @@ -0,0 +1,98 @@
> > +---
> > +- name: Installation of basic packages to build QEMU
> > +  hosts: all
>
> You will need to "become: yes" if the login user is not privileged, right?
>

Hi Wainer,

Yes, pretty much all of the actions here need a privileged user.  I'm
not sure how much of Ansible basics we should be replicating here.  In
my experience, users running "ansible-playbook" will resort to a
combination of --become, --become-method, --ask-become-pass, etc, if
needed.

> Or mention on the documentation how the user should configure the
> connection for privileged login.
>

Yes, I think it's better to just put a note/reference, instead of
inundating the user and the playbook with possibly unnecessary
configurations and details.  I've added the following to the
documentation:

Please note that most of the tasks in the playbook require superuser
privileges, such as those from the ``root`` account or those obtained
by ``sudo``.  If necessary, please refer to ``ansible-playbook`` options
such as ``--become``, ``--become-method``, ``--become-user`` and
``--ask-become-pass``.

Let me know if that sounds good to you.

> About privilege escalation with Ansible:
> https://docs.ansible.com/ansible/latest/user_guide/become.html
>
> > +  tasks:
>
> Just a tip: you can put all those task under a block
> (https://docs.ansible.com/ansible/latest/user_guide/playbooks_blocks.html)
> so check if "ansible_facts['distribution'] == 'Ubuntu'" only once.
>

There will be other non-Ubuntu tasks added later (such as in the
CentOS Stream 8 series), so I think it's better to keep those
separate.  Also, the Ansible version check which Alex suggested is not
limited to Ubuntu.

> I reviewed the remain of the playbook; it looks good to me.
>

Thanks!
- Cleber.


