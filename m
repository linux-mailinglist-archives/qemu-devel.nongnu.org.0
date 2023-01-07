Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C221F660EFC
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 14:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE8vi-0001ob-I3; Sat, 07 Jan 2023 08:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pE8vc-0001oN-SJ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:08:04 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pE8vb-00061R-2y
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:08:04 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 36so2926549pgp.10
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nF8wwmf7oqfqYWZHI5d0uUgU0DuJeqhX3PDL7io8sJk=;
 b=h2zjoG8uMTQ3qfDK7h4Up58voH218uk0lhpfqdKAaghmZjHmHMXfO139QUjLrDe9fh
 zSG2eEU71sE2PYyBh/NSsjaAvzdfTZlB+/b7c3NI0WbpV/7oHLhq94tEQCnK6Pd7bktO
 4UxoT+cAsIgLAuxNjXucC5N/4EyAF3ELEQiD4QKnUUWaPGXtNiXAzpQyodMafZP0GbbI
 1I4yEhdTKSta4Jtgsr4Na5+C0DWa8DSZVT1uIu+zU0hwxzxJpQLd6fw8AiJG6yhKmZOp
 uAu2j//SzXqbQRDH35hpeh2Rr8UeHZDrhmz/AfpLcwe0grQgGFxNaCV1CFOr3OMLJdcJ
 P3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nF8wwmf7oqfqYWZHI5d0uUgU0DuJeqhX3PDL7io8sJk=;
 b=3IY4m2jeSbxPZsp3P/FmikvALtD15vjmLlfuZ2Qgka80P9spe3bcaZy8dWKepafP2D
 qYyZEv8XzvZIDeTkPe/OvWJ+gNf6msr/hZ98kiVaPuZasAIurvrvdHdzeLgRcZHKjfhV
 RBjbS2JH//IXVSA/YxQqHRx0O2TpUPOChb05/fhfFCJw1wLxPMnvGxzzx2aG204x4WT1
 CoejWtT2kuzA9+sE1Zt02oXDmVRUTGnpco7EHFzmuEhWxm4Eg9XTgzTE0pci8pciODu/
 +fqbE1sMNs74eWsDCkQtM1QkyzwA6ZV6YLAUDNxnzt0gcBc0OTFIVtbUgW5NBym2MOlW
 nTkw==
X-Gm-Message-State: AFqh2kqpcLuANYhaMskTMYZPpgFbvXrTapSpFLAz4OFFU+7L5Wm7LTAK
 UsyzSxdHwuHMpM7SUapn40jYb3XZQyK7Lg/hE126iQ==
X-Google-Smtp-Source: AMrXdXtOpj7H51EDWS2bEGL6Ej4lgpaD3jFE7Hq6X43SwoiqOiy30h17Rn3cQWc0/dZhgx750lEMbkgnIKMLEK/81Lc=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr65582pgd.192.1673096881051; Sat, 07 Jan
 2023 05:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Jan 2023 13:07:49 +0000
Message-ID: <CAFEAcA92dk6NkKBkGWKnZeReF=X4JN5f0CJ3ZrrYF9cc3Vqp6A@mail.gmail.com>
Subject: Re: [PULL v3 00/43] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Fri, 6 Jan 2023 at 03:19, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fbe9:
>
>   Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-01-05 16:59:22 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20230106
>
> for you to fetch changes up to bc92f261519d5c77c70cf2ebcf0a3b9a414d82d0:
>
>   hw/intc: sifive_plic: Fix the pending register range check (2023-01-06 10:42:55 +1000)
>
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 8.0
>
> * Fix PMP propagation for tlb
> * Collection of bug fixes
> * Bump the OpenTitan supported version
> * Add smstateen support
> * Support native debug icount trigger
> * Remove the redundant ipi-id property in the virt machine
> * Support cache-related PMU events in virtual mode
> * Add some missing PolarFire SoC io regions
> * Fix mret exception cause when no pmp rule is configured
> * Fix bug where disabling compressed instructions would crash QEMU
> * Add Zawrs ISA extension support
> * A range of code refactoring and cleanups



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

