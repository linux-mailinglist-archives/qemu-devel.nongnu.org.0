Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6C113614
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 21:01:44 +0100 (CET)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icaqE-0002Vc-G4
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 15:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1icacH-0002OU-28
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 14:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1icacF-0007in-Mr
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 14:47:16 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1icacF-0007cy-FH
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 14:47:15 -0500
Received: by mail-pl1-x642.google.com with SMTP id o9so154184plk.6
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2019 11:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qrSRkiaCgZz8DLLrmY+mmD2gKPkv7NsGpvuDCPH/HiE=;
 b=xv/M19/4oyuEUq+gjw67xUIYOnfxECBQMjEcADixAJGxmLqK9jrNKvfcrvzk9R2b3r
 +pKjh9R3tWkSS16FsLvuhlSGoWwP706I4AQ7O9AmoOtg+icWJAmTKilzvkSLkPiUPisn
 HbRfZd6mz5koU+s27fDYwBY2BSy9NnoMg+R8QwbO/SkiAi8qQjtaz51cuRp8Qun3FmZJ
 U9YRSzBMTz2SHkGj6fCIwo/86JQH7QrKTsz9y1MDHFVy+4UgCpBHWpL3Y6tqfpaKQMAM
 9AQb0eE6iMt26hXG52awvkDPSuoEEESgc0hQc2G8bzktcWdxyNzuS7h7W3KgBIxG528f
 x/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qrSRkiaCgZz8DLLrmY+mmD2gKPkv7NsGpvuDCPH/HiE=;
 b=FwEqDms3mD8fwaDhqS1qlICDa1flrXMgTPmiRWq/i7lq+57SC6D56aIkeTgybmHxE1
 DmTAmvV4s8COg4guHvnwC7NJ1TsFwBaEBRPo+60+bFwx4nfonUd651ySDO/6areeE8Lu
 oH+3Di944lW0fnX7pa+NqN1HM7hwRZ6T7nf6VfvQzi2B5evE8Bg4d8zJoxBUp+aqD8DB
 PanQZ2Od4329H4/YYuPsler2KbvZk0ordOChjTjS64+DOvsVwjxnXXTZLmns5msuOz7n
 1qkWASoAip5+yYOWDqOND+rQ1hA2w4bgy7rJiOtNcH8uAhr9WcqjeCr9NzSzhKaW5dzo
 qebg==
X-Gm-Message-State: APjAAAV9kyZrRonaIK9Lb7yfQs5r13dt1SUwAdxPw4e/iDfEG6m05zqf
 9ZHdYmjmfWmMRaEVwSPSANLKFg==
X-Google-Smtp-Source: APXvYqxmZ1zs2zyn3SGDzx4LaWGBX9tLvEa5pl1jcw2G041i//um75FSKxMBg6qTRGyEhqYevuNDGw==
X-Received: by 2002:a17:902:ba8e:: with SMTP id
 k14mr1569366pls.335.1575488829774; 
 Wed, 04 Dec 2019 11:47:09 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p38sm7273553pjp.27.2019.12.04.11.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 11:47:09 -0800 (PST)
Subject: Re: [PATCH v4 26/40] target/arm: Update
 define_one_arm_cp_reg_with_opaque for VHE
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-27-richard.henderson@linaro.org>
 <87tv6f7w9u.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37abfbf0-be00-db96-fbf5-b6d6ea7bb237@linaro.org>
Date: Wed, 4 Dec 2019 11:47:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <87tv6f7w9u.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/19 10:58 AM, Alex Bennée wrote:
>> @@ -7437,13 +7437,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
>>              mask = PL0_RW;
>>              break;
>>          case 4:
>> +        case 5:
>>              /* min_EL EL2 */
>>              mask = PL2_RW;
>>              break;
>> -        case 5:
>> -            /* unallocated encoding, so not possible */
>> -            assert(false);
>> -            break;
> 
> This change is fine - I don't think we should have asserted here anyway.
> But don't we generate an unallocated exception if the CPU is v8.0?

This change is only for validation of the system registers themselves.  It has
nothing to do with the usage of system registers from the actual guest.


r~


