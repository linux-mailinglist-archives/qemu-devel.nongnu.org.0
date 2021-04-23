Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52E36930B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:27:22 +0200 (CEST)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvq6-0001Jm-24
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvpG-0000dT-23
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:26:30 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvpD-0006nj-0S
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:26:29 -0400
Received: by mail-ej1-x634.google.com with SMTP id w23so58113078ejb.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2nwy/QN6sKCy4M9Ed+nhLavwCqRCRFYCMpykZQWfzc=;
 b=IpKNGZLo17cGyulnSaDB1eHuL6f22bIQ1fxs8i7N9ePZs4TvBinfDXS43H7wfg7bpe
 Z4gQKJBjug/hhxQjIdDrppTaI6MSEo7K0gnXw6NOW9p10GW69WnGMTzlgKIHtR9zVs1H
 C65KApHc9oMJ16M7g7a5Om70VZH1DZ6NNr3eoYL9ktwnqJPN1IMPsxjycEAvv61L5yeU
 u6GtxBBSqnmmI2lGIEtD4L/FsDdV1FswXxvWofE98daE57yL5pCPMm0LAWQN0BcwJT3v
 PCqcQaG/2q0eUnrtT/0FqLlIefbxpaSuZRf8CsmcKlnl6sNDNgfJORI1uKRVSVYt2Kyt
 psPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2nwy/QN6sKCy4M9Ed+nhLavwCqRCRFYCMpykZQWfzc=;
 b=fcKvs/A5aY7Dt2pr6fWuxLyrhQsybIQHnZfsTtUWw2Eye3a6nCyUbydJ1ubtBxWgDG
 XKxz9iO9x+mJjvMNgGcqoopQqH1mK0mRENh3QeD1AUGqVQx8awkebXFrbTciGmiJjcfx
 bTHsTjFLrmgdE336zwMWQAgEmgj/jF9g/3t4+lz5FSGacViATUATfUPJuTfDwP7TEQ2M
 AFHDukgxMjeNloWf7oFg/IVZrLMD8NQr5hgI5Xt0U15T9GIECh7v/yNvPA3kKBgF6M4N
 qRRg3kYQD1ihMgrytSyEAX6iyKIVQ2jVsrnxSjEnYT6cxERrbwcluohb2M0ue9kS2Azg
 9UJA==
X-Gm-Message-State: AOAM530mVoiWbD2pGLseWKSUV0dPKk6/pPzQFliP1UKG9YVhDuvck58X
 TNrFU8e37FEbNZ7X5sGlbSAotfZQ8aLcqiyKIa0/8g==
X-Google-Smtp-Source: ABdhPJzWCuwq6mExGgsK7OL3qqhlADhbJVFs7XsiQTnCxAO0NmXb86L1P9bP3ThHe8QuWq9iOd4tU8xPICwGx+rHR3s=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr4221482ejx.85.1619184384438; 
 Fri, 23 Apr 2021 06:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-3-its@irrelevant.dk>
 <CAFEAcA8xS6Hoqd+Y96FxhrDabsotYURsHHvEeN9yDLDHzzVf+g@mail.gmail.com>
 <YILKsjz+WoXFiKUh@apples.localdomain>
In-Reply-To: <YILKsjz+WoXFiKUh@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:25:29 +0100
Message-ID: <CAFEAcA_OzW7TWk8JrvrzEY-Rapcs1wVjuWKvYGzBgWFHQO+vxg@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 2/2] hw/block/nvme: disable hotplugging for
 subsystem-linked controllers
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 14:25, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Apr 23 14:21, Peter Maydell wrote:
> >On Fri, 23 Apr 2021 at 06:21, Klaus Jensen <its@irrelevant.dk> wrote:
> >>
> >> From: Klaus Jensen <k.jensen@samsung.com>
> >>
> >> If a controller is linked to a subsystem, do not allow it to be
> >> hotplugged since this will mess up the (possibly shared) namespaces.
> >>
> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >> ---
> >>  hw/block/nvme.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> >> index 5fe082ec34c5..7606b58a39b9 100644
> >> --- a/hw/block/nvme.c
> >> +++ b/hw/block/nvme.c
> >> @@ -6140,12 +6140,16 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> >>
> >>  static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
> >>  {
> >> +    DeviceClass *dc;
> >>      int cntlid;
> >>
> >>      if (!n->subsys) {
> >>          return 0;
> >>      }
> >>
> >> +    dc = DEVICE_GET_CLASS(n);
> >> +    dc->hotpluggable = false;
> >> +
> >>      cntlid = nvme_subsys_register_ctrl(n, errp);
> >>      if (cntlid < 0) {
> >>          return -1;
> >
> >I'm not sure this is right -- the DeviceClass is the
> >class struct, which there's only one of for every instance
> >of the device in the system. So this is saying "if this instance
> >is linked to a subsystem, don't let any *future* instances ever
> >be hotpluggable". I'm not even sure if it will do the right
> >thing for the current device, because this function is called
> >from the device's realize method, and the device_set_realized()
> >function does the "forbid if dc->hotpluggable is false" check
> >before calling the realize method.
> >
> >Possibly what you want to do here is to call the
> >device_get_hotplugged() function and just make the realize
> >method fail with a suitable error if the device is both (a) being
> >hotplugged and (b) has a subsystem link; but I'm not an expert on
> >hotplug, so I might be wrong.
> >
>
> Thanks Peter, this sounds exactly like what I want. I'll respin!
>
> I have a "full" fix that actually makes the device hotpluggable in the
> context of subsystems, but it is definitely not an -rc thing.

For 6.0 I don't think we should put this in anyway -- it's not
a regression and in any case it sounds like it needs more work...

-- PMM

