Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7721473DDC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 08:59:39 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2io-00056L-HY
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 02:59:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1mx2gh-0003kU-DN; Tue, 14 Dec 2021 02:57:27 -0500
Received: from [2607:f8b0:4864:20::230] (port=36494
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1mx2gf-0008Ig-Ml; Tue, 14 Dec 2021 02:57:27 -0500
Received: by mail-oi1-x230.google.com with SMTP id t23so26373283oiw.3;
 Mon, 13 Dec 2021 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KvdfDcfIK9D7Al/TIvXXz293IfgMkULk5fTtX2RGrSU=;
 b=MeT3ADjV1PZNbyxV7GXIsS/IZc2nUuA4jQmuhxMleNNAXWwUIUShHoCE0p3Is/FasW
 K9asIca6xtRcw8l3C59jP8xm2FSeoirrvB6wtJ/qPVviizjMEn/gdmbnI52vHHyXt7iG
 ex1ZcQZ2FHGCpIs6Bhlet8cNZLDRsdsW7SJxlnOcc3v2iAFz+ePlYt7CcgGEBsPzCH5b
 qlwqWs+N6R7OWLIaWiTLUhIQBc/6eyy9ZgKzrS9TVZuz0BEdZWrlrFEw0YMHaxwWFRMc
 Hn0KiCeDVgqixGFdVZlgmn8hdUEscmravytNvWGTNmr/0EirajihEbQJG6XDkti5vpFD
 +O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KvdfDcfIK9D7Al/TIvXXz293IfgMkULk5fTtX2RGrSU=;
 b=vPpvXmERzT4lpIeSM2M9QjIRjVBzEH2PZgCe1mEYuXkOn3jTcYdH+Ek03Byrp3/TGA
 6A3nWxHCjpeZdhZbNju01cnyhgVIKXTzGoqvTg5LdQ6BcGOlEqINu2nbqqq+emlnxnrT
 xm5bmpxnMC/2QujHghjwyANJ13cjg1WXVjW3sG9BqJNkgG4VyIiqhUixO4fLvmu6vU/3
 cep/Lr+UPIPv2K41fs4fhNxYATk8EJ6qkHD+7oINGP90Og9s5cWvvne98nl8dG/onnqu
 XM80gVPToP/5M9+YMZsEffJHEoZESS7cOxv7dlIPsBMUDCriEfsaW+Dnl7tJp1VZntxh
 BeOQ==
X-Gm-Message-State: AOAM533tUbgOrAtlc7C99pJVDXZoIzG4LBBui+9S/f/VqCDE2T0b4gT8
 TuzLQBQepBJlnOQZMqngIfKOb9lfjgO1IIo4O3A=
X-Google-Smtp-Source: ABdhPJweFdyieyuWsOidthxpwhmbh0vXwTYLpP9jbZaNJXqKgPf+k2FUqdszIzHNsa+AKXEU6QiK6NNfwKaZRwvsc1Q=
X-Received: by 2002:a05:6808:1686:: with SMTP id
 bb6mr3284634oib.40.1639468643738; 
 Mon, 13 Dec 2021 23:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
 <CAN9Jwz3ytV3ogztQrcL+YKGdgKYdNjypeMFbKfyqMiwvWhnMEw@mail.gmail.com>
 <e96aa35b-a8d9-41fa-ae0f-5e89fe6b1cfa@kaod.org>
In-Reply-To: <e96aa35b-a8d9-41fa-ae0f-5e89fe6b1cfa@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 14 Dec 2021 15:57:16 +0800
Message-ID: <CAN9Jwz0fhYELCkiZ16PSd4WXye5EPVrBSvLEq8r5SCigPW6-zg@mail.gmail.com>
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 11:13 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 12/10/21 15:33, Troy Lee wrote:
> > On Fri, Dec 10, 2021 at 10:05 PM C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
> >>
> >> On 12/10/21 09:30, Troy Lee wrote:
> >>> AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's mem=
ory
> >>> and io address. If guest machine try to access DPMCU memory, it will
> >>> cause a fatal error.
> >>
> >> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devic=
es
> >> but it's too small. Anyhow, it is better to have per logic unit. We sh=
ould
> >> change that one day.
> >>
> > Good idea!
> >
> >> For my information, which FW image are you using ?
> >>
> >
> > We're using Aspeed's SDK image, I tested with ast2600-default machine.
> > Prebuilt image can be download from:
> > https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02
>
> Excellent ! Is there one I could try in particular ?
You could use ast2600-default-obmc.tgz, but we will send another patch
for HACE engine.

>
>
> Once correctly supported, we should include one of these SDK images in :
>
>    tests/avocado/boot_linux_console.py
>
> to complete our tests of the device models.
Sure, once the image successfully boots into rootfs, I'll add a test
case for it.

> QEMU is not making much difference between the revision. You might need
> to improve that.
>
> > Without declaring the DPMCU memory, the image will hangs in u-boot.
>
> yeah. You can use -d guest_errors,unimp to catch accesses done on AHB
> windows not covered by the QEMU models. There are plenty of ways to
> move past U-Boot when models are not implemented yet. Don't waste
> too much time, just ask.
>
> eMMC is only on these branches :
>
>    https://github.com/openbmc/qemu/
>    https://github.com/legoater/qemu/
These two branches are very useful!

> Same for SBC and support is primitive.
>
> > We're still working on I3C and SPI issue to be resolved to get into roo=
tfs.
>
> I3C has not much support in Linux and none in QEMU. You will have to
> add dummy models.
Can I submit a dummy model that only responds to the RESET control register=
?
Or it has to be well implemented like i2c/core.c and i2c/aspeed_i2c.c?


> SPI as a non-SPI flash driver ? The SPI flash controller models should
> be quite well covered today. What's the issue ?
I need some more investigation, because we're using a different spi
driver for fmc-spi.

>
> Thanks,
>
> C.

Thanks,
Troy Lee

