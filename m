Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9568354F68
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:06:12 +0200 (CEST)
Received: from localhost ([::1]:51324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lThf0-0003pw-N2
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThdb-0003Ne-R1
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:04:43 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThdY-0007hi-0f
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:04:43 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 11so6856171ybe.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=T7GKETn2W69jfH9IGh5oL7gqIuDAjNjNLMJmw24MuPo=;
 b=EqEai+XSihVWa2WYOcL4P5zO0L9zzkC5tbO7abDX/fg1FBwifnpcR2ro+xCw/SOeOH
 cebtoX5DRv4kOGdcA6oFFfhtVB9/gPLvQE3PQ4zTWXLEuhaKEWHzRYMuEj8Eo4/ojRZC
 ut4Req+J04Y2zqKVfZcuYjlfkI3cVdBDqIr32XH0BvqEGmzo3IGnwjBdokX3/dZuVER/
 lGVds2sD6Y1NZybs7Dz7HpHuef623Ju02dF1w/Z58t5khW3xs3sDXnzUmub/RD/ArHax
 kYQh+5wYzrNN3qOLsnCr15KZ/JaYt2W7nWh89vDCff527gMGg9Z01+azdMVWvvUwpziV
 X8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=T7GKETn2W69jfH9IGh5oL7gqIuDAjNjNLMJmw24MuPo=;
 b=fVgy43fzaHZWRFYXX7gx2tITdlnrUnukgx4Lu96NNwhvqN+oL66nmXK5K6EDu+T9Dl
 GsegmyyR8jmeFhip8+g761XRc1zkr6BCZSRP178/M/nqu59T2xnA6gAmorXsmZ35s+uO
 6KY+yxZHhbggEwYV+PMDNnyiwPGVcaZwa8DjJlVm1h7OKG4NIpm3TpFAtgkQUAydnkD+
 sMfeyel+HogeTig+UFP0U5L9uKh7h10aLlUcHfLxbIVSDIwH3KhMKFTeN3Ra3pqXyDS1
 21QJwJCWKUO6lxvi84mS4YjgJzJ3tXrAxRTkYB4NTn3jr4ssfGNU9zkDKfNFWf6fse7e
 orvQ==
X-Gm-Message-State: AOAM531Hq4hiCRUV0iZZmD/bXETYzelMOjhcUJ+9iuW6tSnVTHlqvpfD
 dzrHIoeNkVEjRwSNe1IzVYkU/TJVQ5lwcEvMaPA=
X-Google-Smtp-Source: ABdhPJyRffQ/DRQhl0zIcjPFDMrXAqWwGJ/z/bP4VXmEj4/EOiR0ltWcVAN/gMD5H72JCeqtan5vfK87x0E7HU+FkuQ=
X-Received: by 2002:a25:cfcf:: with SMTP id
 f198mr27308083ybg.152.1617699878400; 
 Tue, 06 Apr 2021 02:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
In-Reply-To: <20210326062140.367861-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 17:04:27 +0800
Message-ID: <CAEUhbmW-RaG-yy_YmL_cFQ-vUS=9_Mw3CmvBCTrkTAiKi8Y2TA@mail.gmail.com>
Subject: Re: [PATCH] nsis: Install *.elf images
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, the QEMU Windows installer does not include the
> following two RISC-V BIOS images:
>
> - opensbi-riscv64-generic-fw_dynamic.elf
> - opensbi-riscv32-generic-fw_dynamic.elf
>
> Update the installer script to include them.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
> Based on:
> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307ff6c
>
> The above commit does not land on QEMU master. I am not sure what
> the process is, sending it here for comments.
>
>  qemu.nsi | 2 ++
>  1 file changed, 2 insertions(+)

Ping?

