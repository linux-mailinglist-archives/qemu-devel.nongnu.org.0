Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C754736A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 11:49:03 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzxjn-0006f3-EM
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxhG-0005Vy-SI
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 05:46:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxhF-0008OQ-3c
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 05:46:22 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so750219wme.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8xN9agNMWuaXLQoBRB8latHqnDydX/iIgQsqn0gdfB4=;
 b=pJhkmddbcBjDJvToVK4vuGMddMXTYfBtlAbC+NtyqF+wfHZRMb5Kbgy+gAxoJUYRW6
 qpGVBYROLMawy+KBfLtHsm9VRHDqd9A3KyoHDHsemRWSf+OSEjJzfF7LXvibEpjPVUVy
 Pk74yPf0m9UGQvkHxcKqKcMlSUivHJA+5wRIB8Wc6cPZ/dHWCKICXATxKrKrznrU80/9
 +R4Ys3UoffKN8+vAOxsc0Sb5aNk9VohETbTprkFydpidjaMUiR3zLZWntPao37MrWI+3
 Hpien59+PkhwheTy8VP5GMb8Wm5rH4umEFx0cEKpyY/oMlUI0A5sWzSYLMufx9P7rEZE
 bLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8xN9agNMWuaXLQoBRB8latHqnDydX/iIgQsqn0gdfB4=;
 b=e0IjFmWarLURryJJQRz1JkDRohLGs+S1BMRJTN5RQ93SsDe+Fyxc4/dkyHNp5624cx
 cxbzGOYmqyBXPdpEIwxq/dbfaQJBF6/n6jhK9Upwd0A429Ds1y83qe61vZmKpQJAAcaX
 acQe6Wa+0znzRkBR0WCeT2fB1KFCt3+LIwPhB3vhZBwiuu3d8OUcBEDiMt5cjV309yyt
 juSkP5eG9kBO++1ocn99Pg0jVX3f4XHREiDz2A/OiTMNQ5NR2/Ea6jjzFf5ehfw3C4EX
 BCT0Jaqk3Xw8fDs6Dnm1177Pc0S689YEyYyqalEzVXJl68tCSfc/Kr72v3pRmyR7s+oH
 OWEw==
X-Gm-Message-State: AOAM53342U/H0cGlFxb56Fi/zrMndEJKOuf9g6WoVcGKtdbQCFKwL77P
 qSO//6y/B7YUD4erWKgY5LA=
X-Google-Smtp-Source: ABdhPJzKef1Z/SeBVqtb7bSzp2AU8biPnlqXjvSTj4re4WTFtC+nFAHvv/a40FPFgCO3v6hDSOm0pQ==
X-Received: by 2002:a05:600c:1c29:b0:39c:52b6:aad0 with SMTP id
 j41-20020a05600c1c2900b0039c52b6aad0mr3972148wms.203.1654940779360; 
 Sat, 11 Jun 2022 02:46:19 -0700 (PDT)
Received: from [192.168.2.115] (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 e15-20020adfe38f000000b0020fd392df33sm2039417wrm.29.2022.06.11.02.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 02:46:18 -0700 (PDT)
Message-ID: <b6be8fa6-e954-d893-87cb-3f03078bf4ee@amsat.org>
Date: Sat, 11 Jun 2022 11:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/11] hw/acpi/piix4: remove legacy piix4_pm_init()
 function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
 <efd524b1-0ba5-048f-0d79-d67c5d87b020@ilande.co.uk>
In-Reply-To: <efd524b1-0ba5-048f-0d79-d67c5d87b020@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/6/22 12:56, Mark Cave-Ayland wrote:
> On 30/05/2022 12:27, Philippe Mathieu-Daudé wrote:
> 
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> This series moves the outstanding logic from piix4_pm_init() into
>> the relevant instance init() and realize() functions, changes the
>> IRQs to use qdev gpios, and then finally removes the now-unused
>> piix4_pm_initfn() function.
>>
>> v2:
>> - Addressed Ani & Bernhard review comments
>>
>> If no further comments I plan to queue this via mips-next end of
>> this week.
>>
>> Regards,
>>
>> Phil.
>>
>> Mark Cave-Ayland (11):
>>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>>      piix4_pm_realize()
>>    hw/acpi/piix4: change smm_enabled from int to bool
>>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>>    hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/acpi/piix4: remove unused piix4_pm_initfn() function
>>
>>   hw/acpi/piix4.c               | 77 ++++++-----------------------------
>>   hw/i386/acpi-build.c          |  1 +
>>   hw/i386/pc_piix.c             | 16 +++++---
>>   hw/isa/piix4.c                | 11 +++--
>>   include/hw/acpi/piix4.h       | 75 ++++++++++++++++++++++++++++++++++
>>   include/hw/southbridge/piix.h |  6 ---
>>   6 files changed, 107 insertions(+), 79 deletions(-)
>>   create mode 100644 include/hw/acpi/piix4.h
> 
> Hi Phil,
> 
> I see that you haven't yet sent over the PR for this, so I wondering if 
> it makes sense to add Bernhard's other series to mips-next first since 
> they are good cleanups:
> 
> https://patchew.org/QEMU/20220603185045.143789-1-shentey@gmail.com/ 
> (QOMify Sbridge)
> https://patchew.org/QEMU/20220529184006.10712-1-shentey@gmail.com/  (RTC)
> https://patchew.org/QEMU/20220520180109.8224-1-shentey@gmail.com/   
> (Random cleanups)
> https://patchew.org/QEMU/20220605151908.30566-1-shentey@gmail.com/  
> (Werror fix)

Thanks for the head up :) All now queued via mips-next!

> Alternatively if you are busy, please let me know if you are happy for 
> me to send a PR with Bernhard's fixes via qemu-sparc on your behalf.
> 
> 
> ATB,
> 
> Mark.


