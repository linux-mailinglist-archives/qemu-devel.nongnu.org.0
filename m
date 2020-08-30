Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFBA25709D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 23:00:06 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCUQn-0004Ny-Gt
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 17:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCUPs-0003xj-Tr
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:59:08 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCUPr-000655-59
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:59:08 -0400
Received: by mail-pg1-x542.google.com with SMTP id g29so3185624pgl.2
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dq8e1idrZ8gz2wJQoxhOV3aszh9ziGnQm1F0H+7ftWI=;
 b=WBM+YSmTy21IsguLchOAsV+p2TdpM2v09x4Lfjk1HNQLOVKsSTUYTsXgOm7pUXuWHq
 CRn0Tpga7zuw9vxQDKMS8TtFuzGCzOpNFSo26zxENY5/XGhHveg71s9r/58nF/hx1zSf
 GtIgygRurKGKn1nBJh0UEOsv1UQFCy3ww1Qt9LmHQywSiNRUtG9wexwfq31irj+6WGnx
 i0eTsq1vMzEu1qNcN+lZZvKBQevP40Rie1mIsWYs4odPx494RNdJLNcuForMHAuBmhT1
 xy27L5gX/cQPpusVasAWWbA/1CgvtOi0Vh/ggC4z3b4Cyp8Wl4Zv6tumzBjngSnPeVbZ
 JB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dq8e1idrZ8gz2wJQoxhOV3aszh9ziGnQm1F0H+7ftWI=;
 b=mcIFjU3gXTFcdpZxkRERXtJWHkgOMBhHpLAzJlealRYyKBTPMKdoq10eTOByT89JCJ
 zGTsiv9vmJ2cJJ5ND0lyAsOzpaKpPEJ5gMStRT45G8ft2F2L/+ZtfPxKPysURCI8iTI4
 tDPoClLqiIrKLyKw2NWB+ulxOAGVdX5SMEkpSVu33st2GfyR15OMZI3h43HsutG6HYSS
 iHLl2zqWT5XcbnQ0UaCkFqQr/lk6JSu5M8azty7vBvq6sWpPsSMVcpcrt+1/4jYH6r68
 f/+ayq4O2XZW136zZLZTxA2DQgwzifZnR8FM1Frs5g49oaekoMxFSTerj0Ss8PIzyWlD
 QfWQ==
X-Gm-Message-State: AOAM530NIGnfvF495Uh0egzsw34viOGtKky8z6DWJGBp6FL8v4qfuQfR
 ZjPTUhFYlxUGHQ68AjFy39gIEw==
X-Google-Smtp-Source: ABdhPJx++6/bfZZa397vIUpTu4/pth18QZyGcq50GK2QFoaezhd7NqcrgHB6tiYk7hi1KrNfImPo/g==
X-Received: by 2002:aa7:9dd0:: with SMTP id g16mr6820146pfq.107.1598821145498; 
 Sun, 30 Aug 2020 13:59:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm354500pfa.151.2020.08.30.13.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 13:59:04 -0700 (PDT)
Subject: Re: [RFC PATCH v3 25/34] Hexagon (target/hexagon) macros to interface
 with the generator
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-26-git-send-email-tsimpson@quicinc.com>
 <56924ad5-7b6a-a05f-7773-e9be5cc9b9e5@linaro.org>
 <BYAPR02MB4886669B0BB9CED20CF166FCDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <343df449-d140-eac2-0b63-2a0a2172ecfd@linaro.org>
Date: Sun, 30 Aug 2020 13:59:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886669B0BB9CED20CF166FCDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.207,
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
Cc: "ale@rev.ng" <ale@rev.ng>, "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "aleksandar.m.mail@gmail.com" <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/20 1:30 PM, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Friday, August 28, 2020 6:49 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@redhat.com; laurent@vivier.eu; riku.voipio@iki.fi;
>> aleksandar.m.mail@gmail.com; ale@rev.ng
>> Subject: Re: [RFC PATCH v3 25/34] Hexagon (target/hexagon) macros to
>> interface with the generator
>>
>> On 8/18/20 8:50 AM, Taylor Simpson wrote:
>>> +#define DECL_REG(NAME, NUM, X, OFF) \
>>> +    TCGv NAME = tcg_temp_local_new(); \
>>> +    int NUM = REGNO(X) + OFF
>>> +
>>> +#define DECL_REG_WRITABLE(NAME, NUM, X, OFF) \
>>> +    TCGv NAME = tcg_temp_local_new(); \
>>> +    int NUM = REGNO(X) + OFF; \
>>> +    do { \
>>> +        int is_predicated = GET_ATTRIB(insn->opcode, A_CONDEXEC); \
>>> +        if (is_predicated && !is_preloaded(ctx, NUM)) { \
>>> +            tcg_gen_mov_tl(hex_new_value[NUM], hex_gpr[NUM]); \
>>> +        } \
>>> +    } while (0)
>>> +/*
>>> + * For read-only temps, avoid allocating and freeing
>>> + */
>>> +#define DECL_REG_READONLY(NAME, NUM, X, OFF) \
>>> +    TCGv NAME; \
>>> +    int NUM = REGNO(X) + OFF
>>> +
>>> +#define DECL_RREG_d(NAME, NUM, X, OFF) \
>>> +    DECL_REG_WRITABLE(NAME, NUM, X, OFF)
>>> +#define DECL_RREG_e(NAME, NUM, X, OFF) \
>>> +    DECL_REG(NAME, NUM, X, OFF)
>>
>> Is there a good reason for all these macros?
>> Why not just bake this knowledge into gen_tcg_funcs.py?
>> Seems like it would be just a couple of functions...
>>
>> At present, both this and the intermediary files are unreadable.  One has to
>> pass genptr.c through -E and indent to see what's going on.
> 
> I add the regid...

No, that doesn't answer the question.

Why does DECL_RREG_d et al exist as macros at all?  Why not emit the expansions
directly by gen_tcg_funcs.py?

It seems to me that all this does is obfuscate the code, adding one more layer
that one has to unwind in order to understand.


r~

