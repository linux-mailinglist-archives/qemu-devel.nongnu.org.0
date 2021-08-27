Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F353F9C0E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:59:43 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJeGc-0002Ib-0y
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJeFl-0001d3-OF
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:58:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJeFk-0005gz-8W
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:58:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n5so11099212wro.12
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TjQiC507bGAPOddrYqkP3Uj0Gg2zCL9fPOqs2jv6lI0=;
 b=rhZOQLhp4buMa/VtIvhB9DeR8wgsgxJohvvtsZPud0aOq8px83xHPgZjpNfGArELn2
 1aRxzP3RVv5CXvsGST4OYKQGW4X1tG8LQ0JaFLYoZGc4rQSJbYG8qKi2sVoOdYc8cORt
 euV/StKmFv+R55I4EcBaV4+pi2slDpMh36T+AifRcQ3EnOVIAU7XW1RKqLpKw0CXeUkb
 FYSBZX3x7v3AWCfswNzetQV9lZQsEUnyDXVE/LolWBGqhBN9m5DwG4LKIVzcJ44Az01K
 I6YSR35AWPU69oaS7MZ+jx0IhBE/VJCMRzRPsks6BCx84YDWxxm4mEn2s4WV6LV8Jqpy
 48Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TjQiC507bGAPOddrYqkP3Uj0Gg2zCL9fPOqs2jv6lI0=;
 b=tyUWDP1xoHWT2TUxsmRvx4ZRIY4YXTeHgF15btT53liXqackSI4H021p6V0iA5A1hW
 CTAsCMj9Fg/6Wny/xq0tI9WvT0xbsWDeobgiz/kc9/VHzPKaLCy7Rjej5qZCOrThm1Kp
 F0fYdBIV5K50jfWYFcRlPejiuGQjE37V3Ovb+uoJtsDe697jei+o5vV46Hu4NezpzYey
 bGTjBfgV0jwz6spw/6D/gz2H2nrNej298WHLYS8iCghzs1aN4Zz5gSoGwj+ir1myowzF
 YzvmS9Z/QENyW65YU+MlaLM0dYd48hLy1x9rWakam1ZuJBHxXJFt8ksOoLjI85e/12oT
 PUjQ==
X-Gm-Message-State: AOAM532bYOCaAfsYYLgU8vsY9I4r9VSkD4/7VfMuMJK7w9GFgIH3AgNf
 PyZ03Fi0Axaik8rF+GWfH8A=
X-Google-Smtp-Source: ABdhPJxkb9y7jibL8A4VSGwUwlglobtYm3bvxabfaJa/c8J1TGs0MygI2fVs8PeiDpysIPAOxkGyIQ==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr10977595wrt.59.1630079926410; 
 Fri, 27 Aug 2021 08:58:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h11sm8090206wrx.9.2021.08.27.08.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:58:45 -0700 (PDT)
Subject: Re: [PATCH v2 30/43] bsd-user: Remove dead #ifdefs from elfload.c
To: Warner Losh <wlosh@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-31-imp@bsdimp.com>
 <de44e02d-5da0-3347-c2b6-5bbb344ae354@amsat.org>
 <35C0402D-0451-478E-8BCF-446AF2BFBBD4@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e263b49f-4028-b4cd-4b76-787bb3047e0f@amsat.org>
Date: Fri, 27 Aug 2021 17:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <35C0402D-0451-478E-8BCF-446AF2BFBBD4@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.437,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 5:02 PM, Warner Losh wrote:
>> On Aug 26, 2021, at 10:42 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>>> From: Warner Losh <imp@FreeBSD.org>
>>>
>>> LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove it.
>>> Likewise, remove an #if 0 block that's not useful
>>>
>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>> bsd-user/elfload.c | 20 --------------------
>>> 1 file changed, 20 deletions(-)
>>
>> Move as patch #14?
> 
> Are you suggesting I move this to be right after patch #14 or that I squash / fold it into patch #14?

Move, if possible. If too much trouble (rebase conflict) then
don't worry and let it here.

> Warner
> 
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

