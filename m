Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE81EDC77
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 06:46:31 +0200 (CEST)
Received: from localhost ([::1]:35566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jghlu-0004c4-6j
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 00:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jghkX-000414-6p; Thu, 04 Jun 2020 00:45:06 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jghkV-0001i2-UZ; Thu, 04 Jun 2020 00:45:04 -0400
Received: by mail-io1-xd43.google.com with SMTP id h4so4850609iob.10;
 Wed, 03 Jun 2020 21:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogI7e5eIF7rsTtyFaoBuI2FjGRdcMJQ6Dzfn9Dk0wak=;
 b=d88n/yk5Makj1DreQbN3LNm6kDpl5FjVSFPLfSSMuKWdztVlTCv3FiEbhzSUvJ7k5B
 w2Ywpw4qLXxrXtFgMpqUjz3pRFOpToQOtNbzsXdaFaYEYV7yHkBC4MEDrviANai05Jch
 TGRx/MPg6DZeVbIgNKlQ0/cX8KvVxknSZ4WmMONGAqvyfZmKufFKUi61TP36CHiP0cu2
 FNwZmoQw2cU5Cjv8skrXMQ0ekx5VCHJpnlNUY+vtmzxOQoO0WoUNX8FAfKOmLA/2RTcw
 1jfdoBrXrv0jw1R9eQKEhmN4/2Iuw5pWT35s6qxkT/CUN8Xc2sHmM9IfkPopKLc9yaOc
 k1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogI7e5eIF7rsTtyFaoBuI2FjGRdcMJQ6Dzfn9Dk0wak=;
 b=RORJM31JDc17gjyS90bwX4IQ0Tk0js2+eCe2Yq9xaszor9CSDVzCKD+MwrhMSzKpZr
 rUyEePwdiKSvnVqTwE+E5l+E9lXRxXPJ4x0x6feL7AX2FWLYJDC5LvwKkieX+NltHWZI
 pNUTTM8On1Vaxdon3ZFz87bkTO0nP/+F2A6vO7xA50R6yY3CMxZncsyDihYY2olpfLYK
 XZli9fhOvDxFPNmpVaa5SMQw+u+Ph9UlN+xfeZkiht+Tcnz0Z0KBeNS0p3AeQhdbPAET
 gulWJ92D05JH0PezPepIPtTJMrmbX1DgmXlKQ+h4IJSAQPTDkBpUGjs2f5BhSO6wgJDd
 l3hQ==
X-Gm-Message-State: AOAM533B4cGrcKNK3HK5yy5nPzmt7xwNB9Y/mmtIk46kfniVx5BUw8AX
 ld1xt40P5/oVsNrZLNXQjjJVQE5oA0wpGEsakvQ=
X-Google-Smtp-Source: ABdhPJx6lQJMfrZ46ro/P1DG22M+8ndur1oIpFiKuyvJ6liPoj8Qw8k2LKncQEAnOYorgO90y1dLuuPAlNM+oD4i7ac=
X-Received: by 2002:a02:cccd:: with SMTP id k13mr2713187jaq.135.1591245902176; 
 Wed, 03 Jun 2020 21:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <73cce2d0edd0d41ba15df403a2096bfa70bf0565.1590704015.git.alistair.francis@wdc.com>
 <cc1a1671-b926-bb31-1ed2-d2920f0faf38@c-sky.com>
 <c9f16143-4e9b-a3a8-ffd3-12d43fd2e343@c-sky.com>
 <CAKmqyKM6rigjbDoFh0bfq8gJXJ=+H+onh=DXjCzhAijMCvR16Q@mail.gmail.com>
 <ec0a7545-1793-d1a9-fccf-068496cf1f0a@c-sky.com>
 <CAKmqyKOvv2HCpXoD+8E5q2S7JqSDfT7_z3+_=cKFLi+H92itjw@mail.gmail.com>
 <aa240d2d-42bb-b9dd-90f0-1a3051c2491f@c-sky.com>
In-Reply-To: <aa240d2d-42bb-b9dd-90f0-1a3051c2491f@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2020 21:35:50 -0700
Message-ID: <CAKmqyKN3QBadrqzohWe0uwiCPcjU9WFHF_4j0dsKehszsZ4AWg@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] hw/char: Initial commit of Ibex UART
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 3, 2020 at 6:59 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
>
> On 2020/6/3 23:56, Alistair Francis wrote:
> > On Wed, Jun 3, 2020 at 3:33 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >> On 2020/6/3 1:54, Alistair Francis wrote:
> >>> On Tue, Jun 2, 2020 at 5:28 AM LIU Zhiwei<zhiwei_liu@c-sky.com>  wrote:
> >>>> Hi Alistair,
> >>>>
> >>>> There are still some questions I don't understand.
> >>>>
> >>>> 1. Is the baud rate  or fifo a necessary feature to simulate?
> >>>> As you can see, qemu_chr_fe_write will send the byte as soon as possible.
> >>>> When you want to transmit a byte through WDATA,  you can call
> >>>> qemu_chr_fe_write directly.
> >>> So qemu_chr_fe_write() will send the data straight away. This doesn't
> >>> match what teh hardware does though. So by modelling a FIFO and a
> >>> delay in sending we can better match the hardware.
> >> I see many UARTs have similar features. Does the software really care about
> >> these features? Usually I just want to print something to the terminal
> >> through UART.
> > In this case Tock (which is the OS used for OpenTitan) does car about
> > these features as it relies on interrupts generated by the HW to
> > complete the serial send task. It also just makes the QEMU model more
> > accurate.
>
> Fair enough. I see the "tx_watermark" interrupt, which needs the FIFO.
> At least,
> it can verify the ISP.

Exactly :)

> >> Most simulation in QEMU is for running software, not exactly the details
> >> of hardware.
> >> For example, we will not simulate the 16x oversamples in this UART.
> > Agreed. Lots of UARTs don't bother modelling the delay from the
> > hardware as generally it doesn't matter. In this case it does make a
> > difference for the software and it makes the QEMU model more accurate,
> > which is always a good thing.
> >
> >> There is no error here. Personally I  think it is necessary to simulate
> >> the FIFO and baud rate,
> >> maybe for supporting some backends.
> > So baud rate doesn't need to be modelled as we aren't actually sending
> > UART data, just pretending and then printing it.
> >
> >> Can someone give a reasonable answer for this question?
> > Which question?
> I see  the UART can work with many  different backends,  such as pty ,
> file, socket and so on.
> I wonder if this a backend, which has some requirements on the baud

The backend should be independent so it doesn't matter what baud rate
we choose here.

> rate.  You can ignore it,
> as it doesn't matter.
> >
> >>>> 2.  The baud rate calculation method is not strictly right.
> >>>> I think when a byte write to FIFO,  char_tx_time * 8 is the correct time
> >>>> to send the byte instead of
> >>>> char_tx_time * 4.
> >>> Do you mind explaining why 8 is correct instead of 4?
> >> Usually write a byte to WDATA will trigger a uart_write_tx_fifo.
> >> Translate a bit will take
> >> char_tx_time. So it will take char_tx_time * 8 to transmit a byte.
> > I see your point. I just used the 4 as that is what the Cadence one
> > does. I don't think it matters too much as it's just the delay for a
> > timer (that isn't used as an accurate timer).
> Got it. Just a way to send the bytes at sometime later.
> >>>> 3.  Why add a watch here?
> >>> This is based on the Cadence UART implementation in QEMU (which does
> >>> the same thing). This will trigger a callback when we can write more
> >>> data or when the backend has hung up.
> >> Many other serials do the same thing, like virtio-console and serial. So
> >> it may be a common
> >> interface here. I will try to understand it(Not yet).
> > Yep, it's just a more complete model of that the HW does.
> I try to boot a RISC-V Linux, and set a breakpoint  to a watch callback
> function.
> The breakpoint did't match.
>
> I just wonder if there is a case really need the callback function.

AFAIK Linux doesn't support the Ibex UART (or Ibex at all) so it
shouldn't be triggered.

Alistair

>
> Zhiwei
> >
> > Alistair
>

