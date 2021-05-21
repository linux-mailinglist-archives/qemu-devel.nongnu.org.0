Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF838CBD5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:18:05 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8mi-0006XZ-Om
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk8ko-0003pE-TY
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk8ki-0001Ft-0Q
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqVrEbpUs+CsG6eK2wFxGEf+5zmjeYtfALjF0+NyyLE=;
 b=RG8QsAEl8ahsIfAfmqNit6Wh3bBks0ffzQDxgLVwyP8dFlHYbyBmvEqGk/u+0obIM644SS
 tstOAaRB0LZrKHMw8xas9MWLhlLOH9lszLJ6tS2zTK3+Vyv4bDmhvukMZTaFkBb3nOWBAw
 Eet8DLrTD989NNk2k8mypLaQY2JMG+0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-R2qzMDlTPlKqJnqJVwjceA-1; Fri, 21 May 2021 13:15:57 -0400
X-MC-Unique: R2qzMDlTPlKqJnqJVwjceA-1
Received: by mail-vs1-f72.google.com with SMTP id
 f20-20020a67d8940000b029022a675e6e86so7083072vsj.2
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqVrEbpUs+CsG6eK2wFxGEf+5zmjeYtfALjF0+NyyLE=;
 b=kiKFymVjmQjQ7X9xn0vfQYfWnmCiDnJj0TCAi8mDtn9ku0fEhVsgPF0VDCMPxCN9Wm
 T1lV2Wfl69JGB9JoSsdaXTqwIIf9FFBoofJC50+OkR4PuHdDWC7BSeX7A1UJ5csJRxmD
 nqR18e82Zq2RQWFA2Vm9h2839DwRwECkiECP4j8huCCO3ELRpnXehb8EO5/wX5B38g1z
 3GJzI5bQAw0fKsS2z+wTN0/87PI9ZFqtrxMgs9k7YNIgii5PCHyjNS2FxtyFXGOoQjeM
 mKSB0Ss2u0uEntLlbiQ8D2pC290qOhg0RoRCYQtQyNz8Ie0tFNXd77fn7dVQzIu6Suiy
 pv/w==
X-Gm-Message-State: AOAM532H9UZeJUKR/JUo44yRDlKEh3826wNWqKXDVvjV4nM0KloyHRql
 ZCaZOLWZLyef4/+JsCghCz/tlJ8qhkhscrrwemsKopkLU87x0z4nP1XW1SXbFREC1F+Qt5HDyrc
 OHi0UzZyM+5AgkGvNuPKcuLyrKiRpZno=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr11736103vsj.1.1621617356957; 
 Fri, 21 May 2021 10:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRAnAlm6sHiypAshqNjqE0qCGi7wtIouVT8w2oHmgPMUZbRsds/sVGJJWADohgbXpgd9cnIcGELyDGR4cRAKQ=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr11736029vsj.1.1621617356428; 
 Fri, 21 May 2021 10:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-3-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-3-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 14:15:30 -0300
Message-ID: <CAKJDGDa524EkveAe1r92BOcff9mN2fxUoYvnJF9bxoKiOz9PdA@mail.gmail.com>
Subject: Re: [PATCH v6 02/25] python: create qemu packages
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 8:13 PM John Snow <jsnow@redhat.com> wrote:
>
> move python/qemu/*.py to python/qemu/[machine, qmp]/*.py and update import
> directives across the tree.
>
> This is done to create a PEP420 namespace package, in which we may
> create subpackages. To do this, the namespace directory ("qemu") should
> not have any modules in it. Those files will go into new 'machine' and 'qmp'
> subpackages instead.
>
> Implement machine/__init__.py making the top-level classes and functions
> from its various modules available directly inside the package. Change
> qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
> library classes are available directly from "qemu.qmp" instead of
> "qemu.qmp.qmp".
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
>
> ---
>
> Note for reviewers: in the next patch, I add a utils sub-package and
> move qemu/machine/accel.py to qemu/utils/accel.py. If we like it that
> way, we can squash it in here if we want, or just leave it as its own
> follow-up patch, I am just leaving it as something that will be easy to
> un-do or change for now.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/{qemu => }/.isort.cfg                |  0
>  python/qemu/__init__.py                     | 11 ------
>  python/qemu/{ => machine}/.flake8           |  0
>  python/qemu/machine/__init__.py             | 41 +++++++++++++++++++++
>  python/qemu/{ => machine}/accel.py          |  0
>  python/qemu/{ => machine}/console_socket.py |  0
>  python/qemu/{ => machine}/machine.py        | 16 +++++---
>  python/qemu/{ => machine}/pylintrc          |  0
>  python/qemu/{ => machine}/qtest.py          |  3 +-
>  python/qemu/{qmp.py => qmp/__init__.py}     | 12 +++++-
>  tests/acceptance/avocado_qemu/__init__.py   |  4 +-
>  tests/acceptance/virtio-gpu.py              |  2 +-
>  tests/qemu-iotests/300                      |  4 +-
>  tests/qemu-iotests/iotests.py               |  2 +-
>  tests/vm/aarch64vm.py                       |  2 +-
>  tests/vm/basevm.py                          |  3 +-
>  16 files changed, 73 insertions(+), 27 deletions(-)
>  rename python/{qemu => }/.isort.cfg (100%)
>  delete mode 100644 python/qemu/__init__.py
>  rename python/qemu/{ => machine}/.flake8 (100%)
>  create mode 100644 python/qemu/machine/__init__.py
>  rename python/qemu/{ => machine}/accel.py (100%)
>  rename python/qemu/{ => machine}/console_socket.py (100%)
>  rename python/qemu/{ => machine}/machine.py (98%)
>  rename python/qemu/{ => machine}/pylintrc (100%)
>  rename python/qemu/{ => machine}/qtest.py (99%)
>  rename python/qemu/{qmp.py => qmp/__init__.py} (96%)
>

This improves a lot the organization of the code.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


