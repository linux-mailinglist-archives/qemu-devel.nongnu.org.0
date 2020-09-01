Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927CD2585BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 04:41:30 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCwEj-000358-72
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 22:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCwDu-0002dm-QU
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 22:40:38 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCwDs-0006MX-N9
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 22:40:38 -0400
Received: by mail-pg1-x541.google.com with SMTP id 31so1825507pgy.13
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 19:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g01lHr/sINXXcM5zWEET0ZZHXuzRB3o0NliB12yvYEU=;
 b=p99UVkL3SnrWpMEFN12QuoUQFwAzRPBhWu8t7h1V9ZkmvnmAVmovzrnm3KxffqXVe3
 0aTvIcB4Y3LyEfQYXkCnLHjNEIn2EeSxRvh9Vl9f5WDG0rwwoNW8SP84M0lBJhc+248t
 Kvv1LpifHflraQiUbE+VlK5HYg91IvltlODYAZm+edT7mkq+4MgmkXBCQmT0ikWOz4Ci
 wCxn+rUUgWQKOQWWZ5/j53PGW2vvfiA6Kw+6T/VpWwWTNLzqNcNLceuFjxl5fESHsZiJ
 OsbbvGg9M/4LQQR/+rZ1hoExvwUhzZB3wnIotmssKY+hvfuEOAqOubZ8XGOJLz1A8EcO
 XLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g01lHr/sINXXcM5zWEET0ZZHXuzRB3o0NliB12yvYEU=;
 b=j3LxWrXNc/ufpHbUsSzSqJ01+hwzl5zba2WO+34NKkWXpgA3zvcd0SEmF1S7RJ7tqU
 y6/HRMYRD0SDgWK70sHreenqcUFQGyBrfAK/YwQoM5EhIcp8Pg7KcanS8dCFjSuiTJ9G
 kNDgmrLKNjBmCXucBH09O7ptn+FS8pmqwcfp0dJs5k9cITFF1fUsUMEpZvtyps/yVQkC
 N8jUD2i+9V4QnXgJOjIgPu0d3niVIMcM+liVwNJDEDxb4vZ4nZ4vtuqCZXOR0NNG/Tb2
 MUGHfz/nnmAGJbADaLmWEBCYy6mNT7xELrMufr/+OLbUQowdVbAeAMQQXEN/D1wt16BY
 jgkg==
X-Gm-Message-State: AOAM53129bVlVb0bJnnze22IG4GF+mhenKL9opRjhMjkhmVCfkh6ef5U
 5RANUrgCaE0zehSQ1LL+2obMzA==
X-Google-Smtp-Source: ABdhPJwcoaVrtreuDluGh0WLBDle/PZ0f65jsCWWxYgXod8RXrhCze/gK6MtEieQgo6ZC26XH7SHZg==
X-Received: by 2002:a05:6a00:228f:: with SMTP id
 f15mr3849836pfe.222.1598928035125; 
 Mon, 31 Aug 2020 19:40:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i3sm9406484pfc.5.2020.08.31.19.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 19:40:34 -0700 (PDT)
Subject: Re: [RFC PATCH v3 30/34] Hexagon (target/hexagon) TCG for
 instructions with multiple definitions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-31-git-send-email-tsimpson@quicinc.com>
 <10127f7e-a2df-2f19-e897-9a874f9a5d82@linaro.org>
 <BYAPR02MB488691F539AD3A2BFA1C819DDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
 <a0987bce-409b-cd14-7559-c63413ff2b6f@linaro.org>
 <BYAPR02MB4886985CC5CBF78F7D5DBFE5DE500@BYAPR02MB4886.namprd02.prod.outlook.com>
 <fca34122-160d-8c13-d237-a87a917f341b@linaro.org>
 <BYAPR02MB4886D48EDC604CEEF65FDAA7DE510@BYAPR02MB4886.namprd02.prod.outlook.com>
 <1cf57f2b-a2c8-6fbc-2c1c-9945a5d77dd8@linaro.org>
 <BYAPR02MB4886F055CBD52DBEE5F269AEDE510@BYAPR02MB4886.namprd02.prod.outlook.com>
 <0241f731-61de-41bc-9f58-bc43725eef74@linaro.org>
 <BYAPR02MB4886B33025BE2B65D6F5F5A8DE510@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0011ef6-014c-748b-7fc1-ea0f7878c281@linaro.org>
Date: Mon, 31 Aug 2020 19:40:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886B33025BE2B65D6F5F5A8DE510@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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

On 8/31/20 4:10 PM, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Monday, August 31, 2020 1:20 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@redhat.com; laurent@vivier.eu; riku.voipio@iki.fi;
>> aleksandar.m.mail@gmail.com; ale@rev.ng
>> Subject: Re: [RFC PATCH v3 30/34] Hexagon (target/hexagon) TCG for
>> instructions with multiple definitions
>>
>> The fGEN_TCG_A2_add macro does not require nor use that {...} argument.
> 
> The fGEN_TCG_A2_add macro does need that argument, but there are cases that
> do need it.  Here's an example from gen_tcg.h
>     #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
> This is explained in the README, but basically the argument is useful if we
> can properly define the macros that it contains to generate TCG.
We're certainly not going to be able to handle e.g. "+" or "if", so it is going
to work only for the most trivial of SHORTCODE.

Though in fact loadrub_pr makes that grade...

> IMO, we don't want the person who writes an override having to reproduce the 
> generated code.  Assuming we have a definition of fGEN_TCG_A2_add and we
> have the generator intelligently expanding the macros, this is what will be
> generated.
You need to give me a better example that A2_add, then.  Because I see that
being exactly one line, calling a helper that handles all instructions of the
same format, passing tcg_gen_add_tl as a callback.

Have a browse through my recent microblaze decodetree conversion.  Note that
the basic logical operations are implemented with exactly one source line.

> Unlike the generate_<tag> functions that all have the same signature.  The overrides would have different signatures.  This would be more defensive programming because you know exactly where the variables come from but more verbose when writing the overrides by hand.  Also, note that these need to be macros in order to take advantage of the SHORTCODE.
> 
> In other words, instead of
> #define fGEN_TCG_A2_add(SHORTCODE)    tcg_gen_add_tl(RdV, RsV, RtV)
> 
> We would write
> #define fGEN_TCG_A2_add(env, ctx, insn, pkt, RdV, RsV, RtV, SHORTCODE)    tcg_gen_add_tl(RdV, RsV, RtV);
> 
> Personally, I prefer the former, but will change to the latter if you feel strongly.

This comes from trying to handle instructions in different ways, but represent
them all the same.

I guess I see the attraction of the magic non-parameters -- you get a
compilation error if the variable is not present, but are not tied to
positional parameters.

Ho hum.  Maybe I'm trying to overthink this too much before tackling the
ultimate goal of full parsing of the SHORTCODE.

Perhaps the only thing for the short term is to have the generator grep
genptr.c for "#define fGEN", to choose between the two alternatives: inline
generation or out-of-line helper generation.


r~

