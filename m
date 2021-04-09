Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660C35A85F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 23:34:22 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUylg-0001h0-QO
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 17:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUykT-0001GX-2I
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 17:33:05 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUykR-0002YT-0J
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 17:33:04 -0400
Received: by mail-qk1-x734.google.com with SMTP id x11so7320957qkp.11
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 14:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AkjmbTYq/zvdvnCb6+EcGyaWr565Va77v52NXEz9mrc=;
 b=sKBKjakOtvUek9ghLdlAnhPilYZLsZ/axHWUTqDOoZmU6ckaIwogM9hyH4DoKJgETi
 jxMSj7zk3rhu17MIpN6nJHcUhkJqvNOdJZwczBBnS++utDc0zqT22QI7UhVkMNuAJuCm
 W7JEfeDN9mBM9bcVP1/WGFv/FPhQtbCH5GGLicM5WtcBquQEdfMaUSPDQ3F1zf04Qjb8
 YvoPegeO3ApXvu1QSlWZDN4v8GroKX/yd1TCduZ3DfUohaOTL0csJvMyFbMBSz8fNc/u
 bMSCNkMvhRTEozAyPdTQ3SbPBz+A7KfJqcCF9F+qtJqv1UFrlOABu3K63Pk7+DS9LwlE
 1q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AkjmbTYq/zvdvnCb6+EcGyaWr565Va77v52NXEz9mrc=;
 b=jCSh65roZx2GQg2V/WQxHqHzzxDcnNIsZBCDC6Uk+51Sk4O1Mi1cAHEJiQ9m7EmYYA
 IygHnk6WvmSMKBgrBlOLZXpfefn8Lphw2hbhUcSy+qF+DXBf4DCFO8NEFdiIYjc/QtnA
 /GDMafRtZczHhWO/9p9qEbmHfCSX4OqE8NCWUviMigXE0I9iIGwq49zu51SlYt6PgUrC
 p+lVdd5rCSj0Y7TRnRfgOLixfpJ78sOUzcFS8u7mui/qbdDvrjYTTWraesOTks9c1qY4
 fz3jLqLZhJgfU0S9oKx4YPQ6prfJWJwKGiQ+mpYKcwbqgmWpWGk9lHYZIujLm78JmYib
 RXBQ==
X-Gm-Message-State: AOAM533z1N3bp06dIn2ytpHt6pWDmhBURu6gxsKn4TNXpF8Oa2a05XPJ
 4UJ2TEVldux5FYnHhwKYUmE3AuF1LtAuCYkeWX9wBw==
X-Google-Smtp-Source: ABdhPJwsftHk05Tb0bNX2AiPWjVBIZVpoo+U6Glna5LGuIzsCvCrKffJQkE8NvrHCaPbDLlubTlJh/LtD2dsStlawBo=
X-Received: by 2002:a37:b801:: with SMTP id i1mr15935728qkf.133.1618003981637; 
 Fri, 09 Apr 2021 14:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
 <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
 <CAO=notxOYxSyVDA9J-uOBio7d0PByvGLgn40GHbU-yQRpic1Jw@mail.gmail.com>
 <4c44381d-99ac-f1c9-60a9-0f3132422473@amsat.org>
In-Reply-To: <4c44381d-99ac-f1c9-60a9-0f3132422473@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 14:32:50 -0700
Message-ID: <CAO=notwo5U4xRHDYKyH5e83qA0jaqEWKCPBsZUUeVbW19YjKdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=venture@google.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 2:20 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> +Paolo/Thomas
>
> On 4/9/21 7:21 PM, Patrick Venture wrote:
> > On Fri, Apr 9, 2021 at 9:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> Hi Patrick,
> >>
> >> On 4/9/21 6:25 PM, Patrick Venture wrote:
> >>> The pca954x is an i2c mux, and this adds support for two variants of
> >>> this device: the pca9546 and pca9548.
> >>>
> >>> This device is very common on BMCs to route a different channel to ea=
ch
> >>> PCIe i2c bus downstream from the BMC.
> >>>
> >>> Signed-off-by: Patrick Venture <venture@google.com>
> >>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> >>> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> >>> ---
> >>>  MAINTAINERS                      |   6 +
> >>>  hw/i2c/Kconfig                   |   4 +
> >>>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++=
++
> >>>  hw/i2c/meson.build               |   1 +
> >>>  hw/i2c/trace-events              |   5 +
> >>>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >>>  6 files changed, 325 insertions(+)
> >>>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >>>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >>
> >>> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> >>> index 09642a6dcb..8d120a25d5 100644
> >>> --- a/hw/i2c/Kconfig
> >>> +++ b/hw/i2c/Kconfig
> >>> @@ -28,3 +28,7 @@ config IMX_I2C
> >>>  config MPC_I2C
> >>>      bool
> >>>      select I2C
> >>> +
> >>> +config PCA954X
> >>> +    bool
> >>> +    select I2C
> >>
> >> Do you have a circular dependency when also using:
> >>
> >>        depends on I2C
> >>
> >> ?
> >
> > I'm somewhat new to qemu -- I don't know what you mean, since I2C
> > doesn't depend on pca954x, I don't imagine there could be a circular
> > dependency.
>
> See
> https://qemu-project.gitlab.io/qemu/devel/kconfig.html#guidelines-for-wri=
ting-kconfig-files
>
> PCA954X is plugged on an I2C bus
> -> depends on I2C
>
> PCA954X provides I2C buses
> -> select I2C

So from the guide it looks like my KConfig should have _depends_ on
I2C.  My board that I'm testing with selects PCA954X and doesn't
explicitly select I2C.  My device _does_ provide I2C buses, as you
say.

>
> Your device is a particular case consuming and providing the Kconfig
> 'I2C' symbol. I expect a circular dependency problem. Easy to test with
> your series but I haven't.
>
> I suppose in this case, the "select" takes over on "depends on" so this
> is OK.

I have to imagine there is a similar situation for PCIe bridges, as
they depend on PCI but also provide it.

>
> Now (unrelated to your series) thinking at the graphical Kconfig tree
> representation (like this one generated 2 years ago:
> https://drive.google.com/open?id=3D1kvwl7guuAmCh2Y2UqeXynlA2HmjWcRs9),
> I'd rather see a circular dep.
>
> Regards,
>
> Phil.

