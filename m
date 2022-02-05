Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD24AA84B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 12:15:49 +0100 (CET)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJ2i-0004N6-BW
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 06:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ0U-0002xC-Re
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:13:30 -0500
Received: from [2607:f8b0:4864:20::52c] (port=41530
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ0S-0000je-VK
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:13:30 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f8so7217262pgf.8
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 03:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vIMUbB1D5q18vviEbzkE5H3tGVFtOsSJ9qBpcTUDvC0=;
 b=lWlw8xFoI+VMWbl1tT8clPRy6XEEojESe7+x3EsMLCGf50ThfUTiEDpUe0eRBJjX5Z
 kt3SIXCdaFtWpqkDdPB5ebUZN1J76B+9gPDMpKAlQki0uZUOUozggn6WIfVVDQXTC+jD
 II/MP2UKP4TpN7fOy6uLtg52FnYcbscJ34Sg/7I1+AVs0smLH7lgyxoVGa5bDKCW0K1l
 hysr14jwHk9eK1lVnRl0YE/ksu/DXPgnMBhPduZZkqo3Tu4DCTeSoHvM+rlzFwQLJ+Tg
 EzWa9frsSYA82a5NbcICofXHCfXndznzkUJUZJHUw78iN1QOMeL5YE5pkk0ViuSWflut
 W49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vIMUbB1D5q18vviEbzkE5H3tGVFtOsSJ9qBpcTUDvC0=;
 b=pheYg1TfaOFx6Kb6YR+33lmh5iSYkrzsfDFsuw8D0BnAzAy5GnuOSuI+w11/Xxl/Xg
 TLxnt9lbraVBdwnZR/n38idufaSMJN6Y3MVzzQT2D0Yxxj/xSDS01E1gDegHmD/rw7mL
 ANRMskjuIfp+xNgct+wTPEV8whF6O0ncOI0wm8At4fAdhCSn9OFXBsO4hUA3F08sc9/h
 BCd+yBo8wqqsABtekz+nn8RCcyYmKAhbAWb6hiy4ko2znQ5Cj5OvNFDvTPHoYxU8ghjb
 5kUnRG4h5gFKkLDkYd9X2dRP8d731tKWlo5eH6Uqs18YFPVHJMzopUzVpwtR87NgmXqE
 Kc8g==
X-Gm-Message-State: AOAM533UFhSXNXXmN1zTH/0Yrl3iJaqhjWQlVNE9E/PP49EWsJqw8Plg
 CiLBTCMlNb8y59NGK9GexvQ=
X-Google-Smtp-Source: ABdhPJx9Dq2/P8h2/OnNcUh/siaZvOZBqPx+TfoPzLqR5C7h2Tok6p+5EjAUN6QbpkTeEQRkOjOHeQ==
X-Received: by 2002:a63:f711:: with SMTP id x17mr2638363pgh.274.1644059607557; 
 Sat, 05 Feb 2022 03:13:27 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u18sm15261953pjn.49.2022.02.05.03.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 03:13:27 -0800 (PST)
Message-ID: <65efd350-b4ab-1926-aa92-c0a38b38a7d5@amsat.org>
Date: Sat, 5 Feb 2022 12:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] input/adb: Only include where needed
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Laurent Vivier <laurent@vivier.eu>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-devel@nongnu.org
References: <20210705123721.65BDC745708@zero.eik.bme.hu>
 <dc5e448d-e964-817d-013-6dea2be32a5d@eik.bme.hu>
 <c420951b-1162-ffc0-a967-a66d797f0c0f@ilande.co.uk>
In-Reply-To: <c420951b-1162-ffc0-a967-a66d797f0c0f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/2/22 12:02, Mark Cave-Ayland wrote:
> On 27/01/2022 23:39, BALATON Zoltan wrote:
> 
>> On Mon, 5 Jul 2021, BALATON Zoltan wrote:
>>> The header hw/input/adb.h is included by some files that don't need
>>> it. Clean it up and include only where necessary.
>>
>> When you're touching mos6522, I've also have this patch that cleans up 
>> includes that's somewhat related to mos6522 so you could consider it 
>> to be included in your series. I haven't checked but it should still 
>> apply. At least I got no problem with rebasing so at least with --3way 
>> should probably work but if not I can resend just let me know.
> 
> I have a vague memory that someone was advocating a while back for the 
> opposite of this patch in the way it uses headers i.e. the .c file 
> should contain the include for the header as well as the .h file, so I'm 
> not sure what the recommendation is here.

Headers should include the minimum headers they require.

hw/misc/macio/cuda.h uses ADBBusState which is declared in
"hw/input/adb.h", so it must include this header, otherwise we can
consider this a bug.

I haven't checked the rest.

> The parts related to tidying up the mos6522.c and mos6522.h includes 
> look correct though, as they shouldn't be referencing any ADB headers.
> 
> 
> ATB,
> 
> Mark.
> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>> hw/misc/macio/cuda.c         | 2 --
>>> hw/misc/macio/pmu.c          | 3 ---
>>> hw/misc/mos6522.c            | 1 -
>>> hw/ppc/mac.h                 | 2 --
>>> include/hw/misc/mac_via.h    | 1 +
>>> include/hw/misc/macio/cuda.h | 1 +
>>> include/hw/misc/macio/pmu.h  | 1 +
>>> include/hw/misc/mos6522.h    | 3 +--
>>> 8 files changed, 4 insertions(+), 10 deletions(-)

>>> diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
>>> index a71deec968..8a6678c749 100644
>>> --- a/include/hw/misc/macio/cuda.h
>>> +++ b/include/hw/misc/macio/cuda.h
>>> @@ -26,6 +26,7 @@
>>> #ifndef CUDA_H
>>> #define CUDA_H
>>>
>>> +#include "hw/input/adb.h"
>>> #include "hw/misc/mos6522.h"
>>> #include "qom/object.h"

