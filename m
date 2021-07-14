Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373F3C80FA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:06:34 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3aqf-0002lV-MC
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3apc-00023G-Fe
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:05:28 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3apa-0007dw-7j
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:05:28 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id g5so2001601ybu.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pl01JYS4gzKDWVkfZtj3UKvDyoj5x5RC6x655Ux2QR8=;
 b=NRepW0R/AnqjGgROvPV45eewW++CmoeqlBviyQPlQuMalZrE1IafWT7rzDVcldssRo
 EQkfEr6qJ/OArgaySODxwijlOQje/4YlzMDLe24v77IcYUDiEOA96VY08FsgGXWIn6m6
 AgztLonPUR9+IOcagr4He53kyHlq/tlttEhO4+eN3Yj9QquSX+U2zsmW+zHBTmBsj5Ne
 1jHfGwBMDXt3iw1Y44Ia0zq3ke+w3c+kR7yKWZukRXu0t+24YRtQrYFu3U8fCMk3g8Dl
 QI+hZbXbm3HsmvU96Wefj3trsVD2rVmxYDNU33gPOgjZbHj1yVjt1CfU0LAAMPnC2Nup
 YJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pl01JYS4gzKDWVkfZtj3UKvDyoj5x5RC6x655Ux2QR8=;
 b=LGWkQT7IUOQG2G2WtYJXUafjvKp9XIrSp10hIZFzxyhj2KyxBFCn1/4C7hkqTknCAH
 7Kf+/9oGXwQMN1JGhijlET1tZ3AXspCP0vvk/hKxki/0lcMmh6vEd0/el5in534i1de8
 BXGtRjncWNfdYWlZq+eUZNgTRad5gKtFNv45ApHmvKAzFVwZW40bMuvvbJ/qtGrSPd/p
 X5pS8p7ZtWYp2yMFSPmofbLT8PHf07dwhYui0b2sekZL8YpDq9iK8l3B4FK+vLWWcRIZ
 c1JLBtfxrbVygYvyDRtFA8KI2F/zMBf0vY0VfeyIO5U0/68gLubTMoAI6NIzP/pqOcpc
 Gy+g==
X-Gm-Message-State: AOAM5325eRG8jqq/ge1moWSNmvOrsx2T4S7m9xXdcpRbXGqWYTBI1Ipt
 9xlBTHw/kT89CgTzVL3oopwakLhYREyZ/PRTjy8=
X-Google-Smtp-Source: ABdhPJxu4DLxsmFmyAmnhp0/8ZGUc0jmAxwA+lu1OKJWoZIm09vLQHmgxPCJOf6t2hxuu0UzRHc1cvvF7+kafnCqoss=
X-Received: by 2002:a25:dcd:: with SMTP id 196mr12090758ybn.306.1626253523900; 
 Wed, 14 Jul 2021 02:05:23 -0700 (PDT)
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
 <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
 <854f526c-8ee0-a910-e0f9-08cf09ad3213@redhat.com>
 <CAEUhbmViB8kx1OyxCY3dCNccdb7-5exABsk9x32qfapaqFOV0g@mail.gmail.com>
 <70e86495-9f83-ee4f-d9fc-091ccbfed71a@redhat.com>
In-Reply-To: <70e86495-9f83-ee4f-d9fc-091ccbfed71a@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 17:05:12 +0800
Message-ID: <CAEUhbmUUwW1t0VgC-P-bQRetE_yeAbs0ULsVJDjc8Ja6yCSg6g@mail.gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christina Wang <christina.wang@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 4:40 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/14 =E4=B8=8B=E5=8D=882:04, Bin Meng =E5=86=99=E9=81=93:
> > On Wed, Jul 14, 2021 at 12:53 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >>
> >> =E5=9C=A8 2021/7/14 =E4=B8=8A=E5=8D=8811:42, Bin Meng =E5=86=99=E9=81=
=93:
> >>> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=885:11, Bin Meng =E5=86=99=E9=81=
=93:
> >>>>> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wr=
ote:
> >>>>>> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=884:36, Bin Meng =E5=86=99=E9=
=81=93:
> >>>>>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> =
wrote:
> >>>>>>>> =E5=9C=A8 2021/7/13 =E4=B8=8A=E5=8D=887:06, Bin Meng =E5=86=99=
=E9=81=93:
> >>>>>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wr=
ote:
> >>>>>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.co=
m> wrote:
> >>>>>>>>>>> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=
=E9=81=93:
> >>>>>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
> >>>>>>>>>>>>
> >>>>>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x810=
0, as per
> >>>>>>>>>>>> the manual and real hardware.
> >>>>>>>>>>>>
> >>>>>>>>>>>> While Linux e1000 driver always writes VET register to 0x810=
0, it is
> >>>>>>>>>>>> not always the case for everyone. Drivers relying on the res=
et value
> >>>>>>>>>>>> of VET won't be able to transmit and receive VLAN frames in =
QEMU.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.co=
m>
> >>>>>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> >>>>>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>
> >>>>>>>>>>>> (no changes since v1)
> >>>>>>>>>>>>
> >>>>>>>>>>>>        hw/net/e1000.c | 2 ++
> >>>>>>>>>>>>        1 file changed, 2 insertions(+)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >>>>>>>>>>>> index 4f75b44cfc..20cbba6411 100644
> >>>>>>>>>>>> --- a/hw/net/e1000.c
> >>>>>>>>>>>> +++ b/hw/net/e1000.c
> >>>>>>>>>>>> @@ -29,6 +29,7 @@
> >>>>>>>>>>>>        #include "hw/pci/pci.h"
> >>>>>>>>>>>>        #include "hw/qdev-properties.h"
> >>>>>>>>>>>>        #include "migration/vmstate.h"
> >>>>>>>>>>>> +#include "net/eth.h"
> >>>>>>>>>>>>        #include "net/net.h"
> >>>>>>>>>>>>        #include "net/checksum.h"
> >>>>>>>>>>>>        #include "sysemu/sysemu.h"
> >>>>>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D=
 {
> >>>>>>>>>>>>            [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC=
_RCV_TCO_EN |
> >>>>>>>>>>>>                        E1000_MANC_ARP_EN | E1000_MANC_0298_E=
N |
> >>>>>>>>>>>>                        E1000_MANC_RMCP_EN,
> >>>>>>>>>>>> +    [VET]     =3D ETH_P_VLAN,
> >>>>>>>>>>> I wonder if we need a compat flag for this, since we change t=
he behavior.
> >>>>>>>>>>>
> >>>>>>>>>>> (See e1000_properties[])
> >>>>>>>>>>>
> >>>>>>>>>> No we don't need to since it does not break migration.
> >>>>>>>>> Ping?
> >>>>>>>> I admit migration "works" but it doesn't mean it's not broken. I=
t
> >>>>>>>> changes the guest visible default value of VET register, so it m=
ay break
> >>>>>>>> things silently for the guest.
> >>>>>>>>
> >>>>>>>> For old machine types, we should stick the value to the one with=
out this
> >>>>>>>> fix.
> >>>>>>> Could you please propose a solution on how to handle such a scena=
rio
> >>>>>>> in a generic way in QEMU? (+Peter)
> >>>>>> Well, I think I've suggested you to have a look at how things is d=
one in
> >>>>>> for handling such compatibility in e1000_properties.
> >>>>>>
> >>>>>>
> >>>>>>> The POR reset value is wrong in QEMU and has carried forward the =
wrong
> >>>>>>> value for years, and correcting it to its right value needs to do
> >>>>>>> what?
> >>>>>> We should stick to the wrong behavior for old machine types.
> >>>>>>
> >>>>>> That's all.
> >>>>> So that means the following SD patch is also wrong (+Philippe) whic=
h
> >>>>> changes the default value of capability register.
> >>>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921=
.24113-1-joannekoong@gmail.com/
> >>>> It should compat capareg for the old value for old machine types.
> >>> Yeah, it's already a property for the SD controller model but someone
> >>> views it as a bug because the model implements 64-bit but not
> >>> reporting it in the capability register.
> >>>
> >>>>> Can we get some agreement among maintainers?
> >>>> It's not about the agreement but about to have a stable ABI. I don't
> >>>> know the case for sd but e1000 is used in various  and we work hard =
to
> >>>> unbreak the migration compatibility among downstream versions. Git l=
og
> >>>> on e1000.c will tell you more.
> >>> Agreement or stable ABI, whatever we call, but we should be in some c=
onsistency.
> >>>
> >>> IMHO maintainers should reach an agreement to some extent on how
> >>> compatibility should be achieved. I just found silly to add a propert=
y
> >>> to fix a real bug in the model, and we preserve the bug all over
> >>> releases.
> >>
> >> That's the price for the stable ABI. See one of my recent fix -
> >> d83f46d189 virtio-pci: compat page aligned ATS. It keeps the "buggy"
> >> behavior to unbreak the migration.
> >>
> > But this series does not break the migration, as we discussed in the
> > previous thread.
>
>
> It actually did,
>
> (qemu) qemu-kvm: get_pci_config_device: Bad config data: i=3D0x104 read:
>      0 device: 20 cmask: ff wmask: 0 w1cmask:0
>
> Since the register is RO.

Did you mean the VET register is read-only? I don't understand this as
the manual says it's RW and Linux driver programs it to 0x8100.

>
>
> >
> >>> I can find plenty of examples in the current QEMU tree that were
> >>> accepted that changed the bugous register behavior, but it was not
> >>> asked to add new properties to keep the bugos behavior.
> >>>
> >>> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF =
logic")
> >>
> >> I guess it's simply because fsl_etsec is not used in any
> >> distributions/production environments or the maintainer may just not
> >> notice things like this.
> >>
> >> But for e1000(e), we should stick to a stable ABI for consistency.
> >> Otherwise it would be very tricky to fix them after we saw real issues=
.
> >> We had learnt a lot during the past decade.
> >>
> > Okay, do we have such a kind of widely used device model list? And we
> > should document such a process that we should keep compatibility on
> > these devices as well.
>
>
> I can only say for networking devices:
>
> - e1000(e)
> - rtl8139
> - virtio-net
>

Please, at least have these documented as a development process.

> >
> > Regarding this VET register, do you know what guest relies on the POR
> > value which is zero?
>
>
> I don't know.
>
>
> > Zero is not a valid ethernet VLAN type. I don't
> > think changing this will break any guests.
>
>
> You might be right here, but it would be late if we find it breaks any on=
e.
>
> If it's not a lot of work, I tend to bother with compat stuffs for this.
>

Regards,
Bin

