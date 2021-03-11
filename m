Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DE337E30
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:29:08 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQzb-0002ZV-L5
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQeU-00021W-1o
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:07:18 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQeR-0008Px-AL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:07:17 -0500
Received: by mail-ej1-x62e.google.com with SMTP id p8so48465634ejb.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5OtMepEv4JqMWOAYuUrUUrOjczgJ9qV2sF84gvNUT0k=;
 b=G/XDrNnztdPoR/ASMpNuT3/z5DtG5eMlB1W3Wgzwq/VWLCeU4PVbV1r/h8+/3gR/HU
 WSj3yUDZfwD5BU3VmXnBc42AtxxsnTE4zc1AEGsKi1KNodmRXCj3kk/IUMbGFO3hc9U1
 AYDgYQJ5JVJrN3M40FRYBRqVOeIYGbj0j/kdUxDAkc6na6XStWDU0Evr5h1D9DYNxLXx
 rcpyoDQiHF9b05beOkyd75FG6sRyTgYwrgQ2Hps+F1T3fRs4ZW8GUZoDDHF4a6jz/QgW
 cICKPmkK6tfARmqbtthC2xVALKB6NgPrxVp6TO6cmWHhFHxcek/gtNBytAkg/WzqQVh8
 s5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5OtMepEv4JqMWOAYuUrUUrOjczgJ9qV2sF84gvNUT0k=;
 b=nBEWSaXGzwAQAwC08cjR9m9CDQd3PM84C7jkqvplFPWbbObdVclLuCXmn+x0cTuHNZ
 wUgB3zCUORXLyWadiZ3sthLaBFifoJmdDrQf+/Ch0PY0RjuL79+QRQ6lbj8XStrFXxRO
 N0f9Kpxnuk2YvhtxTXuGnNdjzCcYEgX63ybSZRsFlqAO0VacP/6ILIid6OHgxzxBCWc0
 lWN+zx0lSDq8Lj2g5KsSPQ6xWFMfrHVgbEG3fduLOsrPRUnrQxjRcajXvFsTW4u7PzzO
 Do+GFAclhGvIQZNLbRBlvmbv0Cnnon6zNDx47bfkEi99Q4RI6JKRg+USq1HQCoGnh4Lw
 wFhw==
X-Gm-Message-State: AOAM530i99r1LXRaVCwj5TUpUkc/vrxeMcxaMn2vkc35BEd+mFpiDuWS
 MvH1dDDOQ+j8Thlu0HYxk7xf27efz99EHGcak8rzgE6418BrFg==
X-Google-Smtp-Source: ABdhPJwd65KpzEMAmpzCimBlu0vXgCnVOnZ4pHXhNIOCos5KhhtpbW/Yi1akvVfj7c2D5u94Z0cEZZJK24BrL0x+TS8=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr4591207ejd.85.1615489633927; 
 Thu, 11 Mar 2021 11:07:13 -0800 (PST)
MIME-Version: 1.0
References: <MWHP197MB00634EEBA13CDF0F980576C5E5919@MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM>
In-Reply-To: <MWHP197MB00634EEBA13CDF0F980576C5E5919@MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 19:06:55 +0000
Message-ID: <CAFEAcA9gNvv=bown60hBNaMY=WfFqddFVzvUAMT_GPLa9vY_NQ@mail.gmail.com>
Subject: Re: IMX FEC model- modification in interrupts
To: "Olek, Adam" <adam.olek@aptiv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 09:27, Olek, Adam <adam.olek@aptiv.com> wrote:
> We have tried to up and running QNX 7.0 on QEMU 5.2.0 Sabrelite model. Th=
e QNX reach the prompt and was responsive to user command.
> However, starting the network caused a QNX freeze. After debugging the pr=
oblem at QNX and QEMU sites we end up with a solution which requires a slig=
ht QEMU source code modification.
>
> It seem that the hw/net/imx_fec.c is source of the problem. To fix the is=
sue we changed the condition in line 442 from:
>
> if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
>      (ENET_INT_MAC | ENET_INT_TS_TIMER)) {
>
> to:
>
> if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] & ENET_INT_TS_TIMER) {

> Can anyone take a closer look at this condition and confirm that this mod=
ification make sense and it hasn=E2=80=99t negative impact on anything else=
?

There is a massive comment immediately before these lines of code
which explains why it is doing what it is doing, what would
stop working, and what other functionality in QEMU needs to be
implemented in order for the hack to be removed...

thanks
-- PMM

