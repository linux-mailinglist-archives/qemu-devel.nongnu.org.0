Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46934AEB1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 19:42:46 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPrPw-0003vG-Nm
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 14:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrNl-0002wZ-7J
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:40:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrNj-000095-8F
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:40:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso5400022wmi.3
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vh5uTf+ghMO2irHqZAOozDM3KDFZh1P4OCtJ1fePy/k=;
 b=qolDjwIBTLxvpB9kYvqnnQEBFA+sSYQtQl0/j40qSUBv/uB/uObkWvBuXLZZTWeXbK
 9zKkK/8pdLfbtAGXflUQvalZD+gcnv/OS8urhEzBx13pKdzNpJAGvLz/8kZE1MhXCCQZ
 3uz8VcLrFe7d8pbUlEaWzkSq1d59ohA3BB/EWThQNwVkzvoIx4HQHcge6bpDQrY8nB2D
 ycwwkwaoamF4osdsDJ3AUH6NsfbzQOeXTw4IpxcQfTwNvnjBW+bcmWy1XlJP3hlWaIax
 x+ojAw4lqyyBGKOHrJf8q0r8n8jBK26mZLcsgdkRjmXR81d9VeaJ7OLYX7aFAtUQkoqg
 NNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vh5uTf+ghMO2irHqZAOozDM3KDFZh1P4OCtJ1fePy/k=;
 b=Ez/PQbYn9E72dlg/KdougG98uwuPk+iQsSwQjg4VuyUzDKTD2r78BnRrJYWSR/rR5z
 976SqQEYwhVjXO6A742zkafx7vhuZ2TqczPOkP46yRQ//XS38UtLd+37Ds4vJqHwFvZl
 ponN3Px3WwZeX1ZIn4+4JulIE4jyOSvFaxT8WMGlp6uR6rrWh/FsJWeJ/2/eKI7aaI4G
 6Bzx5Nkd/zCdtGzFvtaDCSHgJlG8G2ErRj4mEHwm58+55or8TOMhfU4z/Yi3Zg9fMUDB
 GazR04kDsHhPRdOs5SZLJhodxD+vVGNiznjyAP60rpKQv4sJO+KWghNX/gz0mUZ4a90A
 fBag==
X-Gm-Message-State: AOAM533fjiSO+SVZ5FKsyBhFsNTK3AMGDuzs8AZC6hyzNIkbm+FQXevH
 gR874vSqbVe0vMa3sXGZXiBVZC9UNKzCXA==
X-Google-Smtp-Source: ABdhPJza9ijsiIxFNgN/YPmmY3G2J+G7Uclww/s+UI6kH6wEtV8m+J4hbWjurgB5yQI2HbrmJAt7UA==
X-Received: by 2002:a05:600c:224e:: with SMTP id
 a14mr14122755wmm.57.1616784024981; 
 Fri, 26 Mar 2021 11:40:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d18sm15013330wra.8.2021.03.26.11.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:40:24 -0700 (PDT)
Subject: Re: [PATCH] nsis: Install *.elf images
To: Bin Meng <bmeng.cn@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d8569662-1c7f-dc26-130e-0c1b83c885e8@amsat.org>
Date: Fri, 26 Mar 2021 19:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326062140.367861-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 7:21 AM, Bin Meng wrote:
> As of today, the QEMU Windows installer does not include the
> following two RISC-V BIOS images:
> 
> - opensbi-riscv64-generic-fw_dynamic.elf
> - opensbi-riscv32-generic-fw_dynamic.elf
> 
> Update the installer script to include them.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Following this series' idea:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg794466.html
"blobs: Only install required (system emulation) files"

Maybe we can use meson + cpp with C #ifdef'ry (including
config-host.h + meson definitions) to generate qemu.nsi
with only required blobs?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Based on:
> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307ff6c
> 
> The above commit does not land on QEMU master. I am not sure what
> the process is, sending it here for comments.
> 
>  qemu.nsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/qemu.nsi b/qemu.nsi
> index 96c5534254..aeabe3bdbe 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -142,6 +142,7 @@ Section "${PRODUCT}" QEMU_System_File_Section_Description
>  
>      File "${DATADIR}\*.bin"
>      File "${DATADIR}\*.dtb"
> +    File "${DATADIR}\*.elf"
>      File "${DATADIR}\*.fd"
>      File "${DATADIR}\*.img"
>      File "${DATADIR}\*.lid"
> @@ -258,6 +259,7 @@ Section "Uninstall" Uninstall_Section_Description
>      Delete "$INSTDIR\*.bin"
>      Delete "$INSTDIR\*.dll"
>      Delete "$INSTDIR\*.dtb"
> +    Delete "$INSTDIR\*.elf"
>      Delete "$INSTDIR\*.fd"
>      Delete "$INSTDIR\*.img"
>      Delete "$INSTDIR\*.lid"
> 


