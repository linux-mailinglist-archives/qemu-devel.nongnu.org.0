Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A56320BF2
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:12:39 +0100 (CET)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsHd-00037E-LT
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDs6i-0003Mn-RW
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:01:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDs6f-0001N1-OM
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:01:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h98so11802688wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 09:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TT4Wncnw06XDjsXFw74tF5V7rmNVukXa85wt+vOconc=;
 b=R4mQ/7UmGSxJPDZKTEXCMKA72AuwpEVDsgFHWzxGVu8oeKJBF1Qx5ZYHXk+9eE2FPF
 KpznUQDwfMg8vLyQZWxnqnWp4pbpaYOk2dU/Ku+pO1h4BrkeZsBx3SDBd8Ba527VaDlh
 bp6m9Bzpf/7H3gbp1SwGIJZCDOPqoYnVAh3yh6FTHkLC3EVmDWi1NJZyf4Fi7vWUQgoM
 slC2KbhFobLA2GPshKFS/nTTtt87WckC6+6icmLJAgr7YIQuxLg5naeSXi2OPlHqOSDM
 3K2pgKbIxRw0MNNH7soVpKljrpvc1qhCwxAssDgJFZ/5DFmAhyGlaNBD/M8VkbV0Jkl6
 h8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TT4Wncnw06XDjsXFw74tF5V7rmNVukXa85wt+vOconc=;
 b=Ng1jSGCPCRuiGwgkYvasMuIFFfquJDwvf2r7Le2mI/WvqSDfLiX5qMxQpZd2wKIdbZ
 gQxpKd4Qqe+z9WrijiQ7fD8MRT8cshgEVDTmcmJrpol2CEAXOA0F4N0V2hR42lCteb5v
 EGWNvVyptT9h1V+rVtXco9ZRHJLNzdN2zeyP4QJrTPSduk+QDLdUSPV7cNHBHLhQIgXA
 dXZP/A8evgt0YEAK/rh113fmyXwn1OE7kqsAS484c0eiLnL/GnBi9sSuxMK63dGR0VmY
 0Q/Z8x+DhfUidn2X2akmcH79EGmwTYd5sYDfG7esUjOcRcE6pHWabUyDpGNlPtoMl9ce
 Xb0w==
X-Gm-Message-State: AOAM530ep2ZwMbUNkXv2OKtIPrh3le2XdoojawfLAvZm3B2b7hZbUVC+
 GLSOVEmlP52m+brba4A+lgU=
X-Google-Smtp-Source: ABdhPJwgAseAn2HWoqgvAiNX4FAsohDk/f1Ly3/IeVRcDEwevokX6G30LvukqlrhL/pBmp0TvlEcjg==
X-Received: by 2002:adf:dd41:: with SMTP id u1mr7326540wrm.190.1613926873486; 
 Sun, 21 Feb 2021 09:01:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm22215807wmh.39.2021.02.21.09.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 09:01:12 -0800 (PST)
Subject: Re: [PATCH] target/mips: Remove unused 'rw' argument from
 page_table_walk_refill()
To: qemu-devel@nongnu.org
References: <20210220202026.2305667-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85bc9e97-3d7e-e71d-0fd8-73f3c7a0df5a@amsat.org>
Date: Sun, 21 Feb 2021 18:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210220202026.2305667-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/20/21 9:20 PM, Philippe Mathieu-Daudé wrote:
> As the 'rw' argument is unused, remove it.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tlb_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to mips-next.

