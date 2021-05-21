Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B438C64A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:11:54 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk40P-0002FK-Oa
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk3z0-0001GJ-8I
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk3yx-0001n4-FO
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621599022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBn7z0ovxKhCSlvrYap6fcOL12MAz+pHNhgvYTppXhc=;
 b=ifhD5inhyes9ebArSl0c5pq6SfSOV3hq3jHTUrTTCMa/tXqtdraK6RBxui2VK8P330Mxbf
 PbwLl5USq2kYl+sQxo4iTC53fimwb3GZ4kRVg3jO7PdNo2CB6PPkpk4HOhCKUm1CvYeCtu
 v6g6jUyxlikdBj9XmyuIMu8ROJr5mVg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-_P5Q6Vg2OfGa59pqyZDRxg-1; Fri, 21 May 2021 08:10:20 -0400
X-MC-Unique: _P5Q6Vg2OfGa59pqyZDRxg-1
Received: by mail-vs1-f69.google.com with SMTP id
 b24-20020a67d3980000b029022a610fc6f2so6599093vsj.22
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bBn7z0ovxKhCSlvrYap6fcOL12MAz+pHNhgvYTppXhc=;
 b=a/Uavl+PUY8ADtiPFZlVUT3DdOC5iPB4cPOYE12+ZFVDSlGSe3O35w9rEnvs0QdL2a
 w4W0VFbbfooDYKS9nCwaRnWpn6blhtZIDLNiflMvp95ha8SggTYlCMyQpT7cWPsSW+DV
 vlxPTyB8JxxQbL755/+JJBcIc/5wO2UdAEyIOL7p7kTZtbuo1HN3U23HcGjd9WDoXQ6q
 iYuSURqLDtKsypXJ7RRULeadVWvMhwJL0DVlpYGzxo6qxlWArhV2vOjdSH03fuRqL8Ep
 WOL2PKKh2nch5yZ8UnI3Xq/KmpjZhVWxhtLY/lSjT1y/2/IaCz8+13qDf6UGHu/AFwx6
 2agA==
X-Gm-Message-State: AOAM531oxV1qIX4+zCFT3PpPQ/NLlS87tRNrDg9ngH7/oorcZgFyUstq
 YxOJnx/lDOZBZYsUI/VYkq5CAhgQEEvQX2DmGg4Kxk+M2OV1UoLWoQCJycnViGfvWpNnx83zfxG
 9egY3H+ArRg9b+63dogxcs6Eiw4zKMgU=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr10070490uad.133.1621599019755; 
 Fri, 21 May 2021 05:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhuES4Kh+nMPMRn6XWmM4k93MRRfP6K6jWPL+ZGsu2onacE7YAXInksR8Lqx0SEsFaquN0KQnUx/HkTUFhYj8=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr10070455uad.133.1621599019468; 
 Fri, 21 May 2021 05:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
In-Reply-To: <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 09:09:53 -0300
Message-ID: <CAKJDGDZgEKyGJmAWNWTSRbqqb8zqWbabQX2Sup5ziiiq-cZ_pw@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 5:28 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> > Conceptually speaking, acceptance tests "are a series of specific tests
> > conducted by the customer in an attempt to uncover product errors befor=
e
> > accepting the software from the developer. Conducted by the end-user ra=
ther
> > than software engineers, acceptance testing can range from an informal
> > =E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed s=
eries of scripted
> > tests" [1]. Every time Pressman refers to the term "acceptance testing,=
" he
> > also refers to user's agreement in the final state of an implemented fe=
ature.
> > Today, QEMU is not implementing user acceptance tests as described by P=
ressman.
> >
> > There are other three possible terms we could use to describe what is c=
urrently
> > QEMU "acceptance" tests:
> >
> >   1 - Integration tests:
> >       - "Integration testing is a systematic technique for constructing=
 the
> >          software architecture while at the same time conducting tests =
to
> >          uncover errors associated with interfacing. The objective is t=
o take
> >          unit-tested components and build a program structure that has =
been
> >          dictated by design." [2]
> >       * Note: Sommerville does not have a clear definition of integrati=
on
> >         testing. He refers to incremental integration of components ins=
ide
> >         the system testing (see [3]).
> >
> >   2 - Validation tests:
> >       - "Validation testing begins at the culmination of integration te=
sting,
> >          when individual components have been exercised, the software i=
s
> >          completely assembled as a package, and interfacing errors have=
 been
> >          uncovered and corrected. At the validation or system level, th=
e
> >          distinction between different software categories disappears. =
Testing
> >          focuses on user-visible actions and user-recognizable output f=
rom the
> >          system." [4]
> >       - "where you expect the system to perform correctly using a set o=
f test
> >          cases that reflect the system=E2=80=99s expected use." [5]
> >       * Note: the definition of "validation testing" from Sommerville r=
eflects
> >         the same definition found around the Internet, as one of the pr=
ocesses
> >         inside the "Verification & Validation (V&V)." In this concept,
> >         validation testing is a high-level definition that covers unit =
testing,
> >         functional testing, integration testing, system testing, and ac=
ceptance
> >         testing.
> >
> >   3 - System tests:
> >       - "verifies that all elements mesh properly and that overall syst=
em
> >          function and performance is achieved." [6]
> >       - "involves integrating components to create a version of the sys=
tem and
> >          then testing the integrated system. System testing checks that
> >          components are compatible, interact correctly, and transfer th=
e right
> >          data at the right time across their interfaces." [7]
> >
> > The tests implemented inside the QEMU "acceptance" directory depend on =
the
> > software completely assembled and, sometimes, on other elements, like o=
perating
> > system images. In this case, the proposal here is to rename the current
> > "acceptance" directory to "system."
>
> Are user-mode tests using Avocado also system tests?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html

Yes, they are considered system tests because in software engineering,
system testing means your software built and tested using external
test artifacts, just like your example.

>
> > [1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. p. 430.
> > [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 398.
> > [3] Sommerville, Ian (2016). Software Engineering. p. 240-242.
> > [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 407.
> > [5] Sommerville, Ian (2016). Software Engineering. p. 227.
> > [6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 377.
> > [7] Sommerville, Ian (2016). Software Engineering. p. 240.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
>
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index f718b61fa7..c5de3c9fd5 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -52,7 +52,7 @@ include:
> >      # Avoid recompiling by hiding ninja with NINJA=3D":"
> >      - make NINJA=3D":" $MAKE_CHECK_ARGS
> >
> > -.acceptance_template: &acceptance_definition
> > +.system_template: &system_definition
>
> .system_test_template: &system_test_definition ?

Agreed, keeps the consistency.

>
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 8f220e15d1..c580292bb5 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat=
),)
> >       @echo " $(MAKE) check-tcg            Run TCG tests"
> >       @echo " $(MAKE) check-softfloat      Run FPU emulation tests"
> >  endif
> > -     @echo " $(MAKE) check-acceptance     Run all acceptance (function=
al) tests"
> > +     @echo " $(MAKE) check-system         Run all system tests"
>


