Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD744ECAE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 19:38:07 +0100 (CET)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlbR8-0001zp-Nn
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 13:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mlbPN-0000uG-0t
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 13:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mlbPJ-0000rs-HT
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 13:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636742171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P5dzK+g+UWfDK/Sec0xZ+oIxKlA9LWe9DLOvoKPdtOI=;
 b=XZkElOrUpgDqAQYUkp+gErne7vM+EIwmbpv7rz/D/w7kzVFV4SNIw5ZKv99lLwlQYjnEb5
 cXpZxyoB3O9SpYkUBOjcqAPw7Lh/H4FPBBYPV8A3zv4A8W6a2oWVUKuqklIQmQ83d5zjGz
 uXxssxxgqsnEUw5laTM1hZYNgD6WIts=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-WRSgTuxsNvGZsuUStjeWnw-1; Fri, 12 Nov 2021 13:36:08 -0500
X-MC-Unique: WRSgTuxsNvGZsuUStjeWnw-1
Received: by mail-pf1-f199.google.com with SMTP id
 g142-20020a625294000000b004946d789d14so6174094pfb.3
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 10:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5dzK+g+UWfDK/Sec0xZ+oIxKlA9LWe9DLOvoKPdtOI=;
 b=6dYemPnlYMGzCIwVmAShfKjl00+c2ig/j2bvHrfj3Q54qE+X8GDOOaw2HQUeztZMWG
 +q2VxZhcaeOnyUq73A7z6YGCOdj3LJYM4SixVCxWlz7toXk9np5/T11rC/3ONkncOouV
 awuyzVMhd/pb5w5nZspptJYTlkBYAu5V3yuDKpI6Gy9MFEYThCOdW3rpJU0E5egbrgFM
 R1c3a9pmXKkKuSaJwj7utIlKyyf14rwJRoerxD6YMouHEXxCUhObbyP1g/e+CfIAZ0N3
 NGO02MoDU5LHo7uGYGBVpV7IA1MmGDDZSI9M3prpq3tvfUwn/24T935JlKO6GwuB60Wi
 UfSg==
X-Gm-Message-State: AOAM532NMpSwCCVTw+j6xw4O8q2kz6M8SkdKDQgG+IFMzQiDD2inj1sn
 6FdvKIGVLQx/3137NfAVxZYswpq3EfUlNfaYdNb/jwHwYPxRmJBQgp9Y0zppFRVWeVw4fScwOfT
 YwFjylvhDymAjFNufcBwTRLD5WIRJF7s=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr20137675pjb.203.1636742167260; 
 Fri, 12 Nov 2021 10:36:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ4tf7FQhDr6pqkDDfyS85cknkISn+b10BZ4Mjj0aVqJ6Im5W0XzSuY2LuYLcGw/xONFwuc7Dp2FcsSp+aD2Y=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr20137623pjb.203.1636742166898; 
 Fri, 12 Nov 2021 10:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20211111160501.862396-1-crosa@redhat.com>
 <20211111160501.862396-2-crosa@redhat.com>
In-Reply-To: <20211111160501.862396-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 12 Nov 2021 15:35:40 -0300
Message-ID: <CAKJDGDYihwY+pLrxQ=6j-GtAfc++1bKE8yWVcyqm9WZJyZ1daQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Jobs based on custom runners: add CentOS Stream 8
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 1:06 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This introduces three different parts of a job designed to run
> on a custom runner managed by Red Hat.  The goals include:
>
>   a) propose a model for other organizations that want to onboard
>      their own runners, with their specific platforms, build
>      configuration and tests.
>
>   b) bring awareness to the differences between upstream QEMU and the
>      version available under CentOS Stream, which is "A preview of
>      upcoming Red Hat Enterprise Linux minor and major releases".
>
>   c) because of b), it should be easier to identify and reduce the gap
>      between Red Hat's downstream and upstream QEMU.
>
> The components of this custom job are:
>
>   I) OS build environment setup code:
>
>      - additions to the existing "build-environment.yml" playbook
>        that can be used to set up CentOS/EL 8 systems.
>
>      - a CentOS Stream 8 specific "build-environment.yml" playbook
>        that adds to the generic one.
>
>  II) QEMU build configuration: a script that will produce binaries with
>      features as similar as possible to the ones built and packaged on
>      CentOS stream 8.
>
> III) Scripts that define the minimum amount of testing that the
>      binaries built with the given configuration (point II) under the
>      given OS build environment (point I) should be subjected to.
>
>  IV) Job definition: GitLab CI jobs that will dispatch the build/test
>      jobs (see points #II and #III) to the machine specifically
>      configured according to #I.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml               |  29 +++
>  docs/devel/ci-jobs.rst.inc                    |   7 +
>  .../org.centos/stream/8/build-environment.yml |  51 +++++
>  .../ci/org.centos/stream/8/x86_64/configure   | 208 ++++++++++++++++++
>  .../org.centos/stream/8/x86_64/test-avocado   |  70 ++++++
>  scripts/ci/org.centos/stream/README           |  17 ++
>  scripts/ci/setup/build-environment.yml        |  38 ++++
>  7 files changed, 420 insertions(+)
>  create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
>  create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
>  create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
>  create mode 100644 scripts/ci/org.centos/stream/README
>

Maybe it is too late, but just for the records:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>

CI job on a custom VM runner:
https://gitlab.com/willianrampazzo/qemu/-/jobs/1778451942


