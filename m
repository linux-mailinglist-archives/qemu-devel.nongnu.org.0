Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36144468B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:03:49 +0100 (CET)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJfw-00089p-9l
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miJdh-0006HX-FF
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:01:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miJdf-0000Al-9J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:01:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id b12so4621058wrh.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/GviCGBzVsrPOkiZspZs7N8TlzMUocpfe+SUVpUOIY=;
 b=bDTBpbViboQihDioVHeqwfEs5fVtZpRQF+4Ee5FZyTf9d14Z89whgX4z1JXAyuDa9Q
 YhGJZXmxkmWhE0j+BURrqi80nHDjzdcm/6Va/DjfBCjsHl/JGPX6Un6Y36fPMB5iVtFu
 zGftWHUt01IbEwgrSYuT5X4r4nnk4TEQgKXDWs/kHwz823LN1CtBaY6KkTyGqQKl+chf
 0dAVJal70CKehw++dL2I3rPKZAfRG8+pNAoU34pAhTkdlOjsv8ssdVzpgJpYB/KmPXBQ
 bB0S51gAm+/X7X2Mq2zLazQILZCKF0jDcBsOkNDJPNTbeYVSFhhQ9/evuSBPSTB43vzy
 bsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/GviCGBzVsrPOkiZspZs7N8TlzMUocpfe+SUVpUOIY=;
 b=nzhVqKhnJbBDnlN9vBiE+g3Zvi/uC/lZzMg9h+aZYJOoL3C0fHs5iZZkPOGeDWf0Sb
 Ah2yImbxUBosTkMhTI45w57J42Pu3Uqzx97w8iGPdVKm5gS1GG6gJEwzXuPjDMkTTEmy
 9aNHi6IU/P8uBwMb/7L1z3yw7mrWx3RsRsNjMkrji+IPhOHNghFvzcRZHrMthNMWewlH
 lwBl27Bd9z55yz11TGUiumT7f+rdrD1Ykg1dcc/JK6CzkcxY+lpuzJ6FZRfLCR320CVI
 A5TpMslx3pNmbE8iGyd44BhK9uHUUJncuNUaZz1X6fS6G6rQ6RlfQQJ9x6dLtMKovopl
 2wAA==
X-Gm-Message-State: AOAM533RdttDGYM73HRR7Y3hnYoEBxPBqFND1vJ3EcaNtlHVVg1PPeZu
 LwwDNWxJVqsBQ5pUXJN8SfA=
X-Google-Smtp-Source: ABdhPJydAzwANaRdevhYGTb3cg8HosuiSpWn/jN3gJxuEks0nTguLhRUzZXaPPHrkBekdZyu/N7SXA==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr53751401wrv.120.1635958885635; 
 Wed, 03 Nov 2021 10:01:25 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n13sm2525721wrt.44.2021.11.03.10.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:01:24 -0700 (PDT)
Message-ID: <282771ff-9b42-65aa-b6fa-3110e8a84666@amsat.org>
Date: Wed, 3 Nov 2021 18:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 15/23] target/mips: Extract break code into
 env->error_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-16-richard.henderson@linaro.org>
 <6fb43925-c350-ad38-ed4f-37b236e755fc@amsat.org>
 <3086c9e2-3452-2f4b-766d-be40c3d4ba1f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <3086c9e2-3452-2f4b-766d-be40c3d4ba1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 16:38, Richard Henderson wrote:
> On 11/3/21 11:11 AM, Philippe Mathieu-Daudé wrote:
>>> +            /*
>>> +             * As described in the original Linux kernel code, the
>>> below
>>> +             * checks on 'code' are to work around an old assembly bug.
>>> +             */
>>> +            code = env->error_code;
>>> +            if (code >= (1 << 10)) {
>>> +                code >>= 10;
>>
>> Shouldn't we also move this to the translation (not in R6_BREAK16)?
> 
> No, because it's a kernel thing, not a cpu thing:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/kernel/traps.c#n1056

Oh indeed, I see.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> PS: Just above, it looks like the kernel would need to grow support for
> R6_BREAK.  At present it only handles mips16e and micromips.
> 

