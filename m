Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9C3006FE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:21:09 +0100 (CET)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yFI-0006uV-Nm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l2yDY-0005RP-FS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:19:20 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l2yDV-00048X-Ui
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:19:20 -0500
Received: by mail-lf1-x132.google.com with SMTP id v24so8016683lfr.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cCvXHWQ8zbX1LYxb8zXt7kZesdOhI+NBdMoPdG0rEEo=;
 b=nA0Ab50IDyfJl+Bm/9+FaPQ8Zrby9YULVLTxtgT3gqvuvnEKA4u14IShiI4MMfA8aN
 rHnx2u9oqaWYFRAnxIhBfilE3fO8v5/F3DJg5Kir7sirczgSw4GBeJSnX5dkbBsE9Tgu
 NdVCb99rAfXa2nRmzMk2JQ7Y9yFTB5/sJCR1KuscP0k3KXg9P/3JhsULfL6jyGWhvUst
 xbVqj0ttdz4nuom+2yHOC9zfQwKEaMfo8lRYt+3K8Mp4oQLvI4OmXLm/gZLxBIssVCru
 gEoJgAmt6DvuprQWlZAMX6/srB1fJekDSXPwjdXrmGPs5pF9N4VyrqYFSWexMbyBol3W
 /66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cCvXHWQ8zbX1LYxb8zXt7kZesdOhI+NBdMoPdG0rEEo=;
 b=jN5NLdmh7U/wJs0mRN8U+8A7Tb296Ig+yiuusB/0rGWR1cSakIcAOo/wsY5nv4P0C6
 IxuZwROT/h9/YI4Vi+x2JYWfgnXlbdNReuH4bcHvu7sf2CuN9oLpylA5M16o5f35N8mn
 zDfyywhCHFHoFFJ6TO9uAR1uR+zw/L6bXjAk8MJySLoLaHscNVGevl9w9ghGtc5Fkk86
 Tb/kcTUtzuqBjfsJm+letzCxfaSdWGAvJsOxhwZ9Seaf9tAvlVQOnKMSC/R9k6n3qnlU
 Pdah1p/mwVfURTqzo6D7nrkE40XT3HL5t5LKa7duv01KJgAHVgNi0sg7uGuzXtwN9An0
 aNSw==
X-Gm-Message-State: AOAM530rDd38yt8kM4EXU8uFZ2IswvbaQqyWPOeNMRzWmaQy3srZruGy
 zhlmodQX3WFMqgEDnVESsq4=
X-Google-Smtp-Source: ABdhPJwyAvSjfkuk6hKhBIpblKYK9O9oWOR3ysIhFkNYHfB6utHZ14xVq326a4Bp9cyYiyZUZVO+KA==
X-Received: by 2002:a19:84:: with SMTP id 126mr236728lfa.120.1611328755421;
 Fri, 22 Jan 2021 07:19:15 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id r9sm995747ljj.127.2021.01.22.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:19:14 -0800 (PST)
Date: Fri, 22 Jan 2021 16:19:14 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: rename xlnx-zcu102.canbusN properties
Message-ID: <20210122151914.GE477672@toto>
References: <20210118162537.779542-1-pbonzini@redhat.com>
 <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 01:21:53PM +0000, Peter Maydell wrote:
> Just noticed this wasn't cc'd to the Xilinx folks. Would one
> of you like to review it?

Looks good to me but we need to also update the test cases in
tests/qtest/xlnx-can-test.c.

Cheers,
Edgar




> 
> thanks
> -- PMM
> 
> On Mon, 18 Jan 2021 at 16:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The properties to attach a CANBUS object to the xlnx-zcu102 machine have
> > a period in them.  We want to use periods in properties for compound QAPI types,
> > and besides the "xlnx-zcu102." prefix is both unnecessary and different
> > from any other machine property name.  Remove it.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/arm/xlnx-zcu102.c        |  4 ++--
> >  tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------
> >  2 files changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> > index 4ef0c516bf..c9713638c5 100644
> > --- a/hw/arm/xlnx-zcu102.c
> > +++ b/hw/arm/xlnx-zcu102.c
> > @@ -219,12 +219,12 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
> >      s->secure = false;
> >      /* Default to virt (EL2) being disabled */
> >      s->virt = false;
> > -    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
> > +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
> >                               (Object **)&s->canbus[0],
> >                               object_property_allow_set_link,
> >                               0);
> >
> > -    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
> > +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
> >                               (Object **)&s->canbus[1],
> >                               object_property_allow_set_link,
> >                               0);
> > diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
> > index 3d1120005b..54de71a686 100644
> > --- a/tests/qtest/xlnx-can-test.c
> > +++ b/tests/qtest/xlnx-can-test.c
> > @@ -138,9 +138,9 @@ static void test_can_bus(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 and CAN1. */
> > @@ -175,9 +175,9 @@ static void test_can_loopback(void)
> >      uint32_t status = 0;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 in loopback mode. */
> > @@ -223,9 +223,9 @@ static void test_can_filter(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 and CAN1. */
> > @@ -271,9 +271,9 @@ static void test_can_sleepmode(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0. */
> > @@ -317,9 +317,9 @@ static void test_can_snoopmode(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0. */
> > --
> > 2.26.2

