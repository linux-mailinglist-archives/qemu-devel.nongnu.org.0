Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14B3F447D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 06:54:34 +0200 (CEST)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI1yj-0005ZM-5G
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 00:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1xL-0004hf-PI; Mon, 23 Aug 2021 00:53:07 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1xK-0002dq-EI; Mon, 23 Aug 2021 00:53:07 -0400
Received: by mail-yb1-xb35.google.com with SMTP id a93so31763782ybi.1;
 Sun, 22 Aug 2021 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Sg7F41rWj5fWwWwi1SiKJUBZlkf99+Sqr6Yl2j0wgM=;
 b=PaQH/SyrHvXVZ/GZ/jUsaKwEOPq9Dwn3lkwRTVPZa7hzA2HFtBBxY5wLSwC2bE7JCp
 W/diaLqCZZvFRTty2W8HyTpjQA+e7e+sLrB1gm2fg1oct4PUljoIdiDWW/t8qxy/QZgM
 n4Kt+3o9ejamzzP0rJfAO7GxzvS7p0U4yuQl3Q0bkhXWhyvQuKhg47G0CEY7SUtibZaJ
 pjbBOX/2+zZEp+of4801cclADwxf6GVIL0m2JsXyrroZ4WXZKtRUJ6CkNo48lfO7LZ1J
 czLCn1DUivccIDnxtleoPKztA24ttR3im7H6g/7GtIEuRty62t7nBUnNLnhjdwIPlP0V
 2Emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Sg7F41rWj5fWwWwi1SiKJUBZlkf99+Sqr6Yl2j0wgM=;
 b=bzzTuVpSLGNyjE4O17MMECfX3CoFfO96pq1Q64CzbG/zrmxcbGPTYej6M+GvKz5xLm
 dwATro54yKDLBxTvOAFqHucXJ1u5ucBz0wHP78VT5CyIu9NdSuwEtSIZI7mEIfpJZF0S
 KVkOs4lO/zIYN0QtUqnuaCSQz3aATiTO61IMT/ARV1n9dnkpRP2igIiJXZaui1dGrR2e
 H7k8BupeKb7m4eN5tdF/Q4ifDRFjoiK8Un61JKUFIOk1QVHAEmO+vR3ZUWJ5cmzA+XPx
 SP+wnDDwZX4wUD2z0Y5y5JQkI264wfxoE5jvCTbYMmVkmXFAOb66Z5LjjDivsAsHBime
 35vw==
X-Gm-Message-State: AOAM533/oDLpB65q13xfeRRDXZxXiO8tCVNdmYJXMXTex9yvW5AqD1Q8
 2xABej2UMEm61ONIFZoXU4nL1JYcW61VFSyTvdY=
X-Google-Smtp-Source: ABdhPJzBl0x5P90RBH1gu+fbpqGjhFDsh/wxEfROPQ7b6BcqZPkCPmE/Wr9vRL3K/kiyisZCC3ZmK41bw05dyp3cygc=
X-Received: by 2002:a25:be09:: with SMTP id h9mr43557708ybk.239.1629694385258; 
 Sun, 22 Aug 2021 21:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 12:52:54 +0800
Message-ID: <CAEUhbmUscqN-8fe2BwJ3dRN63fJd5qVPQnnM+ifm5qjt1pPdhw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 12:43 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > At present when input clock is disabled, any character transmitted
> > to tx fifo can still show on the serial line, which is wrong.
> >
> > Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/char/cadence_uart.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index b4b5e8a3ee..154be34992 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
> >  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
> >                                 int size)
> >  {
> > +    /* ignore characters when unclocked or in reset */
> > +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> > +        return;
> > +    }
>
> Should we log a guest error here?
>

Not sure. Based on my past experience of many hardware, if the input
clock is disabled, accessing the whole register block might cause a
bus fault. But I believe such bus fault is not modeled in QEMU.

This change just mirrors the same check on the Rx side.

Regards,
Bin

