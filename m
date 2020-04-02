Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2319C7EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 19:25:54 +0200 (CEST)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK3bF-0000Mv-JU
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jK3a0-0007aF-M1
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jK3Zz-00024b-Q1
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:24:36 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:45961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jK3Zz-00024P-Ly; Thu, 02 Apr 2020 13:24:35 -0400
Received: by mail-vs1-xe41.google.com with SMTP id x82so2875498vsc.12;
 Thu, 02 Apr 2020 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+GesOk1+6PETBtTbbLRdBl6FhGJsXGy10qpnFGgeJ8=;
 b=bJSJc4J3yG/eGh8k68tFGI1IBnmWj1b1fayNK4C6I/b+dP18/iUxHEa3Lx3J10fz1K
 lx1Qc1rBTASWD3MO9K66Gm8FJo/sc9AtivhQi8X9ft03jppLSF+q0RnaSQTZ4mTpru0s
 kwv3+pNBq5hPzW1YCEnxUgsv/CBkSwA6DQr2ZdnfLwWKheKE//YfDgkLHOqilgfDxKT7
 AeaWaXs5i+rmCSZEG5L0WDc98p0rafWQ6RSFlJlXKu4DySgVTI8qu/pg8sn+6VQ3TYYh
 LVJYoy7UR+k3LhQDzmXidDlcPmW4hKfKtGHSVl18zQ1erJ8mjN5ukGcmYMGC5lohbbew
 A/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+GesOk1+6PETBtTbbLRdBl6FhGJsXGy10qpnFGgeJ8=;
 b=Xye41fmWNnQZuuDWg7VHknH0KOndo6tf3epkzbXlelFB7P+As2y3H5xF6lr/RJZieU
 eig32Tweoz+Xnn3vsxlUGUhMguSsw+U3Gtlt7+aUFagAY/bHkbiCsA4FbrT0C0ykA+2q
 UlmV3KjLRunUy82m7h1hkhKHI+eGdEo+S2mi0jXij/zqu0M6ng9sB0EtqqW+jyP0f/uC
 nwyPppIoR3VIE2B81gYtw91p0fCo9yuDEUf6MPRDWP8VXBEpffelDdj0nKTVkEE2z2TJ
 K5oX1liAslmOWw6zyynbfSFNBwNQ1vd7MWu+EAs55KC/i7wxslKfGxDDT9Ee2UwLDG0F
 zhlA==
X-Gm-Message-State: AGi0PuaLGahaSCl/MCHza0g+NiwQfBFtKdOxmNMG5ma9n3pYxy1SDj5J
 vvqhNHrtvCQloAplltfQP/0TCje9FPM1bNnVWwgGcGDm
X-Google-Smtp-Source: APiQypJdxLq5PljA/aLvRC8RPTaFrZfioiruxQ8+37Fm4J2OYo5wqTnfR0oyavMubYEc5nOsXqK9sBKW7hqnYeIlB9s=
X-Received: by 2002:a05:6102:730:: with SMTP id
 u16mr2960891vsg.70.1585848274998; 
 Thu, 02 Apr 2020 10:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-5-edgar.iglesias@gmail.com>
In-Reply-To: <20200402134721.27863-5-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Apr 2020 10:16:23 -0700
Message-ID: <CAKmqyKMhxT6BTssk=Lx9g0ffBex+fxb6ZSE9GeCCeE0sFc4pVg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] dma/xlnx-zdma: Advance the descriptor address when
 stopping
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e41
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 2, 2020 at 6:47 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Advance the descriptor address when stopping the channel.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx-zdma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index dd893bc420..e856d233f2 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -514,7 +514,6 @@ static void zdma_process_descr(XlnxZDMA *s)
>      if (ptype == PT_REG || src_cmd == CMD_STOP) {
>          ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
>          zdma_set_state(s, DISABLED);
> -        return;
>      }
>
>      if (src_cmd == CMD_HALT) {
> --
> 2.20.1
>
>

