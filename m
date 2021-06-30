Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D23B8864
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:26:11 +0200 (CEST)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyeuY-0003hN-9k
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyesi-00030j-0e
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyese-00055X-Dy
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625077450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHiybaV5VjJxvyRmi0KHBpaMSZxFoA754KWkolbotw4=;
 b=J21XpPgNDsAdGYs//jO9doMgzN4oNsYHOF3QYmGcF5aLzqyoNDM/HivVNiNGBmmyLm8DCF
 vZH76FN4ZgqH0bcgB+lvjOYapwZk/tnmcDY4aZxOKIvudrtd3iE9lkmPOtjb/L9xjsPLBX
 Nl7aDmM4SCyj+UYYILK/g2K3C1EGY7o=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-dheRA7tUM6-sXeyIFaTNow-1; Wed, 30 Jun 2021 14:24:08 -0400
X-MC-Unique: dheRA7tUM6-sXeyIFaTNow-1
Received: by mail-vk1-f199.google.com with SMTP id
 o22-20020a0561221796b029024f811a8ca4so752622vkf.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HHiybaV5VjJxvyRmi0KHBpaMSZxFoA754KWkolbotw4=;
 b=Pcxo8s5GBudTBWiK4DMEYlcf4L0eqdHCqVqC4L1LfX18RjWCIv1/AQb1FJRsQ/DVmD
 DPuXHueSblEUykzutdOZlkR0FIfu45hqjW65Jik+Y2/c4C8b97My3tj3KWGlDvc5IeXN
 6O7qHEtxmiG8Xi1mR5jHDBzpqDHk1BtPlpOMryMFyz1to341yGFshZbna/U2ASESoncQ
 0kcu92BdMyyEGECgUHjSeEC2jTRtkH8mWRBAxgIwNEJVhZswxsa3dIQpPgAWaOZNoC75
 bMNM7wwf7Gb5HJRk6sDWp1l8hyzOAvljL2J1XGFDxVdNRGsdjSVnbIlla/M1RzWS3F0u
 4ENw==
X-Gm-Message-State: AOAM531v5knDpDloNwG7yka8J8p8a/IB3s7AupdEKbBW4cKDCT6xh8T2
 B39SrrH4B3FGf18cRImqEkH377Z81l/LUDEiNJNaoPOERhd9qLfeksMC02Sjp1LzixEK0yafPJK
 IfIVdGGdEqUrtVmstS08UhaXEHzubyCE=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr28900417vko.19.1625077446599; 
 Wed, 30 Jun 2021 11:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEeCiEypsrx4ff1SfZXl7rAWZIbTDgn3xIoGUC4w/C0nW4gPbhxNzf9ef4F6V4OUlxcdMF/nwry38BjHcl0mY=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr28899632vko.19.1625077439277; 
 Wed, 30 Jun 2021 11:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-3-crosa@redhat.com>
 <87v95vpp5d.fsf@linaro.org>
In-Reply-To: <87v95vpp5d.fsf@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 15:23:32 -0300
Message-ID: <CAKJDGDaErDRt+3=Gjk7emgpkbapdPS-Xo0fvj3AFDdLyyARG-A@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 8:28 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Cleber Rosa <crosa@redhat.com> writes:
>
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
> >  docs/devel/ci.rst                      |  40 +++++++++
> >  scripts/ci/setup/.gitignore            |   2 +
> >  scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
> >  scripts/ci/setup/inventory.template    |   1 +
> >  4 files changed, 159 insertions(+)
> >  create mode 100644 scripts/ci/setup/.gitignore
> >  create mode 100644 scripts/ci/setup/build-environment.yml
> >  create mode 100644 scripts/ci/setup/inventory.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 064ffa9988..bfedbb1025 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -30,3 +30,43 @@ The GitLab CI jobs definition for the custom runners=
 are located under::
> >  Custom runners entail custom machines.  To see a list of the machines
> >  currently deployed in the QEMU GitLab CI and their maintainers, please
> >  refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Create an ``inventory`` file
> > +under ``scripts/ci/setup``, such as this::
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
> > +
> > +You may need to set some variables in the inventory file itself.  One
> > +very common need is to tell Ansible to use a Python 3 interpreter on
> > +those hosts.  This would look like::
> > +
> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
>
> I was able to put root@foo for the machines I had in my .ssh/config
>
> > +
> > +Build environment
> > +~~~~~~~~~~~~~~~~~
> > +
> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > +set up machines with the environment needed to perform builds and run
> > +QEMU tests.  This playbook consists on the installation of various
> > +required packages (and a general package update while at it).  It
> > +currently covers a number of different Linux distributions, but it can
> > +be expanded to cover other systems.
> > +
> > +The minimum required version of Ansible successfully tested in this
> > +playbook is 2.8.0 (a version check is embedded within the playbook
> > +itself).  To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory build-environment.yml
> > +
> > +Please note that most of the tasks in the playbook require superuser
> > +privileges, such as those from the ``root`` account or those obtained
> > +by ``sudo``.  If necessary, please refer to ``ansible-playbook``
> > +options such as ``--become``, ``--become-method``, ``--become-user``
> > +and ``--ask-become-pass``.
>
> If the above works maybe worth mentioning here because just having root
> ssh is probably the easiest way to manage a box.

If the host is internet-facing, there are lots of recommendations to
disable root access using ssh (eg.
https://www.redhat.com/sysadmin/administering-remote-systems). There
are also recommendations from NIST and SANS.

So, to avoid an unintended creation of an attack vector in the custom
runners, I would personally prefer to let just the ansible tricks in
the documentation than mentioning it is possible (and maybe easier) to
enable root access thru ssh.


