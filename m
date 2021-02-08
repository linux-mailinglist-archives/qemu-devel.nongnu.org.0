Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1231392F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:22:28 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99Ix-0004MK-Hw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l92uK-0000Dl-0t
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:32:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l92tt-0007Zq-UQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:32:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id 7so16291240wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 01:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XMflBkrJaRwcPWL8fgjEqK/Oz4ElccG6JPxmabssZVk=;
 b=oh/5DJ9yWQqv/qKd9De8PVhTU4g9FcgsRMCg5M/BQ6nxrUjny100MTEX3itMNuh/PN
 GY4aZoCnju6p7sJHdvC0tEfnbHRy7MxSjvkti8rlc7+8lZ/zG0j4RhJYWg8NnIFwUUlT
 UBadnBNNy3va5Wd+aItzSBYXFId0v3NQCBUv5ouDVnKZSY04Ey1AMD9pRqIWITmCXhJ6
 HrRZkwwYykYfuCc4vVclfGcZ7jPoqW5cW0q7CIOHwTEKNjukqylFnNLJwDLr/M7DSq5E
 C8f2tngWN00+hBl+581C9Es8INSkPwMxsO1S4sYgA3bdNVa5hSPeLQ34wb5VR2G4pWTn
 amiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMflBkrJaRwcPWL8fgjEqK/Oz4ElccG6JPxmabssZVk=;
 b=iidCOGSrYy45hiWyPkQRbhzpBRryIzMOjUP9C6vl7ZjI1AIIdkevAwZETr/sJ+VfD1
 hpeyxXXXHrK0dS3qo1JYBvQWSEnzrFiey8HOY3br1gIze3RIVUygDZAb/z1ylth6HeEH
 aVd088IyRzpZkcL6lQ7VJTJRehGN78raDemhqj7yfxhWufrhFqN9rsbc5tm6TcyiTao+
 lF7Hsk7NAoaG6DsjGP4Ya9aYqGJXdU4nWmy89/LoxorVzNiPUZl4fTNWJ+JWgxQIqMM4
 Mi+jgbmr5jijFzuWkOiJMydTIAw1biZ6bxe4J7dANvGXrH5ZRVdbwOWUZ+5opce6lsMn
 J+0Q==
X-Gm-Message-State: AOAM532YYN9VdKS8bkDWYjTDB60rGGgnroNvb7a7LqD56tmtCYFNgAH8
 wT987Vqa1IwXVy5+XGU8KLY=
X-Google-Smtp-Source: ABdhPJwJWQm0WNwPugdUcLGbW9rB2gVW+C7ntoLRoB9hjy0Os1172jSE/YtIC/StrJnsa9FL00s19g==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr9769555wrw.383.1612776719665; 
 Mon, 08 Feb 2021 01:31:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w15sm26767165wrp.15.2021.02.08.01.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:31:58 -0800 (PST)
Subject: Re: [PATCH] migration: Drop unused VMSTATE_FLOAT64 support
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20201022120830.5938-1-peter.maydell@linaro.org>
 <d258bc62-1a17-aeed-13ac-b61297e01a04@amsat.org>
 <CAFEAcA_T=HyjZWSXUpP1-07rwUsUsQs0rLOjQKNsm-cUAo1FEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3431522a-982a-7780-5ef7-c6261aad4c69@amsat.org>
Date: Mon, 8 Feb 2021 10:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_T=HyjZWSXUpP1-07rwUsUsQs0rLOjQKNsm-cUAo1FEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Eduardo/Richard.

On 2/7/21 8:43 PM, Peter Maydell wrote:
> On Sun, 7 Feb 2021 at 17:10, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 10/22/20 2:08 PM, Peter Maydell wrote:
>>> Commit ef96e3ae9698d6 in January 2019 removed the last user of the
>>> VMSTATE_FLOAT64* macros. These were used by targets which defined
>>> their floating point register file as an array of 'float64'.
>>
>> Similar candidate: VMSTATE_CPUDOUBLE_ARRAY()
> 
> Isn't that still used by target/sparc ?

Sorry, I meant CPU_DoubleU could be a similar to the removal of float64
in commit ef96e3ae969 ("target/ppc: move FP and VMX registers into
aligned vsr register array"), so we can remove VMSTATE_CPUDOUBLE_ARRAY()
later.

But I could be wrong and this is a legit use, as CPU_DoubleU contains
either a float64 or a uint64_t.

Now if the CPU_DoubleU/CPU_QuadU unions are only meant for CPU
registers, we should either document that or better move these
declarations out of the generic "qemu/bswap.h" ("exec/cpu-defs.h"
looks like a good candidate).

> 
> -- PMM
> 

