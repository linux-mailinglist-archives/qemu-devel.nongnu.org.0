Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5640FA16
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:20:07 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREil-0006lD-1p
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mREgJ-0005J6-4o; Fri, 17 Sep 2021 10:17:35 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mREgG-0006oP-Gt; Fri, 17 Sep 2021 10:17:34 -0400
Received: by mail-qk1-x72e.google.com with SMTP id y144so17888841qkb.6;
 Fri, 17 Sep 2021 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a5eQfdSgBkDvH6C+hAfDOcFFE3CPWh+NfgV0Tds3fmY=;
 b=UurAuuPRGlz+FBBgN8UwUb6D43is3H2FUyJuNjdRwKeMH5+Q4n8i0J8acoHgv1xoWG
 SzKIgjJxFdKgaw9pFezt1zJJJGQQ60u5suQ2w4YnsUoPjgfE6ej0wXKABhVXIG5F8IfX
 n1M7FA3E46psT8ILJK4LoYgJCa0OTWX74oOfAKl76Wl1osOZ6l5jlaQ++6S7qsk49a0K
 KpQrD2Gpv6+t3G2I10mXxrs6rSPaMUuz/RiX4pj2zum0ngZ2keYQX1zOyvMLjC/+m+sG
 /UPlGYlT9x81wbsAAWgkNgXrrOCHmWuRlznSiEXm/LSzsYj8U+M+px1Jmg5iyfi1Smdr
 gRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5eQfdSgBkDvH6C+hAfDOcFFE3CPWh+NfgV0Tds3fmY=;
 b=hOLubi6RMfGCi5RlzUZ1qgKo4FFDalwX8zQIYP9U1VvMaHz4kDQ0vWOG/kFykTv5bh
 OLhxt2LexzCJL3tdIPGmQuFJ7fSwwbzu3elR3qawZ2e/lwd7408pfqIPkhyNZ5NK9//2
 xhO9rj0e/JcW6ARql9EFQzH557gKzZ/UFthdRziTrGAb9iVmLQtQavceQZ5VivxU+Cii
 Kmq96wcvDVK93GMi9Jpw/UcqTg1u1mGdPXzJ4JWuds0vDfTr7YL9akex4dvsvuE6s4Ko
 deIRa/kFG/DSU7Vaam18mo34+X470LCrdel7rmQ5FsRf1tEIc694rZOJm1cdqTvk69XK
 95eg==
X-Gm-Message-State: AOAM531CBpNtWHeP8adyIDyL2Cfir/bVRy9omv9U5LQl+2mgQcbJtkMU
 Xrdl0K97PtVcO5KOajsW4Wk=
X-Google-Smtp-Source: ABdhPJyMOiHcdHqNyfG8jwjRjz2O3QYTrGVyeJ0lMDXnM+I9l53V2+3q1Fi1eXtJ0+XgA3wtJthNOw==
X-Received: by 2002:a37:6683:: with SMTP id a125mr8592306qkc.351.1631888250858; 
 Fri, 17 Sep 2021 07:17:30 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 10sm4593121qtu.66.2021.09.17.07.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:17:30 -0700 (PDT)
Message-ID: <2a6a935e-a842-a2ba-6cf1-2629762adc23@gmail.com>
Date: Fri, 17 Sep 2021 11:17:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] Require hypervisor privilege for tlbie[l] when
 PSR=0 and HR=1.
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.488,
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
Cc: leandro.lupori@eldorado.org.br, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/17/21 08:47, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> While working on FreeBSD radix support, Leandro Lupori (CC'ed) noticed
> that the latest build still fails in KVM but works in TCG[1]. This
> difference occurs because the current implementation of "tlbiel" does
> not validate the instruction parameters and always check for supervisor
> privilege.
> 
> This patch series partially address this problem by requiring hypervisor
> privilege for radix mode when PSR=0. The validation of other parameters
> can be done when we move storage control instructions to decodetree.
> 
> [1] To reproduce the issue, grab an ISO from [2] run qemu as
> 
> qemu-system-ppc64 -cpu power9 -m 2G \
>      -machine pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>      -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso
> 
> or
> 
> qemu-system-ppc64 -cpu power9 -m 2G -enable-kvm \
>      -machine pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>      -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso
> 
> Stop the boot at the prompt and use
> 
> OK set radix_mmu=1
> OK boot
> 
> [2] https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/
> 
> Matheus Ferst (2):
>    target/ppc: add LPCR[HR] to DisasContext and hflags
>    target/ppc: Check privilege level based on PSR and LPCR[HR] in
>      tlbie[l]


For some reason I didn't receive these 2 patches in my mailbox, just this cover
letter. I reviewed both using the qemu-devel archives.


Both patches:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



Thanks,


Daniel


> 
>   target/ppc/cpu.h         |  1 +
>   target/ppc/helper_regs.c |  3 +++
>   target/ppc/translate.c   | 28 +++++++++++++++++++++++-----
>   3 files changed, 27 insertions(+), 5 deletions(-)
> 

