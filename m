Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302714A68D9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:59:25 +0100 (CET)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF33U-00030k-5m
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEyS5-0006YR-2g
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEyS0-0006xG-QF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643742263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvI+h65HloxU1kH+7FC47f91bCZ2KYFb3Z10kjuIjKA=;
 b=Y9qriI29LhYPiXByQujD35WfV+5sgGhtIlAcH9EnlwFdr/BJ6JIQ17JrRFna+AP7Js5tyX
 oos3mVJgIjuewMM3zBAHwvFrpClDp1jKnlPHlVwdr/wMg4W6oeX2LzgI2vqDyDTgNWuZGT
 e2Jo4MDba5VbQqdOYPBXnJnIcodZNnM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-FdrZi1QeNKqtRR53S_77PA-1; Tue, 01 Feb 2022 14:04:22 -0500
X-MC-Unique: FdrZi1QeNKqtRR53S_77PA-1
Received: by mail-ua1-f69.google.com with SMTP id
 b11-20020ab0690b000000b0030d39cc471aso9277876uas.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nvI+h65HloxU1kH+7FC47f91bCZ2KYFb3Z10kjuIjKA=;
 b=7Vf+BGv+5GcfQTJ5Tav2JztMqebWsL3fNuUXDfJMO7sXppNJiSdST1OR2xOH5n9KOJ
 FgGEOggYuR+wnPpsbzSB6FxXtzwPOPju+g4rOjb0vMtykxtiU9umg2N+jFQ011Og4QL+
 0rpV4mSBDgGldqxXiduPLdECGIjZe2GABP6/SM4VgWTzt8JkwAFOqBxLYTgKtKWHMVU7
 7Tiah1LxaEpz3dPnI4oj4eaLLzFeeDxAvrNebmEhdTfMIuYiQL2BWXG5dGe4+JLt+Vxj
 ovgQnWsD5UzAfdTu0rYheYQu2psRY1cArK+0GhGEpclwKAQEffWBvnquZ9/9ZCzP83mG
 XW2w==
X-Gm-Message-State: AOAM5332uaoQnfimxZbH4IDf6Mdl9VDTg4xQIF4aGCpDq/k7GWSHa+sQ
 Vu4ZGGujstE/wdfoB1e33ZaqgXKDu79aLTpfStjHF7v7YUlK0rASfoFqpgfBaBjvAWNQekzMCI5
 f8/OiYFzlDFUSuEAvoeOePppyYePn91Q=
X-Received: by 2002:a1f:ad89:: with SMTP id w131mr1673404vke.17.1643742260766; 
 Tue, 01 Feb 2022 11:04:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypWLxWVZabfeX2B79DzCWKLdt1w5g730AGlHjHsSxQW+pu5pyl5RZTw5XRB388k4bJm+aRMuR4zb+QRf2K9Y0=
X-Received: by 2002:a1f:ad89:: with SMTP id w131mr1673397vke.17.1643742260517; 
 Tue, 01 Feb 2022 11:04:20 -0800 (PST)
MIME-Version: 1.0
References: <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
 <Yfldie06h92qxqf3@redhat.com>
 <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
 <87fsp2xy0k.fsf@linaro.org>
In-Reply-To: <87fsp2xy0k.fsf@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 14:04:09 -0500
Message-ID: <CA+bd_6KSRjuJw6j2QbdyxZd9WQVPw3+nU0d-v3=A+3cozfHwOw@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 1:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Cleber Rosa <crosa@redhat.com> writes:
>
> > On Tue, Feb 1, 2022 at 11:20 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> >>
> >> On Tue, Feb 01, 2022 at 11:01:43AM -0500, Cleber Rosa wrote:
> >> > On Tue, Feb 1, 2022 at 6:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
> >> > >
> >> > > We have up to now tried really hard as a project to avoid building=
 and
> >> > > hosting our own binaries to avoid theoretical* GPL compliance issu=
es.
> >> > > This is why we've ended up relying so much on distros to build and=
 host
> >> > > binaries we can use. Most QEMU developers have their own personal =
zoo of
> >> > > kernels and userspaces which they use for testing. I use custom ke=
rnels
> >> > > with a buildroot user space in initramfs for example. We even use =
the
> >> > > qemu advent calendar for a number of our avocado tests but we basi=
cally
> >> > > push responsibility for GPL compliance to the individual developer=
s in
> >> > > that case.
> >> > >
> >> > > *theoretical in so far I suspect most people would be happy with a
> >> > > reference to an upstream repo/commit and .config even if that is n=
ot to
> >> > > the letter of the "offer of source code" required for true complia=
nce.
> >> > >
> >> >
> >> > Yes, it'd be fine (great, really!) if a lightweight distro (or
> >> > kernels/initrd) were to
> >> > be maintained and identified as an "official" QEMU pick.  Putting th=
e binaries
> >> > in the source tree though, brings all sorts of compliance issues.
> >>
> >> All that's really needed is to have the source + build recipes
> >> in a separate git repo. A pipeline can build them periodically
> >> and publish artifacts, which QEMU can then consume in its pipeline.
> >>
> >
> > I get your point, but then to acquire the artifacts one needs to:
> >
> > 1. depend on the CI system to deploy the artifacts in subsequent job
> > stages (a limitation IMO), OR
> > 2. if outside the CI, implement a download/cache mechanism for those
> > artifacts, which gets us back to the previous point, only with a
> > different distro/kernel+initrd.
> >
> > With that, the value proposal has to be in the characteristics of
> > distro/kernel+initrd itself. It has to have enough differentiation to
> > justify the development/maintenance work, as opposed to using existing
> > ones.
> >
> > FWIW, my non-scientific tests booting on my 3+ YO machine:
> >
> > * CirrOS x86_64+KVM: ~2 seconds
> > * CirroOS aarch64+TCG: ~20 seconds
> > * Fedora kernel+initrd aarch64+TCG
> > (tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt=
):
> > ~1 second
> >
> > I would imagine that CirrOS aarch64+KVM on an adequate system would be
> > similar to the CirrOS x86_64+KVM.  We can develop/maintain a slimmer
> > distro, and/or set the default test workloads where they perform the
> > best.  The development cost of the latter is quite small.  I've added
> > a missing bit to the filtering capabilities in Avocado[1] and will
> > send a proposal to QEMU along these lines.
>
> FWIW the bit I'm interested in for the slow test in question here is
> that it does a full boot through the EDK2 bios (EL3->EL2->EL1). I'm not
> overly concerned about what gets run in userspace as long as something
> is run that shows EL0 can be executed and handle task switching. I
> suspect most of the userspace startup of a full distro basically just
> ends up testing the same code paths over and over again.
>

That's an interesting point.

Does that mean that ,if you are able to determine a condition that the
boot has progressed far enough, you would consider the test a success?
 I mean, that's what the "boot_linux_console.py" tests do: they find a
known pattern in the console, and do not care about what happens next.

The same could be done with the "full blown distro boot" tests
(boot_linux.py). They could be configurable to consider a "successful
boot"  anything, not just a "login prompt" or a "fully initialized and
cloud-init configured system".  We can reuse most of the same code,
and add configurable conditions for different test cases.

Does that make sense?

- Cleber.


