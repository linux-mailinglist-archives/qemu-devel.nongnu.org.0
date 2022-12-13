Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F864B854
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:24:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p577y-0004zY-Ug; Tue, 13 Dec 2022 10:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p577e-0004yP-VT
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:23:11 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p577b-0006YC-93
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:23:10 -0500
Received: by mail-pl1-x630.google.com with SMTP id w23so49970ply.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLPrxvN2vhl7PqYYsY+X3xD5u++6hJb3p4C3MzhkKTY=;
 b=mTuA60uolpj3Hnjg5CvxOxYigaHdRxbL9Opx1gdjKxKMniLx7Kw30hrPgO3NWTXn4D
 k7TL8pJbEUG+esU4qGm7Z+dL4EvzoqVPrZgMgPnyKx106hTh51dPgPoEPeBq+1p1463u
 iSvED6v89Zov1zmugG8EHYBCoVn/avLSg12XwPlx7zxLEZPnfVwYX1U6lom9xX/oSXTk
 7/CxoLAsYPbj0vIV6xujOQJ6A6x+8g0JjOQbWMoeA0YNZfD8ixtx4oR7OPIla/CVmf2T
 HVVOdi9FBcnhIvJXn5REtDq1Jq9pPU4pl9Tn1owsrbHtxzFty+5uZf87qxXmWUmbFUBC
 TQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLPrxvN2vhl7PqYYsY+X3xD5u++6hJb3p4C3MzhkKTY=;
 b=x5KLI/dJUT3tsOpTp6xYyFyF+ls+uI/1PINqPXaO5InHO5tQiDhPZEQ3jR6BETpqNg
 KR5pHi4+kdkgVZp9k5lOKK2mSSQVGoamLekcKyMTDW/HBKQx934WzrA8SyIFXF4NkDxN
 MIsic8a5BrzNXp+IHKsB7dC/86wVoYtg68VOi7sfRdKyYuLSynVGHP5Zpc7oULJTlL8i
 2dXtUpyCQdj6EmgSie9plI9Xa9nQ646mnzeMhx+yXEUcwqocvFrpBFdvbGNybbmoUZvA
 pDdxpr4lYIvQ852Pkv10/+dXVqd7NVwadnbM7NbWCRCSxLKrAePhexXWaToEHzRDSJhO
 gcww==
X-Gm-Message-State: ANoB5pmvjoKcAb1Z4UbdAFuCholJ73hhDlzKymhKFpt1J+QRH4vVu+Eg
 jR1E/Otgelc04KIjNtgEzt2IKGZOK9Ndz+83KcJcfw==
X-Google-Smtp-Source: AA0mqf45Y3as3YWNjcZQyC8sBItvyUj3eQY6dBLOSMXyoELd/vHf8d0+QUX4IJB5tp6eCatx4tQh2kFx/jPUNaFpaZY=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36093850plt.60.1670944985737; Tue, 13
 Dec 2022 07:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
 <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
 <Y5iK7VFi9B1HwHf/@toto>
In-Reply-To: <Y5iK7VFi9B1HwHf/@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 15:22:54 +0000
Message-ID: <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 13 Dec 2022 at 14:23, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> > >
> > > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@l=
inaro.org> wrote:
> > > > >
> > > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > > Simplify byteswapping to/from brams") which states the
> > > > > packet data is stored in big-endian.

> > > > This is a change of behaviour for this device in the
> > > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > > previously on that system the bytes of the rx buffer would
> > > > appear in the registers in little-endian order and now they
> > > > will appear in big-endian order.
> > > >
> > > > Edgar, do you know what the real hardware does here ?
> >
> > > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > > should be modelled as plain RAM's (they are just RAM's on real HW).
> > > Because we're modeling as MMIO regs, I think we get into endianness
> > > trouble when the ethernet output logic treats the content as a blob
> > > (thus the need for byteswaps). Does that make sense?
> >
> > As a concrete question: if I do a 32-bit load from the buffer
> > register into a CPU register, do I get a different value
> > on the BE microblaze hardware vs LE microblaze ?
>
> Yes, I beleive so.
>
> If the CPU stores the value and reads it back, you get the same. But
> the representation on the RAM's is different between LE/BE.
> But if the Ethernet logic writes Ethernet packet data into the buffer,
> LE and BE MicroBlazes will read differient values from the buffers.
> These buffer "registers" are just RAM's I beleive.

Thanks. That suggests that the current code for this device
is correct, and we would be breaking it on the LE platform
if we applied this patch.

I don't suppose you have a guest image for the boards which
uses ethernet ?

-- PMM

