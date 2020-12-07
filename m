Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6AB2D14A3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:29:57 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmISZ-0002cB-LN
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmIQd-0001k0-Fd
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:27:55 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmIQb-00059z-QC
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:27:55 -0500
Received: by mail-ej1-x642.google.com with SMTP id x16so20027424ejj.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 07:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWPqY7gB/QoMToun+/6liS3Aa5bW1uZwjLPmmW+88Ls=;
 b=oBuBU1tDmmtrU8cWvFlNKQWEqdKRQqE+dKLNuy9coZBBMCAJGg+E3Kc1wVxRgi/hGQ
 vGFMphwkXSofsqjWkq+HMZ3AqYHvAvIvBunbHGBON3w6W+gamq3+mTIDD9MnwpbG5daf
 V/RYUVeN5MDlShhtWblzedtvCxeXUWBY+Ay/n5eL34XeViW2U/znT0VRqBFDQfosUJ5+
 iaF0gRhMU8gUf4QTzKigFbIIixW09ocdj2KLMN3eylf2lrn3YSOvJcVIcN2BJpCTZ4U1
 GCRaC/lGDa+Wu2VviBnS9CCYjnPe/na+kkUsZu2PyCc21jIo5N4Dk8oSQ2sBrjDlzmkB
 AHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWPqY7gB/QoMToun+/6liS3Aa5bW1uZwjLPmmW+88Ls=;
 b=T3CcxO9R74jbp1nAIDlFCaLUkj+pnKeR1K1nj1IHvFYips82MSrGXreP7EKZIeLeCl
 AykE5STFjxUowuDQzH4IbidSTflPqmwaY5xIu24Q2fFLhaSdw64vEi9WuKqaN7JLGVl4
 ZVEo5pIRZCG25VuO1fjpP6TgLYoFI4kuiRhJwlVNiJqqtzF2y1R6WhD6cBJkEIBxYhVQ
 Hjkslw/1C+etf4dXV1OhnuAUG7Ysn0z82HyozAoqYw3YGmki33vtXlRJdU6/9fU8++zZ
 t86axa16oOH6rs4P0wxkq/Q6tPYlVuPwasMMDO+jx/sZZGTJhCAjxEZiGIplMkPXgl8q
 O3Cg==
X-Gm-Message-State: AOAM5319GoTAXU2ydrFEGWQB857qP6lpTYTHZeqSvjGtalru3zBP0KSf
 JEeikgfNX9kos1PpGkeKCOQWYoh4Nxce2xSQLZ65zQ==
X-Google-Smtp-Source: ABdhPJxzlqdtQ7zxg9nsdsKrHpDmw3fYW0PNLe0UvSzvUx0bNUOWgUFAyJCA9n9a8k59bXziSr7Lj3CtVdIGqZTX0SA=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr18896508ejd.382.1607354872135; 
 Mon, 07 Dec 2020 07:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
In-Reply-To: <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 15:27:40 +0000
Message-ID: <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Juan Quintela <quintela@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 14:48, Steven Price <steven.price@arm.com> wrote:
> Sounds like you are making good progress - thanks for the update. Have
> you thought about how the PROT_MTE mappings might work if QEMU itself
> were to use MTE? My worry is that we end up with MTE in a guest
> preventing QEMU from using MTE itself (because of the PROT_MTE
> mappings). I'm hoping QEMU can wrap its use of guest memory in a
> sequence which disables tag checking (something similar will be needed
> for the "protected VM" use case anyway), but this isn't something I've
> looked into.

It's not entirely the same as the "protected VM" case. For that
the patches currently on list basically special case "this is a
debug access (eg from gdbstub/monitor)" which then either gets
to go via "decrypt guest RAM for debug" or gets failed depending
on whether the VM has a debug-is-ok flag enabled. For an MTE
guest the common case will be guests doing standard DMA operations
to or from guest memory. The ideal API for that from QEMU's
point of view would be "accesses to guest RAM don't do tag
checks, even if tag checks are enabled for accesses QEMU does to
memory it has allocated itself as a normal userspace program".

thanks
-- PMM

