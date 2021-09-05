Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F9A401036
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:32:33 +0200 (CEST)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtCC-00043P-8m
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMtBM-0003Cz-BW; Sun, 05 Sep 2021 10:31:40 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMtBK-0006nm-I6; Sun, 05 Sep 2021 10:31:39 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id c206so8170004ybb.12;
 Sun, 05 Sep 2021 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rT3ahWbaqmiKdsa5tc1dyxdcZABw2kJmABOnlLhtHPc=;
 b=WP9jx9G/h0UtVCte9ftigguLLYcIBDk0mxL4zPEsZhhkwtuptQs59ZtA2Xm76A6FgK
 HJufGYuXrq5eKazIxXnDNKwuhybfHck/i5F0bAl9nMz3N+IdLb59gg2oka3W6xUCocPp
 cc/AByGhL9wqEKrJ0QN3i59uHCd508UOdqjXRCwDwTQ7Jtomn54JYMPOeoGK80UJpBMN
 9TB+xSSZkV1Yq4bWaNStdE5qsl2z7Ld4YRTKbICKaRDwD26U9ol7Aac/fsCbg4Ly3j/o
 NCILCLMoXH+80tGhCp3DUKBavXR8GeE+R2OOgoUJ4oso8nhBInIWJszbGUNeTy0Fs9Sa
 n+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rT3ahWbaqmiKdsa5tc1dyxdcZABw2kJmABOnlLhtHPc=;
 b=CGTvoCcMWRXUx0EVZSt9MVFRTgXYF1rwjWJwMgW/kmfrlUst6fs0kNoACVy2iYkAN4
 uL3M1CMz9Ulb4jUNxfdX1hSMWdKGFHFTaOclAwdlrWcOpXGXJ7eNp2Ff5I8kmv5gN0mq
 pn/3S02tCRWF5R26e5lnsfgIrRshDki+zKkh5NK3XemZFPN71ngtlSkb+E6tcbmqfFP4
 cRxQRWNhTOgz87PN43MP5t1VWTfPze0H+Zqp4BcuJEr+1IL8FcUuZGwIfCfZh4p99YQv
 RK/bNHGhdQyUPpMh1vHoJoW3h0Q4CVTu2HtEIRm5o9YsDG8xL4s6UOTjSmvDeY8EgpQI
 +Mig==
X-Gm-Message-State: AOAM530nq9FFggn0xLWbFsS2pGz+pGDxjbWvsjoxKs/H8zTX/jN18pzF
 BpxRrpca+PNvq7yHEhUKk5UlWCH91I7gUClgJoo=
X-Google-Smtp-Source: ABdhPJwUCmxg/AEmI7T8ws8qt5JFle8wS7p5w5JdIt80RilS29o/iVTZivTePwN6YyrFvIItWHKhm5Aqw7jbzpYMngk=
X-Received: by 2002:a25:ac87:: with SMTP id x7mr10730427ybi.332.1630852296160; 
 Sun, 05 Sep 2021 07:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
 <869636f3-6e6a-d5d3-e377-1634f8165aa4@amsat.org>
 <bf3ad08b-f1c8-317d-6378-3e33b5279573@amsat.org>
In-Reply-To: <bf3ad08b-f1c8-317d-6378-3e33b5279573@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Sep 2021 22:31:25 +0800
Message-ID: <CAEUhbmW7ecA8YYqQS5Q7BrFd3xzU1UwicFV_wj=kNy5hc+KZ8Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read, write}()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Thu, Sep 2, 2021 at 2:11 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/2/21 8:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/1/21 5:27 AM, Bin Meng wrote:
> >> Read or write to uart registers when unclocked or in reset should be
> >> ignored. Add the check there, and as a result of this, the check in
> >> uart_write_tx_fifo() is now unnecessary.
> >>
> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - new patch: hw/char: cadence_uart: Ignore access when unclocked or in=
 reset for uart_{read,write}()
> >>
> >>  hw/char/cadence_uart.c | 15 ++++++++++-----
> >>  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Just realized it is simpler to implement MemoryRegionOps::accepts().

Is there any guidance on what condition falls into
MemoryRegionOps::accepts() to check?

For example, should we move the register offset check to accepts()?

It looks like only a few codes implemented the MemoryRegionOps::accepts().

Regards,
Bin

