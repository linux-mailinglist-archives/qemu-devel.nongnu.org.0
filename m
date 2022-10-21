Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024CA60769D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:58:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqf9-0002qD-Rf
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:58:07 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqdK-0001dS-NV
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqdA-0001Xu-5l
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:56:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqd8-00063o-GH
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:56:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so4823871wma.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7vABXJVNRwGpSv4QF7b1f84AO3CzCmX7wh1wuYuvqM=;
 b=dZjSyDMevjuzwqGddcfHCdKh1yenplqGoKSvtOW57S3vtMhgb9/sbH2M1q5t7RuyBU
 1clIreBwCx7pMKHd0jgMHl3TneUHQIxex3NRIOItr7n1Wv3q6Cb73YrixJd5gv0c+Vbb
 VMHc7Cu4b4BIPBgo7oRw6aT1csKeqiGmKJZFmEKVMvJq8KKNN5XRg5hAgdTrj8neOHC9
 Snz8P9e48g7L9OVqfxR4SCjdg8t7Fqrb7GFacJ3+WZTB6Mp5eV66RBBwJ+O64/c7pCaX
 pBjGzb7W0UDo7Rc7PUnTFpceYtdMCzTty2m4vp9rzmr+bbd7dL3PTU2kKU7ALP7005ud
 z7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y7vABXJVNRwGpSv4QF7b1f84AO3CzCmX7wh1wuYuvqM=;
 b=z6X28cQt9/R9YxjteCaObbOcnqXx9zmpOStz8ogTzb3FgqydloErDatzOsVLlZUtFo
 1yJJY8EkVOdC8ZU5xV0kKS1EhLAVR1BkMcA7yUD2lkZHh6HKq0oiTtZ2u1lz0BqfuF51
 246T/bs0V5ae8vIIf5G/7psJvnwMx1qz53zazEbRglY0gAPFPvKK2tEkpNY9f1V91wKU
 d0hBYNTX35djtsUDKQW3A0cuKVq3jvehgambQsG+Ji7qyhECPRiIvdiXMnuUF1YWcMBr
 fgVYx0mGQbZwA0TThO56WbwawVZiBJMu2Bqt8Htz2bxmj7Dn7i9Tn+9KBqXwrLdfLZGo
 16pA==
X-Gm-Message-State: ACrzQf2+DvXlL5Zd+cZiSw65FfK2pVAiBB5vPtOIgTTX9HZLFUT/DB/y
 QuJEqDjBP0Okm6qWIS4371nL/Q==
X-Google-Smtp-Source: AMsMyM6iPwFMft+GigcmvMaDcRe1jtJuFrdiNkLB+0tKfMu892KDJLOLiBNLa7p+XQU0Pogoh9KO9A==
X-Received: by 2002:a05:600c:1d1a:b0:3c6:d715:2d69 with SMTP id
 l26-20020a05600c1d1a00b003c6d7152d69mr12877544wms.145.1666353360676; 
 Fri, 21 Oct 2022 04:56:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfeb46000000b002258235bda3sm18547229wrn.61.2022.10.21.04.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 04:56:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD78E1FFB7;
 Fri, 21 Oct 2022 12:55:59 +0100 (BST)
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Fri, 21 Oct 2022 12:52:27 +0100
In-reply-to: <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
Message-ID: <87bkq575m8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Ani Sinha <ani@anisinha.ca> writes:

> On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
>> >
>> > Ani Sinha <ani@anisinha.ca> writes:
>> >
>> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>> > >>
>> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>> > >> > And have multiple platform specific branches in bits that have fi=
xes for those
>> > >> > platforms so that bits can run there. Plus the existing test can =
be enhanced to
>> > >> > pull in binaries from those branches based on the platform on whi=
ch it is being
>> > >> > run.
>> > >> >
>> > >>
>> > >> What a mess.
>> > >> Who is going to be testing all these million platforms?
>> > >
>> > > I am not talking about branches in QEMU but branches in bits.
>> > > If you are going to test multiple platforms, you do need to build bi=
ts
>> > > binaries for them. There is no way around it.
>> > > bits is not all platform independent python. It does have binary exe=
cutables.
>> > >
>> > > Currently bits is built only for the x86 platform. Other platforms a=
re
>> > > not tested. I doubt if anyone even tried building bits for arm or
>> > > mips.
>> >
>> > I'm not worried about test bits on other targets, but we do run x86
>> > targets on a number of hosts. The current reliance on a special patched
>> > host build tool for only one architecture is the problem. If  we just
>> > download the iso that problem goes away.
>>
>> =F0=9F=91=8Dwhat he said.
>
> Yes, in that case the problem is that upstream bits does not pass all
> the test out of the box. Hence we are taking this approach of keeping
> some test scripts in QEMU repo and modifying them. Then generating the
> iso with the modified scripts. It also helps developers who want to
> write new tests or make enhancements to existing tests.
> If modifications need to be made to tests, they need to be versioned.
> We have gone through the route of not using submodules and I am not
> going to open that can of worms again.

We have added a mirror of biosbits to the QEMU project so there is no
reason why we can't track changes and modifications there (we do this
for TestFloat which is forked from the upstream SoftFloat code).
Maintaining and occasionally re-based "vendor" branch shouldn't be too
hard and would track the changes we've made for QEMU's purposes.

> We also have no consensus on where to keep the one time built iso that
> we can download for this test you are proposing.

How big is the eventual ISO? If it's small we could just enable some CI
steps and serve the ISOs directly as tagged build artefacts from GitLab.

> So let's figure out the above first. Programmatically downloading an
> iso and running tests within a VM would be a much simpler test than
> the one I wrote. We can add a subtest or a brand new test anytime if
> we can figure out the above logistics.
>
>>
>> > > It makes sense to try things incrementally once we have something go=
ing.
>> > >
>> > > Lets discuss this on a separate thread.
>> > >
>> > >> All this does nothing at all to help developers avoid
>> > >> bugs and when they do trigger debug the issue. Which is
>> > >> after all why we have testing.
>> > >> Yes once in a very long while we are going to tweak
>> > >> something in the tests, and for that rare occurence
>> > >> it makes sense to periodically rebuild everything,
>> > >> otherwise code bitrots.
>> > >>
>> > >> But the test is supposed to run within a VM anyway, let's
>> > >> have an image and be done with it.
>> > >>
>> > >> --
>> > >> MST
>> > >>
>> >
>> >
>> > --
>> > Alex Benn=C3=A9e
>>


--=20
Alex Benn=C3=A9e

