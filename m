Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D5322D0B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:01:35 +0100 (CET)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZBu-00039w-CL
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lEZ7j-0000A8-29
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lEZ7f-0006Vf-FN
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEw4oTAM6z4JjVUyqUpvRTEIicfOmiV8UvIzrVqBNL4=;
 b=cGSVP1pPTtFLL+bT/Ofsv20fbk9vHD+y5oreTN1BiU7NWanzVzQYe4jnyil0exwxT/neRh
 bHOzzu9wPm3DeyYi4d98/vhnV9wsQKoNK1ilD2qUivmMCLeQdNkPG+knNk9GNt8i5G8aRx
 r4XRrVoxY6yZkC6tEljAFCzSsChc/ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-HnqhpRwjO7OheKRN80Lm4Q-1; Tue, 23 Feb 2021 09:56:32 -0500
X-MC-Unique: HnqhpRwjO7OheKRN80Lm4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68599809DE5;
 Tue, 23 Feb 2021 14:51:38 +0000 (UTC)
Received: from nautilus.local (unknown [10.40.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A820610016F6;
 Tue, 23 Feb 2021 14:51:35 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:51:33 +0100
From: Erik Skultety <eskultet@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <YDUWdeTcyf0Fwn/w@nautilus.local>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
 <87im6i4znx.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87im6i4znx.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Bennée wrote:
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
> >  docs/devel/ci.rst                      | 30 ++++++++++
> >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
> >  scripts/ci/setup/inventory             |  1 +
> >  3 files changed, 107 insertions(+)
> >  create mode 100644 scripts/ci/setup/build-environment.yml
> >  create mode 100644 scripts/ci/setup/inventory
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 585b7bf4b8..a556558435 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >  The GitLab CI jobs definition for the custom runners are located under::
> >  
> >    .gitlab-ci.d/custom-runners.yml
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Start by adding your machines to
> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
> 
> Is this really needed? Can't the host list be passed in the command
> line? I find it off to imagine users wanting to configure whole fleets
> of runners.

Why not support both, since the playbook execution is not wrapped by anything,
giving the option of using either and inventory or direct cmdline invocation
seems like the proper way to do it.

> 
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
> 
> So I got somewhat there with a direct command line invocation:
> 
>   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/setup/build-environment.yml -e 'ansible_python_interpreter=/usr/bin/python3'
> 
> although for some reason a single host -i fails...

The trick is to end it with a ',' like "-i host1,"

Erik


