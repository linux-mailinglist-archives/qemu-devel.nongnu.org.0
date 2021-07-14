Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAD3C7D12
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:43:58 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VoT-0005V6-5F
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Vn3-0004iV-CE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:42:29 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Vn1-0006oX-3u
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:42:29 -0400
Received: by mail-yb1-xb35.google.com with SMTP id y38so933704ybi.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hMuHXz7IVIOVRpt7ovcBAl+yqYdfciEMKCrsGAeT0GI=;
 b=NC++M0tDnMocM8Z//05OibY5X5ibSSQ2iEQVNk3y5+ShdzMGTE9ZQRewoDar9oLAAU
 snJpo8ngOvs08L7Xq51mmPGgj23ARnhD+Qcu0FOHiYHA5TRwCGZpuf1+3bd/OonRYVhM
 qRWzDDcuxWg/I1Ev+gDLjnWyvWllxYQgMioComUPIO3WlDSx1y79oNTPf3vT+ucQoXlR
 Au/sSmuWrzGjgoBp6GdwiFtPlgNr5QRbEeU007ZRL1J/u9vUdO/DxIn7HJavAF8QRPtL
 ot/r6oBh6ZNkiEcbEaqz07fDPzgb7VXvBWmq7ub3KKq5j5YvP1hSNqxVu0+S7wWBihly
 ejyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hMuHXz7IVIOVRpt7ovcBAl+yqYdfciEMKCrsGAeT0GI=;
 b=BdTzCIl29M3q9hU1SygUFvIiwVNKE1VUbGtJvVS3Ubs0UiIkbn7mc/TTneH94FwxaI
 DsxiutwKhR+Mv2SpbFCa0nhY9pkRs1VqzUFlN8zP/7ODuwEU++zAYKGEGFDm59uBgVxw
 MMivha4SBXUOIzSDMa8wONbXZaDrFWrqzfZiHikCnjdmabFwd+qzIoAkKOiXrCQY0NuP
 fBUVA2j2EFkVCcrE3AKQX0fEfLvVT+D8DgW+fOsL4olG7I6MktmMcMxignXLy+D6E7VF
 +rdiRtghFJW27tbRPfLD6AdKbZmOtap7tEfinV2fb6GMAVk0oF0IB0q6NaLmZWogFI6o
 nwWQ==
X-Gm-Message-State: AOAM531axTjyQY3qXxwkKcd3XjDGRQBQ70XJfUWCCPm9PFSUJoyNjMUI
 SzaNeC4VZqPUFCI9RMGBiLkn8azHwav/hf1Tj0Y=
X-Google-Smtp-Source: ABdhPJwQ+DAUoJB0V8jSwVSjguHJ5dR4+crSAPct3V2Pf4x7TJkJWPN9sJs5zxgLzBiO40h5ZcmhJSpjXcSb6xaabkA=
X-Received: by 2002:a25:dcd:: with SMTP id 196mr10600128ybn.306.1626234146009; 
 Tue, 13 Jul 2021 20:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
 <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
 <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
In-Reply-To: <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 11:42:14 +0800
Message-ID: <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christina Wang <christina.wang@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=885:11, Bin Meng =E5=86=99=E9=81=93:
> > On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=884:36, Bin Meng =E5=86=99=E9=81=
=93:
> >>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> =E5=9C=A8 2021/7/13 =E4=B8=8A=E5=8D=887:06, Bin Meng =E5=86=99=E9=81=
=93:
> >>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> w=
rote:
> >>>>>>> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=E9=
=81=93:
> >>>>>>>> From: Christina Wang <christina.wang@windriver.com>
> >>>>>>>>
> >>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, a=
s per
> >>>>>>>> the manual and real hardware.
> >>>>>>>>
> >>>>>>>> While Linux e1000 driver always writes VET register to 0x8100, i=
t is
> >>>>>>>> not always the case for everyone. Drivers relying on the reset v=
alue
> >>>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU=
.
> >>>>>>>>
> >>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> >>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> >>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>>>>>> ---
> >>>>>>>>
> >>>>>>>> (no changes since v1)
> >>>>>>>>
> >>>>>>>>      hw/net/e1000.c | 2 ++
> >>>>>>>>      1 file changed, 2 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >>>>>>>> index 4f75b44cfc..20cbba6411 100644
> >>>>>>>> --- a/hw/net/e1000.c
> >>>>>>>> +++ b/hw/net/e1000.c
> >>>>>>>> @@ -29,6 +29,7 @@
> >>>>>>>>      #include "hw/pci/pci.h"
> >>>>>>>>      #include "hw/qdev-properties.h"
> >>>>>>>>      #include "migration/vmstate.h"
> >>>>>>>> +#include "net/eth.h"
> >>>>>>>>      #include "net/net.h"
> >>>>>>>>      #include "net/checksum.h"
> >>>>>>>>      #include "sysemu/sysemu.h"
> >>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> >>>>>>>>          [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_T=
CO_EN |
> >>>>>>>>                      E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> >>>>>>>>                      E1000_MANC_RMCP_EN,
> >>>>>>>> +    [VET]     =3D ETH_P_VLAN,
> >>>>>>> I wonder if we need a compat flag for this, since we change the b=
ehavior.
> >>>>>>>
> >>>>>>> (See e1000_properties[])
> >>>>>>>
> >>>>>> No we don't need to since it does not break migration.
> >>>>> Ping?
> >>>> I admit migration "works" but it doesn't mean it's not broken. It
> >>>> changes the guest visible default value of VET register, so it may b=
reak
> >>>> things silently for the guest.
> >>>>
> >>>> For old machine types, we should stick the value to the one without =
this
> >>>> fix.
> >>> Could you please propose a solution on how to handle such a scenario
> >>> in a generic way in QEMU? (+Peter)
> >>
> >> Well, I think I've suggested you to have a look at how things is done =
in
> >> for handling such compatibility in e1000_properties.
> >>
> >>
> >>> The POR reset value is wrong in QEMU and has carried forward the wron=
g
> >>> value for years, and correcting it to its right value needs to do
> >>> what?
> >>
> >> We should stick to the wrong behavior for old machine types.
> >>
> >> That's all.
> > So that means the following SD patch is also wrong (+Philippe) which
> > changes the default value of capability register.
> > http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.241=
13-1-joannekoong@gmail.com/
>
>
> It should compat capareg for the old value for old machine types.

Yeah, it's already a property for the SD controller model but someone
views it as a bug because the model implements 64-bit but not
reporting it in the capability register.

>
>
> >
> > Can we get some agreement among maintainers?
>
>
> It's not about the agreement but about to have a stable ABI. I don't
> know the case for sd but e1000 is used in various  and we work hard to
> unbreak the migration compatibility among downstream versions. Git log
> on e1000.c will tell you more.

Agreement or stable ABI, whatever we call, but we should be in some consist=
ency.

IMHO maintainers should reach an agreement to some extent on how
compatibility should be achieved. I just found silly to add a property
to fix a real bug in the model, and we preserve the bug all over
releases.

I can find plenty of examples in the current QEMU tree that were
accepted that changed the bugous register behavior, but it was not
asked to add new properties to keep the bugos behavior.

e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logic"=
)

Regards,
Bin

