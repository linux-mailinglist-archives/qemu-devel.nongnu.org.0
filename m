Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1EA9039E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 16:05:32 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycrD-0006tP-Vo
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 10:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclF-0003Up-7w
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclC-0003cN-MF
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:21 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:42877)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclC-0003bN-GX; Fri, 16 Aug 2019 09:59:18 -0400
Received: by mail-ed1-x541.google.com with SMTP id m44so5187573edd.9;
 Fri, 16 Aug 2019 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VsEqMwtvUOPRshmNKS1IPrYSvQe9ypQylshpeYg0tp0=;
 b=lVbsLB1y9M5GkmjPwhh94vcGhBRA2XkUuWaF1JGoZouWznISqyiMOQJBAcP1I/wujs
 H+RqtmZrm+J3jnxnM5RiuGxzXfJM+gpanbeQh3oM2VB5XLv4G/fygLDxPL5NInx9wLI7
 vFuuPoBbqTTSpNLtmaZe5iXoX9qNr5PINxfUSBOBEhx8J6e6IretdyNViG2AoYHzBuV6
 p5X6XkgBcmcIsWhCmGAjDJ+yI1Y9Zxj8Br9AQ1g1KxxvIVmYeoc26uB1FKCJTp1d9+zu
 j9qOn1ephRwZq5V0H2wdphdMNilT9jaj6C3JwdhaWaOp3OxLkdeDJ+MNOLzvLtz98r4I
 IRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsEqMwtvUOPRshmNKS1IPrYSvQe9ypQylshpeYg0tp0=;
 b=NNSUPaOlyQF/dK194QuADN8GXOibj3hqh6qbFPzSeUdgX6SP4dWPeAWReB2LDuCQXk
 MDnbsF1BTQ/tu8XcJsHchFi7Eu8pgPHzZrsBGrHJiy4uxNiNH6gqLP4AzgrUnKqpoLU+
 s27zl4NiqVOHdKI7BWIeEwMLr/zfOESYkX9+Vy6xFlBP9izOUC9Rn4qKMtWP31DkJfOy
 D/5xsGtqUzNWY21zbQTgu5l7cleqd/SM8hazVbfBNHYzGYgwCrgqjrVcmYS8an62MpQV
 mI3IG6CcUAO3CBzZZsF0hxuG0awwwuE+P5n1/zaBV8lLxDqolg3FYgKM3Q+axi7nZ+92
 MaJg==
X-Gm-Message-State: APjAAAVgVSKTNP2tNc0naybDoUmdm9sxZdbhCUw4YxzefCqb6YS1bAyy
 e4BxplBxIqLilEIv8ThnejrPz/yd4tl00pPTjaI=
X-Google-Smtp-Source: APXvYqz6lruVCkME6EKl+khqPSELpHog5sXZlrI6jxubp9FJ6c1IQkgtVxgMERJMrSO/pH1Z46XLdXHZcoev1GGoNBk=
X-Received: by 2002:a50:8687:: with SMTP id r7mr11014496eda.137.1565963957055; 
 Fri, 16 Aug 2019 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <1a5abeb9acb758a24daddc5ca8ecd56229a73cf1.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <1a5abeb9acb758a24daddc5ca8ecd56229a73cf1.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:04 +0800
Message-ID: <CAEUhbmXVPsfbEhX5JHqm8JjffG=2MWvf-j562q=SJ++y6Hb2fQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v3 1/7] target/riscv: Don't set write
 permissions on dirty PTEs
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

On Fri, Aug 16, 2019 at 5:41 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Setting write permission on dirty PTEs results in userspace inside a
> Hypervisor guest (VU) becoming corrupted. This appears to be because it
> ends up with write permission in the second stage translation in cases
> where we aren't doing a store.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

