Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37D562D0B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 09:53:04 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7BSY-0006mf-QX
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 03:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o7BQN-0005ZB-7v
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:50:47 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o7BQJ-0006Fc-RP
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:50:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id ej4so1887870edb.7
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmpFZhwU0qcI458YQcb6zDu41y22C/gOG8pmA5L+qhg=;
 b=6WMkKTuqBudcTpXXVTGY8DFPoqAVMWYa/E9KYe2skzAHOdk9t9txKxZmGBpUC9YFZ8
 1hSF+A0oBgRJ/8tYGNlj2BhxKQnDCe6Il6SJJWubIdTvYjLxGCBuk6Hl9cc72JXE6vdX
 JFkmxmIL8Q8Pj8n7mkdrFhELVvSuGm7y6m7HRHC8kZGm1q+HYdsA4j3Nj9QopOwzhHWv
 MAz2ouHNmyXFu85vs5BIIBd0A9jVPo31hC6muFjRFI147vYvKGdT6oTy8F5M1ixTBg5T
 8xCOxkQp3gOf5biZRv9wzQYFp1yX7h0quirAkpH0b0xAZz20jhnBPVlSMlurv21YHoBl
 c/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmpFZhwU0qcI458YQcb6zDu41y22C/gOG8pmA5L+qhg=;
 b=ZuKYYVENj5tK35m4kgwHZby1CYdK73fCce15POtW1GBEVz2HfO00ELfo6yixNHXLCW
 Jyjr7oNW6JCQtRzo4u1mhUZueCcbETdfrsfvZBe3rYiiUyWZNEYmdx6xq2TxT9Zs0Aj9
 PxnZv3ZVHSQcCCPadTm2sWauUSdaZBCDg/OOaK+KIUkGBD2o8EaONYY2HFG+d6X7un5w
 lcHjD8QacNdQ2HaRLlmVuKeWiiZrRmYL1Z778dDHL9QZSffNetPz7sCXe9iIttFqFMTW
 CXz8+nTJ7gm0Y4OLM7B2/wqrueZvEEYiqAljud1xSdvQqJ1GClbde5H2GuCORnZMNOa4
 RRRw==
X-Gm-Message-State: AJIora9odOLE0Zv12Hm150qDKG9lsgioqXC+DndUFW3CwCWh+Pp5M76P
 4gOXRFLnS/aPjemRzrBHruSZifOJx7hof7aIJhybKw==
X-Google-Smtp-Source: AGRyM1sEswEHX9aPsmd7J0i/ymyBhJ5X2VJ0gJTTe6Jb5PT0LAvJ2UFXaw7yX+1fAQGxmU7j2yY+sSE7pN8wMZMdhAk=
X-Received: by 2002:a05:6402:2708:b0:435:da6f:3272 with SMTP id
 y8-20020a056402270800b00435da6f3272mr16694025edd.160.1656661841768; Fri, 01
 Jul 2022 00:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
 <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
 <20220701033006-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220701033006-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 1 Jul 2022 13:20:30 +0530
Message-ID: <CAARzgwwhrsG1EkA9=kH9Y456_Yz5KEA9tMQoQ6wGufoPGTu69w@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jul 1, 2022 at 1:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 01, 2022 at 12:58:33PM +0530, Ani Sinha wrote:
> > On Fri, Jul 1, 2022 at 12:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Jul 01, 2022 at 06:12:14AM +0200, Thomas Huth wrote:
> > > > I even wouldn't mind if you put your python stuff in a new directory like
> > > > tests/pytests/ for example, as long as it downloads your binaries separately
> > > > - as I wrote in another mail, the avocado framework rather looks like an
> > > > oddball in our test framework nowadays since it uses a separate test runner
> > > > and not the meson test harness, so having a new approach for python-based
> > > > tests is maybe even a good idea. I just really want to avoid that this goes
> > > > into tests/qtest (since it really does not belong there), and please don't
> > > > add more external stuff via git submodules, that's really the wrong approach
> > > > for this.
> > >
> > > I get it, people hate submodules with passion.  I think trying another
> > > approach for testing that is neither avocado nor qtest is
> > > not too bad. As long as this is not user visible, we can
> > > allow ourselves space to experiment.
> > >
> > > OK so, how about this:
> > > - put it in a new directory: tests/roms?
> > > - create repo for a fork of biosbits under git.qemu.org
> > > - roll our own analog to git submodules: a script
> > >   that clones the repo
> >
> > No need to clone the whole repo. We can simply download the binaries
> > that the girlab CI job would generate from the bits sources in that
> > repo.
> > We need to clone if we are always building bits from source for every
> > test. That is not necessary IMHO since much of the bits package would
> > remain as is without modification.
>
> IMHO CI job idea isn't great since isn't versioned at all, is it?

bits is versioned yes, in a crude way. every time you make a commit in
the top level repo, the version would increment by one.

> Also as long as test passes, sure. But if it fails one will
> need the sources to investigate.

sources might also be needed to write the tests.

>
> Let's start with building things from source.

hmm. bitys uses old autotools, not ninja and takes about 10/15 mins to
build depending on parallelity and build host.

Add an option
> of prebuilt binaries as an optimization once things
> stabilize.
>
>
> > > - new target make check-roms,
> >
> > I think make pytest or some such is better and more generic if other
> > such tests in other areas follow suit.
>
> The name is not critical in my mind, but I think we need to decide
> what exactly differentiates it from other tests.
>
>
> >
> > if the clone exists locally -
> > >   run the test, if not - skip it
> >
> > if download of the bits binaries fail, skip it.
>
> You seem to be recreating either git or avocado or both here.
>
> Personally I want something that works offline.
>
>
>
> > > - as for using pre-generates ISOs as an optimization,
> > >   I'm not sure how important that is, if yes -
> > >   we can add another repo and another make target along the
> > >   same lines
> > >
> > >
> > >
> > > --
> > > MST
> > >
>

