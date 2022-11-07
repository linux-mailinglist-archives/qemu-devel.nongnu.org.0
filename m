Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900D61F0B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzPU-0005JN-RB; Mon, 07 Nov 2022 05:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orzPH-0005I4-OS
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:31:16 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orzOw-0002ux-PU
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:31:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id g12so15424927wrs.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 02:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jBza88KQdDc4AZysP9aEl22MzF3vrnHtv+Om7GpiEwQ=;
 b=SZj0q+NWwLw399kyg9jpLCMQSaZVWhKf+3W1xpDzMnAexxomxH39iVk6fmdb1wp3Lu
 uKL/uWF6CcRWx4yNxVEtl/pjkNVLuV84nxiq1swtljuiDElc2du+zdWiUS2ukIAack0z
 q13csQFdojkpDR0SENTWuGQDij7NysdBTBgEujEpLQ7KE7Op52jfiYT8O29y713J+Uk9
 TzqSBcvldzVlVheubIcVmm7G0vtjpcl5tr1NXet/noUq/ko1ATS2YdkvNoh4xS5YyZP8
 CLzWLCgMPGINU52lvodQWfmkidEnSUTnlVB7ztXVEpQhAB8Um84wM8m3Ao+wxwJqkB+R
 EY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBza88KQdDc4AZysP9aEl22MzF3vrnHtv+Om7GpiEwQ=;
 b=U6MfGCYSIw3ofCU6w+wmahTbTEr4naXwVUw4WXf4PTvWm4c1yCodVZWIjdafRSPUQm
 leA9UKRUEVKAkCTne5/6vnM9jeVXEM6RXo9a6aitymRsLi6RT43R/3SASwkXLbecljpk
 7WaWo/7XuIAzRXp9dwUUkYSrOZ10NL/MD5S+OlWfVTrLLuDaz5H0JeBTwZULJrD58dAx
 GHlKY83svc8WHMPDoCGU28NjvUkuZPjDfDQCF43o250hRdQZZCKSuHEiDjoSZvFwGLxY
 NbMbgP8/+7Ubaa7UPo+NCVu9PyacAdsdmt19ntNntIhzx60CA1QN3RFoWsmQ9cMnmVKY
 6wOA==
X-Gm-Message-State: ACrzQf3hCrnSPHzyhuwkYYpm9Ukna2ypmANlGAEs2qITuudGE/4kNxjM
 FN6WvaWnSvA232NvWwqcSPnWrQ==
X-Google-Smtp-Source: AMsMyM6TpUqrPjYNVkhI8dbn8PRxZR60NgN0o4uFFZWAuLqwBt4Fo8y6031xg+IVODvRI8g1gKHQ7A==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id
 r10-20020a5d498a000000b0023658ef6796mr31954369wrq.399.1667817044750; 
 Mon, 07 Nov 2022 02:30:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003cf57329221sm12118378wmb.14.2022.11.07.02.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:30:44 -0800 (PST)
Message-ID: <28f225b0-47a4-edbc-23b0-97a84abcc58e@linaro.org>
Date: Mon, 7 Nov 2022 11:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 0/6] Two -Wclobbered fixes, plus other cleanup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu, sw@weilnetz.de
References: <20221106212852.152384-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/11/22 22:28, Richard Henderson wrote:
> Stefan reported for accel/tcg, and I reproduced on Ubuntu 22.04.
> 
> Changes for v2:
>    * Incorporate suggested changes to nanomips.c (phil, balaton).

Thanks for v2, it was an optional review change request from my
side, but I appreciate the change, the result is cleaner.

> Richard Henderson (6):
>    disas/nanomips: Move setjmp into nanomips_dis
>    disas/nanomips: Merge insn{1,2,3} into words[3]
>    disas/nanomips: Split out read_u16
>    disas/nanomips: Tidy read for 48-bit opcodes

I'm queuing the nanomips patches via mips-fixes.

Regards,

Phil.

