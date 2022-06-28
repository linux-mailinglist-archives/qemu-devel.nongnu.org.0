Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC155C103
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:38:23 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AU2-0000vl-Vt
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6ASH-0007m1-9y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:36:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6ASF-0000XA-L3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:36:33 -0400
Received: by mail-ej1-x634.google.com with SMTP id ge10so25464938ejb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgsExy1wTuBVZsgAaO9KrvAT1DLw1rXU5+lVNpyXoF4=;
 b=kMJqFphQJ3kSZ3uWQERhRq03xCquoQpHcZTJFE20hoolOu4w7tWaj1Jqg5pmuj1tBL
 sTDcLZmM7XJIt17WRItHoUVbkf8mxghIklnCTvSVheoVsdAWCvjDEqJ/LaAQcsXlVvBj
 ivi4GlKJfJMuAAmTSLM0xoQqtW8bhVSQeY6HYaKjY32MSkOnLMOrBCgdoyTT9UErMJb0
 4iRfIA0Vk29BB5Z5rNcQtr82KNMhUhfEGcHM9xAQnqgc85n4NBP0p/R9J1GFN7VdhJs5
 BDDfzYHfljD546IsqyYUf/WxdLk1YsCcFywljnHU0/iaUnHcc220CjOJvEg7LM6v1fLh
 nf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgsExy1wTuBVZsgAaO9KrvAT1DLw1rXU5+lVNpyXoF4=;
 b=22v2eFNkqoot3YQqZhy+bO4JeyQwQBtE2guJ8F0A/Q3jfoF2H6O9ZHf/jpq4A3CGKu
 tZ564omUYCDol1d/dNZ0ne4cEwIeaZ23rwfyYRc1MV/ITlULqLRqM1kNBUYzvbQ4lTwL
 l7s+plF4FhTliIWc4wFDvwBGIZnhbKLOib62CSxAQAib31P9jIm2TsuJaR98LJVGdRGB
 HFqz28Ryz7FtUdBqxKkulG/XnDPoBCGd2GNhofUNAFHj5dF3IkOACIqbEUZPe7/V8w8Q
 CMhFcAtENQ8w+5gIWOs/PEHuCluCScwjIEjuNujyiKw6cAGL+dhYcmyy0GeIubm/57X9
 dSFA==
X-Gm-Message-State: AJIora/HxGeL95k9O1rcflTyDGCqfjgl2BgJXpey0L/oPdtmam/eHRYJ
 Zexp41VFcgdDN4heQ08pMyZV59EbhdZzVJiydVZijw==
X-Google-Smtp-Source: AGRyM1udTcLMCZj+9OUorX9V7vLI04Uip9BCM2ESW0l25ctBde+1aNaQ6J8Ysiz3SVDcFOlfuH4rKH4bjRGJl5kTn8w=
X-Received: by 2002:a17:907:608b:b0:722:fb4c:5675 with SMTP id
 ht11-20020a170907608b00b00722fb4c5675mr18267866ejc.273.1656419790162; Tue, 28
 Jun 2022 05:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
In-Reply-To: <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 18:06:19 +0530
Message-ID: <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x634.google.com
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

On Tue, Jun 28, 2022 at 5:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wrote:
> > I think the main difference is not even in how it works, it's
> > in what it does. Which is check that ACPI tables are sane.
> > Who cares about that? Well developers do when they change the
> > tables. Users really don't because for users we have the expected
> > tables in tree and we check against these.
>
> It wants to build and run a big guest binary blob -- that to me is
> the main difference. Users don't much care about any of our tests,

perhaps but we do enforce patch submitters to make sure make check
passes before submitting patches. make check-avocado is not run as
part of make check, requires considerable disk space to download all
guest images and hence generally not run by patch submitters. Making
bits parts of avocado tests almost defeats the purpose of having this
test at all.

> whether they're under 'make check' or 'make check-avocado' or the
> iotests framework. The reason to pick one framework or another
> is mostly I think whether the properties of the test are such
> that one framework works better. Avocado is (for better or worse)
> the one we have for dealing with "actually run a guest machine
> with a big lump of guest code in it".
>
> -- PMM

