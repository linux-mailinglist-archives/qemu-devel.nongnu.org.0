Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC882F8DA1
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 17:17:52 +0100 (CET)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0oGt-0006Ld-NW
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 11:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0oFl-0005WD-N2; Sat, 16 Jan 2021 11:16:41 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0oFj-0001sU-OV; Sat, 16 Jan 2021 11:16:41 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id i141so686789yba.0;
 Sat, 16 Jan 2021 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ymgw9EJaoycqtcZPMuEs2zZSi51jWFMW40h/C1BZ008=;
 b=nA+RhKak1E0xTA8sBDQpzyZUzlMDoyenrFQebakRNQfyn26MLp68SRT2MI9jSdaFgN
 W5ruX5/jSfQHh6SMZnfAjYfjTFQVjrcT0Yy/nqWsYjT61Vqkpe8NJRq8yKKb6BhDpc/2
 +W/hT+GA8KG01IycF3VMSV+qeKk5FEFLMM5d0T1GBEL27SNBESKjQ0M464QBJOy0gHLJ
 YrPR3kqHU7+RuqqorHD/vsCZyYN/Ff3TrMYlc/MTysRRyce/31WzSFcyUNoOPt/Qt6NH
 F6T9KUHLOX9z5VbJ0yH93psdksiz+LDSp0xSt6eKFROTbLYup7V89OjdpuNxO3BTNcM6
 oAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ymgw9EJaoycqtcZPMuEs2zZSi51jWFMW40h/C1BZ008=;
 b=c64SKcQWStEkdOXkz5Xy/QuHkA8vyUXXlyRzKCQfpGNJD1W1HAKfqisuigVAUYwuJM
 TQzDmnQcRZf1zVjn//RMH5vzsenb6L0ss+rYr3NkuFj6pFf1zkTrOLI3/3Hq/XlXY+20
 LAX4y0taztkUm+MGG2Wu9B+yQsDl+vSWMmEyPcr/CJ3it9Dc7MpMGausCVFUKI56xsN6
 p1YOj11upgH2d6W9V0dO1lqdzUwXvaXenrbT+LcLDRXTsyKGsAME9vXFWziGbkoNohUM
 YlgYLq4tLw5JwFHEmQ11/TZubBS+qoBuoMXikkB4m2kzIR+VcStxeMNO7cxRbL+qGPp7
 f+9A==
X-Gm-Message-State: AOAM532fWVTNialsLXXMERxdStxo/luvCPKEX2nON1hnga4/ROvm8RGa
 rS+EFu/b5yl6EpeXA+pC6fIBK82QO/cJm1V1TcI=
X-Google-Smtp-Source: ABdhPJy2DYJxMvjUDXZ6jJ+B/6hdW7FjC1DhvCIlIXX7FiPrzkb5OT/hVQe7Y0+V+LeM2mtkrzPYywAoBnrDrXNIDcE=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr26454420ybs.122.1610813798341; 
 Sat, 16 Jan 2021 08:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-6-f4bug@amsat.org>
 <CAEUhbmUXfm4JqqopEhq9-FQYJeY8Md7uwCczbSHm2H9oqERkJg@mail.gmail.com>
 <7fcb40af-12a4-8926-b612-34d21988baf5@amsat.org>
 <CAEUhbmWP5dyKuttdT+-DGSCQdqV326dGwWfS_=RQcxsjTfz_JQ@mail.gmail.com>
 <dd9868f5-7d94-4516-6300-2bf5f2bf850f@amsat.org>
In-Reply-To: <dd9868f5-7d94-4516-6300-2bf5f2bf850f@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 17 Jan 2021 00:16:26 +0800
Message-ID: <CAEUhbmWLVNQv8Qrydd8kNiJngCFxM23Q4AQT=3FiJ8rhoQ1_FA@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Sun, Jan 17, 2021 at 12:12 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 1/16/21 4:59 PM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Sat, Jan 16, 2021 at 11:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>
> >> Hi Bin,
> >>
> >> On 1/16/21 2:57 PM, Bin Meng wrote:
> >>> On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> >>>>
> >>>> When the block is disabled, only the ECSPI_CONREG register can
> >>>> be modified. Setting the EN bit enabled the device, clearing it
> >>>
> >>> I don't know how this conclusion came out. The manual only says the
> >>> following 2 registers ignore the write when the block is disabled.
> >>>
> >>> ECSPI_TXDATA, ECSPI_INTREG
> >>
> >> 21.4.5 Reset
> >>
> >>   Whenever a device reset occurs, a reset is performed on the
> >>   ECSPI, resetting all registers to their default values.
> >>
> >> My understanding is it is pointless to update them when the
> >> device is in reset, as they will get their default value when
> >> going out of reset.
> >
> > I have a different understanding. When ECSPI_CONREG[EN] is cleared,
> > it's like a hardware reset, and the ECSPI takes the following action:
> >
> >     "Whenever a device reset occurs, a reset is performed on the
> > ECSPI, resetting all registers to their default values."
> >
> > Chapter 21.4.5 Reset does not mention what's the hardware behavior afte=
rwards.
> >
> > So my understanding is: afterwards, the software can still write to
> > various registers, unless the register description tells us it's
> > ignored.
> >
> >>
> >>>
> >>>> "disables the block and resets the internal logic with the
> >>>> exception of the ECSPI_CONREG" register.
> >>>>
> >>>> Move the imx_spi_is_enabled() check earlier.
> >>>>
> >>>> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> >>>>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> >>>>
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>> ---
> >>>>  hw/ssi/imx_spi.c | 26 ++++++++++++++++----------
> >>>>  1 file changed, 16 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> >>>> index ba7d3438d87..f06bbf317e2 100644
> >>>> --- a/hw/ssi/imx_spi.c
> >>>> +++ b/hw/ssi/imx_spi.c
> >>>> @@ -322,6 +322,21 @@ static void imx_spi_write(void *opaque, hwaddr =
offset, uint64_t value,
> >>>>      DPRINTF("reg[%s] <=3D 0x%" PRIx32 "\n", imx_spi_reg_name(index)=
,
> >>>>              (uint32_t)value);
> >>>>
> >>>> +    if (!imx_spi_is_enabled(s)) {
> >>>> +        /* Block is disabled */
> >>>> +        if (index !=3D ECSPI_CONREG) {
> >>>> +            /* Ignore access */
> >>>> +            return;
> >>>> +        }
> >>>> +        s->regs[ECSPI_CONREG] =3D value;
> >>
> >>                                    [*]
> >>
> >>>> +        if (!(value & ECSPI_CONREG_EN)) {
> >>>> +            /* Keep disabled */
> >>>
> >>> So other bits except ECSPI_CONREG_EN are discarded? The manual does
> >>> not explicitly mention this but this looks suspicious.
> >>
> >> See in [*], all bits from the register are updated. We simply check
> >> ECSPI_CONREG_EN to see if we need to go out of reset.
> >
> > Oops, I missed the [*] line. Now I have read this carefully, and found
> > there is one problem:
> >
> > Now with the new logic the device reset activity has been postponed
> > until next time a device register is written. This is wrong.
>
> Yes, I just realized that in the imx_spi_read() function.
>
> >
> >>
> >> See:
> >>
> >> 21.5 Initialization
> >>
> >>   This section provides initialization information for ECSPI.
> >>
> >>   To initialize the block:
> >>
> >>   1. Clear the EN bit in ECSPI_CONREG to reset the block.
> >>   2. Enable the clocks for ECSPI.
> >>   3. Set the EN bit in ECSPI_CONREG to put ECSPI out of reset.
> >>   4. Configure corresponding IOMUX for ECSPI external signals.
> >>   5 Configure registers of ECSPI properly according to the
> >>     specifications of the external SPI device.
> >>
> >> And ECSPI_CONREG_EN bit description:
> >>
> >>   SPI Block Enable Control. This bit enables the ECSPI. This bit
> >>   must be set before writing to other registers or initiating an
> >>   exchange. Writing zero to this bit disables the block and resets
> >>   the internal logic with the exception of the ECSPI_CONREG. The
> >>   block's internal clocks are gated off whenever the block is
> >>   disabled.
> >>
> >>
> >> I simply wanted to help you. I don't want to delay your work, so
> >> if you think my approach is incorrect, suggest Peter to queue your
> >> v5 or resend it (once riscv-next is merged) as v8.
> >
> > Thank you for the help. I mentioned in an earlier thread before, that
> > my view was not to fix it until it's broken as the v5 series can
> > satisfy my work. But since you pointed out various spec violation
> > stuff related to device reset, I do think your findings make sense. So
> > let's improve this model together. :)
>
> I'm not mad, just I'm doing too many things and I should rather review
> your ssi-sd series. I don't have the physical hardware (neither know the
> firmware using it) so it is a bit dumb of me to code blindly with no
> possibility of testing. If you think this series is going the good way,
> it would be great if you can give it another try, and I will be happy
> to review.

Sure I will see if I can find a hardware to verify the register write
behavior when ECSPI is disabled.

Regards,
Bin

