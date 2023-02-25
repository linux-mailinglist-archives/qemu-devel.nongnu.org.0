Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953146A28DD
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVraS-00055g-7P; Sat, 25 Feb 2023 05:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pVraP-00054m-Ie
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:15:26 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pVraN-0004BO-Vz
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:15:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id kb15so1520534pjb.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAMHL7kZ86L5KZS4GPla8N7fo9u7X8qYBH7eOjeyRD0=;
 b=XNWUe3oH5+TORxaoS7xPIy84Py/j5KJFldhmIhxpw88brXoxlWwQxSpwdJH7BZlznA
 2tFVX6GeUooSvL6v9pZUos5MrcdWpAtrRpCdhDf0fs3VFq82GP4NmTuMVhs7zRSaGx3i
 +RNx2HFfNXFFs5gdhgEm46gmD1Gs4ta9EwFrLJjn02378rjSZiQiJ5lnGyhN6d9nbeKB
 ITAE937RiBEAz7WVjdrFzeUGgauaqgo7jaQzOhBrrTbzTkgdJo1rPHwx6xxPwya0YUAT
 GkbV5p3CguG1btXkcWysYX0YkjecJpz7sPpny6rrJ6RSYXZ8JmyHxwRvWl2l8l9dHjKp
 zTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAMHL7kZ86L5KZS4GPla8N7fo9u7X8qYBH7eOjeyRD0=;
 b=zqIWKrM+DH5E3i6H8A3pAqxoWRCbHgUPJNyFkCG3HLRE97AAKH5aRLcoUP/PQfoZbW
 RTk7n+hxq5U88Hgd04UGYzpfnX/AhCit70uw2ilNF8qxrnEfmKf1DBtPUMY54kk4wMe6
 3mdQJhy1cjuYAHWYBC6O84sTjbL0gevOstqo87SiFKyJ8jPBYi2lTw6p9LgWiooOjydj
 4BTqx15NDrzaO8izECYhVL+sTs+/KjCfiIqXUBmroWXCQEVfTQpXd05jOgyJ2Is19diV
 PSKl+Q24o6Vn7+Qvh/wN/JymtUmLeEdxpCgDfgL0EDZkA2q6kDvlksI3rjN4GGZZfQom
 qORA==
X-Gm-Message-State: AO0yUKUWzUDSl8Vel9lddJIgjU5AWNBIHllnbwQomndWeMu03rANKZrk
 Gl9kot/hhATWIub3B3awJ6w=
X-Google-Smtp-Source: AK7set/nLncrfTj5H0KFJC62sd8VciELDQ73znonu3/5kI5NfrfsLxEPcCcGzJ06wS94rwrwO0g9sw==
X-Received: by 2002:a05:6a20:728c:b0:cc:47ae:18dd with SMTP id
 o12-20020a056a20728c00b000cc47ae18ddmr8682935pzk.42.1677320121553; 
 Sat, 25 Feb 2023 02:15:21 -0800 (PST)
Received: from [192.168.31.113] ([171.226.229.86])
 by smtp.gmail.com with ESMTPSA id
 t6-20020aa79386000000b005907716bf8bsm932049pfe.60.2023.02.25.02.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:15:21 -0800 (PST)
Message-ID: <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
Date: Sat, 25 Feb 2023 17:15:17 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
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

On 2/24/23 21:29, Igor Mammedov wrote:
> On Tue, 21 Feb 2023 23:04:57 +0700
> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> 
>> This commit refactors APIC registers read/write function to support both
>> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
>> support larger APIC ID, self IPI, new IPI destination determination in
>> x2APIC mode.
>>
>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
>> ---
>>   hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
>>   hw/intc/apic_common.c           |   2 +-
>>   include/hw/i386/apic.h          |   5 +-
>>   include/hw/i386/apic_internal.h |   2 +-
>>   4 files changed, 172 insertions(+), 48 deletions(-)
>>
>> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
>> index 2d3e55f4e2..205d5923ec 100644
>> --- a/hw/intc/apic.c
>> +++ b/hw/intc/apic.c
>> @@ -30,6 +30,7 @@
>>   #include "hw/i386/apic-msidef.h"
>>   #include "qapi/error.h"
>>   #include "qom/object.h"
>> +#include "tcg/helper-tcg.h"
>>   
>>   #define MAX_APICS 255
> 
> I'm curious how does it work without increasing ^^^?

Hmm, my commit message is not entirely correct. In this series, some 
operations (send IPI, IPI destination determination) have been updated 
to support x2APIC mode. However, the emulated APIC still doesn't support 
APIC ID larger than 255 because currently, we use a fixed length (255 + 
1) array to manage local APICs. So to support larger APIC ID, I think we 
need to find any way to manage those, as the possible allocated APIC ID 
range is large and maybe the allocated APIC ID is sparse which makes 
fixed length array so wasteful.

Thanks,
Quang Minh.

