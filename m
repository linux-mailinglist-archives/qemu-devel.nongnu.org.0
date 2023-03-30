Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6C6D0169
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:38:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpey-0007C6-Pr; Thu, 30 Mar 2023 06:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1phpev-0007Bi-CS
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:37:33 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1phpet-000557-2L
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:37:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id eg48so74484056edb.13
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1680172649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrp2nc79hmP6gZWz+K/IudJbWjVK7reyf83P+i3Me2c=;
 b=m1XC1ND+U8MbIgHc7KCpgq81pUQL8HY9ZHWE4Hs60ZaYZF7ynUwIM4tEJb7HX0fQJO
 kbZA+cyeCMwCoip5z3IJYFbY+j5KhToFA9BJxmW47Jj/KZ8ltKwLnuw/ZOMnlbB++7eJ
 TRxjgWXe06HcTZbqSY299omw9ruBg1x3kd5Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrp2nc79hmP6gZWz+K/IudJbWjVK7reyf83P+i3Me2c=;
 b=cV5U0KD7HWYgacDpZkxaKUjCNLmRfC/7l9e+y/ulmH18vgvQhTLTf3l358CE5cc9fS
 UbrWhhSGfB6IFAwBsK8/0VhoP25bd3f2YzLTdGufZMGs8ZrhuR/IehgO3qzfkflU9zGe
 67gamAsBqRJo+gVzkRemayEpJwiuozBSWvkNQIJsMgtAlciX5fVOWRxui5x+ExPl/ysc
 ye17V+uw1EQZ9A3y2D4yMy0a9wcwxCeXHbLSw5pqZUjid+0Fo3oShgNbcqEPqMl1w722
 mYLZhbkpCgyfh7n5ZlC/zHAXN+DFnmn9+T7/DZe8l5d+y1Qx5DvbBJvSRkcwTGY/BRAc
 CmYg==
X-Gm-Message-State: AAQBX9dG+Q+kbyge0mYI1Dg9i4Cq42RnlWpdMH5k+K4Ty6tuR4I8MYTe
 XcGyM7n2IOIbOAzlbiSDo+oewQN0Hi0om7ph+BwyFAUu8jw=
X-Google-Smtp-Source: AKy350Z6d0rMJADI3S8rDs1CzW60SvoP3Hc8Y8gBiMyj4Si8+afFj6Ndp0PLNFx2uJLnL2bjkTtcQRlcYr93otzFbtg=
X-Received: by 2002:a17:907:6a95:b0:947:72cd:9325 with SMTP id
 ri21-20020a1709076a9500b0094772cd9325mr456531ejc.15.1680172648838; Thu, 30
 Mar 2023 03:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Mar 2023 10:37:16 +0000
Message-ID: <CACPK8XebHkZ=08kDkYhZFmoZyOOSBcVynSY90qWe58cviCNYJQ@mail.gmail.com>
Subject: Re: [PULL 00/15] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Mar 2023 at 22:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit d37158bb2425e7ebffb167d611be01f1e9e6c8=
6f:
>
>   Update version for v8.0.0-rc2 release (2023-03-28 20:43:21 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230328
>
> for you to fetch changes up to 87e303de70f93bf700f58412fb9b2c3ec918c4b5:
>
>   softmmu: Restore use of CPU watchpoint for all accelerators (2023-03-28=
 15:24:06 -0700)
>
> ----------------------------------------------------------------
> Use a local version of GTree [#285]
> Fix page_set_flags vs the last page of the address space [#1528]
> Re-enable gdbstub breakpoints under KVM
>
> ----------------------------------------------------------------
> Emilio Cota (2):
>       util: import GTree as QTree
>       tcg: use QTree instead of GTree
>
> Philippe Mathieu-Daud=C3=A9 (3):
>       softmmu: Restrict cpu_check_watchpoint / address_matches to TCG acc=
el
>       softmmu/watchpoint: Add missing 'qemu/error-report.h' include
>       softmmu: Restore use of CPU watchpoint for all accelerators
>
> Richard Henderson (10):
>       linux-user: Diagnose misaligned -R size
>       accel/tcg: Pass last not end to page_set_flags
>       accel/tcg: Pass last not end to page_reset_target_data
>       accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
>       accel/tcg: Pass last not end to page_collection_lock
>       accel/tcg: Pass last not end to tb_invalidate_phys_page_range__lock=
ed
>       accel/tcg: Pass last not end to tb_invalidate_phys_range
>       linux-user: Pass last not end to probe_guest_base
>       include/exec: Change reserved_va semantics to last byte
>       linux-user/arm: Take more care allocating commpage

Thanks for getting these fixes merged.

This last one (4f5c67f8df7f26e559509c68c45e652709edd23f) causes a
regression for me. On ppc64le, qemu-arm now segfaults. If I revert
this one I can run executables without the assert.

The segfault looks like this:

#0  0x00000001001e44fc in stl_he_p (v=3D5, ptr=3D0x240450ffc) at
/home/joel/qemu/include/qemu/bswap.h:260
#1  stl_le_p (v=3D5, ptr=3D0x240450ffc) at /home/joel/qemu/include/qemu/bsw=
ap.h:302
#2  init_guest_commpage () at ../linux-user/elfload.c:460
#3  probe_guest_base (image_name=3Dimage_name@entry=3D0x1003c72e0
<real_exec_path> "/home/joel/hello",
    guest_loaddr=3Dguest_loaddr@entry=3D65536,
guest_hiaddr=3Dguest_hiaddr@entry=3D17411743) at
../linux-user/elfload.c:2818
#4  0x00000001001e50d4 in load_elf_image (image_name=3D0x1003c72e0
<real_exec_path> "/home/joel/hello",
    image_fd=3D<optimised out>, info=3Dinfo@entry=3D0x7fffffffe7e8,
pinterp_name=3Dpinterp_name@entry=3D0x7fffffffe558,
    bprm_buf=3Dbprm_buf@entry=3D0x7fffffffe8d0 "\177ELF\001\001\001") at
../linux-user/elfload.c:3108
#5  0x00000001001e5434 in load_elf_binary (bprm=3D0x7fffffffe8d0,
info=3D0x7fffffffe7e8) at ../linux-user/elfload.c:3548
#6  0x00000001001e85bc in loader_exec (fdexec=3D<optimised out>,
filename=3D<optimised out>, argv=3D<optimised out>,
    envp=3D<optimised out>, regs=3D0x7fffffffe888, infop=3D0x7fffffffe7e8,
bprm=3D0x7fffffffe8d0) at ../linux-user/linuxload.c:155
#7  0x0000000100046c7c in main (argc=3D<optimised out>,
argv=3D0x7ffffffff1c8, envp=3D<optimised out>) at ../linux-user/main.c:892

Cheers,

Joel

