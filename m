Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CE3C6D00
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:13:03 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ETN-0002od-Oo
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ESQ-00027u-Aq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:12:02 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ESO-0003z0-OM
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:12:02 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v189so25195375ybg.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kKzwMWy9yL0nZ77Oyv2F6FsB1CDJSMT1hUCqe20U9cg=;
 b=o3PyRg4Mz/Rh+uK41BxiMZCqPRKmLFlwZsLkOXhldr89yKD1Z2Px4oadvODz3T7K/5
 6kngcJJfDAHXFalZFgTlcPOIcNJ5lBAAfXscb579TOPk8Nb8K80hrQf9PSQKTLPfO+Gn
 NE+vbVinOOfwSucr81IF29qlElBWJ0PW/xzgw8bpkl61hKiY1VFp5kQ4edZw4ZNWse+c
 B4AVSJ+JD8gG2OUWh9Vd49eX+ez/bcYdgM6Yc13EXM1qUpp+6grP0Nra1D4UMYI701a0
 YWuqxNRbtmqYC6REI1ihmoToVtS2CwAhcj486H5E9quPULzb4DvOe9u3KU9X+YqAIWWa
 86kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kKzwMWy9yL0nZ77Oyv2F6FsB1CDJSMT1hUCqe20U9cg=;
 b=GNFIlwDc3juDavb7OHQlfmHisk7bTRNPZUIQD53Vf5+aMrQA5yjuPv4WAwKG66WzIk
 9PnQI8lkwa+5duc7Ln24E0NnBbJf1PkAwE9W2pWQnIVK3R0RoQowbrMKp7xyEezQbICy
 CWYeX7BxeSdBpKhnJaAWUkRLC/rMz5Vpaa6pTs1zSiuqgLwztHBZB9Djf8x3esJj2Q17
 malpWeubK/0za2VXCcdEVyEtf2w/HBZ59DI7gYP6arKfe9ATz86I1BtE/xQ59Ilw5LW9
 BAE20V8jDvVGr3ugFYSq5NOFJmz5tz5EBDe9MCRf9OfCXMysQd9pfzmtqFTnVSeV3Kra
 2WqQ==
X-Gm-Message-State: AOAM533N28IirJiFYwIDWyR22cJ+w5aU2TsNm4MtdxUYNsesdoZE17UC
 P2r2Gc5q2Q7Oebcv71gW9p9KXov+Vljqye04v+c=
X-Google-Smtp-Source: ABdhPJy/aIYfbgkxh32keCVfSh7XMdwwDzRHvB2hVE3FN2GFHgMWxc/YP8k97B3rZUw3CwMXuS9wizbj3G5er46nzss=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr4516213ybc.122.1626167519833; 
 Tue, 13 Jul 2021 02:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
In-Reply-To: <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Jul 2021 17:11:48 +0800
Message-ID: <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=884:36, Bin Meng =E5=86=99=E9=81=93:
> > On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/7/13 =E4=B8=8A=E5=8D=887:06, Bin Meng =E5=86=99=E9=81=
=93:
> >>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=E9=81=
=93:
> >>>>>> From: Christina Wang <christina.wang@windriver.com>
> >>>>>>
> >>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as =
per
> >>>>>> the manual and real hardware.
> >>>>>>
> >>>>>> While Linux e1000 driver always writes VET register to 0x8100, it =
is
> >>>>>> not always the case for everyone. Drivers relying on the reset val=
ue
> >>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
> >>>>>>
> >>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> >>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> >>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>>>> ---
> >>>>>>
> >>>>>> (no changes since v1)
> >>>>>>
> >>>>>>     hw/net/e1000.c | 2 ++
> >>>>>>     1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >>>>>> index 4f75b44cfc..20cbba6411 100644
> >>>>>> --- a/hw/net/e1000.c
> >>>>>> +++ b/hw/net/e1000.c
> >>>>>> @@ -29,6 +29,7 @@
> >>>>>>     #include "hw/pci/pci.h"
> >>>>>>     #include "hw/qdev-properties.h"
> >>>>>>     #include "migration/vmstate.h"
> >>>>>> +#include "net/eth.h"
> >>>>>>     #include "net/net.h"
> >>>>>>     #include "net/checksum.h"
> >>>>>>     #include "sysemu/sysemu.h"
> >>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> >>>>>>         [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_=
EN |
> >>>>>>                     E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> >>>>>>                     E1000_MANC_RMCP_EN,
> >>>>>> +    [VET]     =3D ETH_P_VLAN,
> >>>>> I wonder if we need a compat flag for this, since we change the beh=
avior.
> >>>>>
> >>>>> (See e1000_properties[])
> >>>>>
> >>>> No we don't need to since it does not break migration.
> >>> Ping?
> >>
> >> I admit migration "works" but it doesn't mean it's not broken. It
> >> changes the guest visible default value of VET register, so it may bre=
ak
> >> things silently for the guest.
> >>
> >> For old machine types, we should stick the value to the one without th=
is
> >> fix.
> > Could you please propose a solution on how to handle such a scenario
> > in a generic way in QEMU? (+Peter)
>
>
> Well, I think I've suggested you to have a look at how things is done in
> for handling such compatibility in e1000_properties.
>
>
> >
> > The POR reset value is wrong in QEMU and has carried forward the wrong
> > value for years, and correcting it to its right value needs to do
> > what?
>
>
> We should stick to the wrong behavior for old machine types.
>
> That's all.

So that means the following SD patch is also wrong (+Philippe) which
changes the default value of capability register.
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.24113-1=
-joannekoong@gmail.com/

Can we get some agreement among maintainers?

Regards,
Bin

