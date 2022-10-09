Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B85F89B5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 08:36:16 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohPv5-0002qc-EP
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 02:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohPq3-0000VV-Ky
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:31:05 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:38636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohPq0-0003p4-1j
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:31:01 -0400
Received: by mail-il1-x132.google.com with SMTP id u10so4360653ilm.5
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1CfZpMHsaROaYGp7U6CBbKLUTjHajURMC2r+k5aR/ck=;
 b=ch8KzMiVKBVvej9MYsNAZWdY1ToRDR5DIgtnGo9GjLP9wBsqjUlUey75e5ZLcVbNK/
 jWvQ9ATuFLssRbIUcgDTXpD/l+u3ci4OS79xjNMC0DEiPq8sACPwtHBHBevzDvqAeBb9
 3366xjabXzAOg27Cc4JFI8FsEQ6nHAlJ+D5nX7jOy/kGHxEing1bpSFEsbtHaVmPsM1M
 By6nxsrHWA6HEtNzixBMbMUyxkB5AjArG3LnQerrCUdnzFbyFVSrkYBsQrdxW3ogu8+A
 cDIGZaTVwwZNctn6vm7x9tm4jpRwT7NGq4PyqpGEarBtZjXt/6SIrN6TtMItQI1usWNB
 kIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1CfZpMHsaROaYGp7U6CBbKLUTjHajURMC2r+k5aR/ck=;
 b=Cqdr5EbU7HeDDyrHaDJTTZuIlF3awHbunINYpQ/yL05HeX4iBo2Vz5OT0oF42IBS+D
 3TaMWQOXLwc2qPXGsDYb4OCZSx74ISmRj3gBLVcWaUO9hwubbaPxdMOW1/RdsvjEDnr5
 TgsQq8qXzQdA9Oow/+vrpM2TzKtiF2wTwBNUOTyl68IMhhaFSGP6yUJJCCHd7ujhLw2Z
 jG17o0kAbHQq7uSiUV5/Z5YEUbqKnF0UiUSpkUTq5nzO72VPvuV2uynhtwcgR0ZWWCm7
 bNiFoLxP7eFyixya7Jm3/kqleMxaiAZV5S3U12kaW8I4pvB3R2/unIPT4hfBAC2tKrvY
 VteA==
X-Gm-Message-State: ACrzQf1B8GiELihDT9ioIFbGIky9Rh/RjlIlfUG/v0gvBJLGfkQtcI1l
 2A+dOFWhFMsBeUaO2zFp0BoJDquE4apHm1yn18bUfA==
X-Google-Smtp-Source: AMsMyM6TA/ioFM7Tdri9JUktBL44O1BCZ1T5Hj0iepoVxuWNYcF1z9zyGz/+7y/uUPVO8lPv5L3FDDzOzufZIFtCLTY=
X-Received: by 2002:a05:6e02:1a82:b0:2fa:2077:5028 with SMTP id
 k2-20020a056e021a8200b002fa20775028mr6219386ilv.129.1665297058633; Sat, 08
 Oct 2022 23:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org> <YzPyasEmJcKLJNvX@redhat.com>
 <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
 <CAARzgwz3WSefwFLi-hZnv8kLEJPfurfJNDxFFkQwOT88pF3aNA@mail.gmail.com>
In-Reply-To: <CAARzgwz3WSefwFLi-hZnv8kLEJPfurfJNDxFFkQwOT88pF3aNA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 9 Oct 2022 12:00:47 +0530
Message-ID: <CAARzgwxCFU3Wb_7GzzvtvEc2E0A7TOXOAC3_GWOAzmkQx=WE+Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 "Maydell, Peter" <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 "Mammedov, Igor" <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x132.google.com
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

On Sun, Oct 9, 2022 at 10:51 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Wed, Sep 28, 2022 at 1:14 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> >
> > > Do not do any of this stuff, it is irrelevant to QEMU's needs.
> > > A developer using Avocado with QEMU does nothing more than:
> > >
> > >      make check-avocado
> >
> > Right. And if you want to run individual tests, you can also do it like this:
> >
> >      make check-venv   # Only for the first time
> >      ./tests/venv/bin/avocado run tests/avocado/boot_linux.py
>
> Ok this seems to work after I did a pip3 install of avocado in the host.
>
>  ./tests/venv/bin/avocado run tests/avocado/version.py
> JOB ID     : 8dd90b1cb5baf3780cc764ca4a1ae838374a0a5f
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-09T10.48-8dd90b1/job.log
>  (1/1) tests/avocado/version.py:Version.test_qmp_human_info_version:
> PASS (0.04 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 3.51 s
>
> I see that the output is not tap compliant like the qtests tests are.
> how do I choose tap?
>
>  ./tests/venv/bin/avocado-runner-tap --help
> usage: avocado-runner-tap [-h]
> {capabilities,runnable-run,runnable-run-recipe,task-run,task-run-recipe}
> ...
>
> nrunner application for executable tests that produce TAP
>
> positional arguments:
>   {capabilities,runnable-run,runnable-run-recipe,task-run,task-run-recipe}
>     capabilities        Outputs capabilities, including runnables and commands
>     runnable-run        Runs a runnable definition from arguments
>     runnable-run-recipe
>                         Runs a runnable definition from a recipe
>     task-run            Runs a task from arguments
>     task-run-recipe     Runs a task from a recipe
>
> options:
>   -h, --help            show this help message and exit
>

Never mind

$ ./tests/venv/bin/avocado run tests/avocado/version.py --tap -
1..1
ok 1 tests/avocado/version.py:Version.test_qmp_human_info_version

from https://avocado-framework.readthedocs.io/en/52.0/ResultFormats.html .

