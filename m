Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF616660010
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 13:12:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDlZ3-0004By-KE; Fri, 06 Jan 2023 07:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDlZ1-0004BO-JG
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:11:11 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDlYz-0007kH-Pu
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:11:11 -0500
Received: by mail-pf1-x433.google.com with SMTP id z7so899186pfq.13
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HpHmY1wnU27l7HGtCTtCDFeHGIV9KObxbtPFWT1jPjY=;
 b=G66waiwcsyzZeQtwjo9NWxnif+yi9MSetHZscGukwyBExtSrhaIJPNc9cQXzP+P08S
 01NQ4QrA9pZ1NVc4q40HfZ8pZeT1TZQV2SC9enrpz9+EBU9U1Rm7YuYmRs9wiCL5lWDB
 +sCrNGOAG+k8HOVhqUYOhDQZ0SkYKICCq1KE/+HpqKbrFzaYUYwxtO/5XBJz+ndXmgp4
 ehxmhPHgTASsbNnClDKXAdmkDOLSTxbDk3z0pfb/Xjb1mSUXc1buaGXe33szRbW6aYF9
 FKQxAuVH8gMwDzsJjYaM28kyQ++f+/l30R8CybehRm2oKyueuxDwECT4DLUjEoUGNrEU
 nC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HpHmY1wnU27l7HGtCTtCDFeHGIV9KObxbtPFWT1jPjY=;
 b=GA+zICCoPbFV9/R6lRzC+CdD/tlb1bF7GaY4B600JkRIdmfk68TxYg/aFrD7XAzGIQ
 c4c2mMlPvRaLG1ylgZDWt2EkH5Oyl02h5ZOnnR9Qz9oPsLZcj9UDfmhJhsC27jcMiETL
 8MlaiGM/pX8sSQD1G4opkp9k7DxGqfF1Y8FngIhWI/9DUzJq5CW839FOwuuo2xUMt7lQ
 GtXFl3HFTEf4xNHUdjCLUDaFdKENj62G5hL/N9ImCifLo56fzU/4FThi2jpcXjvQ4Lqz
 KMXlJgUEEExtoxVpFfkXQEZGXIQQIr4CUzgTUKhp0LeZvcewSZxVQzXmGkgFehYCAOtH
 tXGA==
X-Gm-Message-State: AFqh2kpKYYkgmdVk+umgd7zmqbws1/FA9p5P2JkE3++FziWsiWT5rVfM
 xVGpJbrSu6JjFMEx1ze3xm/ion+0jVoeYjSloHOMi3KwHCFzdg==
X-Google-Smtp-Source: AMrXdXsDIvU7eTCU5tIRuF5pp0uJR0qc1F6lILUyE2553EnZEuS+/h4irMOpM9SIYyd7QC/sUi80EcqZ1/cRh1GbDzw=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2519656pgd.192.1673007068428; Fri, 06
 Jan 2023 04:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 12:10:57 +0000
Message-ID: <CAFEAcA8c==BNTTyj_WE0fwAjaDo_4kTgEZgqm_QnzDOmK2G4Qg@mail.gmail.com>
Subject: Re: [PULL 00/34] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Thu, 5 Jan 2023 at 16:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Some arm patches; my to-review queue is by no means empty, but
> this is a big enough set of patches to be getting on with...
>
> -- PMM
>
> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
>
>   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230105
>
> for you to fetch changes up to 93c9678de9dc7d2e68f9e8477da072bac30ef132:
>
>   hw/net: Fix read of uninitialized memory in imx_fec. (2023-01-05 15:33:00 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Implement AArch32 ARMv8-R support
>  * Add Cortex-R52 CPU
>  * fix handling of HLT semihosting in system mode
>  * hw/timer/ixm_epit: cleanup and fix bug in compare handling
>  * target/arm: Coding style fixes
>  * target/arm: Clean up includes
>  * nseries: minor code cleanups
>  * target/arm: align exposed ID registers with Linux
>  * hw/arm/smmu-common: remove unnecessary inlines
>  * i.MX7D: Handle GPT timers
>  * i.MX7D: Connect IRQs to GPIO devices
>  * i.MX6UL: Add a specific GPT timer instance
>  * hw/net: Fix read of uninitialized memory in imx_fec


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

