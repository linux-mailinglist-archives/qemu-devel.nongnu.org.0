Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9946504EB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71pp-0005QW-GU; Sun, 18 Dec 2022 17:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71pn-0005O5-DL; Sun, 18 Dec 2022 17:08:39 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71pl-0003jy-SR; Sun, 18 Dec 2022 17:08:39 -0500
Received: by mail-ed1-x52c.google.com with SMTP id z92so10613324ede.1;
 Sun, 18 Dec 2022 14:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfIR6onsTdDChWdhF0Y/94/mpqePbMDhMOcMJe8ucrU=;
 b=OYAxkXrDKsycM1LbO8BEOXByx4v6C7jO8i0frGsXsHlhDz11oaZ5xiVke7eC5Jm/G6
 JfZsfWPRIFrD4sql/QT7m+vbIFLZfvNPl15VXxE/VrjqY7q7Kbm1fo3ITqxN+l9u3IJi
 eJLDfJb6bptwIvsD+iiPIb80A3kBUrEnUtVfZ6HT013X3azFK7b/RfD/tmAwtQb0PLMF
 ImlsjHsaVhW9o+IZFhZ+ZWCfTtG4fGlUA8cY3ka/J/qLimF9Ysqqk1zp7AqfS/JM6+68
 06hRljatzjelUJme8m6kHrIoDu4685vEsMxYv2T1mXknd8jGjc+i2n2ktVYHXmWM24be
 FWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfIR6onsTdDChWdhF0Y/94/mpqePbMDhMOcMJe8ucrU=;
 b=HcyKKfPLZO3iPQpR2JGZJ4Z8wdLPt3itoD2oS3drvy2pArrpyHa8ZXFQVOZn+cvA5V
 FUp2bHdQyM1R5OnwC4pIaVBIY7Yf2qU3CCsaT6fm5ZWF7iFNI+3MxxYxq8HJdVliCzxd
 VsFBmKAUwiw9XS/YUnqi2QDNX3vqtAdKDGAtvnk/G57M8vc/9QQ/VdVipsfqNpUEn8g0
 /wY80AGnk5I5uvK2yGXkJMO73n1mNFsdyQfM23GO9TKMFOZ5hLp3578ILNfF/tbWMHQl
 jK+R+3xMHfJA8715bbOfLcqvnpbJBf69Zl9t4BKC/YGX0GCi5rv2rIOBLUBYtjJVKAG9
 jATw==
X-Gm-Message-State: AFqh2kqIeiLbBNfVg5JX/O04RKRjcuRE44uSx59fL2tbn3shedU2gRUz
 JI5rAwx2g5iIm09r2T+hbVyhQr3nkK2YsGhHbxIM4uFH74HZ6Q==
X-Google-Smtp-Source: AMrXdXtVNtDMEf9Z168jkBSeW7LyyEnx14dUK5t3zsmByfu6z1NjmPIFDORGYuXlDlok0wkIssOI6DX0kyGybq+8Bhw=
X-Received: by 2002:a05:6402:1816:b0:476:1997:a6ac with SMTP id
 g22-20020a056402181600b004761997a6acmr947563edy.108.1671401315918; Sun, 18
 Dec 2022 14:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
 <d5616b84-f9b4-3f53-1011-4df670c3ed7c@linaro.org>
In-Reply-To: <d5616b84-f9b4-3f53-1011-4df670c3ed7c@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:08:24 +0100
Message-ID: <CABtshVRCmcksddzRYndB5G18TC-=OMMOdFrGFtLp=HoB8zx1eg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] docs/system/arm: Update Allwinner with TWI (I2C)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Sun, Dec 18, 2022 at 11:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 22:19, Strahinja Jankovic wrote:
> > TWI (I2C) is supported so docs are updated for Cubieboard and
> > Orangepi-PC board.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > ---
> >   docs/system/arm/cubieboard.rst | 1 +
> >   docs/system/arm/orangepi.rst   | 1 +
> >   2 files changed, 2 insertions(+)
> >
> > diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboar=
d.rst
> > index 344ff8cef9..8d485f5435 100644
> > --- a/docs/system/arm/cubieboard.rst
> > +++ b/docs/system/arm/cubieboard.rst
> > @@ -14,3 +14,4 @@ Emulated devices:
> >   - SDHCI
> >   - USB controller
> >   - SATA controller
> > +- TWI (I2C) controller
> > diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rs=
t
> > index 83c7445197..e5973600a1 100644
> > --- a/docs/system/arm/orangepi.rst
> > +++ b/docs/system/arm/orangepi.rst
> > @@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devic=
es:
> >    * Clock Control Unit
> >    * System Control module
> >    * Security Identifier device
> > + * TWI (I2C)
> >
> >   Limitations
> >   """""""""""
>
> Squash to patch #3 "hw/i2c: Allwinner TWI/I2C Emulation"?

Yes, that makes sense, I will do it. Thanks.

Best regards,
Strahinja

