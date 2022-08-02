Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D085884DD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 01:45:51 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ1aA-0000lc-1e
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 19:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oJ1WX-0005cl-2k
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:42:05 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:41733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oJ1WU-0001Xy-1i
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:42:04 -0400
Received: by mail-lf1-x136.google.com with SMTP id t1so24077073lft.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 16:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uB6pPWtljZ8gvMCs4EDlavzZjgplepQ9hI377nt/3W8=;
 b=ZR9rTmF3YXkeJEY6yD3tffqVNzds4JXw3eK1qcgSs9MwgDTiTNKmxKFu6Gg/sjfGLr
 E8a0H7KC285BSLbaw9Nlc38BdsuU3FMw5zw8Skv+nPMykHeuX+ysjXqO/KsStH58E5F4
 fwYOmQW1mGHS+2uSlbimUdZmEzTMHzSw7uQsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uB6pPWtljZ8gvMCs4EDlavzZjgplepQ9hI377nt/3W8=;
 b=w8A7oM4Eg0z9KMJY1yxDyVXL/sbHCjVXdUC4YN66HPfaLBjd/vq0BGT9TZk2rTUFpy
 AI7zBJ+YDIcEt5ANUssH0u1+ybxBEE/9lw8WpONZL7pcw6FRkJSM3Pxz+9OsoL02Fvq9
 mBUc0JyYw2J/99jtsmYr/LxtFmEJPrtXXl3H5AATHr9JP+lZsvsEq/QbyQUaffLwBJib
 +y8UveOiZdUqslSzry0Muz9QJecH8pbYSHOWEIoVU3vKdPvfiRZ0MzIGfxNE/RNDFki9
 WRYP1BVQQJM8iLIQE+F9EIMCXrFOgF2VDu17taIiU5gxcAPMBTkyhqLvD3VgldM9GY00
 w9TQ==
X-Gm-Message-State: ACgBeo36sTQiV6bnWprH/m1W8GJl7NMz+vousEsYfJqc+lIQn9TAK/4b
 v+iZj6QEXtSw+H1BCfHDJu3jLK3GTizLPe1mh1qX
X-Google-Smtp-Source: AGRyM1trPg+i66eM6M01Nku1TsNIWjv3BbYl8eWRnvMuzaazDsIMoJdCul/hlLoTRVjAeditYEUU+2sTXA4Sva3WV9E=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr7749956lfu.442.1659483719770; Tue, 02
 Aug 2022 16:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220725034728.2620750-1-daolu@rivosinc.com>
 <CAKmqyKNOtYLubJ0hMaMHY9YO3w21d-S5z3ABKV5KS2UvjA+dRw@mail.gmail.com>
In-Reply-To: <CAKmqyKNOtYLubJ0hMaMHY9YO3w21d-S5z3ABKV5KS2UvjA+dRw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Aug 2022 16:41:48 -0700
Message-ID: <CAOnJCUKANDcUMr0bpivzBmM=DtFn7Hf5LuOYRg+5wxjDcP4_nA@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] target/riscv: Add Zihintpause support
To: Alistair Francis <alistair23@gmail.com>
Cc: Dao Lu <daolu@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 24, 2022 at 9:39 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jul 25, 2022 at 1:48 PM Dao Lu <daolu@rivosinc.com> wrote:
> >
> > This patch adds RISC-V Zihintpause support. The extension is set to be enabled
> > by default and opcode has been added to insn32.decode.
> >
> > Added trans_pause to exit the TB and return to main loop.
> >
> > The change can also be found in:
> > https://github.com/dlu42/qemu/tree/zihintpause_support_v1
> >
> > Tested along with pause support added to cpu_relax function for linux, the
> > changes I made to linux to test can be found here:
> > https://github.com/dlu42/linux/tree/pause_support_v1
> >
> > --------
> > Changelog:
> >
> > v1 -> v2
> > 1. Pause now also exit the TB and return to main loop
> > 2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function
> >
> > v2 -> v3
> > No changes, v2 was lost from the list
> >
> > v3 -> v4
> > No longer break the reservation in trans_pause
> >
> > v4 -> v5
> > Rabase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> >
> > Dao Lu (1):
> >   Add Zihintpause support
>
> Thanks!
>
> Applied to riscv-to-apply.next
>

Did you overwrite your tree by mistake ? I pulled riscv-to-apply.next
a few days back where this patch along with Anup's priv version
fixes are there. But I can't find it anymore. I am looking at this.

https://github.com/alistair23/qemu/commits/riscv-to-apply.next

I wanted to rebase my sstc series on top of the riscv-to-apply.next.
Let me know if I am missing something.

> Alistair
>
> >
> >  target/riscv/cpu.c                      |  2 ++
> >  target/riscv/cpu.h                      |  1 +
> >  target/riscv/insn32.decode              |  7 ++++++-
> >  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
> >  4 files changed, 25 insertions(+), 1 deletion(-)
> >
> > --
> > 2.25.1
> >
> >
>


-- 
Regards,
Atish

