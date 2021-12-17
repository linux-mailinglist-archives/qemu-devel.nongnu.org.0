Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEB478462
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 06:13:54 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my5Z3-0008CH-1a
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 00:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my5XH-0007V0-5C
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 00:12:03 -0500
Received: from [2607:f8b0:4864:20::d34] (port=43843
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my5XF-00049k-Ik
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 00:12:02 -0500
Received: by mail-io1-xd34.google.com with SMTP id z26so1361681iod.10
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 21:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dJfbTUFvL5LZFs58Q8PBmIrBSoc1uKFbuIN+j4jTNA=;
 b=Jc5eNSKv82ZgZwFVjguyGdt48w3ni5+jYtjuN5xAKieYfJBJW5l7Lpr2r42CqOyjlg
 W85VpatGC13N3tuBhtG5kLiVFgFwES94MowCdehH5uAHBo0LqXstGOtutuJ+rVLyzBcM
 BzHK7kVBzQhQZRJl+EO3Jhvz7BXFk5WD/iMBY+uobYvKcDlJ0GLG5D07MdHO2K8ULiyK
 Dufm1l3AZioVRr1QaMx7+742m5X+WCRfuMqhspFY7qtfaRmz+e30paaNAmLxub8OY0+d
 Z7QrCYQ4udh8smekuUKt5U2sEsG25gVjxPy2MnhXFvq7+CSjW/LDQpfET/n3MFbl0HR0
 caZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dJfbTUFvL5LZFs58Q8PBmIrBSoc1uKFbuIN+j4jTNA=;
 b=L+GeIvbDibVyancBodk7l/AOcRGffjT4fZtxcqj/qcCjH8FDC/J1yUsVtyV17VTTN/
 22zaY6gIavPjJbmcpbXKD4QyWcLQEpKY9xkNOr4Z9vdmXIOZJAg+xWJXybLLjof4kabO
 kHwjs4kH9KT4bt8xubgxUhYoBNcivfaNXNckId02C80d061g7EyQ9Pnbw2/CSU6vzJhP
 pyF/2/NqYHxFqDGDjrGPMNnIZJDzag5cw2jPfrXZEefAiAUZUvm+EzU8w1AH4Eci9rwi
 hNfXUalsVMp1N/QCcwmYMWVpa0wiY/Dqaxl64P/QHj4tCw9oWe8GY7BjdZDrP4Q+/ed2
 l0RA==
X-Gm-Message-State: AOAM530p2ST0KF9yza4QLk8RT9Nngguk9T6vqFxPqxLORIZL8f++gclm
 rb5OV73aVpwOnxFIsfkx1UcOy7SRMk8IU8wd3tE=
X-Google-Smtp-Source: ABdhPJzx68tum6Z0zT8RkdPQkeGaX478AkeltsfB6aliLuol4Gm3hmW688Ztfh+4Zqww/AEeaZqAWOwBeaydo1X1ptc=
X-Received: by 2002:a05:6638:2603:: with SMTP id
 m3mr835568jat.206.1639717920669; 
 Thu, 16 Dec 2021 21:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20211216073111.2890607-1-raj.khem@gmail.com>
In-Reply-To: <20211216073111.2890607-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 15:11:34 +1000
Message-ID: <CAKmqyKN8kcZtTEJSVJ56PRayQKHyjOTOSMRRK4F25v242rnwRg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
To: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 5:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> 5.4 is first stable API as far as rv32 is concerned see [1]
>
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  linux-user/riscv/target_syscall.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> index dc597c8972..9b13161324 100644
> --- a/linux-user/riscv/target_syscall.h
> +++ b/linux-user/riscv/target_syscall.h
> @@ -45,10 +45,11 @@ struct target_pt_regs {
>
>  #ifdef TARGET_RISCV32
>  #define UNAME_MACHINE "riscv32"
> +#define UNAME_MINIMUM_RELEASE "5.4.0"
>  #else
>  #define UNAME_MACHINE "riscv64"
> -#endif
>  #define UNAME_MINIMUM_RELEASE "4.15.0"
> +#endif
>
>  #define TARGET_MINSIGSTKSZ 2048
>  #define TARGET_MCL_CURRENT 1
> --
> 2.34.1
>
>

