Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446691B3677
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 06:42:52 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR7Dn-0007S1-9l
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 00:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jR74t-00018S-SS
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jR74q-0006Cz-0E
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:39 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jR74p-0005xD-DF
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:35 -0400
Received: by mail-lj1-x241.google.com with SMTP id z26so776049ljz.11
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6A/JSt/lvhm1/8jW+5g+pqNVCFB1Ru0tyfuhWz6X1oI=;
 b=c7TcHPII2iQm7OBzps9DhQIcRy0VU/z4odqOV8MmTZ9JAzqe0NiJrrV8B79WMKAXGR
 em1ZWTe8oMnSaNd//LpkmCLn6VF6IbfDfbYPA2EMuVGS3VV3mS16Ul4MhWCTDzl4+iOL
 x7hMai51AWj2ruoy3BXtBtD3jwzBA4k+YE7RTuUByAvx1CvKe6Gv108C5cJF//UJaa54
 xpDlgv5F+fnt0RXGflvd+YNYM8ic519NHiuqL+ZNbqMcCTHY9X1tqbzfoXXThyVNY5DP
 OslJUR1fTRdrXW/A1/QEIANJd6IXUXLsPB4hoej9nICxg6o9ri1Fphd3P93K6fXWQlvg
 L/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6A/JSt/lvhm1/8jW+5g+pqNVCFB1Ru0tyfuhWz6X1oI=;
 b=YP0xM11JxA0+UlrmGwqTk539ZWxM2rAniJfacJlk8MO0h+GP5GmWCSfWZaHcs3vxGd
 QdYmRj+CHUdOBTdQ57wvITPmwsD8W41WUq3P+o/md31oNzjX3H0uub0PXDtI5HIlBLF4
 0w+5b82e73ja5FOBLLcrZOh51xdmAp9+m3ViwEFcoQgBLd/Qpilkl05QWJzNCeAug9zL
 0tNNFCLV+FEJySQz+tdt3uYkzgCqog2d6MzpLamVnEWfCVvaI8El4KhbPcGnVfSOW/I7
 9RzDnVSR/bANzhD/xcRZv82gR11tB47NFOcNvdrZsb+hWUTIPLoPjD1xInJrAbaTeLiT
 /lDg==
X-Gm-Message-State: AGi0Pua+qQQKhrJCQUK5CMDje3STxCgWa8RiHBT0DwiWPMpr+iraJFdL
 UpNw2j6mMMak+l9UVvFGHxOzE0pVQ4jTtUBLWCc=
X-Google-Smtp-Source: APiQypJCzQXTwcVDAsol0GJSsiyf/YRGJPA1BCsaylnkBqP8rfc2a3FzDvddKmzBEi+evnZScUHUz2AZvsuoEtD4s5M=
X-Received: by 2002:a2e:87d3:: with SMTP id v19mr5744807ljj.176.1587530012019; 
 Tue, 21 Apr 2020 21:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <1586763024-12197-4-git-send-email-chenhc@lemote.com>
 <20200421195613.CD4D1206D9@mail.kernel.org>
In-Reply-To: <20200421195613.CD4D1206D9@mail.kernel.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Wed, 22 Apr 2020 12:40:53 +0800
Message-ID: <CABDp7VoErMhsmG4QepXd-vJgtUiWRYCt77KdjpjwGhpmq3MLZg@mail.gmail.com>
Subject: Re: [PATCH 03/15] KVM: MIPS: Fix VPN2_MASK definition for variable
 cpu_vmbits
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::241
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
Cc: kvm@vger.kernel.org, qemu-level <qemu-devel@nongnu.org>,
 stable@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Xing Li <lixing@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Sasha,

On Wed, Apr 22, 2020 at 9:42 AM Sasha Levin <sashal@kernel.org> wrote:
>
> Hi
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v5.6.5, v5.5.18, v5.4.33, v4.19.116, v4.14.176, v4.9.219, v4.4.219.
>
> v5.6.5: Build OK!
> v5.5.18: Build OK!
> v5.4.33: Build OK!
> v4.19.116: Build OK!
> v4.14.176: Build OK!
> v4.9.219: Build OK!
> v4.4.219: Failed to apply! Possible dependencies:
>     029499b47738 ("KVM: x86: MMU: Make mmu_set_spte() return emulate value")
>     19d194c62b25 ("MIPS: KVM: Simplify TLB_* macros")
>     403015b323a2 ("MIPS: KVM: Move non-TLB handling code out of tlb.c")
>     7ee0e5b29d27 ("KVM: x86: MMU: Remove unused parameter of __direct_map()")
>     9a99c4fd6586 ("KVM: MIPS: Define KVM_ENTRYHI_ASID to cpu_asid_mask(&boot_cpu_data)")
>     9fbfb06a4065 ("MIPS: KVM: Arrayify struct kvm_mips_tlb::tlb_lo*")
>     ba049e93aef7 ("kvm: rename pfn_t to kvm_pfn_t")
>     bdb7ed8608f8 ("MIPS: KVM: Convert headers to kernel sized types")
>     ca64c2beecd4 ("MIPS: KVM: Abstract guest ASID mask")
>     caa1faa7aba6 ("MIPS: KVM: Trivial whitespace and style fixes")
>     e6207bbea16c ("MIPS: KVM: Use MIPS_ENTRYLO_* defs from mipsregs.h")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?
Please ignore this patch in linux-4.4 branch and even below.

>
> --
> Thanks
> Sasha
>


-- 
Huacai Chen

