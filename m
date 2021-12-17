Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515E478230
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 02:35:54 +0100 (CET)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my2A4-0004TD-Kj
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 20:35:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my27N-0003az-0L
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 20:33:07 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=39653
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my27L-0006k7-9a
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 20:33:04 -0500
Received: by mail-io1-xd2b.google.com with SMTP id c3so911739iob.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 17:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ls6miQ+GqoBucTFu1t85ng3KERrkD1gBvXOPsVBUmWw=;
 b=bprd/SrknrxmMga0/4sRIBj833arOsoXyAYEXnAMd4LbzVQNrjr+H5ZWZKiwMnAaQn
 xs8Qr/5xj18Fp4kTwG/NCYJY6ByyyTH4prdcDIKy0jcPBSWVQZRRc0k25KG8XtUjLPIu
 NylUVbuMSmDn+qcfDINgP7JCrayCBQiVMspG0ft+eigwThsA1bLxnXB89Zdiy8l9zPL9
 Nt0gRK6Q/s1nJo8sXJAEEchpR8jdK+SyMw+K6k6W3WQZE9xro53Vtf3qZUvjskr05p3S
 aJmPtvJ7C0QqlPaAU8UjG0Tr36vfl17eLg7Rtk+co6Qlnf6ZsaA++ytBs0y0QYA7YKU0
 CEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ls6miQ+GqoBucTFu1t85ng3KERrkD1gBvXOPsVBUmWw=;
 b=AF+WGYWSawIrN9T1Dqdi3DwdKRl/Rm/jL0Es0tIB8umHzRKIiRTGDxNqDwIvSqAEBu
 WVbAOXuopdWdzte1iXQWIg0eTa8NhQL8GlZhJlnKSFTg0Dm44HtADn9GToPC9m7lR6uU
 jWuBNWMh9185Y3Cb675YJSQz4M1FPtekGZeEwOm56PWedXYFeukeWJCpgRoN13iDoC7V
 +pluWNzSq0jR20HzM+HaBdjenZG1/vAryBN8UhwdBG0PQMNZG9TMObe/H63/vI5sxF3T
 1KA9YzU0+7xQSoPKqFsDLjT/tVwictMeI4KmGqWlzfxtIQBrUEeLuuK41FIsR8C7c5Pp
 huhw==
X-Gm-Message-State: AOAM5327vuPA3YSsf6awtZ6LMtYjbP4jsfXmPKp9x+DQF6Erw+RR7PBP
 Ni18O9SIzt/ON6jV1B4m4wpeSjhxBt6SqGsnZnk=
X-Google-Smtp-Source: ABdhPJyUcdOqtRnfP/m12Q7h1qq+D9rZDfkP9pQ+OE1yagIOQ4b/I85U+DmQYaCy1ra+NMowa37tgg1llvy2BV2u+tw=
X-Received: by 2002:a05:6638:12d3:: with SMTP id
 v19mr429419jas.318.1639704781409; 
 Thu, 16 Dec 2021 17:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20211216073111.2890607-1-raj.khem@gmail.com>
In-Reply-To: <20211216073111.2890607-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 11:32:35 +1000
Message-ID: <CAKmqyKPCDF4TjK7m2=HEjrNhnUw-YoyBvBUJv60BzvFoP=2F6g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
To: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

