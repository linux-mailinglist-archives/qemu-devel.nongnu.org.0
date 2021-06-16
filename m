Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9B3AA267
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:28:19 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZKs-00035f-Cg
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1ltZJQ-0002ED-Um
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1ltZJM-0002pM-U6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623864403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aE18MiUseUBxeBIU/Y1lihSbXRvEplLR3x8y7WmEDHo=;
 b=gy9AB2DhxdlUoeHf4irsQFrFEgDC3DX1kzspwi40Uy798Y73YTTaCW3K/FgdhL3Zzdj4xN
 QlTtzbEwvz8L7TvM5gU5tKHVa+Mu8qtC9iS6ZzJCTx1L/cuBZu/KwRPFp71vRMIG45GuPf
 h7dwsKj/oecoX8TEY0yplj8rOI0rc+s=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-5fWLSGnzO2mJRztT4McCmQ-1; Wed, 16 Jun 2021 13:26:42 -0400
X-MC-Unique: 5fWLSGnzO2mJRztT4McCmQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 r4-20020a4ab5040000b02902446eb55473so182352ooo.20
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 10:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aE18MiUseUBxeBIU/Y1lihSbXRvEplLR3x8y7WmEDHo=;
 b=cmwAx1nsp7DUbkFs8M61lLyR7Os1RkISYf9n8qgP/xF/KteMNfdXuLJ9e6gIVkfOpe
 Iam8T29gNGuCMvdvQ62y2rdSQKmt+W6Hiff4w18tlummQXhu9SW4UWkp56a3XJHyU+Os
 K1lZ1ldnyULNmbtexSYJKuW/iHLRu7+UH8VJpCJKp9ySl0L015CQMQTcv5FJAy/2TFOU
 8OZgoJ6LcyFgDlMZnAOHNG2+kqCWmBIOQjJ7wF13DQN3pulJK1tnlDVGoPEO6boi30sG
 zEROJ9MFqSwLLPllNkLpXBTc3CG3SA8/w2fY19q3hCUirPU3oPsJU3O9UiN9oV1hH6RB
 4hdA==
X-Gm-Message-State: AOAM5338jpgQRBq4JHyr8w9WmMdLbmRCvfAxGN3GdJ52IQZCt5DpvYOk
 ioxsZ7xYzAkH+Fy0bvOW6VJKFCpzb+jwwp0H69MVQhApy4W1enCtJfQ/ml8/Q1LZg99aCmlX3ec
 589Jlf3eWqFEiF+IxetLfDqmBEvUe+Os=
X-Received: by 2002:a54:4882:: with SMTP id r2mr7950881oic.110.1623864401339; 
 Wed, 16 Jun 2021 10:26:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2SntjNJ841iQDER8wt6/ZEs4VrWrnOFqUXcxijAZiwqGCZ+qCEyNQXIPF+hB1HE/9y9oRt2/3Nm1/0RfKZWw=
X-Received: by 2002:a54:4882:: with SMTP id r2mr7950875oic.110.1623864401135; 
 Wed, 16 Jun 2021 10:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210513062642.3027987-1-jusual@redhat.com>
 <20210523042415-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210523042415-mutt-send-email-mst@kernel.org>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 16 Jun 2021 19:26:30 +0200
Message-ID: <CAMDeoFW2BDH17kjTnU=Pyjyj_JJh22unTVK=nzhN4TQtjd3hOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/7] Use ACPI PCI hot-plug for Q35
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 23, 2021 at 10:26 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, May 13, 2021 at 08:26:35AM +0200, Julia Suvorova wrote:
> > The patch set consists of two parts:
> > patches 1-4: introduce new feature
> >              'acpi-pci-hotplug-with-bridge-support' on Q35
> > patches 5-7: make the feature default along with changes in ACPI tables
> >
> > This way maintainers can decide which way to choose without breaking
> > the patch set.
> >
> > With the feature disabled Q35 falls back to the native hot-plug.
>
> Overall I think this version has addressed my concerns, good job!
> I see Igor has some suggestions on how to structure the code,
> they seem easy to address.
> Question: what makes this an RFC? Any known bugs/missing functionality?
> I don't see anything obvious - what did I miss?

No known issues, just indecisiveness about the default. The next
version will be non-RFC.

Best regards, Julia Suvorova.

> > Pros
> >     * no racy behavior during boot (see 110c477c2ed)
> >     * eject is possible - according to PCIe spec, attention button
> >       press should lead to power off, and then the adapter should be
> >       removed manually. As there is no power down state exists in QEMU,
> >       we cannot distinguish between an eject and a power down
> >       request.
> >     * no delay during deleting - after the actual power off software
> >       must wait at least 1 second before indicating about it. This case
> >       is quite important for users, it even has its own bug:
> >           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> >     * no timer-based behavior - in addition to the previous example,
> >       the attention button has a 5-second waiting period, during which
> >       the operation can be canceled with a second press. While this
> >       looks fine for manual button control, automation will result in
> >       the need to queue or drop events, and the software receiving
> >       events in all sort of unspecified combinations of attention/power
> >       indicator states, which is racy and uppredictable.
> >     * fixes or reduces the likelihood of the bugs:
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1678290
> >
> > Cons:
> >     * no access to possible features presented in slot capabilities
> >       (this is only surprise removal AFAIK)
> >
> > v4:
> >     * regain per-port control over hot-plug
> >     * rebased over acpi-index changes
> >     * set property on machine type to
> >       make pci code more generic [Igor, Michael]
> >
> > v3:
> >     * drop change of _OSC to allow SHPC on hotplugged bridges
> >     * use 'acpi-root-pci-hotplug'
> >     * add migration states [Igor]
> >     * minor style changes
> >
> > v2:
> >     * new ioport range for acpiphp [Gerd]
> >     * drop find_pci_host() [Igor]
> >     * explain magic numbers in _OSC [Igor]
> >     * drop build_q35_pci_hotplug() wrapper [Igor]
> >
> > Julia Suvorova (7):
> >   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
> >   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
> >   hw/acpi/ich9: Enable ACPI PCI hot-plug
> >   hw/pci/pcie: Do not set HPC flag if acpihp is used
> >   bios-tables-test: Allow changes in DSDT ACPI tables
> >   hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
> >   bios-tables-test: Update golden binaries
> >
> >  hw/i386/acpi-build.h              |   5 +++
> >  include/hw/acpi/ich9.h            |   5 +++
> >  include/hw/acpi/pcihp.h           |   3 +-
> >  include/hw/boards.h               |   1 +
> >  hw/acpi/ich9.c                    |  68 ++++++++++++++++++++++++++++++
> >  hw/acpi/pcihp.c                   |  22 +++++++---
> >  hw/acpi/piix4.c                   |   4 +-
> >  hw/core/machine.c                 |  19 +++++++++
> >  hw/i386/acpi-build.c              |  32 ++++++++------
> >  hw/i386/pc.c                      |   4 +-
> >  hw/i386/pc_q35.c                  |   8 ++++
> >  hw/pci/pcie.c                     |  11 ++++-
> >  tests/data/acpi/q35/DSDT          | Bin 7859 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat | Bin 9184 -> 9614 bytes
> >  tests/data/acpi/q35/DSDT.bridge   | Bin 7877 -> 11003 bytes
> >  tests/data/acpi/q35/DSDT.cphp     | Bin 8323 -> 8753 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9513 -> 9943 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7934 -> 8364 bytes
> >  tests/data/acpi/q35/DSDT.memhp    | Bin 9218 -> 9648 bytes
> >  tests/data/acpi/q35/DSDT.mmio64   | Bin 8990 -> 9419 bytes
> >  tests/data/acpi/q35/DSDT.nohpet   | Bin 7717 -> 8147 bytes
> >  tests/data/acpi/q35/DSDT.numamem  | Bin 7865 -> 8295 bytes
> >  tests/data/acpi/q35/DSDT.tis      | Bin 8465 -> 8894 bytes
> >  23 files changed, 161 insertions(+), 21 deletions(-)
> >
> > --
> > 2.30.2
>


