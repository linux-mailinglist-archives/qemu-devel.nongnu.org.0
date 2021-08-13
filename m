Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B163EAE34
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:41:18 +0200 (CEST)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEMCD-0004y4-Gu
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEMAf-00033i-LO; Thu, 12 Aug 2021 21:39:41 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEMAe-0003GJ-CS; Thu, 12 Aug 2021 21:39:41 -0400
Received: by mail-il1-x12c.google.com with SMTP id z2so9252821iln.0;
 Thu, 12 Aug 2021 18:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2YE3M6FXRW65W1ZJ6O4/UmdH4r055aWSH6uw+saxuk=;
 b=dtMoZuC1J3SYwMOnMLFpkWLA0vz1IudFDZFML5WxilejOPoN2YRL18D6LYyJV+ZsH3
 oVdHFWSXLDyUEpUIt7I1EGY193qPlZXPFU6H58hpPMapqxfAeIChfBmdOIRYKNSeyD+1
 UImzY8EA5g4QWr6N7X9kULJLJWVwk6QYBWfEZ5a3qu71hozHazIgONHhSWcBICScFJls
 44ZwqGKwomQ53ubK8hz81uYx3BY7kh5cyiCfuxzQJxxGBwFLuwU3qtO9pFp5IMT2xlTz
 hSYzyB5d4Y2UbKFrE5X5GsKsbqPIWAePC1R0WmltwTgacoCxlLxpmFV4iLmxlQNip9iP
 y+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2YE3M6FXRW65W1ZJ6O4/UmdH4r055aWSH6uw+saxuk=;
 b=rHwzD3bv7UBzY2r5zwUFokm/2cEm4lJgee4GWR8nxvzER432wyOWqYBykL/0H2hXt1
 5pOptSuNnbaHjlvjHoXeo+fSTpig8Z3smIMyeZKNR/mhjlsV8KgXQWdrS+DeZKeWD3fQ
 5C12fc6mEtXYQmb/H3cJxYGQ5BHF5kmcyY5iDl8MBCTyn42+4ecCirO67JlY/v61p1si
 j0dRPO/UBQbPIzfxbGiuQPtfhQFsjLHvoOSWiJDRR+/7uzr1L8AZx3tBN1sUQ0BBYppB
 P3gDhhCPDwR3H7dH5WskBaVVEktnDG5anTq1wICBeQLhtEV86tK/QD1eNqKXo9BRWb/1
 Xubg==
X-Gm-Message-State: AOAM530BeQrZmQJEua0Kazaxw+ECuGKup1wZZVAtO5fLEv2NA0joX3to
 QtQ57njfLVgnbhSeKPxQtMFolQ9NHcIJDowoa/g=
X-Google-Smtp-Source: ABdhPJw+reefPTpADU0y0ZrxqUSZM+BTFBBcHRySN8NCxYY8Cz38TmVizT0A2ojDDE4bj6EcBUSmYdNw572LFzEir1o=
X-Received: by 2002:a92:8707:: with SMTP id m7mr15471ild.177.1628818779026;
 Thu, 12 Aug 2021 18:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-15-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-15-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:39:13 +1000
Message-ID: <CAKmqyKNQ3DUaw0GYOBjjBLM_GJqFsjotF5vtVPP35X1EV-W7oQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing
 blank line
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:44 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Delete the trailing blank line at the end of the source file.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stm32vldiscovery.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 07e401a818d..9b79004703b 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
>  }
>
>  DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
> -
> --
> 2.20.1
>
>

