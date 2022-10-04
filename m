Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31345F3F61
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:22:41 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofe8O-0003QG-9W
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofe6u-0001xq-4T
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:21:08 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofe6p-0003zV-Jm
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:21:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id qx23so9446678ejb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=PwRNe5T4DwU4ibqEbL8sgUW4gXF06tECBCmveUVE3kc=;
 b=NnohlncD+cHI2kVDOUtWFGpw9TSBawguNBWGmruKi98CD58OGm5QYEIHzoqbNdd3lw
 19nfDb6xwBtzOBTtO1cpd6L+aFJ3nDVXW3aGlaqJ9v5ZuTeMDbFlhFOUrnvxWSLcMDfr
 XLgMVDh0m2WL3vAH3S1dbXq2MSgVTREyVGzKh3f4FLEgexHxvpkovf929shOjySe+p47
 acRQlbWPv0dnDE9BBWdi4Q3JBj+QzPMyfHPWPNzyhz669BPV8QJ4E7S8TWVBkjY5NcFE
 h/LaQHXCR9GUX4DOFAoSrXYLwjMFndpf6jEebp5WJ2wxWeRDLAeX/1OTCd55EuqrsiD5
 fZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PwRNe5T4DwU4ibqEbL8sgUW4gXF06tECBCmveUVE3kc=;
 b=XmbbbJlWuo19bzDxEz1MdncOsFG3jkWFcDhrbZIN1JFQjT2y1gsm38S/jcHpU/8QDz
 TWULwqU7oYq7tIOHtGp0s+TFKAULqn8dPhLJoZKqjy1NJLnULEzBrX8trZFHey1o+H+L
 fIR0EeTqCZq0XgCNw6wxBAgiL07laOgfSPKz9pzjwRM9mMdbxQV6iR7wJEB0phblxh7y
 rFKt0kCKP3pf3oDpvuM6Je5B/VuEu6j6i3ZNKFx3pnhf6wNRR+RP6WFtze842xXm0oDE
 aaDQWTzuVfnJlt/Arjh/RiOkWSSU0RZWaK4szahnMyVJWZXJEagUCup6dPxBY/YbE6YN
 lNuA==
X-Gm-Message-State: ACrzQf08h9sFTQN3+EAfi1Zb0VfU8MuEEo/ei160kMdC+JFTrRsx+tcQ
 seH1L1tKJmV4zvsXUVQDervPiMMgSwFRYEH+jIpR4Q==
X-Google-Smtp-Source: AMsMyM5kFLJBAkbfRGcwRWxm9WI30uxmGJTfpCHhLqP4P0V1JGgYoPzR8jfh14qCVcsMZvf84elWsL2XqA0FP9x00TM=
X-Received: by 2002:a17:906:8a66:b0:78b:da52:b752 with SMTP id
 hy6-20020a1709068a6600b0078bda52b752mr6220739ejc.365.1664875261851; Tue, 04
 Oct 2022 02:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
In-Reply-To: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 10:20:50 +0100
Message-ID: <CAFEAcA-6HprXJ9u3orCMyPtaVGgDAU6R_zZ4jQi_NG2NmyaYvA@mail.gmail.com>
Subject: Re: A few QEMU questiosn
To: a b <blue_3too@hotmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Oct 2022 at 02:10, a b <blue_3too@hotmail.com> wrote:
> I have a few newbie QEMU questions.  I found that mmu_idx in aarch64-softmmu  falls in 8, 10 and 12.
>
> I need some help to understand what they are for.
>
> I cannot find which macros are for mmu-idx 8, 10 and 12 at target/arm/cpu.h. It looks like all the values from ARMMMUIdx are greater than 0x10 (ARM_MMU_IDX_A). Am I looking at the wrong place or missing something for the different MMU modes in aarch64?

The comment in target/arm/cpu.h and the various enum definitions
should be what you need. Note in particular the part that says
"The ARMMMUIdx and the mmu index value used by the core QEMU
 TLB code are not quite the same" and also the functions in
internals.h arm_to_core_mmu_idx() and core_to_arm_mmu_idx()
which convert between these two representations.

PS: there is a refactoring patch set currently in review which
changes the MMU index allocation (essentially it collapses
the separate Secure and NonSecure MMUIdx values together),
so the specific details will likely change at some point this
release cycle.

thanks
-- PMM

