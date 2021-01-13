Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53702F4561
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:40:47 +0100 (CET)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzalp-0002GI-75
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzacS-0003ql-VA
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:31:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzacO-0002xG-D8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:31:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l23so622564pjg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 23:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36m8pz5TZ5Bfe65O1IhCqd0gYUP+B+Tsz+AunDd5Ju4=;
 b=xF7IiyL4ZIuHsi81vo/VLwpDSOi3dpwel9dbOYfR+3pU8k0GoLyaIGy8/LwdF1iatr
 7qQTsRJyr60EdkPHFKgY4V7xx13DWMYZJA3wo7QQP2poDUx2wwZVRibyjKHlQLhcrfHE
 BHX3iYt8dyC6AdPj9PpwKAmZ9Sg4aZMGRr9wD3Er/zy5Zp4r7D7edHagJC7rxxsmDw2Z
 d+ZnLahBOyyKOVx36UNNv6AqAC8bvId8jYWHFOxOqea04S9tWK++Dn53zba3jS3JOtuK
 KhJp6XtwHuimQ+v53APidKdj8AziEH/HZzOUZsosqkFxFThISzDnuYBn9NTbVMDs87cG
 M/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36m8pz5TZ5Bfe65O1IhCqd0gYUP+B+Tsz+AunDd5Ju4=;
 b=fzRLHrmiDlBEzLnyOm+UvSD4mxA0i2UOREIrv7BUpHz3WnXr7AmMIWaPs805lT9oxh
 /rI7kCEhxCzuIbfZ0vwrhdpUnSlbAe/ZLQIWnvcPlRqEILOKL1GjVve1YhkmRiqxDhwL
 +Pg8WfPZXRdAiNf7KK3byXCJmYlqYbf8BaQgb8GDk8PLZ2OG2sp482Vg/q1QQd/NjJpG
 9yQYYCDId7gjAwiIay6rwHruMHtC+mUEqSSC67zXDN1mvgQ/WkdKLZV7HGZEjzu/uWjQ
 Ij2Zf0dX9UbnhV0hLpUroNN0vTVemkqxQ05lVkR8uF3gAQP1rp5NgwgAauWXAWpRxXId
 2aFA==
X-Gm-Message-State: AOAM533T236BVB6DMKE7j5riJHUVMeo9Ywu3j46Wr4NawQ/BsnnRJZkn
 B7mR+xZUM4y/UziKt4D0L9dovp39moolMaHJ235akQ==
X-Google-Smtp-Source: ABdhPJyg5zEVsk2ezTbnKQlXgQHzlWqR5mbl+aILcp7/fEoeF/DDgdjqRmPCOcp6ZX/qk2Gxo6j/SEXaTYPxwohfVko=
X-Received: by 2002:a17:90a:8a8b:: with SMTP id
 x11mr924820pjn.54.1610523058246; 
 Tue, 12 Jan 2021 23:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
In-Reply-To: <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Wed, 13 Jan 2021 10:30:47 +0300
Message-ID: <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jose Marinho <Jose.Marinho@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- the same size for secure and non secure gpio. Arm doc says that
secure memory is also split on 4k pages. So one page here has to be
ok.
- will add dtb.
- I think then less options is better. So I will remove
vmc->secure_gpio flag and keep only vmc flag.

Regards,
Maxim.

On Tue, 12 Jan 2021 at 19:28, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jan 12, 2021 at 11:25:30AM -0500, Andrew Jones wrote:
> > On Tue, Jan 12, 2021 at 04:00:23PM +0000, Peter Maydell wrote:
> > > On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
> > > >
> > > > On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > > > > Add secure pl061 for reset/power down machine from
> > > > > the secure world (Arm Trusted Firmware). Connect it
> > > > > with gpio-pwr driver.
> > >
> > > > > +    /* connect secure pl061 to gpio-pwr */
> > > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
> > > >
> > > > I don't know anything about secure world, but it seems odd that we don't
> > > > need to add anything to the DTB.
> > >
> > > We should be adding something to the DTB, yes. Look at
> > > how create_uart() does this -- you set the 'status' and
> > > 'secure-status' properties to indicate that the device is
> > > secure-world only.
> > >
> > >
> > >
> > > > > +    if (vmc->no_secure_gpio) {
> > > > > +        vms->secure_gpio = false;
> > > > > +    }  else {
> > > > > +        vms->secure_gpio = true;
> > > > > +    }
> > > >
> > > > nit: vms->secure_gpio = !vmc->no_secure_gpio
> > > >
> > > > But do we even need vms->secure_gpio? Why not just do
> > > >
> > > >  if (vms->secure && !vmc->no_secure_gpio) {
> > > >      create_gpio_secure(vms, secure_sysmem);
> > > >  }
> > > >
> > > > in machvirt_init() ?
> > >
> > > We're just following the same pattern as vmc->no_its/vms->its,
> > > aren't we ?
> > >
> >
> > 'its' is a property that can be changed on the command line. Unless
> > we want to be able to manage 'secure-gpio' separately from 'secure',
> > then I think vmc->its plus 'secure' should be sufficient. We don't
>
> I meant to write 'vmc->no_secure_gpio and vms->secure' here.
>
> Thanks,
> drew
>
> > always need both vmc and vms state, see 'no_ged'.
> >
> > Thanks,
> > drew
>

