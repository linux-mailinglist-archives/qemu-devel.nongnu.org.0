Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87432400D6E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:08:39 +0200 (CEST)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMem6-0000dp-L3
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMekd-0007qG-RA; Sat, 04 Sep 2021 19:07:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMekb-0000Gr-Vx; Sat, 04 Sep 2021 19:07:07 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z18so5731711ybg.8;
 Sat, 04 Sep 2021 16:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXuJbphSoHoS8lKiaW1Rr6K3g11ovmfiJH8iCdMZQko=;
 b=h3ReZ0sD5AoQQGJPdoVczaxXtqcS6FWJ93RzbBGnz6q6sPyjilXh3rYlBvWTXNfItE
 uSndsbWO52YesflT4Hu5CECUYsY8nHqH7fbWxKk5ojgWJGgItFTyNGgrSZJblmWIX4Lr
 JSoIJ9c2vCTXPRgOk/6GxKiMVtFRbnAcxcYMts+aVsdpWjN+WEFMJvoii7RrNiCcvooq
 klXH2Wp5BnHrUxOpuaFkSR58WCtt0L7T77VLAk2gUs8Ac/l8VLXbqSIN6nNWyH3vGpdK
 ndlUzgsI15azIEkDWVcHDYiAWFSTe7i5kVfiwGQml9Ae8I+AuxQpwLpIPQzEunF9z9X5
 FiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXuJbphSoHoS8lKiaW1Rr6K3g11ovmfiJH8iCdMZQko=;
 b=Hod3v2zExFHj6Jf/0EKfjUgND0jigDb7RdeWskoJxCyfymqXmKwltr59X0oVyjiKZP
 /on4WHCpB/vVwq5S9fUn7RsOOzI9+k2pjwKNYcPSbtGJ5L6ZrXZy+2k4Og97VtRMEilr
 /HZJ2WeccHOYtsjpE7RbCs/U41fOBVHmvYxlIwe8FgWsglOznZCIhtc0wk8J1YFoHrT4
 jNlpWZGgw2MsmUIiCzkLHB99pzspSfnVQIBuif4VK4oSOvJAvXPj1q042IqJVEtuRqS2
 Vmxb6eP16Q575GfqK8Kks666N7XiYNZE0dHULNib6lLJdwHh7VY5mZxtREidSg3jGS+C
 NGKQ==
X-Gm-Message-State: AOAM532ASdt53Sinqg6/3YSswjkPeDFetWC6wo0/ZV3OvsTildCcpUbN
 uKVNsucyjdPvcKrjRAAvKDqy4b9SN/0zVVwsRuTcAUUFQIm7CQ==
X-Google-Smtp-Source: ABdhPJyqCOMhXtNTlXSkrkSqnF8asVnZUoabvkqx4cAcG8RVVL5WX4th4aILVe+pgp3xfGV2Ubx97IK/U4SWlvuzM3E=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr7131574ybm.345.1630796824524; 
 Sat, 04 Sep 2021 16:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
In-Reply-To: <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Sep 2021 07:06:52 +0800
Message-ID: <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 1:13 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/2/21 12:29 PM, Peter Maydell wrote:
> > On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 9/2/21 8:58 AM, Peter Maydell wrote:
> >>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> The control register does not really have a means to deselect
> >>>> all chip selects directly. As result, CS is effectively never
> >>>> deselected, and connected flash chips fail to perform read
> >>>> operations since they don't get the expected chip select signals
> >>>> to reset their state machine.
> >>>>
> >>>> Normally and per controller documentation one would assume that
> >>>> chip select should be set whenever a transfer starts (XCH is
> >>>> set or the tx fifo is written into), and that it should be disabled
> >>>> whenever a transfer is complete. However, that does not work in
> >>>> practice: attempts to implement this approach resulted in failures,
> >>>> presumably because a single transaction can be split into multiple
> >>>> transfers.
> >>>>
> >>>> At the same time, there is no explicit signal from the host indicating
> >>>> if chip select should be active or not. In the absence of such a direct
> >>>> signal, use the burst length written into the control register to
> >>>> determine if an access is ongoing or not. Disable all chip selects
> >>>> if the burst length field in the configuration register is set to 0,
> >>>> and (re-)enable chip select if a transfer is started. This is possible
> >>>> because the Linux driver clears the burst length field whenever it
> >>>> prepares the controller for the next transfer.
> >>>> This solution  is less than perfect since it effectively only disables
> >>>> chip select when initiating the next transfer, but it does work with
> >>>> Linux and should otherwise do no harm.
> >>>>
> >>>> Stop complaining if the burst length field is set to a value of 0,
> >>>> since that is done by Linux for every transfer.
> >>>>
> >>>> With this patch, a command line parameter such as "-drive
> >>>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
> >>>> flash chip in the sabrelite emulation. Without this patch, the
> >>>> flash instantiates, but it only reads zeroes.
> >>>>
> >>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>>> ---
> >>>> I am not entirely happy with this solution, but it is the best I was
> >>>> able to come up with. If anyone has a better idea, I'll be happy
> >>>> to give it a try.
> >>>>
> >>>>    hw/ssi/imx_spi.c | 17 +++++++----------
> >>>>    1 file changed, 7 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> >>>> index 189423bb3a..7a093156bd 100644
> >>>> --- a/hw/ssi/imx_spi.c
> >>>> +++ b/hw/ssi/imx_spi.c
> >>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >>>>        DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
> >>>>                fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
> >>>>
> >>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> >>>> +
> >>>>        while (!fifo32_is_empty(&s->tx_fifo)) {
> >>>>            int tx_burst = 0;
> >>>>
> >>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >>>>        case ECSPI_CONREG:
> >>>>            s->regs[ECSPI_CONREG] = value;
> >>>>
> >>>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> >>>> -        if (burst % 8) {
> >>>> -            qemu_log_mask(LOG_UNIMP,
> >>>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> >>>> -                          TYPE_IMX_SPI, __func__, burst);
> >>>> -        }
> >>>
> >>> Why has this log message been removed ?
> >>
> >> What I wanted to do is:
> >>
> >> "Stop complaining if the burst length field is set to a value of 0,
> >>    since that is done by Linux for every transfer."
> >>
> >> What I did instead is to remove the message entirely.
> >>
> >> How about the rest of the patch ? Is it worth a resend with the message
> >> restored (except for burst size == 0), or is it not acceptable anyway ?
> >
> > I did the easy bit of the code review because answering this
> > question is probably a multiple-hour job...this is still on my
> > todo list, but I'm hoping somebody who understands the MIX
> > SPI device gets to it first.
> >
>
> Makes sense. Of course, it would be even better if someone can explain
> how this works on real hardware.
>

I happened to notice this patch today. Better to cc people who once
worked on this part from "git blame" or "git log".

> In this context, it would be useful to know if real SPI flash chips
> reset their state to idle under some conditions which are not covered
> by the current code in hw/block/m25p80.c. Maybe the real problem is
> as simple as that code setting data_read_loop when it should not,
> or that it doesn't reset that flag when it should (unless I am missing
> something, the flag is currently only reset by disabling chip select).
>

One quick question, did you test this on the latest QEMU? Is that
Linux used for testing? There have been a number of bug fixes in
imx_spi recently.

Regards,
Bin

