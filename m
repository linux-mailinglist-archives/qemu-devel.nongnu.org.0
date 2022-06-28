Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31B55DE19
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:28:41 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BGi-0000Ix-HX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6BBP-0001oW-Jk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:23:13 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6BBM-00022K-OC
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:23:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id sb34so25677053ejc.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YsQ2+e+2WH4tYwy+p5FEOfS+18k6p2drBcJ2onzS0j0=;
 b=1WWG6ouy9lE3ICcS/JvJ1k1Lm1LEmwB69WI2BHFjaSTVlU+KHzUrMCzGdz3BgDAgs/
 tBhh6qPEzGJKo51SjFNRJFuPZubw6pNS/fZb6wf0f5ZhVNJby1Z6N/FkHUWa0kTjXpYT
 W6RjrwuHALEnMN/ILvwKOpmichZqvs7V3QiY8fUkTuzFunpP+/8PM87eU0JKyRXHsafp
 iBma60NetZ78KawINzKNrGzE8uYewgREWI+WqZ7D4GpQ8KS8GTBajrLcCZVJ9+3jFV2O
 1A199FtBWv6BYf1BQmEljJnGcNGPqtvX4iZkOlEkz40g6D8XIe6pElyrt4ldtVpK+nlT
 wraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YsQ2+e+2WH4tYwy+p5FEOfS+18k6p2drBcJ2onzS0j0=;
 b=2mkAEcI3kGMK25zElAyD/WUDvDwsxvCev0d3kUTHETdxr7meQ2/9V8vToa1pdIf6zA
 rnaGXryH9b9EdomiRcw9Jax4efYanLeqqyZfZLVpnAcVD48+ygHdFMUmwdAy1DeUFp6u
 mb7nQcjMKhSldEPNmPbm7hxEYKI1sNobeqJH7thGhx8S1H1qJArwOIo0BmzzIoXmO6X1
 j8gAC5Y6yFvfsUtYApmrIrLMjXPAeB1RQxJbcy7BKuHuaXYZSjxwFKtPX7O7Muyzpvri
 Z6Cr0/WNjqgjhbv4XmWGb8D2AVOhsdsvlk23hEZrPvC5Jy9G2L1QVMbX4luctjZxb4Io
 NmZQ==
X-Gm-Message-State: AJIora8U63GsF63tSw+aKzwRKBASu6uL04UT6Muu50sB3iA+Zm0Mv61O
 jqFpiHmuVmvLQImZeZGflAOwaQEshiLR4M2nOFsN1Q==
X-Google-Smtp-Source: AGRyM1syhF2BU1Tenk9h2vdfEeeN/6H5/3A2R9UknE2eOf57QZ1WRA8HP2WEKkf8T58FeH5hMUtpq2HQEOBA1oIu97A=
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr17963647ejo.716.1656422586186; Tue, 28
 Jun 2022 06:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
In-Reply-To: <Yrr6VDCuKpp8SqW9@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 18:52:55 +0530
Message-ID: <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x632.google.com
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

On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jun 28, 2022 at 06:06:19PM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 5:40 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >
> > > On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > > > I think the main difference is not even in how it works, it's
> > > > in what it does. Which is check that ACPI tables are sane.
> > > > Who cares about that? Well developers do when they change the
> > > > tables. Users really don't because for users we have the expected
> > > > tables in tree and we check against these.
> > >
> > > It wants to build and run a big guest binary blob -- that to me is
> > > the main difference. Users don't much care about any of our tests,
> >
> > perhaps but we do enforce patch submitters to make sure make check
> > passes before submitting patches. make check-avocado is not run as
> > part of make check, requires considerable disk space to download all
> > guest images and hence generally not run by patch submitters. Making
> > bits parts of avocado tests almost defeats the purpose of having this
> > test at all.
>
> This proposed biosbits test also involves a considerable download.

I do not think 50 MB is "considerable" . Last time I tried to run
avocado tests, my laptop ran out of disk space!

> The test is said to be irrelevant for anyone except those working
> on a fairly narrow set of QEMU firmware related bits.

Well ok that is just a bad argument. You can say the same thing for
most qtests. In fact, that is why most qtetes can run directly simply
by passing QTEST_QEMU_BINARY in the environment. No need to go through
make check. Same with the bits test. It can be run directly.

So by the same
> rationale we shouldn't impose that burden on everyone working on
> QEMU by having it in qtest.

So why burden everyone by having bios-tables-test when it only affects
acpi/smbios developers?

Making it entirely optional, only
> downloaded by avocado on demand, for the people who need to run
> the tests is best.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

