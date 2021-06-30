Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5D3B7AED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 02:19:43 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNx8-0003TK-Qp
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 20:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNwF-0002np-Ow
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNwD-0000nd-7C
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625012323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bLqteZ5tYxyhkinAmCZ14dt4eBCeX0NgwzaBaVaIFtY=;
 b=Jd4ya0SpFI1eDoiOtceAiyxEhiJt6x9S/6pQ98NtETNrUtlOQe/boDc0ihHN+DIvO8M9Ex
 2I6BR6x8Huy3rLjTLFHcf0kuRmsgyHSmih18AhbYNZaw+Wm5HryLdjHZtZdA65XFHWTYaf
 Rd0EGY/3SsTJNtxhYBtIhhpjF+53c+o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-bV2ZgCPqNg660tmVyVjWHA-1; Tue, 29 Jun 2021 20:18:42 -0400
X-MC-Unique: bV2ZgCPqNg660tmVyVjWHA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ho42-20020a1709070eaab02904a77ea3380eso149037ejc.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 17:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLqteZ5tYxyhkinAmCZ14dt4eBCeX0NgwzaBaVaIFtY=;
 b=gMRVKgdvk0NNfjr8erJlMzYOGFty3UhFl3MWIh+jTyr05qcCyjSLqECOP5r4a0rjKZ
 //XMcI3U5NngWg503O6jeQROUlaF6tLeyNB9yzgehJWWRb9qqGI6ohUcw0iUN0nMw96d
 Bm6srzhS5tYVkrfE8KiAmqM9Nmy6lds4/QR7ybweRV4T3heSnwotK3i7jLE/KZT/CIyg
 0oDWilsWk/7hKu8yPr9Wucmqcvr0533wI3U/+IuOZ29sg0kk70OeSsozIilNmwIceZGl
 c+Tj8cI3D3V9lh2BMU5D26AcyP3Xc5Qs3UMQsfmuhoeCmkNfDyjJ0DPgKK4kEIYEB1np
 R0Tg==
X-Gm-Message-State: AOAM531D6rya2WgQIkIIxq6/yjLJAKHPqGr2siy+Ce2FHkAjBxSM+NOi
 dwRv8PSHOS3rJIuT1Cr9dBb9kK/AQQIzuf7I8ot0qbf1LxrCIgc5z4R/pk45kXoE1JTSqtqutQ8
 8PfBzVxl4YIRPfFBfnhO4qsZPp6bv71o=
X-Received: by 2002:a17:906:28d5:: with SMTP id
 p21mr32034641ejd.358.1625012321392; 
 Tue, 29 Jun 2021 17:18:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+czi1ROxrqoQz0jfJ/Dhrb1clhejXyi28YMU5USEMxgELBSXpJFrhUR2KuMJ1Dzp6IEmCIZiO/Yi9yPJjNz8=
X-Received: by 2002:a17:906:28d5:: with SMTP id
 p21mr32034618ejd.358.1625012321190; 
 Tue, 29 Jun 2021 17:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
 <be9840a8-09d7-cdd8-7ab4-a6acf185eede@redhat.com>
In-Reply-To: <be9840a8-09d7-cdd8-7ab4-a6acf185eede@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 20:18:30 -0400
Message-ID: <CA+bd_6LFzPEiUV0FXFCkZVLJ0FfbcPfPM1dKEywMjx3uY=bX0A@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 2:24 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/06/2021 05.14, Cleber Rosa wrote:
> > To have the jobs dispatched to custom runners, gitlab-runner must
> > be installed, active as a service and properly configured.  The
> > variables file and playbook introduced here should help with those
> > steps.
> >
> > The playbook introduced here covers the Linux distributions and
> > has been primarily tested on OS/machines that the QEMU project
> > has available to act as runners, namely:
> >
> >   * Ubuntu 20.04 on aarch64
> >   * Ubuntu 18.04 on s390x
> >
> > But, it should work on all other Linux distributions.  Earlier
> > versions were tested on FreeBSD too, so chances of success are
> > high.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
> >   scripts/ci/setup/.gitignore        |  1 +
> >   scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
> >   scripts/ci/setup/vars.yml.template | 12 ++++++
> >   4 files changed, 131 insertions(+)
> >   create mode 100644 scripts/ci/setup/.gitignore
> >   create mode 100644 scripts/ci/setup/gitlab-runner.yml
> >   create mode 100644 scripts/ci/setup/vars.yml.template
> [...]
> > diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> > new file mode 100644
> > index 0000000000..f112d05dd0
> > --- /dev/null
> > +++ b/scripts/ci/setup/.gitignore
> > @@ -0,0 +1 @@
> > +vars.yml
> > \ No newline at end of file
>
> Add a newline, please.
>

Sure! Thanks for spotting that.

> > diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
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
> > +      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
>
> Could you please add a comment at the top of the file or name it differently
> so that it is clear from a quick glance that this is an ansible playbook?
> Poeple might later wonder otherwise...
>

Good point.  I'm adding a proper header with copyright / comment.

>   Thomas
>

Thanks for the review.
- Cleber.


