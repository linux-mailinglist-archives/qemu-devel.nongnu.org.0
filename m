Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656C217BA7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 01:26:08 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jswyU-00069B-S8
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 19:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jswxi-0005Yu-3X; Tue, 07 Jul 2020 19:25:18 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jswxg-0002vM-Cr; Tue, 07 Jul 2020 19:25:17 -0400
Received: by mail-pf1-x444.google.com with SMTP id u18so3790562pfk.10;
 Tue, 07 Jul 2020 16:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6cqNQxuw3Y/V6NftgLNlTn8/nswH0Ipil9VUR+5sfr8=;
 b=G3AD20sMSb8K+vX7FN1U++dDQ13SVgseoJS3RI9xC2s7A6APAMN2cLy82IUqG0qgVT
 Kc8Y+myF1sZNjDC+NgLxx1gF4bAyGRAkgdY/3NOHcMaFnDeqQv2djx03UKHZCzGdAzLM
 Rt6Nr7poz+Gyumr3y4k5QKwbIlf59sfN2jABUXYCE+fZQW79Y7z523oombrP8NCv+hrw
 LwI2WxR9BtJ+cfIYblPO7y/7G0c4DbmUrt9WequeGJ7q9Vbgt2bf+d7iCr2wxFBf5YXn
 Kw+N91F+80iRkOwJ+Ot0MjeGmpcvjyUvEn/92GVA8DTNhDsH55e2f5/h6d4YLDoLqWIN
 MNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cqNQxuw3Y/V6NftgLNlTn8/nswH0Ipil9VUR+5sfr8=;
 b=EQaxh+0AIy2PhhKyG7LNQYFML0+pLDppD+7XySeCz4j1myPiz0TTdqIYIKyCByBwtU
 dZUYl18NP1auH28Jw66e4oh/VVN9gFD1asRWn6UZSMXwtqJXXGBxgX/wCvD6PqBxqqwD
 jayhDMLx8moZek89wPat6QZdwn2JLqxBGImQNpGhSSKsLE3Yut9NMm2NeqK2yyFEu69k
 AE2LLBwRQCjHLzvt6O2Yl7iGsC5lSj3y8ifirdu84VYF+yPIdTcUDoo4SqBdIbnr/MPC
 xM4MK31fiWiFVuXf2N8CVLAq6kOBRQpT3p+Hl3X2L87Dn3AvaJwETKLqiD32bjvCQmQ4
 S3Tw==
X-Gm-Message-State: AOAM532PNWYJKHgL8biDsrzSuRPqU00CeRr5tSW9muKrQBNvkHK7OLWe
 6ITxk+/uHWRxlhBNEFWjpmdRRPG7qBKtETqwwgvCl++T4wU=
X-Google-Smtp-Source: ABdhPJxUmq0Q/1VmXrXld35CqWvO6BJW+FxmFeuN6hJBkxD0bexjjkXUBuLdxrivPHF+D9MA1C4o5ptuyQ5Wyg+MK34=
X-Received: by 2002:a6b:640f:: with SMTP id t15mr13395576iog.175.1594157447109; 
 Tue, 07 Jul 2020 14:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
 <1593746287-19251-7-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1593746287-19251-7-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2020 14:20:58 -0700
Message-ID: <CAKmqyKPiU3uZ11q1HtxwP0A-_3vNmaOutvmh6M_xajqb8c8cbg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] gitlab-ci/opensbi: Update GitLab CI to build
 generic platform
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 2, 2020 at 8:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This updates the GitLab CI opensbi job to build opensbi bios images
> for the generic platform.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v3:
> - Generate fw_dynamic images in the artifacts
>
> Changes in v2:
> - Include ELF images in the artifacts
>
>  .gitlab-ci.d/opensbi.yml | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
>
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index dd051c0..fd9eed4 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -34,18 +34,14 @@ build-opensbi:
>     when: always
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
> -   - pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> -   - pc-bios/opensbi-riscv32-virt-fw_jump.bin
> -   - pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> -   - pc-bios/opensbi-riscv64-virt-fw_jump.bin
> -   - opensbi32-virt-stdout.log
> -   - opensbi32-virt-stderr.log
> -   - opensbi64-virt-stdout.log
> -   - opensbi64-virt-stderr.log
> -   - opensbi32-sifive_u-stdout.log
> -   - opensbi32-sifive_u-stderr.log
> -   - opensbi64-sifive_u-stdout.log
> -   - opensbi64-sifive_u-stderr.log
> +   - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> +   - pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
> +   - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
> +   - pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
> +   - opensbi32-generic-stdout.log
> +   - opensbi32-generic-stderr.log
> +   - opensbi64-generic-stdout.log
> +   - opensbi64-generic-stderr.log
>   image: $CI_REGISTRY_IMAGE:opensbi-cross-build
>   variables:
>     GIT_DEPTH: 3
> @@ -54,10 +50,6 @@ build-opensbi:
>   - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
>   - echo "=== Using ${JOBS} simultaneous jobs ==="
>   - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi32-virt 2>&1 1>opensbi32-virt-stdout.log | tee -a opensbi32-virt-stderr.log >&2
> + - make -j${JOBS} -C roms opensbi32-generic 2>&1 1>opensbi32-generic-stdout.log | tee -a opensbi32-generic-stderr.log >&2
>   - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi64-virt 2>&1 1>opensbi64-virt-stdout.log | tee -a opensbi64-virt-stderr.log >&2
> - - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi32-sifive_u 2>&1 1>opensbi32-sifive_u-stdout.log | tee -a opensbi32-sifive_u-stderr.log >&2
> - - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi64-sifive_u 2>&1 1>opensbi64-sifive_u-stdout.log | tee -a opensbi64-sifive_u-stderr.log >&2
> + - make -j${JOBS} -C roms opensbi64-generic 2>&1 1>opensbi64-generic-stdout.log | tee -a opensbi64-generic-stderr.log >&2
> --
> 2.7.4
>
>

