Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03483A2F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:18:06 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMRZ-0004Ab-8H
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMPx-0003E1-8j
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:16:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMPu-0005Ts-Pw
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:16:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k7so3849075pjf.5
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=V4JGjqAUjTFk08LLfF747r+2TBRIc8SKI3kNjs9zotk=;
 b=P28DVnI8G6XYqzDhTNZkdj4B8IyYWhD2hbA8lNoRdmnAuoX/eqBK8QAtiQie3/fbmN
 TmxeMzqDW7vgHUbbNcuwXWpxAjDLN49Q1xSwzNDvU97za0xn7x63iCTpZix3efTQGKkn
 qqJg6fBsBW3+mLenVJ2ig+8mON/nWf3+lI4NetW47oKS6LOfS/X6HbQ+B2fUd3yI0KJZ
 HMcYF3UJ4WOBjVmdCFG12BrtkvXksNF8c17n1/nsjQlyhslgHVM8wTRmbZKoj3sID4+g
 /0sCDkgrLuoacu7tJZqxOttuVw3FV+tST4iYXvNYvzPtcB3AODY9RXgnChP5i5nVrIZ7
 9Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4JGjqAUjTFk08LLfF747r+2TBRIc8SKI3kNjs9zotk=;
 b=fXulQL0x3SoXS+5d0cH3CZsCT/ndMNOUVEyuh8ZGqUVNbPF+7VPCKOBeRCNVvSYEzh
 LmH8CDinAUN7v6x1HG735CpEy8d8A+MClYj+JUQwYbIdOif57/QyTAk1j2cTtuqmb7+V
 d1SKMmWe8FIRbaAqofycOFjDIUaNu1CMc1ZpTT4tcOZwhwaK1EZmaxhhyqsJu6Xz1PIx
 Lh8BrO8QUWmwMzm6bHLM90iUdQrg5KT7FXSR3pw+LcviAFy1jiaghbzaIgaKBEVU4Et3
 kFA9uEpeUFT0crv/dFLVOw96Tob3FXcpKF2ZX8AEOeZg51lrDiQ4fMBETKT4pt9YU6KE
 E01w==
X-Gm-Message-State: AOAM5312nY9Tg76H623iu+y0y516xlWn0ffXqwGVRDV7j47CHIDPptzH
 kWmsBAY+ccp8IF39V/olLGoYfg==
X-Google-Smtp-Source: ABdhPJy50huZyE+ttIiSJaQMFdhyhgYjMCVyitUmGHslnCDT+NRpB74a9nT07sXFGlyQz4cpJ6VoSg==
X-Received: by 2002:a17:90b:789:: with SMTP id l9mr3737584pjz.25.1623338181102; 
 Thu, 10 Jun 2021 08:16:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u1sm3033178pgh.80.2021.06.10.08.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:16:20 -0700 (PDT)
Subject: Re: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into
 tcg_init_machine
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-13-richard.henderson@linaro.org>
 <CP2PR80MB3668BD3BD55F799F0554F95BDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1497969f-f3c1-4f56-3358-5affc45d375a@linaro.org>
Date: Thu, 10 Jun 2021 08:16:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668BD3BD55F799F0554F95BDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:58 AM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> There is only one caller, and shortly we will need access to the MachineState,
>> which tcg_init_machine already has.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h      |  2 ++
>>   include/sysemu/tcg.h      |  2 --
>>   accel/tcg/tcg-all.c       | 14 +++++++++++++-
>>   accel/tcg/translate-all.c | 21 ++-------------------
>>   4 files changed, 17 insertions(+), 22 deletions(-)
> 
> Nitpicking: there's a comment in bsd-user/main.c's main() that should be updated now that tcg_exec_init() no longer exists. Currently:
> 934     /*
> 935      * Now that page sizes are configured in tcg_exec_init() we can do
> 936      * proper page alignment for guest_base.
> 937      */
> 938     guest_base = HOST_PAGE_ALIGN(guest_base);

Thanks.  I think the comment was wrong, and has been wrong for a while.  The 
only thing that controls HOST_PAGE_ALIGN is command-line options.

I've just clipped tcg_exec_init out of the comment and will leave the rest to 
the guys that are modernizing bsd-user/.


r~

