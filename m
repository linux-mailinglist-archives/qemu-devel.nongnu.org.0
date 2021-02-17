Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860D31DFA5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 20:30:27 +0100 (CET)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCSWm-0005FS-Qb
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 14:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCSUR-0003jB-Pd
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:28:00 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCSUP-0000EH-3o
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:27:59 -0500
Received: by mail-pg1-x532.google.com with SMTP id o7so9132324pgl.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vjNFtEC9IJoaQpaUejWUpYZb9jDCMsNfP1e62qn6I3Q=;
 b=G+S0g79T5aAnQs9i+jTbTj+PrIVSHjxbTbH2fRauSCCHGEC6PNTqj+Ygo6vsqgTi9K
 Mw8sDzF6pJytGfSKkFPLC0o3BiHzvx/JOVxiR0PiuGtRi7N8VykMxGoTWwBlljfHFKl+
 3I3sPIi67HuOMGF9Ha+CfmHnHmnw+Zw6BB7wwZNnchbGnq646uusXn671vd/2SRdA5qe
 HAaBmd8+a3vrRyTlMsi43v280fC5EIPYKMsg0NP0JGnVht4uiEMA5XmHgbk7581vd58c
 rigyOHP/Rq4V+v5JJ7muhJuwy2A5MJDsUlbi7g6kALIT9nVcYOXqwkGXX+hWtx6ex1Kh
 Dq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vjNFtEC9IJoaQpaUejWUpYZb9jDCMsNfP1e62qn6I3Q=;
 b=CfExTyyLm7/fRT2Xt9q/47b/1yjjwmjGp9LMWZu/9dadfcfJ8a5jkqNWnmhKIejZS6
 qQJer3iC0ApH6P/5Sml4WH32XM1QfmOJ6DlrSyqOxJUSbaP54g1PiYm6Pnz/Jp3GzSab
 x6rLC1LTVtgfFnSkVUA+l3kALjrboDvG2OyswNRSHj3yn+GySVU5dVwLB+T95DdwVsL3
 9n54Kh2naUTlK+FFQymNMxvTUetBRGcjDamjT6P3DjKKVcnzb/x0ZeTqVa7bVQyE9ZGH
 yS8Odlpm2mHqdG1VK6hPUUZtO8hOpXHwmZUqPxHlhh4tAkgq8V5KgQMHMTsiSboXRz5J
 cOsQ==
X-Gm-Message-State: AOAM531pDGQ7IzfjNc663giBeRr+qVMMzvUKL3RTnrdDU9B4mhb1BIdL
 ZklILFt/BfvOr1X6bzhCItEKNA==
X-Google-Smtp-Source: ABdhPJy0SpwWpShHeQ2xR8qfwd1awuZTuQIwBj3ekV1PZ6iTUhpnDIWFijAlCWnS/0L41sBZoAiFAg==
X-Received: by 2002:a63:4444:: with SMTP id t4mr761338pgk.329.1613590075581;
 Wed, 17 Feb 2021 11:27:55 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id b10sm1615191pgm.76.2021.02.17.11.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 11:27:54 -0800 (PST)
Subject: Re: [PATCH] target/mips: Remove XBurst Media eXtension Unit dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210217185848.1421360-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9d92acc-af2b-ff72-7337-30f05c1a95c8@linaro.org>
Date: Wed, 17 Feb 2021 11:27:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217185848.1421360-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 10:58 AM, Philippe Mathieu-Daudé wrote:
> All these unimplemented MXU opcodes end up calling
> gen_reserved_instruction() which is the default switch
> case in decode_opc_mxu().
> 
> The translate.c file is already big enough and hard to maintain,
> remove 1k+ lines of unnecessary code and /* TODO */ comments.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Maybe better to review using 'git-diff --function-context'
> ---
>  target/mips/translate.c | 1055 ---------------------------------------
>  1 file changed, 1055 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

