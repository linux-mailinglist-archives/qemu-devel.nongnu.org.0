Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0682E859D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:51:12 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvROB-0003s9-Nu
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRMf-0002si-R6
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:49:37 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRMe-0001N3-4D
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:49:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id c124so9684386wma.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/P67jR4r1KKhccgEHGFcNHoACGvzUMDoS9v8MyrnMU=;
 b=ILrWoGSlYOrSwajehF2avEY/lRxJ9l9Z5ksvuS49xLr+QrlIA0wifCoEovb/Fgahcy
 /cPS+6OdOX5WGBmFVSyqzCP3/pR5gEgqsAR//hIGIs0rFT3QcWVCh8D6ex9UduHsC35K
 1ip8y1364Ukt7S/9vjFzmXEM78TWXV+cWP8ot39B7nGZdAMmAs4Vy8zW6w5605G84ARb
 R/SuR2y1si+IEXWKP/gWp26aUDSTlVbVIuLdG8QfQ2KQQyT7bEo5oNX/686aWSszjCBv
 as0verKXNTZ9Hpi0MvJdMxVkK6Wkm2o/HmgIEUO+tTwHATAbGb1jjmYoPTzm4TIA5Rrm
 tyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/P67jR4r1KKhccgEHGFcNHoACGvzUMDoS9v8MyrnMU=;
 b=XGPHCSrYM57V12DQgnig/fhXZ2XbPg8IaVLQMYKngLkierOpd7z51jXJIPkxJDbIkC
 bS8Odzz9ZWMbQptTDfMvyQ6BiTCZTntHE05hoI5q5fBd0w+D7Dq256AM5E4KUZAKMH7e
 wa5gLhpkpc1ny7pPJifGJbI+IgUINVsmtc6/wBtiDsJADt3rEvLMOVHOCfIHJQe/C5ne
 IDoyLGodW9lySPvhkE7gE21I+Vwv3cUV9J2UrHmCJfn/70msT9JyaiTRfhcwXHCQ582d
 EFLTevLC0f6sImbjdLYADsKpl1fjsQka2TY/jGuZAdY9VKo8i0INnOBw2vs13/TJ7Adh
 BK4w==
X-Gm-Message-State: AOAM532xSzHYdTyfRwmO1+KKgNNLvuv6RhuyX3WmfyIuwUV1jFWJ1NNn
 DxAvQqmRkam6W9DBbHsVSco=
X-Google-Smtp-Source: ABdhPJzt+0xw9tcDEMRF7ZfBj4jaNRBts+lUiYgAiUqIq2Se2ZJ0D4pBZViiq5K3h3WcBAbYR9Sz0Q==
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr16711367wmd.41.1609534174780; 
 Fri, 01 Jan 2021 12:49:34 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id c20sm18484828wmb.38.2021.01.01.12.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:49:34 -0800 (PST)
Subject: Re: [PATCH V19 4/5] hw/mips: Add Loongson-3 machine support
To: Huacai Chen <chenhuacai@kernel.org>
References: <20201221110538.3186646-1-chenhuacai@kernel.org>
 <20201221110538.3186646-5-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe9f5f3c-1a45-139d-7620-0cd2032db191@amsat.org>
Date: Fri, 1 Jan 2021 21:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221110538.3186646-5-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 12:05 PM, Huacai Chen wrote:
> Add Loongson-3 based machine support, it use liointc as the interrupt
> controler and use GPEX as the pci controller. Currently it can work with
> both TCG and KVM.
> 
> As the machine model is not based on any exiting physical hardware, the
> name of the machine is "loongson3-virt". It may be superseded in future
> by a real machine model. If this happens, then a regular deprecation
> procedure shall occur for "loongson3-virt" machine.
> 
> We now already have a full functional Linux kernel (based on Linux-5.4.x
> LTS) here:
> 
> https://github.com/chenhuacai/linux
> 
> Of course the upstream kernel is also usable (the kvm host side and
> guest side have both been upstream in Linux-5.9):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> 
> How to use QEMU/Loongson-3?
> 1, Download kernel source from the above URL;
> 2, Build a kernel with arch/mips/configs/loongson3_defconfig;
> 3, Boot a Loongson-3A4000 host with this kernel (for KVM mode);
> 4, Build QEMU-master with this patchset;
> 5, modprobe kvm (only necessary for KVM mode);
> 6, Use QEMU with TCG:
>        qemu-system-mips64el -M loongson3-virt,accel=tcg -cpu Loongson-3A1000 -kernel <path_to_kernel> -append ...
>    Use QEMU with KVM:
>        qemu-system-mips64el -M loongson3-virt,accel=kvm -cpu Loongson-3A4000 -kernel <path_to_kernel> -append ...
> 
>    The "-cpu" parameter is optional here and QEMU will use the correct type for TCG/KVM automatically.
> 
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  MAINTAINERS                                  |   1 +
>  default-configs/devices/mips64el-softmmu.mak |   1 +
>  hw/mips/Kconfig                              |  11 +
>  hw/mips/loongson3_virt.c                     | 621 +++++++++++++++++++
>  hw/mips/meson.build                          |   2 +-
>  5 files changed, 635 insertions(+), 1 deletion(-)
>  create mode 100644 hw/mips/loongson3_virt.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

