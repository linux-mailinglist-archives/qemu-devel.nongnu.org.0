Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7372DF148
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:21:47 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhnW-0007lg-Et
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhWa-0000lt-Vb
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 14:04:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhWV-0005zY-EA
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 14:04:16 -0500
Received: by mail-wr1-x435.google.com with SMTP id m5so6562528wrx.9
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjzKBtFnDX8TdHLPi2smRX1F+3s3Gwj75HN6Ih8/Uxg=;
 b=OqaWHx1q1G8ZPYcrgkHOJFi9EPP/4IwLdPt1B+9JGtg7hTNs3Ollikv5M4qQ1pv6OI
 1o6kV7MROBsSMY98UACeJrD5mq+MSHIBv0++J3tOFH+Pb8X0QBqGcEMRjGdiwRU5G+aD
 Idk5ZnTLP5Num3hdSMa9cfqpafLve1BjtBZREOAL+/lP0gmlimyxQUqICJ3jarzSghua
 FZJ9Yu0D+pw+BrIY1XZFL5gk0a+Jb0FA8Ji0A9VhaE8FiJV3lDeRFWPtBbxhnma2/EQI
 gPuokJHgWKiLInKOEkUCIVrumfRNN909798uQRDq+ZBoIfse2vMxLYT4LLv0FSK/OkOu
 xOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjzKBtFnDX8TdHLPi2smRX1F+3s3Gwj75HN6Ih8/Uxg=;
 b=eDIRCcBxjeGOc0sGGNChJvQErRASqRfehzG2DJm9yvWHK3ArcHjEq3ZJxcb2WWFFif
 ntGlx27daXceF1vb8dFGp0Yj2FEHJ3dS4YtlULXMLghqeAOmq0TQUTc7k4afKTAWQsva
 JpYKPBNavP6VAGR1+CG2udInlU0FJmoLF/SWDnQU+dbrThkTZtbIZm2CTqDhJj7ZfBxn
 3Wfu75nzQDtXNBOPctIp8m4rDP1GqT8kpkquR4eGYC3sXHRsCR0ubLKbzH7tGWgkX7Sd
 Eon11KlDNFeKYEXN14dVHOXkUwyc4gugCn4WuD+5CTpKSb7DlOmUxAe4LYV3AKG9lvDc
 Hm5A==
X-Gm-Message-State: AOAM53326QfKztPSaUk4jEwb5VR7uvAMIUa4AEsAIOBgkZXkQsVjtgZA
 iM4gcGbZlBMbIdoRr0D0TYM=
X-Google-Smtp-Source: ABdhPJzI4bp2in4QYDukpacTXwqJLqosWZoaXqdfmx8FEyA/wVdrvA9EmVePCmFE9WqvzRUdIqp/tA==
X-Received: by 2002:adf:97ce:: with SMTP id t14mr10612346wrb.368.1608404649987; 
 Sat, 19 Dec 2020 11:04:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id o83sm16217523wme.21.2020.12.19.11.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 11:04:09 -0800 (PST)
Subject: Re: [PATCH v2 0/8] MIPS Bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <217928f0-58a5-6a3f-3e89-e9e0ebe3b376@amsat.org>
Date: Sat, 19 Dec 2020 20:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:41 AM, Jiaxun Yang wrote:
> v2:
> A big reconstruction. rewrite helpers with CPU feature and sepreate
> changesets.
> 
> Jiaxun Yang (8):
>   hw/mips: Make bootloader addresses unsgined
>   hw/mips/malta: Use address translation helper to calculate
>     bootloader_run_addr
>   hw/mips: Use address translation helper to handle ENVP_ADDR
>   hw/mips: Add a bootloader helper
>   hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>   target/mips/addr: Add translation helpers for KSEG1
>   hw/mips/malta: Use bootloader helper to set BAR resgiters
>   hw/mips/boston: Use bootloader helper to set GCRs
> 
>  hw/mips/bootloader.c         | 157 ++++++++++++++++++++++++++++++++
>  hw/mips/boston.c             |  62 +++----------
>  hw/mips/fuloong2e.c          |  48 +++-------
>  hw/mips/malta.c              | 171 ++++++++++++-----------------------
>  hw/mips/meson.build          |   2 +-
>  include/hw/mips/bootloader.h |  48 ++++++++++
>  target/mips/addr.c           |  10 ++
>  target/mips/cpu.h            |   2 +
>  8 files changed, 306 insertions(+), 194 deletions(-)
>  create mode 100644 hw/mips/bootloader.c
>  create mode 100644 include/hw/mips/bootloader.h
> 

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

