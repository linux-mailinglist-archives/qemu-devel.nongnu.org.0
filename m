Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C453FF436
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 21:32:02 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLsRM-0005XT-P1
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 15:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsQE-0004Ox-80
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 15:30:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsQ8-0002VJ-Qv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 15:30:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id n5so4661756wro.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDgYTaZPd7fIgaqSd2LJvUg0u8gA8KQxliFRygtGFJM=;
 b=u4183SyGPMqn86XxNfKuH4///StAm8zYgLSkagvy3+3NQqzs0Hq5HvxQ/9p1oJsRlI
 yHHOxUvIIYxPA28/w0W0k38GBAYEQs4SGN86V34p+AxgB+d/b0p85AFdoYrzrIVxNcZv
 Hr7vgVgBlBo/OUX0uBsum6+wSSD6FCNRtLNGj73/qRV70qc6KD0nguSn0i+Ix+XGZIfv
 U7XreJiBWcctM5BYAL28J8kJKtf445JbSZckDmliqwcckBI0JKMtUE5t1U70JhoD85EM
 5VPcod/1YBtuxKcIMqyW9cPRkglMRKus7ZhdI/5tRfGi+ORwtD1zHxz9RlOuCYSHH7+W
 dt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDgYTaZPd7fIgaqSd2LJvUg0u8gA8KQxliFRygtGFJM=;
 b=g8bHZ5+W5OQ4JnkJwmuddMYyDHOSKytaDXuTGDL/I9A9qTQcahiDjbKd+5uQoPRujs
 yJoGZj+8e0PDCnhshRF48mAHLGwqThof9TFmAaj5IvR7CS9TeJ+K2oF24pQEXs88LDnP
 zNAWPiylycwe43PLj8uAG3vAtHDRAzyvUakuE6DFL8MsW4QjWcvaK0Hlz60cjoxNiSGC
 iUrYhjrM2cq4ddHc/epr6KKFemxXWk4ox7msPfW4PrUoddC+HL3I/FQ380eAWCoqu7O7
 1tjOukjQK2d78iIBAZPeGMTWoj2XAS+J/v3TozbvOzBWyyV/m39whm5vIHsrnUwygxn+
 NUJQ==
X-Gm-Message-State: AOAM530evv6Ny4ziE8sLKD+76goHWdSHFG+2TqUp/qpWr6KQLGXrnLzI
 0BxJ7X0JGZhCob5agYZqGbIrswgW8RNzJgIGp3CGhQ==
X-Google-Smtp-Source: ABdhPJyQfCzkwyyrliDvYajmeKmpp2OabBqoFFAnRSaLSZE+7h8IbEenJ9/rORrvv6/bds/k1t48FnxPZih/ix3by6c=
X-Received: by 2002:adf:b748:: with SMTP id n8mr5614986wre.133.1630611041455; 
 Thu, 02 Sep 2021 12:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
In-Reply-To: <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 20:29:52 +0100
Message-ID: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/2/21 8:58 AM, Peter Maydell wrote:
> > On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> The control register does not really have a means to deselect
> >> all chip selects directly. As result, CS is effectively never
> >> deselected, and connected flash chips fail to perform read
> >> operations since they don't get the expected chip select signals
> >> to reset their state machine.
> >>
> >> Normally and per controller documentation one would assume that
> >> chip select should be set whenever a transfer starts (XCH is
> >> set or the tx fifo is written into), and that it should be disabled
> >> whenever a transfer is complete. However, that does not work in
> >> practice: attempts to implement this approach resulted in failures,
> >> presumably because a single transaction can be split into multiple
> >> transfers.
> >>
> >> At the same time, there is no explicit signal from the host indicating
> >> if chip select should be active or not. In the absence of such a direct
> >> signal, use the burst length written into the control register to
> >> determine if an access is ongoing or not. Disable all chip selects
> >> if the burst length field in the configuration register is set to 0,
> >> and (re-)enable chip select if a transfer is started. This is possible
> >> because the Linux driver clears the burst length field whenever it
> >> prepares the controller for the next transfer.
> >> This solution  is less than perfect since it effectively only disables
> >> chip select when initiating the next transfer, but it does work with
> >> Linux and should otherwise do no harm.
> >>
> >> Stop complaining if the burst length field is set to a value of 0,
> >> since that is done by Linux for every transfer.
> >>
> >> With this patch, a command line parameter such as "-drive
> >> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
> >> flash chip in the sabrelite emulation. Without this patch, the
> >> flash instantiates, but it only reads zeroes.
> >>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >> I am not entirely happy with this solution, but it is the best I was
> >> able to come up with. If anyone has a better idea, I'll be happy
> >> to give it a try.
> >>
> >>   hw/ssi/imx_spi.c | 17 +++++++----------
> >>   1 file changed, 7 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> >> index 189423bb3a..7a093156bd 100644
> >> --- a/hw/ssi/imx_spi.c
> >> +++ b/hw/ssi/imx_spi.c
> >> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >>       DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
> >>               fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
> >>
> >> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> >> +
> >>       while (!fifo32_is_empty(&s->tx_fifo)) {
> >>           int tx_burst = 0;
> >>
> >> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >>       case ECSPI_CONREG:
> >>           s->regs[ECSPI_CONREG] = value;
> >>
> >> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> >> -        if (burst % 8) {
> >> -            qemu_log_mask(LOG_UNIMP,
> >> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> >> -                          TYPE_IMX_SPI, __func__, burst);
> >> -        }
> >
> > Why has this log message been removed ?
>
> What I wanted to do is:
>
> "Stop complaining if the burst length field is set to a value of 0,
>   since that is done by Linux for every transfer."
>
> What I did instead is to remove the message entirely.
>
> How about the rest of the patch ? Is it worth a resend with the message
> restored (except for burst size == 0), or is it not acceptable anyway ?

I did the easy bit of the code review because answering this
question is probably a multiple-hour job...this is still on my
todo list, but I'm hoping somebody who understands the MIX
SPI device gets to it first.

-- PMM

