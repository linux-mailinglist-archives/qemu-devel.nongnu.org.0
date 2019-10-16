Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0850DA201
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 01:14:38 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKsV3-0006gi-An
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 19:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iKsUA-0006CL-1G
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 19:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iKsU8-0001TL-Rq
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 19:13:41 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iKsU8-0001T1-KU
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 19:13:40 -0400
Received: by mail-lj1-x241.google.com with SMTP id 7so459149ljw.7
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWFRF4RJ0QSt4UwT65kWbkwBZSAvB9dTyKR5CLZQGYw=;
 b=FQkpTZ2zw0h7snDHWXKV2Gl1hkjVBzSdQTESuSk3rZfJTUZvdQLx6uwEmbDpy9mpJU
 9NUltdY4qIwfBCYpkNrgDyPoc9oFHIf5x8pu4eqL7lgHFXZEVYOWpjZFjrJi7rDyr+BJ
 n/uyINwjP0EBjzP3emVyRSp2P9dUTn/sC8acCSjYw4nA81kvcMCP0YFQyX4toJdC2ekn
 Wsf3FrE2lO9Z7tJRifzl0zkY7vXUndR/LCdRQihrWAW5mzocQDVtBSwhJsoNH9izqTij
 iOGj9fr1lanyCMRHpvRXmgQiiYv2hM7yV4QSF5OyoVCVM4gNz9B0094WPj7LtjeM+x79
 FxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWFRF4RJ0QSt4UwT65kWbkwBZSAvB9dTyKR5CLZQGYw=;
 b=NIizRqEBdLN3DidsTQaIy1k64SuzWmYdqQ4cVeoxdM79n6J3R2B9XmYeTRYaFs3nDz
 0wkvMDmNc5TShSXJ9Ck5176BwcOIcimSTxIYafGF92HXc0dNeL09tkm2AJ6q1de+PRxO
 I3sg+Yh6EQQMVQggYSP8uzU6OqK5ZLy15TOQdOioO1QdiU0rCA3IrRQf8hrNyIiE9yKW
 dM+SMvMvqPprXXtIgEHufzOaCnJP6+GrOBV9gpABNhxmO8mZXvfrXcBkIUq1twsBZj56
 MR3e9OJGGNT4DqMXgYcw84alFy/WEM4XNYvCiEwak7ZiVAjiaIP19qGWgMPvy0My8uqa
 clLg==
X-Gm-Message-State: APjAAAU7+D0btq6tfVUHOaUSF7ezsPGGL1bcPulcendenNnj2GCCfnBV
 CiUV4gwilGBbiXNIR970xTXYD0QfLGDZOsgkIps=
X-Google-Smtp-Source: APXvYqxU3Ix6eXJd0wFxAR/ov6eg1nsF/aByloQM9VAAn560jRZY9uzjPGvB8vh30JkrRrjPhL5HBY9Bd4CGrJ19ACQ=
X-Received: by 2002:a2e:9604:: with SMTP id v4mr363363ljh.101.1571267619152;
 Wed, 16 Oct 2019 16:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <1571035899-9692-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1571035899-9692-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Oct 2019 16:08:31 -0700
Message-ID: <CAKmqyKPtXc4LOeaSyCdh=T3qgM8e+F=oiasbynH1VfTnofOrVA@mail.gmail.com>
Subject: Re: [PATCH] ssi: xilinx_spips: Filter the non spi registers
 transactions
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 13, 2019 at 11:51 PM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> ZynqMP/Versal specific qspi registers should be handled inside
> zynqmp_qspi_read/write calls. When few of these transactions are handled by
> spi hooks we see state change in spi bus unexpectedly.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/ssi/xilinx_spips.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index a309c71..4f9f8e0 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -109,6 +109,7 @@
>  #define R_GPIO              (0x30 / 4)
>  #define R_LPBK_DLY_ADJ      (0x38 / 4)
>  #define R_LPBK_DLY_ADJ_RESET (0x33)
> +#define R_IOU_TAPDLY_BYPASS (0x3C / 4)
>  #define R_TXD1              (0x80 / 4)
>  #define R_TXD2              (0x84 / 4)
>  #define R_TXD3              (0x88 / 4)
> @@ -139,6 +140,8 @@
>  #define R_LQSPI_STS         (0xA4 / 4)
>  #define LQSPI_STS_WR_RECVD      (1 << 1)
>
> +#define R_DUMMY_CYCLE_EN    (0xC8 / 4)
> +#define R_ECO               (0xF8 / 4)
>  #define R_MOD_ID            (0xFC / 4)
>
>  #define R_GQSPI_SELECT          (0x144 / 4)
> @@ -938,7 +941,16 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
>      int shortfall;
>
>      if (reg <= R_MOD_ID) {
> -        return xilinx_spips_read(opaque, addr, size);
> +        switch (addr) {
> +        case R_GPIO:
> +        case R_LPBK_DLY_ADJ:
> +        case R_IOU_TAPDLY_BYPASS:
> +        case R_DUMMY_CYCLE_EN:
> +        case R_ECO:
> +            return s->regs[addr / 4];
> +        default:
> +            return xilinx_spips_read(opaque, addr, size);

This doesn't seem right. This should have no functional change for the
read function and has the consequence of not printing the memory
accesses. If you try to debug this code now you won't see all of these
operations in the log.

> +        }
>      } else {
>          switch (reg) {
>          case R_GQSPI_RXD:
> @@ -1063,7 +1075,17 @@ static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
>      uint32_t reg = addr / 4;
>
>      if (reg <= R_MOD_ID) {
> -        xilinx_qspips_write(opaque, addr, value, size);
> +        switch (reg) {
> +        case R_GPIO:
> +        case R_LPBK_DLY_ADJ:
> +        case R_IOU_TAPDLY_BYPASS:
> +        case R_DUMMY_CYCLE_EN:
> +        case R_ECO:
> +            s->regs[addr] = value;
> +            break;
> +        default:
> +            xilinx_qspips_write(opaque, addr, value, size);
> +        }

For the write code it looks like this skips the "no_reg_update" goto.
Maybe that is the issue that you are seeing?

Alistair

>      } else {
>          switch (reg) {
>          case R_GQSPI_CNFG:
> --
> 2.7.4
>
>

