Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D637280F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:25:33 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrJ6-0006af-9H
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldr56-0001dB-RN
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:11:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldr51-0007En-L7
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:11:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id y7so12018231ejj.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VyYQCRKPPZ1U7QW1fpsJdF9vQ9MQPGn/Nrdw59WsAz0=;
 b=c4AuYw2ySoDcOX+9aNhohWDn/JK3wFlRD+FLxIkyfik5OnnEO8qaBi10Uq/SengRjz
 e8htzIwVXL6CNVwK2S8FdF2Sgl6kv8JbjrHYifWwQUA2iX12dxYqhsbi4wxyd31+8VYO
 fvvtSFN/OVMoQB5j4M9fZ7rUAV44F9C3hkzg8tiTFXIyyeESrpKUzSiNWUVwCFGU3p4Z
 cqklltO5GSi9boaRxs/gCxlX2I4nhhsj6PEk5D20P02WFZKhZunUVXOAgkgptrHanxaN
 +cPVflOzD0hP6Ltpf9bleUB5UqXW3HT8lWc1YjQjzf7SZfIEY67eC4oZBT+YACtoG8tE
 cI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VyYQCRKPPZ1U7QW1fpsJdF9vQ9MQPGn/Nrdw59WsAz0=;
 b=Pl3VL4qLxHbSMDudkBp6+qa+z0HdXWDbNFb+B6+Wb3ABTAJQA7pluWn8/U9R2ikBXw
 DFuCUMMCBzwZeFsJmpgSfSiZWCjQoaRFTbNgC3loI25f3Hw1N+6p8Ke8CyDBl8sFOqyU
 +AgKkVDabkD57RkC7p6sNHiIPNu972cLyyEsBoHqftKc1Me7zywmE+OiV76RJb+xECiF
 FOJ0GTZ2WaXl7fPXFDrmomiCN+uFX8wLg+8hMmx0vHS9yaOkBU+K0YL9kbDgV5VddqrV
 ErwBkRMH9ZTeVvK1upIHWSHHcbtw6cAe+9KS+rZiGAxiPRp4IcrA5ypkEhBe+n56VU8y
 u/SQ==
X-Gm-Message-State: AOAM532HwH93LByFS0RHvyZia8Vztpy34ImJMYrZaZhVOptaSSaP2UDD
 YZyH8ERNCaNIbn0jfwpt1sNfWd1H9vQ76Yh58ENIkQ==
X-Google-Smtp-Source: ABdhPJxR6USXRuVhouKvWrtcGU3Z1CWuSI4XhK7S6KbfUI6puHaPziup0thsO7Adye/0d+ghNEyPJ2ppRa1YD6rMoes=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr21132286eja.85.1620119457854; 
 Tue, 04 May 2021 02:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210502161538.534038-1-f4bug@amsat.org>
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 10:09:52 +0100
Message-ID: <CAFEAcA8RB8Qrc5CwL9-3KcQ3qzEO5kxAh9GWCx1AvXQ_QtnntA@mail.gmail.com>
Subject: Re: [PULL 00/36] MIPS patches for 2021-05-02
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 17:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0e=
cf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501=
' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210502
>
> for you to fetch changes up to 1c13514449439b5ff1f746ed0bf73b298da39cf0:
>
>   gitlab-ci: Add KVM mips64el cross-build jobs (2021-05-02 16:49:35 +0200=
)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Fix CACHEE opcode
> - Add missing CP0 checks to nanoMIPS RDPGPR / WRPGPR opcodes
> - Remove isa_get_irq() call in PIIX4 south bridge
> - Add various missing fields to the MIPS CPU migration vmstate
> - Lot of code moved around to allow TCG or KVM only builds
> - Restrict non-virtualized machines to TCG
> - Add KVM mips64el cross-build jobs to gitlab-ci
>
>
> scripts/checkpatch.pl false positive in patch 31
> "Move TLB management helpers to tcg/sysemu/tlb_helper.c":
>
> 4 checkpatch errors:
>
>   ERROR: space prohibited after that '&' (ctx:WxW)
>   #414: FILE: target/mips/tcg/sysemu/tlb_helper.c:71:
>   +    tlb->XI0 =3D (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;
>                                                     ^
>
>   ERROR: space prohibited after that '&' (ctx:WxW)
>   #415: FILE: target/mips/tcg/sysemu/tlb_helper.c:72:
>   +    tlb->RI0 =3D (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;
>                                                     ^
>
>   ERROR: space prohibited after that '&' (ctx:WxW)
>   #420: FILE: target/mips/tcg/sysemu/tlb_helper.c:77:
>   +    tlb->XI1 =3D (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;
>                                                     ^
>
>   ERROR: space prohibited after that '&' (ctx:WxW)
>   #421: FILE: target/mips/tcg/sysemu/tlb_helper.c:78:
>   +    tlb->RI1 =3D (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;
>                                                     ^
>
>   total: 4 errors, 0 warnings, 688 lines checked

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

