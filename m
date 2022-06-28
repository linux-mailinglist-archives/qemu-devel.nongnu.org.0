Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A255E512
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:47:00 +0200 (CEST)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BYR-0007nK-M7
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6BWc-0006nQ-Jf
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:45:08 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6BWa-0006Pc-UZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:45:06 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r3so22305745ybr.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q//8vU7DWbwL+guKMFMqZy1ozIePlINu4eWiPceek+Q=;
 b=EesHH9x8eib3rZDcfGWuRvc0JcMriQ6k4BBoDlC6a0T4dle5lWgvrhJ6Fdn9aj7UWx
 0GIUTn2sMvRtVLbpXtRzckvhZTPiZhutIWul0hH9B5IgaIycnOOWO/0on2lLqPe1sOfC
 v4avnp6GxJv7aJGgU6mFiJamZYJGBgwTWb6gCzrWmNGxRKvnxZvcxSfbQ7FsfiZJB8xA
 pXU/2IADpBC7mtXa4YJSZc7TMnQ1pIM736sfNENyIRZ7wG4Ra5yjowCUI7YY88cAsyKg
 J9TXg0IvCQoebUoExQ55N8ASJulN8Pnn8hzqfeg8ZWS6Cljp/Vcbc9E9dGkeL4vZs26x
 FTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q//8vU7DWbwL+guKMFMqZy1ozIePlINu4eWiPceek+Q=;
 b=HLAp9LdHNaFoiu6pXkMvK9i1WSDyUdPg82Zf6fKrB1MJzwRf4Leb3urdQsndiNyqWU
 YrsIRU+xxQV/eEVfccdD6wbifSoMupgepT/lmFS19m2wIHlbRUauEYOayg3TKgRduJj4
 dDycG91kg8AhZ0SYnMXTYZue+zliQVPKwIypzwxqZ+sK10lWGUP17jB/CvRfgolaOSdu
 9/vd7oYVt6Xk7gsB4hNIbx0hfYrptxHyB3dWdblA+PGZgDxmgKpnL9jNDOXAHSNQxF/l
 CVw+ox4WgK2L11h3TCTj3Za2bqy9OgaEUpqhI5fw9u3kpUx+XoC9VC4JOAEUf0NoQYw0
 AOSA==
X-Gm-Message-State: AJIora+BEDBJt/YkSf+xbMOBiw9ulfgUJH85YSPaOYEUW/pm8KcMH0GQ
 G1O7AJ/dk09XPNAYbi/KoPfaAkTS69gOaG3K/MIMIw==
X-Google-Smtp-Source: AGRyM1uI7Ze+ibtA4D8jfUt/Thz3ySo12RaSxRa1YP+s9k6BPHZX1oXITNZBbhfBvQ+2kzAMDz0+Gg6cpW9Vl9xQ68U=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr20284923ybk.479.1656423903335; Tue, 28
 Jun 2022 06:45:03 -0700 (PDT)
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
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
In-Reply-To: <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 14:44:24 +0100
Message-ID: <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Ani Sinha <ani@anisinha.ca>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 28 Jun 2022 at 14:23, Ani Sinha <ani@anisinha.ca> wrote:
> On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > This proposed biosbits test also involves a considerable download.
>
> I do not think 50 MB is "considerable" . Last time I tried to run
> avocado tests, my laptop ran out of disk space!

I think 50MB is pretty big. It might be smaller than some other
avocado tests, but it's not exactly the "no binary involved"
that most qtests are.

> > The test is said to be irrelevant for anyone except those working
> > on a fairly narrow set of QEMU firmware related bits.
>
> Well ok that is just a bad argument. You can say the same thing for
> most qtests. In fact, that is why most qtetes can run directly simply
> by passing QTEST_QEMU_BINARY in the environment. No need to go through
> make check. Same with the bits test. It can be run directly.

'make check' is generally the small, fast, no-binary-blobs tests.
Very few 'make check' tests even run code in the guest.

> So by the same
> > rationale we shouldn't impose that burden on everyone working on
> > QEMU by having it in qtest.
>
> So why burden everyone by having bios-tables-test when it only affects
> acpi/smbios developers?

Because it's small and fast and doesn't have a binary blob to download.

There are definitely some awkwardnesses with 'check-avocado',
but we should work on fixing those, not use them as a reason
to refuse to put tests into the avocado tests if that's where
they fit best.

-- PMM

