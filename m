Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B63C7E65
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:12:51 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Y8Y-0000uR-H8
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Y0G-0001oY-7l
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:04:17 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Y0E-0002LE-5q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:04:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id ee25so1535682edb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 23:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M6WoG1J/7oU9tvy8WlCnKFPeewA1tefpoE/RTFbyerE=;
 b=kMdHhRevrrrNbFuDzHQ8IxzcB6E72QfBaOBTCTLL9jwmNl1vc7dTWm6d0YBamsCxIx
 hQJ31ktLFV4hd+FAXdmBAXDL1XG/PVYkRaDcz/AlHXYuPqs4rMGGD4O2wbEiA6vgO5Ue
 vM0TEgozcsTknGvvnT4iHp04uYSSRw1bUHSDfTZE07ETZYLCfBnecMICowJi0KiDP2+6
 k6CSbPtFXr3MsFkouDuV5XSjsGsuBEd8qF2X3BOBfZzfViaHW/rcn4SrXJptFJq7sLCq
 pP2G4cIE5dsVtlhtFogn9sGUi/S9i0wAwIqW2mnl8V6id9bGFTZ2JxzNTJmlqDr9bZil
 g/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M6WoG1J/7oU9tvy8WlCnKFPeewA1tefpoE/RTFbyerE=;
 b=VwwimIK4Y29suK+L5yiIJXN9ykG/V1T/wVG/j96M+YhCXYPJUfTbGR7s06FHZu2zFh
 hAsysQzMZSSnE7O066s3AGYFuNdR4S6Z8/0UtP3cVgR1Md4HBOgFy6etgnV9h7t3U1td
 V18gY+2oHE5SKcaSrFMlstRLcPVHZQA+WHMy2cb7DqdFXvNxSedRFZhhcbqwPHCVq5LP
 wxWUbJwMNi0/gAN1Fhza6gx/MWJEypMdW0E3Gaci09Ll/kzbwfuWohHSpAYjinYOtIYy
 bFgXqg7UpY2KbS1oiG6kUcDHWqqCg1heLeaVxlTnT4bPENb5pCGtPEYaoIBkdh5zVhXT
 zlQg==
X-Gm-Message-State: AOAM530jWZURzyDy0o2uzAWnzoJX4582a/LR+AyV7DFOnjjWO6zXJ995
 TZM3hRoZO0qEJgoSX/VnwWQKqNpsQemH1/+z+E0=
X-Google-Smtp-Source: ABdhPJxuISeKktfy5RC/uZMAxrmBOiRk2cQanZonDHN91Wsgh6j9vpumOp2nxxUMDCM8L6PybU1/irfdByIYJk2Eeb0=
X-Received: by 2002:a05:6402:752:: with SMTP id
 p18mr11151782edy.281.1626242652714; 
 Tue, 13 Jul 2021 23:04:12 -0700 (PDT)
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
In-Reply-To: <854f526c-8ee0-a910-e0f9-08cf09ad3213@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 14:04:00 +0800
Message-ID: <CAEUhbmViB8kx1OyxCY3dCNccdb7-5exABsk9x32qfapaqFOV0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52a.google.com
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

On Wed, Jul 14, 2021 at 12:53 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/14 =E4=B8=8A=E5=8D=8811:42, Bin Meng =E5=86=99=E9=81=93:
> > On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>
> >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=885:11, Bin Meng =E5=86=99=E9=81=
=93:
> >>> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=884:36, Bin Meng =E5=86=99=E9=81=
=93:
> >>>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wr=
ote:
> >>>>>> =E5=9C=A8 2021/7/13 =E4=B8=8A=E5=8D=887:06, Bin Meng =E5=86=99=E9=
=81=93:
> >>>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
> >>>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com>=
 wrote:
> >>>>>>>>> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=
=E9=81=93:
> >>>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
> >>>>>>>>>>
> >>>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100,=
 as per
> >>>>>>>>>> the manual and real hardware.
> >>>>>>>>>>
> >>>>>>>>>> While Linux e1000 driver always writes VET register to 0x8100,=
 it is
> >>>>>>>>>> not always the case for everyone. Drivers relying on the reset=
 value
> >>>>>>>>>> of VET won't be able to transmit and receive VLAN frames in QE=
MU.
> >>>>>>>>>>
> >>>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> >>>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> >>>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>>>>>>>> ---
> >>>>>>>>>>
> >>>>>>>>>> (no changes since v1)
> >>>>>>>>>>
> >>>>>>>>>>       hw/net/e1000.c | 2 ++
> >>>>>>>>>>       1 file changed, 2 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >>>>>>>>>> index 4f75b44cfc..20cbba6411 100644
> >>>>>>>>>> --- a/hw/net/e1000.c
> >>>>>>>>>> +++ b/hw/net/e1000.c
> >>>>>>>>>> @@ -29,6 +29,7 @@
> >>>>>>>>>>       #include "hw/pci/pci.h"
> >>>>>>>>>>       #include "hw/qdev-properties.h"
> >>>>>>>>>>       #include "migration/vmstate.h"
> >>>>>>>>>> +#include "net/eth.h"
> >>>>>>>>>>       #include "net/net.h"
> >>>>>>>>>>       #include "net/checksum.h"
> >>>>>>>>>>       #include "sysemu/sysemu.h"
> >>>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> >>>>>>>>>>           [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RC=
V_TCO_EN |
> >>>>>>>>>>                       E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> >>>>>>>>>>                       E1000_MANC_RMCP_EN,
> >>>>>>>>>> +    [VET]     =3D ETH_P_VLAN,
> >>>>>>>>> I wonder if we need a compat flag for this, since we change the=
 behavior.
> >>>>>>>>>
> >>>>>>>>> (See e1000_properties[])
> >>>>>>>>>
> >>>>>>>> No we don't need to since it does not break migration.
> >>>>>>> Ping?
> >>>>>> I admit migration "works" but it doesn't mean it's not broken. It
> >>>>>> changes the guest visible default value of VET register, so it may=
 break
> >>>>>> things silently for the guest.
> >>>>>>
> >>>>>> For old machine types, we should stick the value to the one withou=
t this
> >>>>>> fix.
> >>>>> Could you please propose a solution on how to handle such a scenari=
o
> >>>>> in a generic way in QEMU? (+Peter)
> >>>> Well, I think I've suggested you to have a look at how things is don=
e in
> >>>> for handling such compatibility in e1000_properties.
> >>>>
> >>>>
> >>>>> The POR reset value is wrong in QEMU and has carried forward the wr=
ong
> >>>>> value for years, and correcting it to its right value needs to do
> >>>>> what?
> >>>> We should stick to the wrong behavior for old machine types.
> >>>>
> >>>> That's all.
> >>> So that means the following SD patch is also wrong (+Philippe) which
> >>> changes the default value of capability register.
> >>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.2=
4113-1-joannekoong@gmail.com/
> >>
> >> It should compat capareg for the old value for old machine types.
> > Yeah, it's already a property for the SD controller model but someone
> > views it as a bug because the model implements 64-bit but not
> > reporting it in the capability register.
> >
> >>
> >>> Can we get some agreement among maintainers?
> >>
> >> It's not about the agreement but about to have a stable ABI. I don't
> >> know the case for sd but e1000 is used in various  and we work hard to
> >> unbreak the migration compatibility among downstream versions. Git log
> >> on e1000.c will tell you more.
> > Agreement or stable ABI, whatever we call, but we should be in some con=
sistency.
> >
> > IMHO maintainers should reach an agreement to some extent on how
> > compatibility should be achieved. I just found silly to add a property
> > to fix a real bug in the model, and we preserve the bug all over
> > releases.
>
>
> That's the price for the stable ABI. See one of my recent fix -
> d83f46d189 virtio-pci: compat page aligned ATS. It keeps the "buggy"
> behavior to unbreak the migration.
>

But this series does not break the migration, as we discussed in the
previous thread.

> >
> > I can find plenty of examples in the current QEMU tree that were
> > accepted that changed the bugous register behavior, but it was not
> > asked to add new properties to keep the bugos behavior.
> >
> > e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF lo=
gic")
>
>
> I guess it's simply because fsl_etsec is not used in any
> distributions/production environments or the maintainer may just not
> notice things like this.
>
> But for e1000(e), we should stick to a stable ABI for consistency.
> Otherwise it would be very tricky to fix them after we saw real issues.
> We had learnt a lot during the past decade.
>

Okay, do we have such a kind of widely used device model list? And we
should document such a process that we should keep compatibility on
these devices as well.

Regarding this VET register, do you know what guest relies on the POR
value which is zero? Zero is not a valid ethernet VLAN type. I don't
think changing this will break any guests. The commit message says
Linux e1000(e) driver just rewrites this register by itself. Given
that's probably the most commonly used OS, it's not strange this bug
gets unnoticed for years.

Regards,
Bin

