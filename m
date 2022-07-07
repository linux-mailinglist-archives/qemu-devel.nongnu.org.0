Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F068E56A2E8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:54:40 +0200 (CEST)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9R1j-0001u1-II
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o9QxN-0007KM-Bk
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:50:09 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o9QxL-00050N-9o
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:50:09 -0400
Received: by mail-ej1-x62b.google.com with SMTP id n4so12956296ejz.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kdO/lvfrO5FhBpLDnFGwl+1BW9XiPjGjDlNJPcipgc=;
 b=h75NjfQDCP/P9AspEIws6Rzvx4O5f4PWNhepDNwD5HYK0Furwc5WX6iK9UxYLqqCeH
 6PgIVzwFsOEAyJARSharjUi8DOFoJ3zWF7DoQCmrgjByYyreel8puEYwEON2RLRQyFQ5
 QSx1bcSpEhJ3F/pwE3TKOsOQ664qnQkfDeQgviEXXg6CbA2peMMgfRVTYdjW45hF3m0A
 JmnMcgkFZgFOTufAkSyaoTSxKGhSFZoueUpGM/wMkkzSdwSd2LTko5LDCnlLSHFo7vCX
 rfQMRVOlXgc2CkzJ5mPI/QlhcUJDGWYvfcpkFR9lCw9FSeidIVGSsnzyUp8ksPg3WHjB
 Ob2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kdO/lvfrO5FhBpLDnFGwl+1BW9XiPjGjDlNJPcipgc=;
 b=qGOqyV5f1RoDilOMyy/XD7Cw+sVXb4E9kgHLd+CaAhhOJO2eggOaHKDggmF1g1Vqg/
 HV29IbCMO96WXw4hXJZbSVcOSGMEo7vH42sV4P0z7jMheZAWe5qiDegW27T5WtBfxpQ7
 Qv1Mf9FCT6xqjdM8Yu6SRolfWEbgBnKMn1q1JAsu3K5/m2AiC25K8uBtbJpc8P7xJPM2
 xGy8gFIdd63KRp5pvHqE7bhzSom1aOb7tvB2MpgHNP/C1cs+2uUWkokMhEqPopXeI62V
 /O4u7I5YBmCaBo/bdiAn/b7MP4X/Po5LZa+F9LnYa8rJPWxZcs9C2sNaWHkZLFgnywHi
 fy/A==
X-Gm-Message-State: AJIora+nDh8bcchlxgGmq91c5xlM++T5yH4e1wXSnYH4aOzbSXh38QtH
 ULs97nsSED0/fW8LZS+K74LypkclyJnWvZPrI2uHoQ==
X-Google-Smtp-Source: AGRyM1t288IMMF+idYIibnnmvlacYZ31iemIAjYRJBZRd/Ax8G3V3oNyY/wnPJRe2GvImN7SHOwnpf4y0CbLrAgteGw=
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr45165769ejo.716.1657198205144; Thu, 07
 Jul 2022 05:50:05 -0700 (PDT)
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
Date: Thu, 7 Jul 2022 18:19:53 +0530
Message-ID: <CAARzgwzynQ1ZP4bZNvzvaAGLpLCzziGOYGx9iiTXRWo3MeDW=w@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62b.google.com
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
> Also as long as test passes, sure. But if it fails one will
> need the sources to investigate.
>
> Let's start with building things from source. Add an option
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

Well we need to make a call as to how to make things work offline, if
that's what we wanted.  I have made changes in v2 to download the
binaries from my github repo. It works great. If download fails, it
skips the test. If those files are available before, it will not
attempt to download them.
https://pastebin.com/nrcdN8WS and
https://pastebin.com/m7Dx3PZk

The Dockerfile and build script I have in the repo will generate these
artifacts. So if you wanted to run the test offline, either build
those from source and place them where the test expects to find them
or build them from source using Dockerfile/build script and place them
there before running the test.

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

