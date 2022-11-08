Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB5621514
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:08:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPFf-0001iE-8P; Tue, 08 Nov 2022 09:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osPFc-0001hx-EJ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:06:52 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osPFa-00039n-MN
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:06:52 -0500
Received: by mail-il1-x12e.google.com with SMTP id o13so7505094ilc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jLvuZ4paUTE9IskW7iyXlzxfzXGXtE7yCKkaB3BjVt4=;
 b=cvQrQMmvtKV9KK9Q57VbD/AD0n0mpci7oJVJ/NQx6yj3kS8UQ7EGzWsUwLb+r3ZsCx
 KhxbuxR5ByTdULF5aa5HEB7JnbRYTB4GVfXly2v+Uhkl7euVWS6HsB2+BLm0htD0/4LJ
 lvLSpo0tSfwJArkeej8VQ9R1nfzImwkMu7ByVFrBZHJa9kdnVSgZJ1+CcRAx84PunXh/
 wOewKmONj/aTEfCUs261n8arDT7Uuz2tUa9y7oppOH88GDAilXOM1gMHwG0h/C95YM0x
 AQ1UHBCXjX2wQsx7P5sbnrn06rB0bVTJD8qEBJUO4XKJAiz/G9nEpK9qlD08HUChJumM
 qYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jLvuZ4paUTE9IskW7iyXlzxfzXGXtE7yCKkaB3BjVt4=;
 b=L7wq6GNtyYVDmf4RmXyr+MOBbe/coTW5lKBoQ1SCnQIu50HuD+V9HqGnT6uDc808Uh
 lTd9TCzY6u0SBV1IRSQvSiqx1HQnboPCrxpK1N4B+56Jk9TBwmLP2CagTkLaBQqOmaLg
 69YPBhztf3xGrJ0YA994WG2zDp5PjYXrwcKIsHN4o/zTK9UxkQAwgeIw+kwwPe6xsaHZ
 RriP9MkkF9utgYFL3WD+pr+XvPhVbu11ToxhkILESxLCA/ywVWXPKqXubqb74IFk/Vc9
 Zgb5rjApmkL6VErI9SdJMdo8Eo9zLT7ic+lxUxw8xx/mw6a6Fp7dnnSnzWfTZ1u70QOc
 U4ig==
X-Gm-Message-State: ACrzQf2gGsjqbvra7Yx62abYSdHkEkrOyyuBA7Gz+cF+LIbwjUmybmXg
 giBfqIDey7RGbneKbsOTy6C3VgGyUQEASIp5OAtuHQ==
X-Google-Smtp-Source: AMsMyM4L7O0aM+qJAI5jC3D7KS8vpKq6OPaREpyWHJERWJE+5DNPUuhup6K3mh663OUrxordDosUBtbKQaWD6eZaly8=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr31535194ile.202.1667916409272; Tue, 08
 Nov 2022 06:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-46-mst@redhat.com>
 <20221108143641.4bdaae6f@fedora>
 <CAARzgwzJFUQ_+pRCbx0f-dOyckF2aZUnGt9XV7b0=7AQMJ4Jgg@mail.gmail.com>
In-Reply-To: <CAARzgwzJFUQ_+pRCbx0f-dOyckF2aZUnGt9XV7b0=7AQMJ4Jgg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 8 Nov 2022 19:36:38 +0530
Message-ID: <CAARzgwzOCzOSX+Us5fyFEEHGiFLQpO2Z=KCUN+druDzWQ7dD-g@mail.gmail.com>
Subject: Re: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 8, 2022 at 7:09 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 8, 2022 at 7:06 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Mon, 7 Nov 2022 17:51:11 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > From: Igor Mammedov <imammedo@redhat.com>
> > >
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index dfb8523c8b..570b17478e 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,35 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/pc/DSDT",
> > > +"tests/data/acpi/pc/DSDT.acpierst",
> > > +"tests/data/acpi/pc/DSDT.acpihmat",
> > > +"tests/data/acpi/pc/DSDT.bridge",
> > > +"tests/data/acpi/pc/DSDT.cphp",
> > > +"tests/data/acpi/pc/DSDT.dimmpxm",
> > > +"tests/data/acpi/pc/DSDT.hpbridge",
> > > +"tests/data/acpi/pc/DSDT.hpbrroot",
> > > +"tests/data/acpi/pc/DSDT.ipmikcs",
> > > +"tests/data/acpi/pc/DSDT.memhp",
> > > +"tests/data/acpi/pc/DSDT.nohpet",
> > > +"tests/data/acpi/pc/DSDT.numamem",
> > > +"tests/data/acpi/pc/DSDT.roothp",
> > > +"tests/data/acpi/q35/DSDT",
> > > +"tests/data/acpi/q35/DSDT.acpierst",
> > > +"tests/data/acpi/q35/DSDT.acpihmat",
> > > +"tests/data/acpi/q35/DSDT.applesmc",
> > > +"tests/data/acpi/q35/DSDT.bridge",
> > > +"tests/data/acpi/q35/DSDT.cphp",
> > > +"tests/data/acpi/q35/DSDT.cxl",
> > > +"tests/data/acpi/q35/DSDT.dimmpxm",
> > > +"tests/data/acpi/q35/DSDT.ipmibt",
> > > +"tests/data/acpi/q35/DSDT.ipmismbus",
> > > +"tests/data/acpi/q35/DSDT.ivrs",
> > > +"tests/data/acpi/q35/DSDT.memhp",
> > > +"tests/data/acpi/q35/DSDT.mmio64",
> > > +"tests/data/acpi/q35/DSDT.multi-bridge",
> > > +"tests/data/acpi/q35/DSDT.nohpet",
> > > +"tests/data/acpi/q35/DSDT.numamem",
> > > +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> > > +"tests/data/acpi/q35/DSDT.tis.tpm12",
> > > +"tests/data/acpi/q35/DSDT.tis.tpm2",
> > > +"tests/data/acpi/q35/DSDT.viot",
> > > +"tests/data/acpi/q35/DSDT.xapic",
> >
> > still missing DSDT.count2 table, likely in other updates (as well)
> > which should break bisection if not whole pull request.
> >
> > I'll prep a tree based on your pull req, with fixups
> > for you to pull from.
>
> Does this mean there will be a v5 for the PR?
> V4 looks good in the CI so far ...

Never mind. It has merged to QEMU master.

