Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0772B9743
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:03:54 +0100 (CET)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmPZ-0007dJ-AX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfm8D-0006v5-Oq
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:45:59 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfm8A-0003hD-Vw
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:45:57 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so8586538ejm.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45e0VgNBbvYnn00UZUV/75YCSw3FH7awq7f1yZmGnIA=;
 b=yd+dDD5sCyrZHocr/ApiPlXl8Vodq1TGFhwOHBFO8f6IhOtQwsioH35yKK7UONHdH5
 TitQsHK6lA8fYRer+u4YnGR1szOVLD1j7PQF214pS7Ce6d2fyplN4xEO63Z0fMf+eo5F
 +D7s7HaiYkc1/gXas5BwAL1r0YHLx3mzjYUBJ3VVkquNN71MOzWoSStwN2EHOedXyFIr
 Ro9F1WQY4P81qMbCgNbC/Ev/imG/WmHAd4i9hs/qUPN2WgCzFgjiXtJGT7k0K/b08nuD
 3c0yMqnN3mBXKuySRziRYw0DuO4lMXk7AGWqZHMjPIhhmOGjOj8ao0ADRhK4NexKY+xa
 jw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45e0VgNBbvYnn00UZUV/75YCSw3FH7awq7f1yZmGnIA=;
 b=nIhH73G3a+20nm5xeODLx7zVWtC2cRb7GkhvWSR337xBK0KNEsyYdTsBZNJsnftOfT
 cKIgNPPIMP6KCmOpsirr2gMleHoMP4Jf23tTEDMjnodLMBIGHqV3uzNm10CJ0d9YCjJA
 DRdDRuh2YQYLnv9cJ9fY4KcHfAhJhBeH6qVEv4jYkHxH7OAGsNWk0q4xX518nkHSdiLM
 BMfj1vk9sBgIv7O+oCu57krPyRvUldBIxk3i41SLQPGhCy2Tpe2L+oBGzjXKPgDCpyYN
 iLWk9Mw18Wrdk3oEQ/6x/i+IwcRGpjfN2hlrfMsqHygC8Q9ezl+19Jhpg9H2++VAe/Bv
 LsXw==
X-Gm-Message-State: AOAM5330NkGkUm7frBU3YwEV1cT2YZwsbwchxkpTmtMKMnFtYfi2Uh8B
 nELi+2GNn3XSXpFZiDaxpDNY1ex7jcP8rJvswT5wcw==
X-Google-Smtp-Source: ABdhPJwerYJJayn5lWpV2YdXL6eFXH1urcMvWimgMV3daCqtLlvmtu4pEM2RJAtpVko5A8pZi6+uXKrICI4dBfpc4FU=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr30365553ejr.56.1605800751989; 
 Thu, 19 Nov 2020 07:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
In-Reply-To: <20201119153901.53705-1-steven.price@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 15:45:40 +0000
Message-ID: <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 15:39, Steven Price <steven.price@arm.com> wrote:
> This series adds support for Arm's Memory Tagging Extension (MTE) to
> KVM, allowing KVM guests to make use of it. This builds on the existing
> user space support already in v5.10-rc1, see [1] for an overview.

> The change to require the VMM to map all guest memory PROT_MTE is
> significant as it means that the VMM has to deal with the MTE tags even
> if it doesn't care about them (e.g. for virtual devices or if the VMM
> doesn't support migration). Also unfortunately because the VMM can
> change the memory layout at any time the check for PROT_MTE/VM_MTE has
> to be done very late (at the point of faulting pages into stage 2).

I'm a bit dubious about requring the VMM to map the guest memory
PROT_MTE unless somebody's done at least a sketch of the design
for how this would work on the QEMU side. Currently QEMU just
assumes the guest memory is guest memory and it can access it
without special precautions...

thanks
-- PMM

