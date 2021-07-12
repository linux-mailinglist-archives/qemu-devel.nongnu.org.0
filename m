Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA93C66C7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:08:19 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m352A-0000jz-W3
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3514-0008TR-RE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:07:10 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3513-0007z7-5E
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:07:10 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i18so31601502yba.13
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ukwvj6gKt50/2xRHrLHqScVpgyIwFxCRbzLcfknKWbQ=;
 b=PpKE7NCV5Rz/cHElmUq08of8pNE66/JpqOOmriduPhVJX1PopBmdtTazFGtLAwTEzD
 gxrhkrl9LINgCMDz09WgeTktK0QtV/YHJwJWW6iELQicXSzZTmehEM5MYN6ZL8ywKALk
 JsPiIKq78RNdCpbunv5wcEayU3xGsweSwmgZ2LBNbKlkDGPnojmIOY3uSkOk5oi4lc2y
 IBkgKzJsWbYkgeAbt31Y2yfpzwNX5gaKU5055If+32mqxyrQhgvb/axuQvnjfg4TVCdx
 uyI1nuL3Ki23UceHN9ulmf+p3HV6lPHAU2upuEhRxNQoi77AGkktaK8xUdmqWpnpBnhg
 P5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ukwvj6gKt50/2xRHrLHqScVpgyIwFxCRbzLcfknKWbQ=;
 b=Jbhq6gePyURJ75v1X2ZscPH084AJ5iGeoq8lTCsMzZWmEgT24gAfV86QmTXXw0bgex
 ITWqCxAc8LozNSw79B/gtzfrRXrnYyVd3N8/MMOA8Ox/5Dfax1waEVQ6O1XisLlRL0sC
 aaOpY5eZOTZEoq2VYI2mcg8JYEwsz46Xl4sTWcMArZRIXm/qdiQliSaPnrosOXH1fy0P
 uyu/sWCv5x+GN1JoQNz18RVOfajl9ZqosRWBKXnKvFFuxT0XKxpM58APc22SoDXeVTo5
 A1yiwxnQz01TKdhebXj2zGw+qEYvBPo235CenXve1XqUQVNdcwjJibboCKSQQ/EuoyCA
 RHGQ==
X-Gm-Message-State: AOAM533ZarCD689y7xm347UFwbojGsvNf3O79RXGOXg91zTSrRge5doO
 2Vt5lElYtnuay5ZP3Jp6Y5TzOnlR+Mgz3TCNWIPzzt+I
X-Google-Smtp-Source: ABdhPJwzHo/ESrl1VITaFgs1Neb0JB3MTzU0tPWnxAY9IcjvMqAS06grt+C105fwOH7ilQNkc7Z/kFRt5e45KSF6pII=
X-Received: by 2002:a25:df11:: with SMTP id w17mr1773962ybg.314.1626131227915; 
 Mon, 12 Jul 2021 16:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
In-Reply-To: <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Jul 2021 07:06:56 +0800
Message-ID: <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=E9=81=93:
> > > From: Christina Wang <christina.wang@windriver.com>
> > >
> > > The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> > > the manual and real hardware.
> > >
> > > While Linux e1000 driver always writes VET register to 0x8100, it is
> > > not always the case for everyone. Drivers relying on the reset value
> > > of VET won't be able to transmit and receive VLAN frames in QEMU.
> > >
> > > Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> > > Signed-off-by: Christina Wang <christina.wang@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >   hw/net/e1000.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> > > index 4f75b44cfc..20cbba6411 100644
> > > --- a/hw/net/e1000.c
> > > +++ b/hw/net/e1000.c
> > > @@ -29,6 +29,7 @@
> > >   #include "hw/pci/pci.h"
> > >   #include "hw/qdev-properties.h"
> > >   #include "migration/vmstate.h"
> > > +#include "net/eth.h"
> > >   #include "net/net.h"
> > >   #include "net/checksum.h"
> > >   #include "sysemu/sysemu.h"
> > > @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> > >       [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
> > >                   E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> > >                   E1000_MANC_RMCP_EN,
> > > +    [VET]     =3D ETH_P_VLAN,
> >
> >
> > I wonder if we need a compat flag for this, since we change the behavio=
r.
> >
> > (See e1000_properties[])
> >
>
> No we don't need to since it does not break migration.

Ping?

