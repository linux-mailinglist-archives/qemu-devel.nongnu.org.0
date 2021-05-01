Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947BF37094C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 01:08:18 +0200 (CEST)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyif-0001ZO-55
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 19:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcyh0-00010J-MS; Sat, 01 May 2021 19:06:34 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcygt-0000MI-14; Sat, 01 May 2021 19:06:32 -0400
Received: by mail-yb1-xb33.google.com with SMTP id r8so2710650ybb.9;
 Sat, 01 May 2021 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhyySDE4/0eYlFcVpxsrQQUb0N7zOJ+Y6y6McqTQSYo=;
 b=HDlNKrG94ddW40D5JruZ549n2TksJhaEpspU9ZU124lNw8bOOwOLjmqtFiO2T5Uwsn
 RA8sjcsf5ECnTTaC+IwvvwhuuKtI4TR0l5P8YmpF3SyuCiXqcpyVyVjtu8D7Q15QVqe+
 RBe3qKYZF8Q5pNXEDy94uLf7rN2oVJgGn0ukBwBe+uQdtFzHC3zor+TMSLGUYsRBMzjA
 mjBClTp6DKxK428HxxfM+jlRXWXXRmgIl7EaSDAr+HdoD06jm6jV5ahNt3VxlJuZMIX2
 7kab0PCN0TToQ3Ajb5KBL0YSEbW05EO0dyd6/HRtF4aGw6aFjH4rLvV+cBjT7Lc3HnOA
 pkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhyySDE4/0eYlFcVpxsrQQUb0N7zOJ+Y6y6McqTQSYo=;
 b=PMYtzGkKlM7p3DIEYDeLf7tT2AtLRnemYgv8+YerS9zwJ39EXXH1TBnf9Iwa9zDYO4
 SOs2vwwYx9I246yU0GjSJxWpLnGw8ZgIA3+rp+r52Y6A/pXCC5xQ8yWo0i7S3OEvZgLQ
 5qKsiZmU6tu3juPh+ABYcZPz4NfJzxryTzP6GMtrvechkDnc3m6XqKmjm+4Z9C3Swghd
 IIfE0Y37u5fnUg/z9vyd5BNGfpDoPCeb3FGtWpFQiK9jziONTsqc+g6ZGf5lc8Wpi8u+
 H+agj8q9K9EaoLblQNX9gGZX559gdj3qa0rN7TfZkJ0CCpBQhTp55kg0nlfJm214n5yo
 Dbww==
X-Gm-Message-State: AOAM5333ybISoYydIVhrb+6Lanemo/NTUw9SLqNZlVYdJq2eJsVzccKX
 3k+51h+1Sd1clnDcrH09vkJ9DawtS7mb2AgP304=
X-Google-Smtp-Source: ABdhPJzmjq4aFBNvp+6JbTQ+k4rcLTgu/A5u23UAmcbyDMkPvhfsPovzH8RrNMec4l5Q45Zf07L9vEazhyZ0KP53WLQ=
X-Received: by 2002:a25:56:: with SMTP id 83mr17557021yba.387.1619910385317;
 Sat, 01 May 2021 16:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
In-Reply-To: <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 May 2021 07:06:15 +0800
Message-ID: <CAEUhbmUwa+7cANCpT8vD=Dbow6ZCFTYto+fd8Gyrghsd-wgbSg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 2, 2021 at 4:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/30/21 9:28 PM, Bin Meng wrote:
> > On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> At present, when booting U-Boot on QEMU sabrelite, we see:
> >>>
> >>>   Net:   Board Net Initialization Failed
> >>>   No ethernet found.
> >>>
> >>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> >>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> >>> board, the Ethernet PHY is at address 6. Adjust this by updating the
> >>> "fec-phy-num" property of the fsl_imx6 SoC object.
> >>>
> >>> With this change, U-Boot sees the PHY but complains MAC address:
> >>>
> >>>   Net:   using phy at 6
> >>>   FEC [PRIME]
> >>>   Error: FEC address not set.
> >>>
> >>> This is due to U-Boot tries to read the MAC address from the fuse,
> >>> which QEMU does not have any valid content filled in. However this
> >>> does not prevent the Ethernet from working in QEMU. We just need to
> >>> set up the MAC address later in the U-Boot command shell, by:
> >>>
> >>>   => setenv ethaddr 00:11:22:33:44:55
> >>>
> >>
> >> With this patch in place, the standard Ethernet interface no longer works when
> >> booting sabrelite Linux images directly (without u-boot) using the following
> >> qemu command.
> >>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
> >>         ...
> >>
> >> The Ethernet interface still instantiates, but packet transfer to the host
> >> no longer works. Reverting this patch fixes the problem for me.
> >>
> >> Is there a qemu command line parameter that is now necessary to instantiate
> >> the Ethernet interface when booting Linux ?
> >
> > Enabling "guest_errors" shows that Linux kernel fec driver is trying
> > to read PHY at address 0, which is not what we want.
> >
> > [imx.fec.phy]imx_phy_read: Bad phy num 0
> >
> > The device tree blob of the sabrelite does not contain a node for the
> > ethernet phy specifying phy address, so I suspect Linux kernel driver
> > is using default phy address 0 instead.
> >
> > Could you please test on a real hardware to see what happens?
> >
>
> The problem is that qemu returns 0 when the OS tries to read from a
> non-existing PHY. Linux expects it to return 0xffff, and believes that
> a PHY is there if 0 is returned. This helps:

Good catch! Please send a patch for this.

>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index f03450c028..3c90c38e26 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -285,7 +285,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      if (phy != s->phy_num) {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>                        TYPE_IMX_FEC, __func__, phy);
> -        return 0;
> +        return 0xffff;
>      }
>
> Note that this is not really a guest error; any OS can and likely
> will scan the MII bus for connected phy chips.

Agree.

Regards,
Bin

