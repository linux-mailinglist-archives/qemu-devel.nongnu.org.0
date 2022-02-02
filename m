Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44B94A7BBB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 00:34:02 +0100 (CET)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFP8R-0002Ge-Fp
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 18:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFP2O-0000sX-AS
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 18:27:45 -0500
Received: from [2607:f8b0:4864:20::102e] (port=38733
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFP2M-0005NY-5L
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 18:27:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 o16-20020a17090aac1000b001b62f629953so8287027pjq.3
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 15:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tWFz3fwUdZA+AOrIiKeDVpPiX15bKfnwMjiWUw3xZkk=;
 b=VFLzOX0znxQbNufLbZnSVlj8M3kWIvAxDMjkQo4L2lu3t+dxrP2XNMcNdtVBNTBhp2
 VrMqPXYOOBIyFdK3+FryVMRwZyAYyxXeZGmWB7b9nTP0J9ap8IvgRYTS3EUxDaGELaI7
 gaJwAAXaTO9wt2TwExE+/QMF3pEULmuWaa9vsa6n+tPEjkOn6OaU4BlQ3j3eJEZdIK8E
 DpxH8pf2a8C9pzhG9HfHQlPUNFaSHyeuVAjY3r2AhikvjvVPMY8k92XKEceUwQB3x22M
 IjfdeWthrbtEoj61qG8fPtPbccdvptet0zvxUoxgnCmNor4ovSbF0L9JgKJBuYlj6g7Y
 LC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tWFz3fwUdZA+AOrIiKeDVpPiX15bKfnwMjiWUw3xZkk=;
 b=i35KhjO7JfgOv4Bgrn1kIA5KCbSQYFB8Ivbc/Y3gTTG89YuDVkab72GYrWv/BjDS+H
 EmHpt3bX316ovakqF7dflExKSqHPaXgAUZKzSn2BLdMeoN366kxF4qOJsbYLJrHjHewK
 /oKOhYQCqlXERty1aoqnRgMcfHr7AG7bJnJKwK6yjd11I2It60XKFDj3aJRaiNnVEf9s
 Houskul7169hQBwiW/anBmeIAP2cLLvUAtCzA56W1w7ogTAxqBFFg31TnQNu+7CqfjsL
 AjzTqrOggKVLQU27Le019h90LG5qxWLmZUvtq2GwmYOpfAMBMAx0XwRJbyA6C5D+sER8
 9fAA==
X-Gm-Message-State: AOAM530PPlnDEkj9TO9/lHoW9oGoDALx5gD4s+jKOQc7wcrvY5Tdiq3B
 /9SNcAEYVPe45n0TL7p/nCQ=
X-Google-Smtp-Source: ABdhPJyjSocE5Rk/O4I602y30Nmd6gIpEX77KbD4n8cKZJjFco1xA/Xms7N6A5REDnH9S2SwENo1MQ==
X-Received: by 2002:a17:90a:f001:: with SMTP id
 bt1mr10621547pjb.109.1643844460598; 
 Wed, 02 Feb 2022 15:27:40 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g19sm21294316pfv.4.2022.02.02.15.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 15:27:40 -0800 (PST)
Message-ID: <c64a77e0-33c6-ab26-412f-05e329fe5968@amsat.org>
Date: Thu, 3 Feb 2022 00:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] m68k: virt: add a bootstrap ROM
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220202223528.1260154-1-laurent@vivier.eu>
 <20220202223528.1260154-3-laurent@vivier.eu>
In-Reply-To: <20220202223528.1260154-3-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/2/22 23:35, Laurent Vivier wrote:
> This ROM will be started by QEMU and will load the firmware.
> The firware will be based on Petit Boot, the aim of the bootstrap

"firmware"

> is to ask QEMU to load the kernel and initramfs to the RAM.
> 
> It also builds the bootinfo structure to pass to the kernel the
> same way QEMU does when it loads directly the kernel.
> 
> To build the bootstrap:
> $ git submodule init roms/m68k-virt
> $ git submodule updage roms/m68k-virt

"update"

You can combine as "update --init".

> $ make -C roms m68k-virt-bootrom
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/virt.c      | 32 ++++++++++++++++++++++++++++++++
>   .gitmodules         |  3 +++
>   pc-bios/meson.build |  1 +
>   roms/Makefile       |  7 +++++++
>   roms/m68k-virt      |  1 +
>   5 files changed, 44 insertions(+)
>   create mode 160000 roms/m68k-virt

> diff --git a/.gitmodules b/.gitmodules
> index 84425d87e28a..315d597d057a 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -67,3 +67,6 @@
>   [submodule "tests/lcitool/libvirt-ci"]
>   	path = tests/lcitool/libvirt-ci
>   	url = http://gitlab.com/libvirt/libvirt-ci
> +[submodule "roms/m68k-virt"]
> +	path = roms/m68k-virt
> +	url = https://github.com/vivier/m68k-virt-bootstrap.git

We'll need to mirror that on gitlab.

Otherwise LGTM.

