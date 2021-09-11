Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F9407A8F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 23:48:04 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPAqx-0002iM-3b
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 17:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPApx-00022p-80
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 17:47:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPApv-00047z-G0
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 17:47:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso4029697wme.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 14:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zR/ofvtWqZ5KRp8Y7p1/fNG83vHBbUcBv7O9noAvBRA=;
 b=VtLM0HUkriNmpKskVb1G/CM1r9fOeltGnu7mqO1RaYsXbXvLpegY9dhBEATTA71RyW
 m7irx3644WR6cUixJxu3CYlme5aXFPLgUPELp4EaT8kE0Jqa5kaw6Vv2bE4hi7Sarm3J
 TueWjTqqrw4LevxPqWDCBfK25pHBZ8g368234h5rTnGYUQh789YSuY7Gg1qhXQnGd3oH
 cFeEy7ST0GKrxemKLcMWOWzZshhF/YfAUFowMLL/Pi5wBqA6HrjhRXqguThenircjqvO
 UOzZaqjuNGEftVUILM7CVQa07wAUQRfjrNmI9lFlKeQR84RsR52L5pjjMtxq6Qs8bFzL
 NpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zR/ofvtWqZ5KRp8Y7p1/fNG83vHBbUcBv7O9noAvBRA=;
 b=MfHlo2c4i+D6CIibVf/UYlZm/lgV1YNCDmjq0h/W61Kc0VDqctkAPmnN9ShcVX3aOb
 KvL6T0xKpMuFd8J8X9UiqjfBqlVZo9aqlE641gOlNR4S1q3bNv/pHPmuS6HTy3zWpMJS
 9U1J7zRC6W/MWsXE3mWrGNPw0aMVj5k61ePh5N9sUgGblM34vPhY/Nh5d8pB1FDVnOKM
 pTxSBVPvVBFmLOEZsv8XGE4fP7BcddnBUeUJjLdljhgGUQlDoQU0qw4v1rlNyQIgWoIR
 2Wdgm4SVRM04hwJYyE7gmWbptLIh+iE+Kii0G1Jelr5whWEABYRHF9Afcj8iskQPcX25
 s93A==
X-Gm-Message-State: AOAM533+kTGL+qEPaCGnTM6vJnhk/xsddJyJwHkd9iyU5XrWlJVeyPLc
 QXzF07L+A+x/ODAxkRvp28o=
X-Google-Smtp-Source: ABdhPJxxfRAgimyVPsRavvcW5dukFp5qHSJlBHY9Z2gNzXBiAwzT0M6sUmDBGj2Jj1N9ey4syZekYg==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr4114622wmi.143.1631396817395; 
 Sat, 11 Sep 2021 14:46:57 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g3sm2914337wrh.94.2021.09.11.14.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 14:46:56 -0700 (PDT)
Subject: Re: tcg: pointer size warning on x32 arch
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
 <6b1c1c7f-0e0b-fd49-2ef8-1ab7c8b7a3e5@amsat.org>
Message-ID: <fd38f80c-bd36-8399-33b0-bbd3ec566813@amsat.org>
Date: Sat, 11 Sep 2021 23:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6b1c1c7f-0e0b-fd49-2ef8-1ab7c8b7a3e5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/21 11:06 PM, Philippe Mathieu-Daudé wrote:
> On 9/11/21 7:50 PM, Michael Tokarev wrote:
>> Hi.
>>
>> The following warning is reported by the C compiler when compiling
>> tcg code on x32 architecture:
>>
>> In file included from ../../tcg/tcg.c:429:
>> tcg/i386/tcg-target.c.inc: In function ‘tcg_out_movi_int’:
>> tcg/i386/tcg-target.c.inc:959:30: warning: cast to pointer from integer
>> of different size [-Wint-to-pointer-cast]
>>   959 |     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
> 
> Likely fixed by:
> 
> ---
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 98d924b91a8..0895f5670a1 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -956,7 +956,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType
> type,
>      }
> 
>      /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
> -    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
> +    diff = tcg_pcrel_diff(s, (const void *)(uintptr_t)arg) - 7;

Hmm not quite. At this point tcg_out_movi_int() already checked 'arg'
does not fit into a 32-bit value... And on x32 we have sizeof(void*) = 4
so we can't cast a >32-bit value that way.

But tcg_out_movi_int() is called by tcg_out_movi(), and all 'arg' values
are either 0, 1 or a host address (often casted as uintptr_t). So on x32
this value is already truncated (safe enough?). Thus this code seems
unlikely reached there (with a >32-bit value).

So maybe this is sufficient to silent the warning?

---
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 98d924b91a8..2e6304f26b1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -955,6 +955,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType
type,
         return;
     }

+    assert(sizeof(uintptr_t) > sizeof(uint32_t));
+
     /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
     if (diff == (int32_t)diff) {
---

