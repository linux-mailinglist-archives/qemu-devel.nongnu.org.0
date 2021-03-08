Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12B33058D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 02:05:37 +0100 (CET)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ4L2-0000Oe-EI
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 20:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ4Jm-00081p-Q9
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:04:18 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ4Jl-0007ag-6W
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:04:18 -0500
Received: by mail-pg1-x535.google.com with SMTP id n9so4408192pgi.7
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 17:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pj2qipbOiBeTX5rvHADovrnXkhRCk+YAHsuCWX4wiDU=;
 b=Pqu9zjjkVrqUTMaw1rDEbjQ1jMhgzOD/2sTiUsqbQUo/ZrxXRzT5j9Jf45CsXPCKrM
 NSxqAs5h4cNLdGNo4VCUL5Wwv8IR1E6lJ9A4m/z6Ibh7MTvstub/oUiVtn4IXGiPvNr0
 I7RyC5JBffmMDLZvV0wdGTBaJyYHV57WrRuQX2tNg5EBsxQjwS6fMx+LDiN0RCjFAMRg
 PRtwzfA0/zM7h3wWsK+4O0jEIjTXZIOu3SD+gyY8+TUHOvjLKrWamvPCVh847vsFnLg5
 N4nEu4TiJgAynL4f5KL+iqN9lAdpuZ2r7ZIwCvdXfanN3q9ySsuJgSJGCdc05O2Ktlgr
 AewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pj2qipbOiBeTX5rvHADovrnXkhRCk+YAHsuCWX4wiDU=;
 b=hNxrSBvHz6FLkDWx96h+vv+v2sSr6iwZP6CHBCTWKHtEb751ODwBN+PbXDI9pC184M
 sNpDMd1oXV2Zo0Cqi2I2dhTa63y5y4lFz/PsZ4eO5k0+4M4aQYdSkrnGXQ7HbDjZeDek
 nSrZIUdd86BB6MQdIOO/82wRjPHySQmRiqosc3OtNSQZjDHabIZT79hB7xUo4hmB0dAi
 Z1X1hOgn5J6viTV+85nfxiwBbL0s7hELctSoZgBnhTN414NIqBui4WADYxbTsWSa0qRX
 FQzm5/fghoG6PExo/WzMDQ/36wIbNf7WadPoT74oW4BGSqWb6bMV9myk7ODC9DHcfq8G
 rlbw==
X-Gm-Message-State: AOAM532q9UzE4qUAUTdJg0mRmTiQ0+tP/URM2OfsTOJ4beEhjHd8lVO9
 OToRHiNKHaOZgntJe35u7hsWS09OkScPpg==
X-Google-Smtp-Source: ABdhPJwgSqDq/LulGkU7Vzrlzjef7wIWapdPRTUQ+NBwc0T7+/mo6XV6QJHxIUEDyeb5JpeVyOuo0A==
X-Received: by 2002:a63:4d0a:: with SMTP id a10mr5108652pgb.177.1615165455860; 
 Sun, 07 Mar 2021 17:04:15 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i20sm7952336pgg.65.2021.03.07.17.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 17:04:15 -0800 (PST)
Subject: Re: [PATCH v3] target/m68k: implement rtr instruction
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307212552.523552-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <107d8b83-96bb-fb31-a5ac-0b0c5835ab23@linaro.org>
Date: Sun, 7 Mar 2021 17:04:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210307212552.523552-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 1:25 PM, Laurent Vivier wrote:
> This is needed to boot MacOS ROM.
> 
> Pull the condition code and the program counter from the stack.
> 
> Operation:
> 
>      (SP) -> CCR
>      SP + 2 -> SP
>      (SP) -> PC
>      SP + 4 -> SP
> 
> This operation is not privileged.
> 
> Reported-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Tested-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Laurent Vivier<laurent@vivier.eu>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

