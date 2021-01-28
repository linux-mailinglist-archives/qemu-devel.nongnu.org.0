Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5F307D30
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:59:50 +0100 (CET)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Ba9-0005DE-1r
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5BWi-0003Jy-04
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:56:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5BWg-0004r2-1d
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:56:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id y205so4488552pfc.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gw1KcvqbCPIh5Rr3etxf4X0Cr1iGflLf43UHMg3Mi7k=;
 b=oyB4PF8Oc7sMr5wY3YkxGWd/E4WuwjN/SCcf+j9f3IMnZATrEpZFieJusYp2sruo2a
 BoaLSoTG36NpUXdtdOXlUL1jaGf1raqt9UNrccIK4DPkQjth7mzo3LDBfMslM37YoMtU
 2a6y/hz7fLH5yDZ9worqJxN6pG3KkwZe+DDwIWcwEFcWMIo+1i8Gw8zfcTM/kTO+BCAm
 xDvvQ80xVW2PYtSGxG/3i0QVvL+GRnqeigKE8t130c42yEoznlo3Dh7Kdfcxki8vV7VQ
 Xx+XUHbocMcRpqu53Cdor753igHufIyVndooK+t5o6W+65UEVrGfcTGB2mNLNraOrgUO
 OVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gw1KcvqbCPIh5Rr3etxf4X0Cr1iGflLf43UHMg3Mi7k=;
 b=gZPBMxs+Y4IgP2+RBiF/W5ikhp1fAclNKDiHDFxgbcLDoaJP48eVeYcOH4zq1waIQH
 Cc+9zUWBD5F6WXUIK5mwS2r1F3MDR1P3UcgewGE6FcNe2ex9TorHNnkZmAUSU5LPTRRP
 LAfukExvs4uOG4OLhSREIC29sPQNS4ornpkPJZrHjG+2nEo5+wrHCA43Q62TUsy6s2zi
 v67axAalcI/d2CaNKBRx1KNsHWeYFP/qgm4Lacj1hcSNBmHgrMQqQJIFmvsgEtHy4hJS
 wVPXqghYuNWC730tO26aEoov44rTyXZX6uo8wtQLyQ6zDJZoma8Pe0gHlbCIbCSGBeHX
 GZPg==
X-Gm-Message-State: AOAM5335vj78U19d7ZLX+C8OPtbC+Va+Ht0kSCuy82QYS5lAk9rGQxyH
 eLIZTeTdUzRe90NqrZCUpDZP21OlfnKh1tcE
X-Google-Smtp-Source: ABdhPJzPKU82AL3rdiqtnhIuAU7TWypUlXrCzGkx5wh0mgh1+VUG0alONzJO0x2S5r/PQbJliTvriw==
X-Received: by 2002:a62:4d43:0:b029:1c6:e790:5f8f with SMTP id
 a64-20020a624d430000b02901c6e7905f8fmr476497pfb.65.1611856572017; 
 Thu, 28 Jan 2021 09:56:12 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id fv12sm5551311pjb.22.2021.01.28.09.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:56:11 -0800 (PST)
Subject: Re: [PATCH 21/23] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-22-richard.henderson@linaro.org>
 <993a9d04-049b-7e31-9833-115ce07ee8e7@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b47cddb2-8829-57e8-b030-eab800c009f4@linaro.org>
Date: Thu, 28 Jan 2021 07:56:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <993a9d04-049b-7e31-9833-115ce07ee8e7@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 1/28/21 5:39 AM, Stefan Weil wrote:
>> -    case INDEX_op_div2_i32:     /* Optional (TCG_TARGET_HAS_div2_i32). */
>> -    case INDEX_op_divu2_i32:    /* Optional (TCG_TARGET_HAS_div2_i32). */
>> -        TODO();
>> -        break;
>>   #if TCG_TARGET_REG_BITS == 32
>>       case INDEX_op_add2_i32:
>>       case INDEX_op_sub2_i32:
> 
> 
> One of the ideas for TCI is that it should ideally support any subset of TCG
> opcodes which is used by an existing TCG backend or a newly written backend.
> 
> This only requires copying the TCG_TARGET_HAS... defines.
> 
> So this patch should keep the preprocessor conditionals, and the TODO
> statements have to be replaced by code (or #error for the moment).


If that's what you are after, easily configure different setups, you still
don't need the ifdefs.  Just change the TCG_TARGET_HAS_* definition in the
header file.  The ifdefs are not necessary.  They will be unreachable code if
you zero out the HAS, but they'll still compile.

As for div2, there is no code for it in tci.c and therefore there should be no
code for it in tcg-target.c.inc.  Those bits of code are a pair and must to be
added together.


r~

