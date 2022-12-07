Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EB6460F0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yzJ-0004Gc-QL; Wed, 07 Dec 2022 13:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yyw-0004CT-0K
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:17:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yyt-0006p0-Uo
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:17:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so29279770wrm.2
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GmIdP/SsPmw3Nj/VAD2dleNCr8c7wbwqy6xLcamYD20=;
 b=cyV1zpulQkWt8Ka8bJJ4V7yjjqySI1K+iNBB7G72fS+qMXeII2Wq0cfulWDDXLYLVi
 5e1uypPigz8nbZjhudte64P8qBAzyVcRB6dJpibqWYCOIOfGxzw6iwiO9+Bsqyajx7nH
 lk+2TMqwI3J800vadh1pcu5Bryk77pmCDg89H4c/iff1O/RVXdxep3hC3EmscztGluMC
 jjx6QnEiNaQw58pEEdUZVU5SQMVjAu6rvMzH7Nqz5DKOy10s2chcamZqy4KctCB8x7yQ
 BpVvOb0jPBnvcBarBjhujp3hM0hBkNotyeohsH6FL/qRgVcP4pG3ygfUCzvrR7gHrovU
 ey/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GmIdP/SsPmw3Nj/VAD2dleNCr8c7wbwqy6xLcamYD20=;
 b=LKUZXjRP+8i8RQuW3DQK6MB//pS14LQGbggdT+Wy/3wU1HM0WXG03ReKKeCYkSKnGw
 Xo6w8VMrZlCPbsOR1NNw0AVFF4w8mjGRm9FkSVERYinlhr4Wp8AbGEhbE4KkCoFFWL3f
 j1LQjF+g8mMz6NEKkOkxcZBJKpCiK5lyTw7ErC8Qbu8DKcfBuwzIcmiZDV7VL7Eb+tuB
 lhwgIKK06QE0tCOGM+tUmRIP7xuszQmmCGPkCZasnGSNUZAzoxszJE3NQIrMp3K7wUhV
 51frPeHxsbCNn16Zp/xwg3MPtBBX07FXdqBLUl5PijhtsI3342I344lmtUfDKkEl/jML
 rA2g==
X-Gm-Message-State: ANoB5pmzEhj+UP3UKQPXwjJmbjFw/++R74dvjdOV3axSdVq04Qy/9i9U
 TAFxSdxTSzl8ryg+//Irellkew==
X-Google-Smtp-Source: AA0mqf69CDlTgFaFxQpAyPXmUa9gzSQJYlZQZBhJkmyXsAyuSls9MXFOU4KbQP2hNikyXlWSVJ4hEA==
X-Received: by 2002:adf:eb02:0:b0:236:5e6a:7ee with SMTP id
 s2-20020adfeb02000000b002365e6a07eemr57303293wrn.618.1670437037473; 
 Wed, 07 Dec 2022 10:17:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e23-20020a05600c2dd700b003cfd42821dasm2514981wmh.3.2022.12.07.10.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 10:17:17 -0800 (PST)
Message-ID: <7c08c5a5-14b0-553f-3d82-9164983cecb0@linaro.org>
Date: Wed, 7 Dec 2022 19:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org> <87k03313z1.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87k03313z1.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 7/12/22 19:08, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Both insert/remove_breakpoint() handlers are used in system and
>> user emulation. We can not use the 'hwaddr' type on user emulation,
>> we have to use 'vaddr' which is defined as "wide enough to contain
>> any #target_ulong virtual address".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   gdbstub/internals.h        | 6 ++++--
>>   include/sysemu/accel-ops.h | 6 +++---
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
>> index eabb0341d1..b23999f951 100644
>> --- a/gdbstub/internals.h
>> +++ b/gdbstub/internals.h
>> @@ -9,9 +9,11 @@
>>   #ifndef _INTERNALS_H_
>>   #define _INTERNALS_H_
>>   
>> +#include "exec/cpu-common.h"
>> +
>>   bool gdb_supports_guest_debug(void);
>> -int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
>> -int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
>> +int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
>> +int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
> 
> Now we should be able to remove the "exec/hwaddr.h" include from
> gdbstub.c
Yes. And you made me notice I didn't commit the changes in 
gdbstub/{system,user}.c...

