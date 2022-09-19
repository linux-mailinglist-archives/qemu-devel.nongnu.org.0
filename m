Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD45BD743
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 00:26:21 +0200 (CEST)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaPDY-0005Lt-1W
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 18:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaPCI-0003wP-R7
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 18:25:02 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaPCG-0002AZ-9N
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 18:25:01 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h188so645280pgc.12
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rNSPf6fRXjrTyBrsotNqcVUhBgpBwcgWJnzMUoRRyTc=;
 b=k23zhHcCLtUZd1xR5MIuEa+fw7hz6yEx4n/1V3gmYncPmaBqdh0papsxet2RMeJ00b
 x5wK6uYwg57QyowLX/LsWXlqC9fXicojheCsL2DBWdSILhBC06KYlv25V8pNEUk1+3u1
 U879Jdt4j2c/wHWCQQ4IjzZ7RF98mE3xY8LBLr/CaeCQ4pxP2fYwFV+IMTtfmruK1Tij
 MGXDqC/FtfONESHYh9NEnNq0NwXLTeGS7/7uDkFtaHJXCIHSLSqF/8gApLD7qSQW3p8H
 c74j0guvjF1kJg6CwEMtm4HJCX7FMPsY3QeohJ1cusB0VidFd8WfA2yNSvEefpNyJ6lo
 +olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rNSPf6fRXjrTyBrsotNqcVUhBgpBwcgWJnzMUoRRyTc=;
 b=uykiAW4P/gAW/wVr2gvdHOjZqPCxa46guuLVm7QUlvap+GPzPeevJd98mRaF9qQ6JH
 NLhwV8DGPxNAZ/GLbWAtwieg7FDnxj/SC9AyxpAoovKvH9z0mXtvqlOg9lOCyBZvJh+N
 ircsT13dXgu6ssM7gP8NEBindYSfT/gfWjLdRwYEc+VpFcpjcpeV5IKsArsLJr3iyMuY
 mTIywnW1XLrasC/ZldtuPGC38OTnG4NSqDJGrr0VXDxo4iGd78CgJnwlbYu5tMLjN248
 39jx4lDz4NjyOTRrmMxrF3EIPtRgfw/F266OTEgiSKD1cTE//oHR5dBY8OJBaCBg4VEi
 uTUQ==
X-Gm-Message-State: ACrzQf1lAyPyj2E17TJOjW0V7UeemsjuiuNdu831QlQgYUQ6aK+drx6G
 +53P1aew2kvCUzC9j3/rhSP0LJS84gBHUEN2ACo=
X-Google-Smtp-Source: AMsMyM6PTFIM9eCMHx/rHMompp5P1qRVP95zCyok0fephkFSQAHaTe7ZF+Razuu2QIv7bwUh6nsvycSm0gtyybMs/EY=
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr17467478pgg.221.1663626298751; Mon, 19
 Sep 2022 15:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661934573.git.aburgess@redhat.com>
In-Reply-To: <cover.1661934573.git.aburgess@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 08:24:22 +1000
Message-ID: <CAKmqyKM5BgZhnsLCP_bSaBQ4g_u_O8+RhM2fQOXWDw3eJG5BXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: improvements to GDB target descriptions
To: Andrew Burgess <aburgess@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
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

On Wed, Aug 31, 2022 at 6:43 PM Andrew Burgess <aburgess@redhat.com> wrote:
>
> I was running some GDB tests against QEMU, and noticed some oddities
> with the target description QEMU sends, the following two patches
> address these issues.
>
> Thanks,
> Andrew
>
> ---
>
> Andrew Burgess (2):
>   target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml
>   target/riscv: remove fixed numbering from GDB xml feature files

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  gdb-xml/riscv-32bit-cpu.xml |  6 +-----
>  gdb-xml/riscv-32bit-fpu.xml | 10 +---------
>  gdb-xml/riscv-64bit-cpu.xml |  6 +-----
>  gdb-xml/riscv-64bit-fpu.xml | 10 +---------
>  target/riscv/gdbstub.c      | 32 ++------------------------------
>  5 files changed, 6 insertions(+), 58 deletions(-)
>
> --
> 2.25.4
>
>

