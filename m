Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B85F896F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 07:23:52 +0200 (CEST)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohOn1-0002x4-4e
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 01:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohOlL-0001Zh-58
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:22:07 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohOlJ-0001NR-5D
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:22:06 -0400
Received: by mail-il1-x12c.google.com with SMTP id q18so1557951ils.12
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 22:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ua24RJGild1PnFfuqPPbYKfWZw/06RqzSRj2PQwi+Xk=;
 b=HmNTrmdzzQtMUOZrLJJ9eVZAoy57InD1BPF5yfUiE9mpuu9HwafKRXgfAAubjSb/N2
 hTcjEH70c8izf/K37R0Fxim+tLR5km1wg43rSQHXRX03vE+pTEgQm3XE70cgwwYy4emn
 hS2LDOrsQy5TOGPZmsd/s+Msho4C4c6AegQN6suGhvwacNvetc5HowRZifIChv2yimXP
 iKayvtgGV6J+LK3h15tQ3GeL+i8LVo0K1kYQCNhjFrJErpA7uUGuFi8nunpCUC/u7/Io
 nJLTCInk/D7QbSil1Vud7Np7IF/rpkBBa8fOm0g3WasFe+qzViXy6AcuQ42znSNZtEyI
 lbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ua24RJGild1PnFfuqPPbYKfWZw/06RqzSRj2PQwi+Xk=;
 b=MFHTfztxRImMCEta5Y56GX6L2Szitt2D2fbeJQilFbEevOdtaWj4vrK+W+bcc9yWUk
 GEnbeSb+6jg3geZs/5Itr6OxcbH7S3WRyWt6OCltBlTLbeeqWYUpbkNEU4KgR+wgoCNA
 Iozn3NuaC3I4caE3T9gHy6tOwh3IDOkNRM+4jGq4DgULxGCuPPYAATRXvXb6qwTlJW8s
 KOzmh5RK8l1JOw+z8RVFFAVMMPEWDUEQ6rV+QPOQSekKSLNJoGUiMTXRaeJHDB2h54u5
 AjD50MoaKNDN6fRohvXwX4N/4zEhDlRkb29wun/N6gKfzZuF00KPHqBI71YS5+gGARbp
 p3qA==
X-Gm-Message-State: ACrzQf3IaAYWos7rXVLb08A9TLQEAt+78g4PgIaUrPEObstYkIEsS5oV
 AJISBTB8wC3CI9ItoIDi2DxPLVoa9nrTDFcrsV5qng==
X-Google-Smtp-Source: AMsMyM7bYdZSLKw5gA/Oou4MhMAUPrwDlLe41UAIsBgGyoEIXAWZKWXMnaKsA9ym2BW54IzIsIqGd/2MPaYcKQHwbKI=
X-Received: by 2002:a05:6e02:174d:b0:2fa:1b65:106e with SMTP id
 y13-20020a056e02174d00b002fa1b65106emr6281841ill.63.1665292923086; Sat, 08
 Oct 2022 22:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org> <YzPyasEmJcKLJNvX@redhat.com>
 <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
In-Reply-To: <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 9 Oct 2022 10:51:51 +0530
Message-ID: <CAARzgwz3WSefwFLi-hZnv8kLEJPfurfJNDxFFkQwOT88pF3aNA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 "Maydell, Peter" <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 "Mammedov, Igor" <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 1:14 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/09/2022 09.06, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Sep 27, 2022 at 06:09:22PM -0400, Michael S. Tsirkin wrote:
> >> On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
> >>> I also second the idea of using avocado instead of pytest, by the way=
.
> >
> > snip
> >
> >> Problem is I don't think avocado is yet at the level where I can
> >> ask random developers to use it to check their ACPI patches.
> >>
> >> I just went ahead and rechecked and the situation isn't much better
> >> yet. I think the focus of avocado is system testing of full guests wit=
h
> >> KVM, not unit testing of ACPI.
> >>
> >> Let's start with installation on a clean box:
> >
> > ...snip...
> >
> > Do not do any of this stuff, it is irrelevant to QEMU's needs.
> > A developer using Avocado with QEMU does nothing more than:
> >
> >      make check-avocado
>
> Right. And if you want to run individual tests, you can also do it like t=
his:
>
>      make check-venv   # Only for the first time
>      ./tests/venv/bin/avocado run tests/avocado/boot_linux.py

Ok this seems to work after I did a pip3 install of avocado in the host.

 ./tests/venv/bin/avocado run tests/avocado/version.py
JOB ID     : 8dd90b1cb5baf3780cc764ca4a1ae838374a0a5f
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-09T10.48-8dd90b=
1/job.log
 (1/1) tests/avocado/version.py:Version.test_qmp_human_info_version:
PASS (0.04 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 3.51 s

I see that the output is not tap compliant like the qtests tests are.
how do I choose tap?

 ./tests/venv/bin/avocado-runner-tap --help
usage: avocado-runner-tap [-h]
{capabilities,runnable-run,runnable-run-recipe,task-run,task-run-recipe}
...

nrunner application for executable tests that produce TAP

positional arguments:
  {capabilities,runnable-run,runnable-run-recipe,task-run,task-run-recipe}
    capabilities        Outputs capabilities, including runnables and comma=
nds
    runnable-run        Runs a runnable definition from arguments
    runnable-run-recipe
                        Runs a runnable definition from a recipe
    task-run            Runs a task from arguments
    task-run-recipe     Runs a task from a recipe

options:
  -h, --help            show this help message and exit


>
> Or run tests via tags (very convenient for maintainers):
>
>     ./tests/venv/bin/avocado run -t arch:s390x tests/avocado/
>
>   HTH,
>    Thomas
>

