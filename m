Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F47387C7A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:30:17 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1fk-0000q0-PO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1TB-0001Zb-08
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:17:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1T7-0004g5-K6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:17:16 -0400
Received: by mail-ej1-x631.google.com with SMTP id et19so8110713ejc.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CJ89FbISvltT80mtwgYuuv06nBXALr2prTF+QCmVPwI=;
 b=JDqHyqF7piHNqxHVnGyljUGGB3S9gABIbsXqtQOYGqim+k5yZMRR4Z9OPNhzKAHMbT
 tf8ogWjDsFOzRp5rX5X+fGNClZkfv+Bw+vLCHweFrHkwqboAJsZsdurqMcc9rqOmKOyC
 H/IwqVLDu9GeWSEQuXvU+BkEurkl6q2bBOsSRtG2SxIsxN5LiZqms+6sKbPnanGYuH3v
 7HxXxFg6UKd9Bj6SQCp3eOoRNGrT7fptZBVQeQwziCYj5zhKjoTSYK71+aHPrrmyCgmc
 CiAu6x64ySc9GFgVdwQugYq/8LMN1rN13zI6grWc0+xKEBtLj8Khi96u+9zZVV7Mfyoz
 nC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CJ89FbISvltT80mtwgYuuv06nBXALr2prTF+QCmVPwI=;
 b=H/ZwmoobEhUBAwnL/bVsVMiModht8W4bDediTqCd5e2xRb9g51/QFe5tFssaBPdv7p
 WC+4gt7oQr2ZON6ohR1+2XiAG/06KEhe9UjlFNbOcA4jY+9Dqiu5RRjVnbovP8z+JEcy
 xaIcbpm2r+6O9HLxc8f76y0vrDPdiv0LtxHtWQLvXRWvatUNHf9p1i4kT8DoZ9597Ytt
 ojmeSKNb/4GaP2At0vQSw+EQP3qKUTB3tuznc413R3zu6mcMuVVXMEqOSm4RBAjP9zZH
 IlmLHfAo9a9Ew4nODIqTqTP5r580WaQ1IA51yzA3hsX6q6NoZ8BRrzOfw10XLKFxVTqO
 QYAg==
X-Gm-Message-State: AOAM530M40UdRGEVeEYE4pRQCgCJpHroOvageOMyBloTyhHn/MJgz3oJ
 7t78w+HkASr3vPF9DYmlJR5uVwohU/3O81hCn5SKrg==
X-Google-Smtp-Source: ABdhPJxmFxznDK5mcROX1UY5+U0JpN8qJHVzFHL9M7nIGNWnJmlUiLsBcNeleOU0kGlo+biskOg5dqNyijjIiMrxh7E=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr6615326ejb.56.1621351031762; 
 Tue, 18 May 2021 08:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210517112001.2564006-1-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 16:16:54 +0100
Message-ID: <CAFEAcA_HWW_Xc-pkd6sjYYEndWyxX4OhHFEZCpR-1-+cirL0NQ@mail.gmail.com>
Subject: Re: [PULL 00/20] Misc patches for 2020-05-17
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 at 12:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f=
7d:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2021-05-16 17:22:46 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9b2de449e9593facd562fa7478b5ab15c9a8b588:
>
>   KVM: Dirty ring support (2021-05-17 06:16:22 -0400)
>
> ----------------------------------------------------------------
> * submodule cleanups (Philippe, myself)
> * tiny step towards a usable preconfig mode (myself)
> * bump Meson submodule (myself)
> * Kconfig and LOCK_GUARD cleanups (philippe)
> * new x86 CPUID feature (Yang Zhong)
> * "-object qtest" support (myself)
> * Dirty ring support for KVM (Peter)
>
> ----------------------------------------------------------------
> Paolo Bonzini (6):
>       configure: check for submodules if --with-git-submodules=3Dignore
>       configure: simplify assignment to GIT_SUBMODULES
>       meson: bump submodule to 0.57.2
>       object: add more commands to preconfig mode
>       qtest: add a QOM object for qtest
>       KVM: do not allow setting properties at runtime
>
> Peter Xu (10):
>       memory: Introduce log_sync_global() to memory listener
>       KVM: Use a big lock to replace per-kml slots_lock
>       KVM: Create the KVMSlot dirty bitmap on flag changes
>       KVM: Provide helper to get kvm dirty log
>       KVM: Provide helper to sync dirty bitmap from slot to ramblock
>       KVM: Simplify dirty log sync in kvm_set_phys_mem
>       KVM: Cache kvm slot dirty bitmap size
>       KVM: Add dirty-ring-size property
>       KVM: Disable manual dirty log when dirty ring enabled
>       KVM: Dirty ring support
>
> Philippe Mathieu-Daud=C3=A9 (3):
>       configure: Only clone softfloat-3 repositories if TCG is enabled
>       hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
>       backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD
>
> Yang Zhong (1):
>       i386/cpu: Expose AVX_VNNI instruction to guest

    Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
    Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
ERROR: pull request includes tag with UTF-8 error in person name


-- PMM

