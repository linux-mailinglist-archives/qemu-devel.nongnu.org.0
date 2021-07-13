Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754873C6C12
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:37:11 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Dug-0004mL-IC
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Dtp-000455-06
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:36:17 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3Dtn-0003vo-C8
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:36:16 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id k184so33506283ybf.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DV+E8/h6XkImYvhzArstkH7Yeve0Y444gqwEOLnNwyY=;
 b=MybAnRbNupjXlta1kIw8rOw8SsiQsaf7q6UtLDPnjEeNV4dV/NbQLeNPAHHf/hK0oL
 fxnSwHV3e4kbVDYkWFMHKfoH1ZsZzpuQNjy5f/eMFiSHZKfHiF+zUq3qpgiKOTNe/dtL
 HJfDSfABqgyDp7NTPfc5XV9gyCedq8NR3imCCs/dzCuXKZDYPjNKGzopZiqnnprdf+KU
 NjACm/A4nf4MyNKEAtWxQ5fS2GiRD9Vz7HHcfZ9GFtlo/25/ENfOIrUUClcILOy0Y7LP
 Ze7rJh3bmqRoNSMQSFX7dgznaXTEJdwQUjpASMrJ1V66WNRdg6LjsiO2v7pwr59Tihqc
 a6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DV+E8/h6XkImYvhzArstkH7Yeve0Y444gqwEOLnNwyY=;
 b=ZBZ8ppRBPM09NAVzkKkulLDCuwiVNutoF4mzdyzB9ui9Gil6D8U0s2O5/lzJ87W9Zv
 oFrtJp33lXPCKM5Mh1ZezrCQB2UysLIF3+PJpqPXHJobH2MHrjjnFUbmhA6/KCRp95ZY
 rkUZ2wux8gUBkKw6DIYHkZ+ZR+jvyzOVOjuFaLJg2uFiEiNG1rAy+58nEGlKjsHg9iUb
 Cg+5bM5bnpYVr+MAweqatpjcXPIkXbyiz9ZOB8AyTfXLSFh5+0ovf1GpQPBz1v6JlpYY
 gw675OZPVG/AY5QCWcyAXdCVGla6vzjwTOq+xX0VpO/AurrOZdUeeFAXObVOwmBn1yl5
 pyDw==
X-Gm-Message-State: AOAM531q+2cLdzErEhXKBJTBBzxd31GIsuOEvLAyoxqV5R+6aWb1lGd9
 i/Ctjm12cnyBhJS9eUeq7WPPneox3tNvzFSRxQA=
X-Google-Smtp-Source: ABdhPJxStUxBR9e+OEqvepO74loTMikq9Z0DJ6EI43cVw50Y4jlSpXnG4C4eo/phpE9yi/u2bar7msQCx7WZewSAhew=
X-Received: by 2002:a5b:504:: with SMTP id o4mr4361865ybp.332.1626165374114;
 Tue, 13 Jul 2021 01:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
In-Reply-To: <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Jul 2021 16:36:03 +0800
Message-ID: <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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

On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/13 =E4=B8=8A=E5=8D=887:06, Bin Meng =E5=86=99=E9=81=93:
> > On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>
> >>> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=E9=81=
=93:
> >>>> From: Christina Wang <christina.wang@windriver.com>
> >>>>
> >>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as pe=
r
> >>>> the manual and real hardware.
> >>>>
> >>>> While Linux e1000 driver always writes VET register to 0x8100, it is
> >>>> not always the case for everyone. Drivers relying on the reset value
> >>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
> >>>>
> >>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> >>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> >>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>> ---
> >>>>
> >>>> (no changes since v1)
> >>>>
> >>>>    hw/net/e1000.c | 2 ++
> >>>>    1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >>>> index 4f75b44cfc..20cbba6411 100644
> >>>> --- a/hw/net/e1000.c
> >>>> +++ b/hw/net/e1000.c
> >>>> @@ -29,6 +29,7 @@
> >>>>    #include "hw/pci/pci.h"
> >>>>    #include "hw/qdev-properties.h"
> >>>>    #include "migration/vmstate.h"
> >>>> +#include "net/eth.h"
> >>>>    #include "net/net.h"
> >>>>    #include "net/checksum.h"
> >>>>    #include "sysemu/sysemu.h"
> >>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> >>>>        [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN =
|
> >>>>                    E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> >>>>                    E1000_MANC_RMCP_EN,
> >>>> +    [VET]     =3D ETH_P_VLAN,
> >>>
> >>> I wonder if we need a compat flag for this, since we change the behav=
ior.
> >>>
> >>> (See e1000_properties[])
> >>>
> >> No we don't need to since it does not break migration.
> > Ping?
>
>
> I admit migration "works" but it doesn't mean it's not broken. It
> changes the guest visible default value of VET register, so it may break
> things silently for the guest.
>
> For old machine types, we should stick the value to the one without this
> fix.

Could you please propose a solution on how to handle such a scenario
in a generic way in QEMU? (+Peter)

The POR reset value is wrong in QEMU and has carried forward the wrong
value for years, and correcting it to its right value needs to do
what?

Regards,
Bin

