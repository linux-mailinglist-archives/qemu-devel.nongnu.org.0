Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B10484A43
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:56:18 +0100 (CET)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4rmz-0008MN-3l
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4rli-0007SV-Ib; Tue, 04 Jan 2022 16:54:58 -0500
Received: from [2607:f8b0:4864:20::131] (port=37585
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4rlh-0004xv-3T; Tue, 04 Jan 2022 16:54:58 -0500
Received: by mail-il1-x131.google.com with SMTP id j6so29407961ila.4;
 Tue, 04 Jan 2022 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFetcjpQ9Ll1aOkgtM7OHVrBs0K87hP14vdAxwyNvhg=;
 b=IXKpoQ42mp9Vsmz5VHFl93XyofEIa9J07OhKqvfP3Hx+w/D/R33o1Md1UNtoid0dtX
 cc6VkMc9v1kZODaaG+G0a4WI6/AXIGdzzAwRTSUY2nWQpsezu8jWFAmozlUxbjG0k/oa
 EwlERTejE1zDduEUu7EjhHnlPWWZ840tY9JS5mXgKOsUjCLmqeV8Fn/OnFXIGQD6j6FR
 GICtuHJgCFx4LKYYMbJAgbOhlzIHpTd4f8EtoPGX9XGqfX9Bq/n4llqs6PETkunvL0FJ
 8vpqWL1nequMWsPhBleqofDAIg87Eb50DH0HPdppMuF+f1+jyPASj8BYGd4qAYML7OoD
 j7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFetcjpQ9Ll1aOkgtM7OHVrBs0K87hP14vdAxwyNvhg=;
 b=QdPXaiB4Px/GMB8BT3Thqm437gq9tVi7SXxJQCbtkTbS1n+nZU2zZYQx7JzWPXomt+
 HrkIz5M33aEfOTmAqRtJSr2mxecNZlsSJdBpG2zqbv2uYKEkrEOSU3BCB6lhf/Bh6oNo
 e+5s3dy8OtMvhZ/VWkI4UdsF9Hb9SSyQOyPfTUXu8YVoyTd6GmW027frM7B8ffRWrnuN
 CuL4K1XUsbY1907eB4nmT1/9cMX/dKtfOiCBW0Az8mf7vNZ+igBkU+AJT2lbw9kQQp/b
 BAT9Bu9gf3MSusqCxhbEdn9PrfO8/P9KbnFAAk7mHZRJINqbPGx+TwBIuCmdVWXFTFnt
 qo7A==
X-Gm-Message-State: AOAM530BBydWmc23+aqoOIHLvhi3JZVKlKrneaBK9Y00Mmkoq5BuL/LB
 oPm71LIOoXSssXd3kVKY9tONUxJe5feveYlsdA4=
X-Google-Smtp-Source: ABdhPJyN6ckPnSSgYC/ipHB4Z2dsLwJ96AFUjYN5aA5VXf4UpwV1OXIjy130NEg/JwGvdBT4kyN4oWN7xUmawrPa+A4=
X-Received: by 2002:a05:6e02:1567:: with SMTP id
 k7mr23228398ilu.46.1641333295799; 
 Tue, 04 Jan 2022 13:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20220104063408.658169-1-jim.shu@sifive.com>
In-Reply-To: <20220104063408.658169-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jan 2022 07:54:29 +1000
Message-ID: <CAKmqyKMftmh67=nM4Jcre1LOvv9Tf33UuhcOVC-jbdpGkC1XOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Align SiFive PDMA behavior to real hardware
To: Jim Shu <jim.shu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 4:56 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> HiFive Unmatched PDMA supports high/low 32-bit access of 64-bit
> register, but QEMU emulation supports low part access now. Enhance QEMU
> emulation to support high 32-bit access.
>
> Also, permit 4/8-byte valid access in PDMA as we have verified 32/64-bit
> accesses of PDMA registers are supported.
>
> Changelog:
>
> v2:
>   * Fix high 32-bit write access of 64-bit RO registers
>   * Fix commit log
>
> Jim Shu (2):
>   hw/dma: sifive_pdma: support high 32-bit access of 64-bit register
>   hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA registers

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/dma/sifive_pdma.c | 181 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 159 insertions(+), 22 deletions(-)
>
> --
> 2.25.1
>
>

