Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3B903A3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 16:07:01 +0200 (CEST)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycse-0008UF-7R
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclX-0003ls-Pb
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclW-0003tr-R0
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:39 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46869)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclW-0003tJ-KT; Fri, 16 Aug 2019 09:59:38 -0400
Received: by mail-ed1-x542.google.com with SMTP id z51so5175100edz.13;
 Fri, 16 Aug 2019 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZjf4PlAGOeVzKxNgv+ofsLzu+5Szi8gd8NA52sIoZQ=;
 b=dZQzQXpwu3uhDQzNHk2vyUrdhv8Nf+PvIUBLY7tMdor+k5LORnh4Kregwe5xrWobLQ
 RHJzbETpIyh9qh+tgBeWid17qoeUu+D3fEWwVLggL19UCyYoEORkFnTTp8GZ1t2G3XYl
 ikqcNu68ly8Lz2F5U6IJD7bDmfWz543UiRdqH3u0UzoDwU+q/sQpHMolZ1qvlaMGAoAP
 0XiWR536PyuADrF/4FUJZilDhOdbwSD4Y0+eZ3fH6sVpsi1T7mP7O2bo82eiZVLAmnk3
 1NVFNT1SMYCjq6JGwdRT+rRUq//UAI9yBVBX9EDJbRxp6vCQzH6yNTMC/EUIMHr+cyY0
 7gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZjf4PlAGOeVzKxNgv+ofsLzu+5Szi8gd8NA52sIoZQ=;
 b=dxTP9fG6akjYUXHN0PZ7FNZOjHGTDrt+wXHGLdsm///+UscnRdhQS3ocgGUZVKvDoE
 dH1aAUjqv1WkRhfd4q+PPcWcMwxoEok6lGt4FPhmflV4GWXbet1qo6hoKy8U5JZdF884
 Z51ze5ipRZ3Zu0CUUxnvEzOwLI9HvUrU28eAeyRJtjaSXW7rYsRAmebUskJe4FXLdiWj
 zTRLOMwNJtuZ5T/tzrXHTs9T7QDjxAdj3XGIUJG0iGhS9BQ1J4iegpLffanfh3ha+/9r
 vI8bV4QNbYQBT8F1O87vs8Dfd0DMjiLde11Ma/jh20yykbNsQbjW520bmGiLPEtt4E4L
 5aaw==
X-Gm-Message-State: APjAAAV1vWbXAfdMNIpDdEQF9lSouLXBotEy4306ob7mAOhi5DX93gpY
 ixACzdj1YAfU5+ogf+7Az/JPyr3il9dzIBQSx4E=
X-Google-Smtp-Source: APXvYqxEhakauWrOuWbK1qlQekaya7JkdX+W1jZHntUTn2f4Nhz9ZbeswTVtOr0Wm0FUP7bGIJi23auP1gN+R9EgIw4=
X-Received: by 2002:a05:6402:14d6:: with SMTP id
 f22mr10785077edx.180.1565963977843; 
 Fri, 16 Aug 2019 06:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <7e476df36a8c2ba53162e9a5f62e9fa171da00ad.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <7e476df36a8c2ba53162e9a5f62e9fa171da00ad.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:25 +0800
Message-ID: <CAEUhbmVfgZPGgimuke=2S2TOyUN2FXsrKc4AwJ-nd0VhNu-vvg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v3 7/7] target/riscv: Convert mip to
 target_ulong
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
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 16, 2019 at 5:44 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The mip register is an MXLEN-bit long register. Convert it to a
> target_ulong type instead of uint32_t.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

