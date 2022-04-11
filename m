Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBA4FBBCB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:12:42 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndsuP-0006fH-38
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndssw-0005dH-SR
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:11:11 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndssv-0001X1-9x
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:11:10 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z33so27081599ybh.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26FZLetp4/aKcmiVTcyfLB+NXTh30uhlPSKZQxtB39g=;
 b=q5k5QRU1qXQl9ZeuvduTtnb+M9DOnIC3XYZuJDBEHCPqtdZDLBVq8gSSmyLMyCEPCp
 2mneqa6tett9juOC+mOPUovb8tXUiEPWsDwNUdOobHu5C2Ccxv8qsE+9xT4qNWBiFJ4x
 ZftGvma7GF82Bfo0n1xmf850Sh5NFKg4lxW7yR0B83IJbNpMUkynBRAbWgDEDXkAr0ba
 OccXI00qMU7Wyps266LN+ef6PeHX0ewsNcDl1Xn5qv/rttNN2dMoMstDzx0LetKOJczI
 pXcSaSJnYhFp2nUo0CdD8V8cE97zq4HQzINIaSo1hMItutCAMcVyqLHuRjRPOR+iyO1q
 jVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26FZLetp4/aKcmiVTcyfLB+NXTh30uhlPSKZQxtB39g=;
 b=o09IKmbtuVaeHQytLiDJh+ZGPDNr2gkZWisE+zCftyV3D1Xq/tHJnCnDfRolrU3mec
 8ZvN+JBrgTNfI+IYrzkKSucAXxOeasl98Y9emwZm9gaJB7vKUYVQLS84ipJbK4Zq/5cw
 BIREeBU+jooIB18XwF9v6xbjYzDOymNtNn+dEUhQ0tVwtDOIaJybktBGZq+U1CM1sku+
 4OhIjZqny9Cxgkjkb+yjjBGU5OWPKWvivWOyaIyjAYgEjSRe7jckhd0U/Lgnu7p11qN5
 GWUh3JCfL1e83DOiWu0l3YC97o7wMDhKwQaOFtvjytuSQxz2Jdg1QrbV7lG3t68rnG6/
 Hzow==
X-Gm-Message-State: AOAM530B9QWoGBcNSHBNOp1y8dZvMuWpsvnp6UK5AzCTRFsGvEeRaaeq
 XYPUZol+t9kMgHx4hM0PCJBycl2IHd/z1Fdzfn/0Dw==
X-Google-Smtp-Source: ABdhPJwvwAhT2VABybLl65pNpTflZYQbDMYBGTxAFkvCMMBQZvULZ0D+I2fTdDJQmZOzyBOSUKzznmVPi0cXV9FtIfM=
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr7269502ybe.39.1649679067857; Mon, 11
 Apr 2022 05:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <20220411120216.63r7ggy43y7ttvhp@gator>
In-Reply-To: <20220411120216.63r7ggy43y7ttvhp@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:10:56 +0100
Message-ID: <CAFEAcA_PfakDVFvNCF55FGoV0A=141CNdtqvgPjheSGvpVqh+A@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>, agraf@csgraf.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
> > Also, we support SVE today, and we don't have variable size
> > coprocessor registers. Is there a bug here that we would be
> > fixing ?
>
> SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
> registers. They work fine (just like the VFP registers which are
> KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
> cpreg list. SVE and CORE (which includes VFP) registers are filtered
> out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
> out they need to be handled specifically by kvm_arch_get/put_registers()

Right, this is the distinction between ONE_REG registers and
coprocessor registers (which are a subset of ONE_REG registers).
We wouldn't want to handle SVE regs in the copro list anyway,
I think, because we want their state to end up in env->vfp.zregs[]
so the gdbstub can find it there. And we wouldn't have benefited
from the copro regs handling's "no need for new QEMU to handle
migrating state of a new register" because we needed a lot of
special case code for SVE and couldn't enable it by default
for other reasons.

If we do add non-64-bit cpregs on the kernel side then we need to
make those new registers opt-in, because currently deployed QEMU
will refuse to start if the kernel passes it a register in the
KVM_GET_REG_LIST that is larger than 64 bits and isn't
KVM_REG_ARM_CORE or KVM_REG_ARM64_SVE (assuming I'm not misreading
the QEMU code).

-- PMM

