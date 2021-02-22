Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34430320FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 05:19:17 +0100 (CET)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE2gl-000358-Qh
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 23:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE2fq-0002YP-Hk
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 23:18:18 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE2fn-000111-Fw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 23:18:18 -0500
Received: by mail-il1-x130.google.com with SMTP id e7so9665584ile.7
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 20:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PalK0wdWgYPLF3gz0Qkedt33h46hfDnQhI162BuZA8M=;
 b=azFVUK0u+6I3ypRDVFfAZjcCppebzaICtw55njJGpmdENqiF8NFXULPbavy3lDy0yO
 IFGbJMmdbmDCX1vufIUIaikE1Md551s/pcMMahLSPfoLey5RG/PC0V7Za1Med2l18SE7
 PNS4BO+JvCbdoM484BgOAHxfTYD6bOPxLDSM2qxZYGBaSY79WC0hPtzyig0PFXB+1JFb
 kZtp8syeCghJ2iPgXV1Pbj65TRruzYG4st3NgJB2EX+Zcb4qPAXhhufpDXm8satxlAgm
 aY7hkRe4bfvNeWuXAJvpf6tEtgLVzqTz6MI4wYlEoZO8fcC8WXZ7oqX2cCAnA8KCqTV+
 CjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PalK0wdWgYPLF3gz0Qkedt33h46hfDnQhI162BuZA8M=;
 b=A8n3YAY7AA1Q3/PgyHogtTfaLsMo+w/ZT2jjP9DqRvVLj3a4nzNSBtS4WekPa/dA83
 I3aq+H2PkwkFbndHdEU4dV2qv3oqzeY0VF07+9ciU9yFViVPqY58biG644DSXcMlG1Rq
 te81DELzSCG2gef7oCr0fvB4yGZ02SAJ9mslq9XhbzGpww/hDjp9XcZHpqE5lrOC+Hb7
 E5zlvsL0yb6XoxCyiRdekJwZnbjZPFVboNClITGmBRE2XmoM0uw5FLuNYX+/a12BsLQm
 wZprYDPnGXpLC5N0QGq/ZZ8ej0cHtV8Zqs65YzAoAtKyScmZh3Ww+PrqYIcHoG1hDFhY
 1Rgg==
X-Gm-Message-State: AOAM533+w30scKBOGBkAK7URzKMfg4Awre04JLI4m+l0dz1aKTWfac+Z
 DqgBH9Y8fpQPcFK1Zd2eWYfOvHwtOxe5+l7c0TNx
X-Google-Smtp-Source: ABdhPJw+4LMaKP6Nf148zQBMwd9Wmsoz+FN8UkEv13ZBqx10EVBnqzJxQvZrIYmTRtOWqWZHMva2WDapQcd0CcUOawY=
X-Received: by 2002:a92:ad09:: with SMTP id w9mr13266827ilh.23.1613967493415; 
 Sun, 21 Feb 2021 20:18:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
In-Reply-To: <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Mon, 22 Feb 2021 12:18:00 +0800
Message-ID: <CAJc+Z1ENDPcBf0ezxSpCaOV2WOVs4E1b3OSnwEapCLuDUdaWzw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 19:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Adding the migration maintainers to the cc list, because
> the real meat of this patchset is "how should the migration
> of MTE tags be integrated into the migration/ram.c code",
> which is pretty well out of my area of expertise...
>
> thanks
> -- PMM
>

Hi Peter,

Thanks for cc-ing to the related maintainers!

Regards,
Haibo

> On Mon, 8 Feb 2021 at 03:20, Haibo Xu <haibo.xu@linaro.org> wrote:
> >
> > This series add support for MTE(Memory Tagging Extension)[1]
> > in KVM guest. It's based on Steven Price's kernel KVM patches
> > V7[2], and has been tested to ensure that test case[3] can be
> > passed in a KVM guest. Basic pre-copy migration test also passed
> > between two MTE enabled kvm guest.
> >
> > This is a RFC patch series becuase:
> > (1) Need to add some arm MTE specific codes to the ram migration
> >     loop. There may be better way to do that in a more abstract way.
> > (2) Only pre-copy migration is supported and tested currently,
> >     post-copy as well as compress/zero page migration are still WIP.
> >
> > All kinds of feedbacks are very welcomed, especially for the migration
> > support.
> >
> > Note:
> > (1) To support MTE migration, tags for one page are appended to
> >     the page data during ram save iteration which make it easier
> >     to sync the page data and tags.
> >
> > [1] https://community.arm.com/developer/ip-products/processors/b/
> >     processors-ip-blog/posts/enhancing-memory-safety
> > [2] https://lwn.net/Articles/842827/
> > [3] https://elixir.bootlin.com/linux/latest/source/Documentation/
> >     arm64/memory-tagging-extension.rst
> >
> > Haibo Xu (5):
> >   Update Linux headers with new MTE support
> >   Add basic MTE support to KVM guest
> >   Add APIs to get/set MTE tags
> >   Add migration support for KVM guest with MTE
> >   Enable the MTE support for KVM guest
> >
> >  hw/arm/virt.c             | 44 +++++++++++++-------
> >  include/hw/arm/virt.h     |  2 +
> >  include/migration/misc.h  |  1 +
> >  linux-headers/linux/kvm.h | 15 +++++++
> >  migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
> >  target/arm/cpu.c          |  2 +-
> >  target/arm/kvm.c          |  9 ++++
> >  target/arm/kvm64.c        | 31 ++++++++++++++
> >  target/arm/kvm_arm.h      |  2 +
> >  9 files changed, 176 insertions(+), 16 deletions(-)

