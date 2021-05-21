Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C333D38C694
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:32:50 +0200 (CEST)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4Kf-0002KB-Rl
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk4Gj-0000Af-59
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk4Gf-0003bZ-My
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621600119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAIvEx2mSQJr37uvnqVRAXLyQnlf9AXNqu12tPg6sSg=;
 b=Z6Qd1NtYfyq4pY1hLJ71GyZshUuDgt1SencQSA5Nc9LnYk4Dn52QBNE3ABsp+9XH2zYhXk
 jPv6GBvUYz1R43uPm8uUGlVZfFbeMadUw6iOiOEDzBbMBBCVJkmfXperJp9FrPiUxLlvDD
 tjp1qx8yKOm9LC/8JJstZe15Qnt4ks4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-bkHt3Y51ON2H6nmjk06nKQ-1; Fri, 21 May 2021 08:28:38 -0400
X-MC-Unique: bkHt3Y51ON2H6nmjk06nKQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 g18-20020a67fad20000b0290238d53e08c7so448731vsq.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PAIvEx2mSQJr37uvnqVRAXLyQnlf9AXNqu12tPg6sSg=;
 b=GMy0xmOhaDTapYm1uUCkTlPrb812oKegmmU7cS0w05juT9LonjtJX9RqCmpmvGw5zu
 MbGc7XIM+ZSLcgbjuSREKw/7vsI570u+AtRVgdZj2H2ADNGLokpIXBZ7mByO0jHKjEE+
 0DoGySnyScbpzV9rl5qatqHyS4Ysj6/161HEQdA/Elj4kQzE2LUvLDlhdSLInrnyY2Xo
 Z94lEBTEAD3eSyNpfS2V7A9ffLG7OK+ozDsmKlnKBIGw7CufM9i/NckmuIJefaWOqgN/
 0Qp2sQZe/6+l3BX1bN9ASWxODjwwaDurgLM/or01CYCSkVsO98/rzg3B98euE3C+2XCA
 dwSw==
X-Gm-Message-State: AOAM532Ff/VFWmvNR+OfZJ+kSISOktG8FpeMuO5d72TZZhRqtLz2WJfb
 Pah0+V3nlkcD4rTyNeG16NEdCKpYx6LdKqetX8xmEeXGyU1M8sV3looslKoYINh0hTKK8usd9g8
 tD3a2uPcGAzVLyLbl/RcvT75u5Z0PJzI=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr9342206vsj.50.1621600117700; 
 Fri, 21 May 2021 05:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxhAm4wW289ZiaX7YnettjlgiNoTBDdnfSoZjMMwdgpwNqRK8OQGSVZXtNu/i/b6A4k6VEo9ccrAzljogWCPU=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr9342185vsj.50.1621600117492; 
 Fri, 21 May 2021 05:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
In-Reply-To: <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 09:28:11 -0300
Message-ID: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/05/2021 22.28, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> >> Conceptually speaking, acceptance tests "are a series of specific test=
s
> >> conducted by the customer in an attempt to uncover product errors befo=
re
> >> accepting the software from the developer. Conducted by the end-user r=
ather
> >> than software engineers, acceptance testing can range from an informal
> >> =E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed =
series of scripted
> >> tests" [1]. Every time Pressman refers to the term "acceptance testing=
," he
> >> also refers to user's agreement in the final state of an implemented f=
eature.
> >> Today, QEMU is not implementing user acceptance tests as described by =
Pressman.
> >>
> >> There are other three possible terms we could use to describe what is =
currently
> >> QEMU "acceptance" tests:
> >>
> >>    1 - Integration tests:
> >>        - "Integration testing is a systematic technique for constructi=
ng the
> >>           software architecture while at the same time conducting test=
s to
> >>           uncover errors associated with interfacing. The objective is=
 to take
> >>           unit-tested components and build a program structure that ha=
s been
> >>           dictated by design." [2]
> >>        * Note: Sommerville does not have a clear definition of integra=
tion
> >>          testing. He refers to incremental integration of components i=
nside
> >>          the system testing (see [3]).
>
> After thinking about this for a while, I agree with you that renaming the
> "acceptance" tests to "integration" tests is also not a good idea. When I
> hear "integration" test in the context of the virt stack, I'd rather expe=
ct
> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
> virt-manager on top and tests them all together. So we should look for a
> different name indeed.
>
> >>    2 - Validation tests:
> >>        - "Validation testing begins at the culmination of integration =
testing,
> >>           when individual components have been exercised, the software=
 is
> >>           completely assembled as a package, and interfacing errors ha=
ve been
> >>           uncovered and corrected. At the validation or system level, =
the
> >>           distinction between different software categories disappears=
. Testing
> >>           focuses on user-visible actions and user-recognizable output=
 from the
> >>           system." [4]
> >>        - "where you expect the system to perform correctly using a set=
 of test
> >>           cases that reflect the system=E2=80=99s expected use." [5]
> >>        * Note: the definition of "validation testing" from Sommerville=
 reflects
> >>          the same definition found around the Internet, as one of the =
processes
> >>          inside the "Verification & Validation (V&V)." In this concept=
,
> >>          validation testing is a high-level definition that covers uni=
t testing,
> >>          functional testing, integration testing, system testing, and =
acceptance
> >>          testing.
> >>
> >>    3 - System tests:
> >>        - "verifies that all elements mesh properly and that overall sy=
stem
> >>           function and performance is achieved." [6]
> >>        - "involves integrating components to create a version of the s=
ystem and
> >>           then testing the integrated system. System testing checks th=
at
> >>           components are compatible, interact correctly, and transfer =
the right
> >>           data at the right time across their interfaces." [7]
> >>
> >> The tests implemented inside the QEMU "acceptance" directory depend on=
 the
> >> software completely assembled and, sometimes, on other elements, like =
operating
> >> system images. In this case, the proposal here is to rename the curren=
t
> >> "acceptance" directory to "system."
> >
> > Are user-mode tests using Avocado also system tests?
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>
> We've indeed got the problem that the word "system" is a little bit
> overloaded in the context of QEMU. We often talk about "system" when
> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-use=
r
> emulator binaries). For example, the "--disable-system" switch of the
> configure script, or the "build-system" and "check-system" jobs in the
> .gitlab-ci.yml file ... thus this could get quite confusing in the
> .gitlab-ci.yml file afterwards.

I agree with you here. After I made the changes to the code, I noticed
QEMU has the "system" word spread all over the place. That may confuse
people looking at the "system tests" without much interaction with
software testing terminology.

>
> So I think renaming "acceptance" to "system" is especially ok if we only
> keep the "softmmu"-related tests in that folder... would it maybe make se=
nse
> to add the linux-user related tests in a separate folder called tests/use=
r/
> instead, Philippe? And we should likely rename the current build-system a=
nd
> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or =
so?
>

As I mentioned in Philippe's reply, those tests are still considered
system tests because system testing is the software built and
interacting with external test artifacts in software engineering.

> Alternatively, what about renaming the "acceptance" tests to "validation"
> instead? That word does not have a duplicated definition in the context o=
f
> QEMU yet, so I think it would be less confusing.

While at the beginning of your reply, I started thinking if
"validation" would cause less confusion for the QEMU project. Although
validation testing is a broader concept inside the Verification &
Validation process, encompassing unit testing, functional testing,
integration testing, system testing, and acceptance testing, it may be
an option for the QEMU project.

While system testing would be the correct terminology to use, if it
causes more confusion, using a less strict terminology, like
validation testing, is valid, in my opinion.

>
>   Thomas
>


