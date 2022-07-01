Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43572562C9E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 09:30:23 +0200 (CEST)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7B6c-0000tC-9g
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 03:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o7B5A-0000D1-UE
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:28:52 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o7B55-00046r-9B
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 03:28:52 -0400
Received: by mail-ed1-x530.google.com with SMTP id fd6so1840175edb.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJ3UAJ1DHn+Rl48i8gSZTrJclFX6By6E0cVlbBCYHwo=;
 b=R9FvUMp4t/cP7qCturYF7RYose+KR7tz98p8XRC9FkAN17mV6Q4gSE8cdtYOoJt0AH
 aShKnyCgBB4MIqeTx4XCTsaL4kY4Y39BZS+aSZBwPQqQodTaXYvPskntuzEpyXwZ2bI4
 TDUpOlWxgkGE0wgvXV9dl0UYp5ZdWg7pCIl1SzbqQdjyPy+0ksTXckJwACKw+pF9LCm6
 jYIjcyR/3Ma92Wl1qTVjKH+g+OIPypTL6XZSJrANm36LesYqktAysz8zTFlTvipqSNww
 JrU27KWoMTWv9/e/3Y7lAb9yvRzf4VyD2Cq5nLpb6JdGmSQQilYC0LlEhB/vBT0V+Ss2
 3Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJ3UAJ1DHn+Rl48i8gSZTrJclFX6By6E0cVlbBCYHwo=;
 b=Rrzm0ImX2MMGYWNLx8oJ0mbF4EcSSb9OLNMIx5mM5cETcxbNobZwyEI9OPlVlK46lk
 c2mZThARFGJf3mFGGhQpRwgUV/abUzB7bhRt5SPiHdNeyZGHSewxWzpRXqGvLWHSCqys
 GxiJn5rZlLc+2ZHk5IenWjr4uFrsji3SZ6xqPn7RTuZtv880VxDDk+YcoFda9SDj1VnN
 JbpSFoAjnUUC0qZsn9BgzzVlj74mOMdqYHVyY21nN5VYsYtmjmaMTyzbUa5TMEeJ3VfQ
 VVvuUr47JwUst7BvKVRemhTt/u/h8L8NcaTuMSQSMrhpqLP6wC4p2qQXntm43lP86/sc
 IeyA==
X-Gm-Message-State: AJIora8+QOuJH+A1ZYEsC5QODvPiHoDTh6byQTiHct1w/AVjeOmcmr0I
 I+K2f0gHcAKxwaS4y2AWxr8vpwYgzTsJy/x9e1rHJw==
X-Google-Smtp-Source: AGRyM1stJ7vkNi6qBAqDn7j1UC636aXXlmqBJv9uyhssEl6I9BYQfId/Xbmm/AvzDQ+slfvkrclKTSJqDWaYw+q+rg0=
X-Received: by 2002:a05:6402:40f:b0:436:a6ba:360d with SMTP id
 q15-20020a056402040f00b00436a6ba360dmr16693670edv.371.1656660524273; Fri, 01
 Jul 2022 00:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220701024108-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 1 Jul 2022 12:58:33 +0530
Message-ID: <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x530.google.com
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

On Fri, Jul 1, 2022 at 12:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 01, 2022 at 06:12:14AM +0200, Thomas Huth wrote:
> > I even wouldn't mind if you put your python stuff in a new directory like
> > tests/pytests/ for example, as long as it downloads your binaries separately
> > - as I wrote in another mail, the avocado framework rather looks like an
> > oddball in our test framework nowadays since it uses a separate test runner
> > and not the meson test harness, so having a new approach for python-based
> > tests is maybe even a good idea. I just really want to avoid that this goes
> > into tests/qtest (since it really does not belong there), and please don't
> > add more external stuff via git submodules, that's really the wrong approach
> > for this.
>
> I get it, people hate submodules with passion.  I think trying another
> approach for testing that is neither avocado nor qtest is
> not too bad. As long as this is not user visible, we can
> allow ourselves space to experiment.
>
> OK so, how about this:
> - put it in a new directory: tests/roms?
> - create repo for a fork of biosbits under git.qemu.org
> - roll our own analog to git submodules: a script
>   that clones the repo

No need to clone the whole repo. We can simply download the binaries
that the girlab CI job would generate from the bits sources in that
repo.
We need to clone if we are always building bits from source for every
test. That is not necessary IMHO since much of the bits package would
remain as is without modification.

> - new target make check-roms,

I think make pytest or some such is better and more generic if other
such tests in other areas follow suit.

if the clone exists locally -
>   run the test, if not - skip it

if download of the bits binaries fail, skip it.

> - as for using pre-generates ISOs as an optimization,
>   I'm not sure how important that is, if yes -
>   we can add another repo and another make target along the
>   same lines
>
>
>
> --
> MST
>

