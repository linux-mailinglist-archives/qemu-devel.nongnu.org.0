Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FA6FA67
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 09:32:10 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpSnp-0005PY-Qb
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 03:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33019)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hpSnb-000511-7x
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 03:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hpSna-0004wU-8G
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 03:31:55 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hpSna-0004uz-0N
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 03:31:54 -0400
Received: by mail-wm1-x342.google.com with SMTP id a15so34035326wmj.5
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GD1idQxkWlB++MINx3HXAfoYai9gROioIY8iiOILTLk=;
 b=xi2MV7PydqRU6I5+8kUq97v1DRSjVar2MYEoQsIEQnUfm7c43S7PezvQYJLkeeYqdU
 HI5o64djQHqymoCx1bbmzeF3IVqEujv4O9hLVA9ALWT2XGwFODiVaZhyyzzwkw4mnRct
 1sXXy4t3xD4p07RqMIo+pvCDL3w9L2cAEaZX51sGY7uoEVFkHuQ67Xkj+P0/1Sg1gssh
 dORJqMD09rghtO2HNY8UmmGyoQqVZsuRZm0oIYasFTcwVG1euy8ktSNdYbbX0vJw1Iru
 9FkTUXPi5v7NZ0Qy2vnt3u7sleYoWBm07KU5i52CgTIm5z6//8gmEJMfr4nzw7D2mRFh
 Hd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GD1idQxkWlB++MINx3HXAfoYai9gROioIY8iiOILTLk=;
 b=NJnoWTBe9d9pbm9r1NB9Qr89rHX6f06rO5nNQRgv7WYHLmSkDHLoVU6nxLuH4ipu1/
 7GeO73skqAbivG47QXZZaozVLW4qYZVirzzQBOfzx1eYM7WHIcUzMEisRtyQU/LIe3zp
 NNPYAiIgRWvihjyAEB8RMGwzU025IbWDNTjOf/WxFc6yfUBr1lw3Lw4A5EPoyTbO68ds
 wO8lYuqQE7vDSqFCYh+c7rzLCXFY1pZMJB4bzyIiiOMFOdYcgUxr650hq5cnnHYA+twj
 mZkfM2rJXRBupu7LYqT3aWxYBp3AhHyydbESyuPmF0ZjZ72rvdKt9xG9oSg4ioG9dy8r
 wHSA==
X-Gm-Message-State: APjAAAXt47R/Y3vmzdCZ4qT4VEuAIiIBnHfI5eMdRDd2E71+0g4csmg4
 fkUg8n/dSJt9Ill7mjU9YI6tzw==
X-Google-Smtp-Source: APXvYqxPi6U0akV1PX8fVTu5Y6h9ZNdZJIzzlCqdC75E7RM9JHK148QhwkfbRsuq4sSrYPuh04MSKA==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr54372916wmk.101.1563780712127; 
 Mon, 22 Jul 2019 00:31:52 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id e6sm38698552wrw.23.2019.07.22.00.31.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 00:31:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F28501FF87;
 Mon, 22 Jul 2019 08:31:50 +0100 (BST)
References: <20190719210326.15466-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190719210326.15466-1-richard.henderson@linaro.org>
Date: Mon, 22 Jul 2019 08:31:50 +0100
Message-ID: <87k1cajzix.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH for-4.2 00/24] target/arm: Implement
 ARMv8.1-VHE
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> About half of this patch set is cleanup of the qemu tlb handling
> leading up to the actual implementation of VHE, and the biggest
> piece of that: The EL2&0 translation regime.
>
> Testing so far has been limited to booting a debian 9 system with
> a 4.9 kernel, and a fedora 30 system with a 5.1 kernel.  Both have
> KVM enabled, and both report enabling VHE is successful.

check-tcg is throwing up errors for ARM:

ERROR:/home/alex/lsrc/qemu.git/target/arm/helper.c:5353:define_arm_vh_e2h_r=
edirects_aliases:assertion failed: (src_reg !=3D NULL)

>
>
> r~
>
>
> Richard Henderson (24):
>   cputlb: Add tlb_set_asid_for_mmuidx
>   cputlb: Add tlb_flush_asid_by_mmuidx and friends
>   target/arm: Install ASIDs for long-form from EL1
>   target/arm: Install ASIDs for short-form from EL1
>   target/arm: Install ASIDs for EL2
>   target/arm: Define isar_feature_aa64_vh
>   target/arm: Enable HCR_E2H for VHE
>   target/arm: Add CONTEXTIDR_EL2
>   target/arm: Add TTBR1_EL2
>   target/arm: Update CNTVCT_EL0 for VHE
>   target/arm: Add the hypervisor virtual counter
>   target/arm: Add VHE system register redirection and aliasing
>   target/arm: Split out vae1_tlbmask, vmalle1_tlbmask
>   target/arm: Simplify tlb_force_broadcast alternatives
>   target/arm: Reorganize ARMMMUIdx
>   target/arm: Add regime_has_2_ranges
>   target/arm: Update arm_mmu_idx for VHE
>   target/arm: Update arm_sctlr for VHE
>   target/arm: Install asids for E2&0 translation regime
>   target/arm: Flush tlbs for E2&0 translation regime
>   target/arm: Update arm_phys_excp_target_el for TGE
>   target/arm: Update regime_is_user for EL2&0
>   target/arm: Update {fp,sve}_exception_el for VHE
>   target/arm: Enable ARMv8.1-VHE in -cpu max
>
>  include/exec/cpu-all.h     |  11 +
>  include/exec/cpu-defs.h    |   2 +
>  include/exec/exec-all.h    |  35 ++
>  include/qom/cpu.h          |   1 +
>  target/arm/cpu-qom.h       |   1 +
>  target/arm/cpu.h           | 259 +++++-----
>  target/arm/internals.h     |  62 ++-
>  target/arm/translate.h     |   2 +-
>  accel/tcg/cputlb.c         |  77 +++
>  target/arm/arch_dump.c     |   2 +-
>  target/arm/cpu.c           |   2 +
>  target/arm/cpu64.c         |   1 +
>  target/arm/debug_helper.c  |  50 +-
>  target/arm/helper-a64.c    |   2 +-
>  target/arm/helper.c        | 985 ++++++++++++++++++++++++++-----------
>  target/arm/m_helper.c      |   6 +-
>  target/arm/pauth_helper.c  |   9 +-
>  target/arm/translate-a64.c |  14 +-
>  target/arm/translate.c     |  17 +-
>  19 files changed, 1058 insertions(+), 480 deletions(-)


--
Alex Benn=C3=A9e

