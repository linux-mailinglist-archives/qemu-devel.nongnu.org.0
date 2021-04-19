Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCE3648F8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:22:31 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXbS-0008HM-Eg
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYXVN-0001e2-Ss
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:16:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYXVM-0000sW-3S
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:16:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so6370276wmi.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D7Qp6ejM6n6bXKV0Jp5kY4EmienfngJ0lLOSYWzzuZA=;
 b=gzPr2EKpW/yg7BQG3LlTdnj7RbQu0BzqvxCqFVp16Z1N4Bf+i69NfV99FTHAhwzPlV
 6zZVKqOeHYGDv+ixP8jQXCWjYrLvKm7Ppw8ss1MvQ9b2u6d/9g0vAz6yl1oRxiM/VAIK
 i1Dm+u/VriTba/rJzgul2Cx6LogVr2LwcsJhAnJ4MFUdnvtQkkCyAe2t0W7O9EH1C3h0
 zjgQ36Cqo36kv7B89qTHi2T9c3M2M43VLmtRIN9Snd0bJPqBPs/1BVqM0uVoVfk70GF7
 X6YAWuRmlto8C7pfc8H7SUueWTXKHqp5VxoLR/5qaM6bYTjYpDpSiYXvBvI5C30o/HYf
 ygWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7Qp6ejM6n6bXKV0Jp5kY4EmienfngJ0lLOSYWzzuZA=;
 b=SFbxOmBAB+kR4IKToNtcSvNKX1VWuNA3jFc8XJkix5ZudbZ/OjbyU2cywU6RYvNpH+
 AJp6dCR1j++vgMD8GQJcckp6fsqtNEET7RdTxeFaDYfrwk4Fog+wXjw7Zpk2ISZBQ377
 lNlEUfj2XnZlvKAsmbHuiqimejcYmd64KFLSnc4bhoagmuEkDeZ004p2oz4122nw36hx
 f7exVA0wfAMWAYNXJCEiQreO49jNlPCF1HmHEVQgIybORd+o+zh4Ht8xK93j0630ZkJJ
 JgWm4CbehK6GW7impS/np0sgXj9cFnxcn92UvANOvcooh6jnofKrsKCE0etHATAAFcN5
 tiMA==
X-Gm-Message-State: AOAM533x2J1OSibm/DwGOFzwBwLGmzXajjxEr/4HJ13kWlr30kyyotUI
 x3j/qI3NHJ7woHaJgInl4Y4=
X-Google-Smtp-Source: ABdhPJxS1yBM1o3i63lVn2v9XvxCub6X6EozMVx31m9K/h0swHIKGHKfVG0Jwq35tKyPCEWoEVmf/w==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr102381wmq.67.1618852570372; 
 Mon, 19 Apr 2021 10:16:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p18sm22971787wrs.68.2021.04.19.10.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 10:16:09 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] target/mips: Correct the license text
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210418080345.926981-1-f4bug@amsat.org>
 <CAFEAcA-5yjOFpn15-OiBuF4DxyOde=rmZ=ZzypgNtHF1DgeXRw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2dbabbe-2c9c-f3a6-cde3-8c3ffa7ee237@amsat.org>
Date: Mon, 19 Apr 2021 19:16:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5yjOFpn15-OiBuF4DxyOde=rmZ=ZzypgNtHF1DgeXRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:53 PM, Peter Maydell wrote:
> On Sun, 18 Apr 2021 at 09:03, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The license is the 'GNU General Public License v2.0 or later',
>> not 'and':
>>
>>   This program is free software; you can redistribute it and/ori
>>   modify it under the terms of the GNU General Public License as
>>   published by the Free Software Foundation; either version 2 of
>>   the License, or (at your option) any later version.
>>
>> Fix the license comment.
>>
>> Fixes: 3f7a927847a ("target/mips: LSA/DLSA R6 decodetree helpers")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Commit introduced after 5.2 release, during the 6.0 cycle.
>> Harmless and useful for 6.0-rc4 IMHO.
>> ---
>>  target/mips/rel6_translate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
>> index 139a7524eea..c5843cbc5e2 100644
>> --- a/target/mips/rel6_translate.c
>> +++ b/target/mips/rel6_translate.c
>> @@ -6,7 +6,7 @@
>>   *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
>>   *  Copyright (c) 2020 Philippe Mathieu-Daudé
>>   *
>> - * This code is licensed under the GNU GPLv2 and later.
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>   */
>>
>>  #include "qemu/osdep.h"
> 
> I find this file's copyright/license comment a little confusing.
> Looking at the actual commits, it seems to be entirely your work,
> in which case you can put any (compatible) license you like on it.
> But the comment header suggests it includes some code copied from
> other files in target/mips and thus copyright by Thiemo and others:
> if that's so then it would seem more logical that this file be
> under the LGPL as older files like translate.c are.

I guess used a template with Thiemo and others by mistake, this file
is new and I wrote all the code content. I have no problem to change
it to LGPL.

Thanks,

Phil.

