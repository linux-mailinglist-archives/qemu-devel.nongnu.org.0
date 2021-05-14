Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9796380C06
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:41:03 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYzu-0003Yn-O1
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhYye-0002mD-EO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:39:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhYyc-0002j4-R7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:39:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id di13so34973111edb.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fYLngUt/zy9Q4EiH9OP2H+JBKyju4G/JEOJuu1k47PM=;
 b=Wd0Su8b/PYfTpG0e0vZDWBFPTVvrKvdxJ1TpkOsd9bfqClz5oKh9x9EcWS+pWtVP2P
 HsVL48VivmoBlqN/58TURucnAOcMzn5U3PLJTeb7XijA9J//PhdPCDM1OorDU+T+Y/Vs
 gmlimRHZlkli2YFExFO4ficgU7QHXoLvQQ1KHN++6NyflCslw8DCkxJcbj9FMvoqAtJa
 UPfBF09qbFCoaDcN8HgSHNQi6cGziaIoMpxuLOivjOWJBlRCh4DbhQRlm0uaLUJiPdin
 NPLUWsu7szhJEin5CBffv14avyu0yPNhKGst6psKRCh3etBECbcWuEjYIasovwDlC4aW
 ZhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fYLngUt/zy9Q4EiH9OP2H+JBKyju4G/JEOJuu1k47PM=;
 b=chJxLIO8lrKG01mfOE7L2/iG9I1zKqD428rYsOD3jvIIFa4TqvKZQRKb4CLRnL784A
 KsrVQ/letCV+RMdzBAqW4mTYVjZrZd2lO6BDBY5BPW1Yf/4yO8+WLREaBeydlOgPS3iI
 bTkxfpQjwPAy1Q6y4NMvCMsPqkt7Vu81W1w7Gp1ErsCpkwSV2ymnLZpZgaD+UyzQ/q8T
 CmHGbywKx1vC0gSDJdOywhwSbpU6Aqd7yvfsVT5HKHAXmG9H5NUv0hZyosBlhP+gC7Da
 k4GJE3jYv6x+8muOQRxiRh1RAx9Vv5ycNqdUmyBTL5qBVtT3Fzk6I2CuseFIlI2hrSrO
 1Emg==
X-Gm-Message-State: AOAM531+Vt2b69NvIYC5r5kqos0wzUo0S/OwxeSpz2RfnyfJnAQv+Gn3
 EZsQ7xfy0vBltHDExK6izJVYLqMvvG2g6Q==
X-Google-Smtp-Source: ABdhPJzm5kKRLscv2Mygy3gAJkKQDENqmWBcNRm2q28lJl0qwTx8ZyFamZzlXeXwEiWSEK8VVbVOtA==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr56495749edv.182.1621003180814; 
 Fri, 14 May 2021 07:39:40 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n17sm4576759eds.72.2021.05.14.07.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:39:40 -0700 (PDT)
Subject: Re: [PULL 0/4] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210513122008.207491-1-richard.henderson@linaro.org>
 <CAFEAcA-gMPaP5rT_CGqEFWJ6LP7S6Z9oA0OiFYrTWomRh+V36w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae52dbdd-3d35-19ec-57e5-9ffebf237f79@amsat.org>
Date: Fri, 14 May 2021 16:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gMPaP5rT_CGqEFWJ6LP7S6Z9oA0OiFYrTWomRh+V36w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 1:03 PM, Peter Maydell wrote:
> On Thu, 13 May 2021 at 13:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267:
>>
>>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210511' into staging (2021-05-12 17:31:52 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210513
>>
>> for you to fetch changes up to 9bcf4c52f801966b10f802e65c3ecc8bbbd8c660:
>>
>>   tcg: Add tcg_constant_tl (2021-05-13 05:42:44 -0500)
>>
>> ----------------------------------------------------------------
>> Minor gen-icount.h fix.
>> BSD cpu_signal_handler fix.
>> Add missing tcg_constant_tl symbol.
>>
> 
> Fails to build on FreeBSD and OpenBSD:
> 
> 
> ../src/accel/tcg/user-exec.c:358:46: error: use of undeclared
> identifier 'T_PAGEFLT'
>                              TRAP_sig(uc) == PAGE_FAULT_TRAP ?
>                                              ^
> ../src/accel/tcg/user-exec.c:334:31: note: expanded from macro 'PAGE_FAULT_TRAP'
> #define PAGE_FAULT_TRAP       T_PAGEFLT

Good excuse to highlight my "gitlab-ci: Allow using FreeBSD runners"
series :)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg806537.html

