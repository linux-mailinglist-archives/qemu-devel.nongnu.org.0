Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFC62129F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOpq-0003sp-0o; Tue, 08 Nov 2022 08:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osOpd-0003sT-IN
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:40:02 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osOpa-0003A0-1y
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:40:00 -0500
Received: by mail-io1-xd36.google.com with SMTP id r81so11450633iod.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ULmF6VEXqwYto1otilklnHplX9gsvF7zqxhVT4wvbWU=;
 b=0sqVidzK+1/+zEdInEW4RxHvXn80nkXU1cpVUr1ns/MNYcTFjYFPi+a06HNLiqKC4Q
 O2Rv/ipdq+KH6Qa8nGl3ZJI3OSjYZw27GwN5F0QtikTzv8jBZOfTPkjoBSGKAFY53KQH
 UktEHdmoj+p+bCWDmgbszzLBWD2Nzy1GlD5z0ju1s0gSR1hspZIddRU3uuH4mH2mHK2c
 d3q+syPY828rofTcaB2AH/jiLcbrQjH4wGDTDA3jSltJeZ2BUZtkkk575i7W+ZQQsPt3
 Zflcu9U55PyXxbxQ7wGNJWGNWZVoicDw/j7j7s5/vQ8vQNsX56spE3Kfnzxouo5e0Zlx
 aQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULmF6VEXqwYto1otilklnHplX9gsvF7zqxhVT4wvbWU=;
 b=0pUk6WggsAzCj9uERjAv6uNxxmjp1uj+cu5IgUMNTNJqSkmzN90mJhtvY/BtyePYUC
 2oyPHb1CfKU6W5f+iLeFdenyVpW7ae+IW5XcAYN+qNaVHp5uCGDPoM7K0axtSYz1Kfd6
 1Zr9bvKtAJBWyJSzINwRck576QOObf9/QGvRgPa3wIhQhKzwkAXu7x7zlPY2EJ6v6Gi8
 ZgbSZ8tzk/z6BmuSfYJW3ViBDbaJcn4QoZvfn01vjh9pXcDIt4xWzbeafAENKlegfUBD
 oCacv/74sZ2uvlTVUOHxHsyF3zgMwwPrZf1Dm4p9lykn2NigDAA7cs66BmjpRhu2qu7L
 dqZw==
X-Gm-Message-State: ACrzQf3FAZGQy8nVS3B3WHWya2THdDCMTm2TV4WlY2wRTxZIWdtU8KWg
 M54jMteMMrmTdARkTmDXflF3tmJaOOdraA3LAV8dkg==
X-Google-Smtp-Source: AMsMyM7Gn5mhvqT7VBQilVB7PpTljTkgIl+s0QXValBZ98Jz/Z8O+PRq+4Ex93OKzYusdZWEI8VPhabgVugF4OQhu5w=
X-Received: by 2002:a05:6638:12cf:b0:375:2799:7bf6 with SMTP id
 v15-20020a05663812cf00b0037527997bf6mr33911334jas.309.1667914795696; Tue, 08
 Nov 2022 05:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-46-mst@redhat.com>
 <20221108143641.4bdaae6f@fedora>
In-Reply-To: <20221108143641.4bdaae6f@fedora>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 8 Nov 2022 19:09:44 +0530
Message-ID: <CAARzgwzJFUQ_+pRCbx0f-dOyckF2aZUnGt9XV7b0=7AQMJ4Jgg@mail.gmail.com>
Subject: Re: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd36.google.com
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

On Tue, Nov 8, 2022 at 7:06 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 7 Nov 2022 17:51:11 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > From: Igor Mammedov <imammedo@redhat.com>
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..570b17478e 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,35 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/pc/DSDT",
> > +"tests/data/acpi/pc/DSDT.acpierst",
> > +"tests/data/acpi/pc/DSDT.acpihmat",
> > +"tests/data/acpi/pc/DSDT.bridge",
> > +"tests/data/acpi/pc/DSDT.cphp",
> > +"tests/data/acpi/pc/DSDT.dimmpxm",
> > +"tests/data/acpi/pc/DSDT.hpbridge",
> > +"tests/data/acpi/pc/DSDT.hpbrroot",
> > +"tests/data/acpi/pc/DSDT.ipmikcs",
> > +"tests/data/acpi/pc/DSDT.memhp",
> > +"tests/data/acpi/pc/DSDT.nohpet",
> > +"tests/data/acpi/pc/DSDT.numamem",
> > +"tests/data/acpi/pc/DSDT.roothp",
> > +"tests/data/acpi/q35/DSDT",
> > +"tests/data/acpi/q35/DSDT.acpierst",
> > +"tests/data/acpi/q35/DSDT.acpihmat",
> > +"tests/data/acpi/q35/DSDT.applesmc",
> > +"tests/data/acpi/q35/DSDT.bridge",
> > +"tests/data/acpi/q35/DSDT.cphp",
> > +"tests/data/acpi/q35/DSDT.cxl",
> > +"tests/data/acpi/q35/DSDT.dimmpxm",
> > +"tests/data/acpi/q35/DSDT.ipmibt",
> > +"tests/data/acpi/q35/DSDT.ipmismbus",
> > +"tests/data/acpi/q35/DSDT.ivrs",
> > +"tests/data/acpi/q35/DSDT.memhp",
> > +"tests/data/acpi/q35/DSDT.mmio64",
> > +"tests/data/acpi/q35/DSDT.multi-bridge",
> > +"tests/data/acpi/q35/DSDT.nohpet",
> > +"tests/data/acpi/q35/DSDT.numamem",
> > +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> > +"tests/data/acpi/q35/DSDT.tis.tpm12",
> > +"tests/data/acpi/q35/DSDT.tis.tpm2",
> > +"tests/data/acpi/q35/DSDT.viot",
> > +"tests/data/acpi/q35/DSDT.xapic",
>
> still missing DSDT.count2 table, likely in other updates (as well)
> which should break bisection if not whole pull request.
>
> I'll prep a tree based on your pull req, with fixups
> for you to pull from.

Does this mean there will be a v5 for the PR?
V4 looks good in the CI so far ...

