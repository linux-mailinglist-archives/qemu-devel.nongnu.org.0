Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAF2E8E59
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:17:22 +0100 (CET)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAkb-0008S8-Fe
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM3-0003g7-Pz
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:59 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALw-00067H-7q
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:57 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k10so15968444wmi.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0a3rTB/0hGEtsQF0OD3GQ48dsGPkE+9rJGIbQwI7VZI=;
 b=FMUCS7br9Pv+0kJR1E9A1X4zia//06u1mfG1Yn4YHYlkQdnxztC75yJJXC3ufhrkm2
 VgYfNrhYYjZwXt4QnVc0wlufec4HmJN/G62Ax4eIcg6CrbYryLQJd1kSVuIKdYTf7YQ2
 VmQqtlJXMcraMxvYqmILplwB1MXMTiRMzr3DH5EgRXkFfiMDY/4C9NfqAwH3bkQ5ntsd
 Uq3Cioibu4Jb+M0oS44iNeTKTyYC8fJhnC0ZX6/Fc4YRtYfxfgNesu92Xq45jBATQjof
 fORVEu5BMQs5p7trPiE7wwgULkYqlCxvQJSwPgYoPZAEZrGTEyGG3wdqWVgZTREodrpK
 5r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0a3rTB/0hGEtsQF0OD3GQ48dsGPkE+9rJGIbQwI7VZI=;
 b=Qnkj9jiXVzMsq+MTrkCNfyNGkYdhY32BHbELZOn1xBucVtAjbBbNdZYdRF0zOQtsJL
 SA4BVREZAHm6ZDAewpQKbpfI2hkEUZEsc/0763ZKIaI4AtPKCdHQvR+8LGJHWS1JNt6D
 PG/A+NNMWi7CCIhNUdpZhElJ/wq4kHc4Syw9NUdWo2i3T1Lneuidw00q8jZG3XT8OIPP
 r0Qc48hrQ83h8Oof2wkG54nSi6MvPp+lHs0tZp8fVIu+HQ9zgsStiUoe12a9bCojYRvT
 iuhYztRo0MYJw31BxS0/2z4fL1/Uut3TlC4NonHahuU5seQ0k+CtGSriYKUJQhTNSOQZ
 hpeg==
X-Gm-Message-State: AOAM532+n4q0laBOlCLjW/DkrVztUOXz4lJuqPZtIhGhxKYWYWssbl/m
 9Pjth1DJv95ubo/OuT0o3No=
X-Google-Smtp-Source: ABdhPJw7tWRQ7lR96ja8pRwL/9jzN4PjXwBy0FMVR2MDyslipYhdh5+Di7vDiQX4vqblx8k+FyKKww==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr24516139wmf.46.1609707110508; 
 Sun, 03 Jan 2021 12:51:50 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id n14sm29274120wmi.1.2021.01.03.12.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 12:51:49 -0800 (PST)
Subject: Re: [PATCH v3 0/8] hw/mips/fuloong2e fixes
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d7a6b3e7-d0fb-e559-486d-259b5aab74b9@amsat.org>
Date: Sun, 3 Jan 2021 21:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 4:17 AM, Jiaxun Yang wrote:
> It can now boot Debian installer[1] as well as a custom PMON bootloader
> distribution[2].
> 
> Note that it can't boot PMON shipped with actual machine as our ATI vgabios
> is using some x86 hack that can't be handled by x86emu in original PMON. 
> 
> 
> Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/tree/fuloong_fixes_v2
> 
> v2:
>  - Collect review tags.
>  - Get CPU clock via elegant method. (philmd)
>  - Add boot_linux_console scceptance test
> 
> v3:
>  - Collect review tags
>  - Typo corrections
>  - Rewrite PCI Lomem
> 
> Jiaxun Yang (8):
>   hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
>   hw/mips/fuloong2e: Relpace fault links
>   hw/pci-host/bonito: Fixup IRQ mapping
>   hw/pci-host/bonito: Fixup pci.lomem mapping
>   hw/mips/fuloong2e: Remove unused env entry
>   hw/mips/fuloong2e: Correct cpuclock env
>   hw/mips/fuloong2e: Add highmem support
>   tests/acceptance: Test boot_linux_console for fuloong2e
> 
>  hw/mips/fuloong2e.c                    | 84 +++++++++++++++++---------
>  hw/pci-host/bonito.c                   | 42 ++++---------
>  tests/acceptance/boot_linux_console.py | 21 +++++++
>  3 files changed, 89 insertions(+), 58 deletions(-)

Patches 1, 2, 5, 6 and 8 queued to mips-next.

