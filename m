Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CB6445BF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Z0S-0007ED-8u; Tue, 06 Dec 2022 09:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Z03-00079L-9r
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:32:48 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Z01-00082P-QY
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 09:32:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id m19so11310718wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 06:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=am+T1z+6vasvJvEMV4iQTqsax3zDRFlg48mzlTZaHmM=;
 b=IcC1ho+cX4Bi9OpED/rJ+uwaZQvLFr38rGjFhBhXZf3ZII3/530rSjbaaKmUxby4Zh
 3nF7nei6LhiMMCELE4ym/6XnC+wAIFeep1EPfx4LhNHo/SN6lDJ+poorkp3AXlPzOHR9
 WK9IZBKk4HseppCe2vl+2kJHnJKJXFRy7nUjodPMpqrA8Se3M84Fp24Vplz7zFlzx9Fr
 SbIBNebG0zm6KOCv6lifKIvZwIhQvWHSmvXHSAK4+Ct52pE8vNGNYQqbkHbAp0JomsiA
 Lxy0bLE+B3NAk6dgoHQjMS3xwsrl1Xrkc4d25+qgyEsTPwvm4hajaw9nx2lAZViFNZ4q
 FnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=am+T1z+6vasvJvEMV4iQTqsax3zDRFlg48mzlTZaHmM=;
 b=JFeqJuNeOGHVUOMp1bK+HGnZtErb7VoLGsoMNwZ+h4z7Ar8KWNge26xsaqzCAoPMCa
 zB3IrUpyI+KraOWSqbmHWpQnYUtxK8obQpDDGm6acZGDs9N21Syn3XJ8PjG1gPaL5j2L
 YfdlnjeucOZq9bQXQi61WmpdhLCQ2CuqF+ijV6XiJNN1EeuuYyayRMeLjjgweurzyNcN
 pX8ah3jUz1jLQ5xSA3jqOJjo51UrZ9Mxhp3p7l+rUJTYrPU3tgGlZCrJBXa5A2hLFN5s
 F0UGzNt/psz1Kb4KbY2sxoIlaqDjN3SWYgwvH5khj7BufoozYoDEsIQv57IazXAIdume
 gj4A==
X-Gm-Message-State: ANoB5pmU9VuS83CMeoP389jNdoebSwU6hBkExFrEnDJV4QyOYNhZxtPA
 spy+O+QqPnEYhRr2p15fNUe0fA==
X-Google-Smtp-Source: AA0mqf76uvsOcRzU3r3vE4LQtiyyGXqVyY725yzRIjekiBqUV8z5A58GeV13OPf59IHxkGo28kMfEQ==
X-Received: by 2002:a1c:4b05:0:b0:3d0:8819:a815 with SMTP id
 y5-20020a1c4b05000000b003d08819a815mr12721979wma.90.1670337163321; 
 Tue, 06 Dec 2022 06:32:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm24847772wms.44.2022.12.06.06.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:32:42 -0800 (PST)
Message-ID: <abeef930-8fc8-7afc-80d7-b9807fceb728@linaro.org>
Date: Tue, 6 Dec 2022 15:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <13fbfb3f-0d42-19a6-de11-4df9c5884b5b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <13fbfb3f-0d42-19a6-de11-4df9c5884b5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 26/5/21 20:15, Richard Henderson wrote:
> On 5/17/21 4:11 AM, Philippe Mathieu-Daudé wrote:
>> --- a/include/exec/hwaddr.h
>> +++ b/include/exec/sysemu/hwaddr.h
>> @@ -1,8 +1,9 @@
>>   /* Define hwaddr if it exists.  */
>> -#ifndef HWADDR_H
>> -#define HWADDR_H
>> +#ifndef EXEC_SYSEMU_HWADDR_H
>> +#define EXEC_SYSEMU_HWADDR_H
>> +#ifndef CONFIG_USER_ONLY
>>   #define HWADDR_BITS 64
>>   /* hwaddr is the type of a physical address (its size can
>> @@ -23,4 +24,6 @@ typedef struct MemMapEntry {
>>       hwaddr size;
>>   } MemMapEntry;
>> +#endif /* !CONFIG_USER_ONLY */
>> +
>>   #endif
> 
> Why no #error on this one, unlike the next patch.

Because many files in user emulation include "exec/hwaddr.h" :(

