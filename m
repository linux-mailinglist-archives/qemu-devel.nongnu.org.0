Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FF2E7557
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 01:28:06 +0100 (CET)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuPLR-0003Jv-9U
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 19:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuPKO-0002tq-BV; Tue, 29 Dec 2020 19:27:00 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuPKL-00077C-3f; Tue, 29 Dec 2020 19:27:00 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id f6so13632833ybq.13;
 Tue, 29 Dec 2020 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9Gayo8SON4ARYVcEAffYy9bjn3xlJFO9Q7xDae2CzY=;
 b=inb367k+n+MwUzXNecwfZmhBz5935jGvg2IQujVhQbSKQLPc77E0hWRW6rgHmMqMyI
 rP61s9j75DIvVNqbGh10Ls63t3Z9Nc3MEdAf74BYOwh6EcHPmoKMO4cX88tropY6AvLI
 1odQhF2JKfJ1RLwj/eFu5PgMHXfNbh4rHKt6Ws4ZrTR1xd97T+gQgpefWBoAxksMYx8D
 FkHP18Jk5aQVas2IGW7O2Z4xJrwDDDwL2KovNUP8G/Jdt2k5Lcb72BOnyqF1Q73TJYNW
 fYkbMZq7sED2LXP41qivVBagBlFPv4976JJ2cEDitn9d+77vDSk7kLCIRRWIG3BnhuSU
 wVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9Gayo8SON4ARYVcEAffYy9bjn3xlJFO9Q7xDae2CzY=;
 b=B2tySd/1NWTLBY8sd7dVDbdWI4kPq7MlalOFUs++KRVkeP48St2O6M9BZqNGqVYDyW
 2rLXFDA3rnzv/Pi38Sqy0WSe6FLDvOzK0x1lwvWC9+hmoDVon6guu9ITO7dCEw3a5S69
 hpACBcU741J2D8zIbVgxMWtzQwH2bGlf6SLHefmyzF0+hqmreGgBXjqEtuEHLJTOfFhT
 6KNclvBA7FdqrpZ8O2NRRbeTcv+BL3EELho9sV4cWOF90IhzXwVYOJXr3gg8ySrRWf+x
 sYu3m/YwSC+oxaVoUdOwlTlA/dWn3YCxMgiXAA4FG888t1w3cffMWqsAvCrlv5HDgjYT
 nqiQ==
X-Gm-Message-State: AOAM53216pggOqZBC058bwIqeOnLMvrWRfCLBQ64/G/Z/nSUueSrPYvT
 yY1zpN7lSb9Be20ytGsBTjCsBcMzsT1+yEvp5Yw=
X-Google-Smtp-Source: ABdhPJy1ZncBparQ1ffd5OuDewEHiFLnjBJ/xLnKrMBrE/aPGIzQbfq0ugEZ1KiSCzdHNpAVLipCNeVOr0yrUyAUN1c=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr69451137ybi.517.1609288015808; 
 Tue, 29 Dec 2020 16:26:55 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
 <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
 <CAOkUe-BWEVpzwHLPzUMzuUK12RQdUds-tCEWcyhrZeWDh9AaHw@mail.gmail.com>
In-Reply-To: <CAOkUe-BWEVpzwHLPzUMzuUK12RQdUds-tCEWcyhrZeWDh9AaHw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 30 Dec 2020 08:26:45 +0800
Message-ID: <CAEUhbmWcNqNMzipVvYMgVsJH7dTwZv8qMYFdpzvCSNRGVH0NsA@mail.gmail.com>
Subject: Re: [PATCH] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sylvain,

On Wed, Dec 30, 2020 at 12:37 AM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Thank you for your remark here is the new patch:

This should not be put into the commit message.

Previous commit message is missing.

>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Regards,
Bin

