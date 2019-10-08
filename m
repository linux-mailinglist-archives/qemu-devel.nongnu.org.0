Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B7D02DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 23:31:46 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHx57-0004a7-1W
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 17:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHx2i-0003Dk-Ov
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 17:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHx2g-0005Eb-L6
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 17:29:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHx2g-0005Dc-Ey
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 17:29:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so3697968pgl.10
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 14:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IPyug0eKjmtK9KcEfNbD4dlgh7p9fSLfUM2RjELR0uA=;
 b=Cs7MtZO6OZjzzEfAgBqJNRMGM7CUfQEzy+2MpB2S6v6MkTRzdkL48vAmCELhLWqSUS
 wtKuP0KKyuwURSSy+wPwPIQUEs42xGdKJv4e7NV/1Ejpjz+hQPCiDLn5zBMAd1e2zBl5
 Xnz7J+mW68pLhWQffJd+W3NGf48dISk/oshRImxv3WtTzrSnrB+D1u/jdoVNszmgyomG
 Mu4NT3i1RahF1NhRKC0Oyfc6lhOizdzRH0Flexc6whhWzyltwWr8Ff0/EMDVxcha1Mhz
 MNgkLxz38/WTWCvX6gJS64dFU5KfXLySRUE57DpC/QGOJbC1xSvgwqIpWYUErDAoV1ID
 DAkg==
X-Gm-Message-State: APjAAAUJ+hVfKfSQlpWmmgZUTAW/3RnvlxX/oVmOFLfT5t9QiIgPMXeS
 5zCnVYUoWhIT+5Y2aVedyP/XJSqXlnM=
X-Google-Smtp-Source: APXvYqwx7PHot8EtneQjKkbc669OX4FVPF4bSbOL2G2Znqy/wPYJtXhLqe6RHU0R5NoahGkwnH5ncQ==
X-Received: by 2002:a63:d03:: with SMTP id c3mr537495pgl.174.1570570152667;
 Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y2sm72597pfe.126.2019.10.08.14.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
Date: Tue, 08 Oct 2019 14:29:12 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 14:29:04 PDT (-0700)
Subject: Re: [PATCH v2 0/2]  RISC-V: Convert to do_transaction_failed hook
In-Reply-To: <cover.1570567870.git.alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-0b0d87ea-8019-4226-b65c-76bdfc0c4189@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Oct 2019 13:51:46 PDT (-0700), Alistair Francis wrote:
>
> The do_unassigned_access hook has been deprecated and RISC-V is the last
> user of it. Let's instead update the RISC-V implementation to use
> do_transaction_failed instead.
>
> After this series I used the 'git grep' regexes in
> docs/devel/loads-stores.rst and these are the memory accesses inside
> target/riscv:
>
> monitor.c:102:        cpu_physical_memory_read(pte_addr, &pte, ptesize);
>
> cpu_helper.c:262:        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
> cpu_helper.c:264:        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
>
> translate.c:782:    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
>
> gdbstub.c:328:        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
>
> All of these look safe to me.
>
> v2:
>  - Rebase on master
>
>
> Palmer Dabbelt (2):
>   RISC-V: Handle bus errors in the page table walker
>   RISC-V: Implement cpu_do_transaction_failed
>
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu.h        |  7 +++++--
>  target/riscv/cpu_helper.c | 23 ++++++++++++++++-------
>  3 files changed, 22 insertions(+), 10 deletions(-)

Thanks, these are in the queue.

