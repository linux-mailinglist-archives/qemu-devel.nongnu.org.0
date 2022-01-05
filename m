Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F754850B6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:07:30 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Cb-00030s-Vu
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:07:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n539T-0000pm-AT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:04:15 -0500
Received: from [2a00:1450:4864:20::42e] (port=41686
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n539N-0005y8-7H
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:04:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v6so20144674wra.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 02:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xkfe/J111FcWnu7rdRR2HaEKlJUQolcTC8ueKRW7Zog=;
 b=AN5Uae1ViOzbSwLXXoFJq0eMz01RCSoSihGsQbltcbWzsHWQ4ALw3vRH0I+HVxH+Dd
 nEOQk13vURpJTxN2PrzVFlbrVxUxdZk08vxW+bDDn+3QrJQLVMgZNh23+WsP7Z+ZeE4X
 8bxHYQwSn49dgjPAE6zJqcF97WMaKUYKc+c2pIDMiJNUK0wTD5OPD6WRq8kgrYHI4MSp
 G7JDlI8dkC2TBoZpV0+BWlaDi11Kv7eSHgqK90JsmjtIDnd2cBVIf25qlw6cQSTG74UC
 P2OpqrOhbcbisPmCqlj1j92cXw8iLiLGCp6oPiMVMp0NsH0r1iH24da6PtVllTwEQVDo
 q/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xkfe/J111FcWnu7rdRR2HaEKlJUQolcTC8ueKRW7Zog=;
 b=cQwxKciIXOaXX5urDrVJseHVSr4UtkXU/CA8MqSeQ71xpMfqKeOe+egEsgUD3EoyS8
 bxD4P5TiBqwFt5XRNZzI03MlhlkzuoulFnsZbw30WeR/7fKOg9FdZCCxu+89od/quWVy
 uPJv0/enBc6nTwyf/jgFYGUoMTRIt21EbLch0kn4Jq34TM0qDqdxxWbkFDL4ErEyeSTr
 emiVdSJdllhd67/i3sGSxIwmXAZqSTrvf50yHdbnuOU7A9oi5llveDEv8Jy3X7YeNImQ
 McPuXTEPT1gfmpsL63c5gB/wF8Cq5wGhq2hUNSmzkzITjrQCdYSdbkjqHgAlAuV2RK4Z
 9NuQ==
X-Gm-Message-State: AOAM531QFUMe6scNGFwPmjr4jHbTgK+kaFc/pLe9Vbu237MrWh1Dm+0Z
 1QQKGDIZv5ptmgrm4neuuuY=
X-Google-Smtp-Source: ABdhPJzBET9OfjcwFmQSt0VT4FXxrZBG+4wjkLBXB8SPFcRcnbn94qc1zL+zX8dpfPXwBGMejjEd3Q==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr44917458wri.1.1641377047901;
 Wed, 05 Jan 2022 02:04:07 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i6sm1106025wrf.79.2022.01.05.02.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:04:07 -0800 (PST)
Message-ID: <01628bc2-aeff-86a0-29e9-557937af570b@amsat.org>
Date: Wed, 5 Jan 2022 11:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] common-user: Really fix i386 calls to
 safe_syscall_set_errno_tail
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220105052339.677395-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105052339.677395-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/5/22 06:23, Richard Henderson wrote:
> Brown bag time: offset 0 from esp is the return address,
> offset 4 is the first argument.
> 
> Fixes: d7478d4229f0 ("common-user: Fix tail calls to safe_syscall_set_errno_tail")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Ho hum.  I'm disappointed that our CI didn't catch this,
> despite cross-i386-user.  And I'm disappointed that I
> didn't run a full manual build on an i386 vm to catch
> it myself.  I plan on committing this directly.

Sorry for missing this myself too while reviewing, x86 is my weakness.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  common-user/host/i386/safe-syscall.inc.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
> index 9c45e56e480..db2ed098394 100644
> --- a/common-user/host/i386/safe-syscall.inc.S
> +++ b/common-user/host/i386/safe-syscall.inc.S
> @@ -120,7 +120,7 @@ safe_syscall_end:
>          pop     %ebp
>          .cfi_adjust_cfa_offset -4
>          .cfi_restore ebp
> -        mov     %eax, (%esp)
> +        mov     %eax, 4(%esp)
>          jmp     safe_syscall_set_errno_tail
>  
>          .cfi_endproc

