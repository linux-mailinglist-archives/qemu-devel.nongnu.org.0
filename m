Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924168E1BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:13:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUKu-00063A-Nk; Tue, 07 Feb 2023 15:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPUKs-00062w-N5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:13:02 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPUKp-0007BD-Jk
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:13:02 -0500
Received: by mail-pg1-x52f.google.com with SMTP id u75so4636513pgc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j27AC1CIY5/xsTOmxXypYn2GQcC/r9Cgs1XLNPO7unI=;
 b=V94t/olel7ZoxukRceKlBe8014mAWUgkBBO4Mm+B+yX80hE5M5tSy3MJBQTFyRTfAy
 ZNNjSRG693rVHUIFslFteOeB837YoO5oCm/296qSlTE93Q0XhXV/75899vup4H902SMr
 0cvdxe/9OWmQEheUQ4BXgcG+mZoX1EWh1lSDFyhNZRtklA9oFg7TpvFsdQ5EnLxnmhFW
 qfa8Ei5zpw1FsJWjtKKBYXvrNAkPp8VxFE538ABlKCe+a1tGyyKkG04k7bB0YbriAcBT
 SMYXkBZdPeMrG9i/qW0YtNRt+tGViTUHclco7oEeRE31jn1t1VQiEV3lpx1Wx/5gGWl0
 kwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j27AC1CIY5/xsTOmxXypYn2GQcC/r9Cgs1XLNPO7unI=;
 b=NTWsVFs+riQ6Xe2ptoWLt2lejjDR/yfrTqp6mm58wxucDc2tJVesBCq6tn2P6etHoR
 2OkHVg3vN4QD3Hg8kxtm0LziCOCqB/R2M+Tn52KqKSzc2JjmPCkVaitdrPmYfiKt6u+b
 N3wEbDlX7DyyZOU8J8EYAJdKCwxUeNmMIppg7zEIFduY3DJeJp27hyKGmu1V9xFiRLfw
 n5GuEPtupS+laTARO7Oj57FMrQ+ErGLs66j4dNd6TxfNRbsJPxOVI1yewGimMhDjghss
 ek95+9lAZZzqBOiLwvhL95ds1hdV5V+aR00d6XG3sEAvtdtNCfktssMfLJZuk97XpAf8
 EzvQ==
X-Gm-Message-State: AO0yUKUlDpyxTFll6eKEas+mIc7azQXF4+KEGfnqkgDH2SJfraHycukV
 +Sr0kBj7i6lDmaPNCIu2j8kfyi7CU+i0egHJIXLoPA==
X-Google-Smtp-Source: AK7set84q+obkZFtcqMN2zN9aFqToDPhoNCNpwCPMylSAvGwtKoPlvcKNuokq2A6xvZfoSXrgcMmk4rXNLus+87NrMQ=
X-Received: by 2002:a63:7207:0:b0:4fa:b562:f29a with SMTP id
 n7-20020a637207000000b004fab562f29amr839975pgc.120.1675800778120; Tue, 07 Feb
 2023 12:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 20:12:46 +0000
Message-ID: <CAFEAcA842S_AQobUb7Zmkn=WOghNeJXeV37_g3AnzQnrgRDNgw@mail.gmail.com>
Subject: Re: [PULL 00/32] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 at 07:12, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20230207
>
> for you to fetch changes up to 5474aa4f3e0a3e9c171db7c55b5baf15f2e2778c:
>
>   hw/riscv: virt: Simplify virt_{get,set}_aclint() (2023-02-07 08:21:32 +1000)
>
> ----------------------------------------------------------------
> Third RISC-V PR for QEMU 8.0
>
> * Update disas for xnor/orn/andn and slli.uw
> * Update opentitan IRQs
> * Fix rom code when Zicsr is disabled
> * Update VS timer whenever htimedelta changes
> * A collection of fixes for virtulisation
> * Set tval for triggered watchpoints
> * Cleanups for board and FDT creation
> * Add support for the T-Head vendor extensions
> * A fix for virtual instr exception
> * Fix ctzw behavior
> * Fix SBI getchar handler for KVM


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

