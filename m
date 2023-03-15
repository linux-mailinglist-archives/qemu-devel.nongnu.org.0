Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9CF6BB030
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 13:16:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQ2m-0001Mm-8b; Wed, 15 Mar 2023 08:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcQ2h-0001CN-KE
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:15:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcQ2e-0002SU-Nr
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:15:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id l1so17081110wry.12
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678882539;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N5LLMSBO57cZVg7HrUD5fSNTgGG8b6zgDoZTVVH/4/o=;
 b=lbLwjIUe6w+HL0FsWzcpfsolNLQPlD8HChYBQFLUcPM0aGfW7pPr/xwCVAcDMM6gI4
 /B2yCGVJnENvn+qShUN1RahZ/JHFVsXhxk+zQciyXvbb/G/D0KuK/ocG+QQeXlcY5+9k
 qKknihWvQQYvaG5xkdd40HYWiHM1oMBB7n7pvXpXvWSj/5Dcs1bfwFxF5zc7+CMaRV96
 TfCFDrMba4cQZVyZoqculMzGDAGVHOopKMkLX1tphnQNRZ36jqf/01kgHUbX1Eky9bW/
 qCgM6uONVFetPpmU2BRPwH5k+/LpEGrEuQ3v8BTuahVYK+vXssE4dwPpb09I7UK1+3+X
 /Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678882539;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5LLMSBO57cZVg7HrUD5fSNTgGG8b6zgDoZTVVH/4/o=;
 b=rrXU2Lx0aZlPjZMRpLsYfMlHKdFaZyQ74zTHc7XFlT8TLvS0nOalWN3nO/bPUaqqAU
 OsEo1+edF4QjvWbwWDoXwwJGGm/UQJt8BXdnBRTu/aAsksYFs7QWAzmSbiaNdvte3OCZ
 Jv4ubz05owHQ8vcsbxol9NcrETd0xpXjnQ7wtqyGvXh9gcGDIa1Bh3P/TwMyMkBf12IH
 1O6Ra0Rlpm9FY1gAtQ0M3JxgtE6j9oBxYPzi/wWrLzZxaZBvgtodiP90kFn2YlzBt91j
 MOqUpuixHhvySjwcs3R2MxitmcOuR6CGwmnZMTTMJUvp8QnykU6qxky2bPkjfsApPKve
 Fw4w==
X-Gm-Message-State: AO0yUKW7dMtg4fqNdwG0DfdpNCx1haeyHz4LFIUut88FwZy9i1c+4Rs9
 YVIz6EnbcajM0i+Zhta28csUQQ==
X-Google-Smtp-Source: AK7set97JSwdlH4cYGmI2ztLYQ2BlRvcEeGO6ov7vD1CSulnK4a+9ABHo16fueOhfu/wr+7eJKshEg==
X-Received: by 2002:a5d:66c1:0:b0:2c5:4f2d:d9b4 with SMTP id
 k1-20020a5d66c1000000b002c54f2dd9b4mr1621407wrw.58.1678882539229; 
 Wed, 15 Mar 2023 05:15:39 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d11-20020adfe88b000000b002ceaeb4b608sm4582863wrm.34.2023.03.15.05.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 05:15:38 -0700 (PDT)
Message-ID: <652c9544-cefe-3d1b-bfd2-8ce41fb8555c@linaro.org>
Date: Wed, 15 Mar 2023 13:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Use f-strings in python scripts
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20230314212418.3925751-1-quic_mliebel@quicinc.com>
 <881540e6-5720-268f-6141-c99f3663c2fa@linaro.org>
In-Reply-To: <881540e6-5720-268f-6141-c99f3663c2fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/3/23 08:46, Philippe Mathieu-Daudé wrote:
> On 14/3/23 22:24, Marco Liebel wrote:
>> Replace python 2 format string with f-strings
>>
>> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
>> ---
>>   target/hexagon/gen_analyze_funcs.py     | 115 ++++-----
>>   target/hexagon/gen_helper_funcs.py      |  54 ++--
>>   target/hexagon/gen_helper_protos.py     |  10 +-
>>   target/hexagon/gen_idef_parser_funcs.py |   8 +-
>>   target/hexagon/gen_op_attribs.py        |   4 +-
>>   target/hexagon/gen_op_regs.py           |  10 +-
>>   target/hexagon/gen_opcodes_def.py       |   2 +-
>>   target/hexagon/gen_printinsn.py         |  14 +-
>>   target/hexagon/gen_shortcode.py         |   2 +-
>>   target/hexagon/gen_tcg_func_table.py    |   2 +-
>>   target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>>   target/hexagon/hex_common.py            |   4 +-
>>   12 files changed, 243 insertions(+), 299 deletions(-)
> 
> Preferably unifying style using single quote (') first:

Scratch that preference (or replace by "preferably following
black format", per 
https://lore.kernel.org/qemu-devel/ZBGo8WNlnRZUGYJZ@redhat.com/).

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


