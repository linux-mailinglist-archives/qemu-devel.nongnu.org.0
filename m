Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD4676653
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 14:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJDVH-0006NR-GP; Sat, 21 Jan 2023 08:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDVE-0006N9-Hz
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:01:48 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDVC-0003ch-U1
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:01:48 -0500
Received: by mail-pg1-x534.google.com with SMTP id r18so6007497pgr.12
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 05:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b2cQ7EPm+HzRVxk2JCnjdwDBUzACpgs91WuFCzwqJiI=;
 b=mElUCWb+P0oa2HvC1uRvzj3w6l3Yee+CY9TDZbZ8M02nbzWhYu0VBiVKt74o8pXSyh
 GUgAqQdbYc2inhGUsjGLdbQlENebKLf9pcOXxmqSEbXGEw87Z0KvRjsS6rkBe//gjeVr
 C/vt2qNNL43tkjYyqqgt4CF3FhyWcD5xx46Y5XSaoRBEcIycw4oDsyq/BhYEeCwPYXC+
 Q7LHxmSyTq7DBJuY6QzpNCicDuygITY5/0smS5hAIiCvaicjKESkV4F7HxdQ0naT7iBv
 TCEoiOodh5t70R5KlWx/J/r0pxbVn28nfRwY8WrZpSpJjXMzvqri3p90OtIWaBZU5nud
 Kiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b2cQ7EPm+HzRVxk2JCnjdwDBUzACpgs91WuFCzwqJiI=;
 b=eABMXqytiVuvU3TKwaMGdDLWQQNliAJ1pNDGTtKtNtCVLTOFMRLNx3v4RmdXrc09lN
 7oCzbkbfbz8IYmIBcQhJmDC4JIKVo2QPCjWiBn/4N00yYwgbwD6pGQlzXhFdy7loEnCb
 Ohf08lcfLyPx1LHlg2ZkS/bhc5s5vDueBROfN4U9Hpsk38onMmOLPbTAoUi3Wr+qCcun
 nkUyry4C+Gg5CCunZkrCaKJPL2V8W6OP26SIgeJ60XncEAv50BUB7+NQJLTURSEjDQa1
 KL8fK5Nm/5SyJzNtWNIeXrklhtGmhNayh/PGb1HT3NaSweGZC6lghAfrNHycFnv3sJS0
 XxDQ==
X-Gm-Message-State: AFqh2krI4p+LL0sAqa6iAULt8Lu4OaP0eFKHU3EOdra33/LDHTONvQzH
 yBX2C6HAIBvXJoCwRKxafJenip902ykXUwYjFLV7ew==
X-Google-Smtp-Source: AMrXdXvNFif/wkVSjyUVMpAELuggrdHqrPC8WAV/Mwiv9+syDOb1VT5pf8a9yZ/PJ9bF0u3HiKfBTA4dnM1xS4QWb3A=
X-Received: by 2002:a63:6dce:0:b0:4ce:2e45:1e4d with SMTP id
 i197-20020a636dce000000b004ce2e451e4dmr1520121pgc.211.1674306105504; Sat, 21
 Jan 2023 05:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Jan 2023 13:01:34 +0000
Message-ID: <CAFEAcA96_qzqNSRC-Nk5zv9z+4uyPDMYDZ-rP8NuD9o-W=CNgA@mail.gmail.com>
Subject: Re: [PULL 00/37] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Fri, 20 Jan 2023 at 07:47, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 239b8b0699a222fd21da1c5fdeba0a2456085a47:
>
>   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-01-19 15:05:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20230120
>
> for you to fetch changes up to b748352c555b42d497fe8ee00ee2e44eb8627660:
>
>   hw/riscv/virt.c: move create_fw_cfg() back to virt_machine_init() (2023-01-20 10:14:14 +1000)
>
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 8.0
>
> * riscv_htif: Support console output via proxy syscall
> * Cleanup firmware and device tree loading
> * Fix elen check when using vector extensions
> * add RISC-V OpenSBI boot test
> * Ensure we always follow MISA parsing
> * Fix up masking of vsip/vsie accesses
> * Trap on writes to stimecmp from VS when hvictl.VTI=1
> * Introduce helper_set_rounding_mode_chkfrm
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

