Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DB3C8140
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:17:18 +0200 (CEST)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3b13-0000mj-En
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ayT-0007eX-W8
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:14:38 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ayS-0005ef-F2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:14:37 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k184so2020423ybf.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Eotw87Ey6bFiu2YdZjMyfKNoAN6oCiiYtKvAUtx4WkU=;
 b=NRYzIYknjTYOHFXNaWvdYTv9afRAXbtQ7+5rUveKxzLeWONZH0FfKrocbQ9307AnnF
 hAsE+GECU+jBNEg06pa/3EGT/qA7hkYuWsYtuo0iSi0aWUninVuNhMChCdVIeB5zJ7fU
 t7Oq3rCfIqy2aDdxclaS8cRR1rQ04eVjsYqyD24DTNKH9DnJLRM1ztkEXMaTDvtQh2Sm
 0JOBpxutnQLgpMhZBRrhFPvNbLiwHVqM/ni91/HH4yq85OHw4aBKE2X2Re5yaAIlsL8j
 op9rkq/4gH0IhaZ0DCEDz2AX8HTOCX3CF+rTS3RvLVjIjmgLbMiSSEtSiI+FjWoA/V8Y
 MSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Eotw87Ey6bFiu2YdZjMyfKNoAN6oCiiYtKvAUtx4WkU=;
 b=RDW77gKM745wG87chhKpEBJhbnii7FMZmlM0+R6jwehOqqv4JKDtLRgSFLXPnUURCy
 H8qezInESk/ig9ugHNVNWNO0oW7gmue9Dy9LoX5uwLeLGdszeWIHWtxwDE7X4yKsOWqd
 PGaGeWIIhh3DiFW5miSP9hlnpzEUJx4xxtgsWSgQk2dKFVfnfDO9jzsmQY3uKWfaIIA9
 Xk3PhInwQYQok0Xs+NNsL+JVtUDayYLcu9fp8nnnx+9COoLgwWUxuJgeRysK1RVsFb+b
 5gLmEf/WQMDX8FIIwxLWTEUNmeWCRxlls+Gx6cBEcFQjUqqtgcvbcAx04YBjnY9ji+la
 rssA==
X-Gm-Message-State: AOAM532Yd1wr3i8W+g2bo8oJM6IE5q9WH+Oet95OzIanPfXqwPtsURKf
 UrI8ZZDXoP70B+5E5pXOIty/Y43kM213/o+ubLs=
X-Google-Smtp-Source: ABdhPJyS3VNWRDdJuP1pbRMXnOU6eKHIvoAiWqwSAFjcbp72bbWAl2Vie8vevsK/6YH3zoQVaXgBUIK11SNBy0q5v3s=
X-Received: by 2002:a25:df11:: with SMTP id w17mr11625861ybg.314.1626254075619; 
 Wed, 14 Jul 2021 02:14:35 -0700 (PDT)
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
 <CAFEAcA_5LugG0JbBX=gN=dYE301nVNuDUpe9--_8o3rw9_y4Jg@mail.gmail.com>
In-Reply-To: <CAFEAcA_5LugG0JbBX=gN=dYE301nVNuDUpe9--_8o3rw9_y4Jg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 17:14:23 +0800
Message-ID: <CAEUhbmWZnkUKG76SWi0bOXDta9eR__Z5zn38UjSMROuucc1jQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Peter Maydell <peter.maydell@linaro.org>
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
Cc: Markus Carlstedt <markus.carlstedt@windriver.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christina Wang <christina.wang@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 5:01 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 14 Jul 2021 at 04:42, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > >
> > > =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=885:11, Bin Meng =E5=86=99=E9=81=
=93:
> > > > Can we get some agreement among maintainers?
> > >
> > >
> > > It's not about the agreement but about to have a stable ABI. I don't
> > > know the case for sd but e1000 is used in various  and we work hard t=
o
> > > unbreak the migration compatibility among downstream versions. Git lo=
g
> > > on e1000.c will tell you more.
> >
> > Agreement or stable ABI, whatever we call, but we should be in some con=
sistency.
> >
> > IMHO maintainers should reach an agreement to some extent on how
> > compatibility should be achieved. I just found silly to add a property
> > to fix a real bug in the model, and we preserve the bug all over
> > releases.
> >
> > I can find plenty of examples in the current QEMU tree that were
> > accepted that changed the bugous register behavior, but it was not
> > asked to add new properties to keep the bugos behavior.
> >
> > e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF lo=
gic")
>
> There is basically a judgement call going on here about whether the
> device is "significant enough" that it's worth the effort of
> preserving back-compatibility of bugs.
>
> There is at least one clear rule: if the device isn't used by any
> machine with a versioned machine type, then there is no need to
> provide back-compatibility of old buggy behaviour. (There would
> be no way for the user to select the old behaviour by choosing a
> -4.2 machine type.) This is why the fsl_etsec device doesn't need
> to handle that.
>
> For PCI devices it's a bit fuzzier because in theory you can plug
> any PCI card into a versioned x86 PC machine.
>
> We don't want to preserve bug-compatibility for absolutely
> everything, because the codebase would quickly clog up with weird
> behaviour that we never test and which is not of any use to users
> either. So you have to look at:
>  * how easy is providing the back-compat?
>  * how commonly used in production is the device?
>  * how likely is it that guests might care?
>  * would the behaviour change cause odd behaviour across
>    a cross-version migration from the old QEMU?
>
> Migration compat is similar, but not quite the same because the
> compatibility handling tends to be less invasive, so we take the
> "provide compat" choice more often. For non-versioned machine types,
> again, we're OK with breaking back-compat as long as we bump a
> migration version number so the user gets an error message rather
> than weird behaviour.

Thanks Peter. I think the above information can be put in a doc in
docs/devel, and with some real examples to help developers on how to
achieve backward compatibility.

Regarding this series, as I mentioned in an earlier thread, I believe
the possibility of breaking a guest is very low. Adding a back-compat
check is not that hard either. Just not sure which factor weighs more.

Regards,
Bin

