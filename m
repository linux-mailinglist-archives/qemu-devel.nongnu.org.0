Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501C4C7F2B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:27:38 +0100 (CET)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqMb-000112-LB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:27:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAk-0006Xp-FI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 19:15:25 -0500
Received: from [2a00:1450:4864:20::32c] (port=53150
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAe-0005Ol-NQ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 19:15:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r10so6640444wma.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 16:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6ovBljeafNSlk6IyQEJqNoJxlHmjSr/p74A79qcVUbE=;
 b=RMwFDum1u2jhaMCNrDjKWU04IN4HdKPWdTELCvWRmDu55TQFMTPKsBjXkhMMo+Avsm
 hufBV/7WlyBAjdyCniTzlSlErZfita6YE8+sWdwSFcQaIlrIzzAxFga6Z90PcxUC5bcn
 en6kN84yjpwtBW4X48r+h5K+kC4ByhAYcFcFS9OcKVYsP5eY5ib2emRRWCULVLO2jbMN
 Iaxj4BXbMYIBQc5oaFSyJp1Odi2OWcCrsZo7yhgsD2ioA4xp6pJ/j2yB89YtNP73BByG
 /IhsAjA0hW9H4MI7tO3jEPe6HTBReQxQ8QC9YpvloD//bUbyPQtzCoqT1J7fw0fpmg48
 LB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ovBljeafNSlk6IyQEJqNoJxlHmjSr/p74A79qcVUbE=;
 b=zsVSCJL7AMq8tcqrmOAlnHHKH4olyKtIJz+jOXTXOmM/g7YeKGjO4oN4JZ0nFmi8aY
 JfecI123g08xk0Kj3ZvLpUh1gk4PuBFiVAsE7IyHGnZnYtdDo4XKSs9aSqh03VtvAWUo
 vXhppxQmMHjpwnJQzf0MNI/FdNN/bzpW811Fa305AGSknRaf39/5L1aVRuNYK55UO2xw
 VAC+Idi/4LjWTaCsjy1Y3K/hscb1zzHqX5uNxlsF8CEPMb5Xi0WEqsDHYNkOArOK3MrI
 8hKAS7oo/0Bnp5vb5ovhv857A1Z/A4tI8jVBUg5UOK+cTrIdnyGG7kBOdVZ7e6Mnuo44
 +lhQ==
X-Gm-Message-State: AOAM531VBW0c2SDjNGGoapywqPQCAqKfCM9HPLBI04SfR+To2j9yzg0r
 8HJOUW0cXKq8l0Y1gPtlNCI=
X-Google-Smtp-Source: ABdhPJxqi5VpVbLYhn5E+2tbtKUJXEswj/hBAsu9721pN6wNKP0dGFJNgf9lGt+1w2sNJKEWq5da2A==
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr2769891wmh.56.1646093713092; 
 Mon, 28 Feb 2022 16:15:13 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm1575339wmg.36.2022.02.28.16.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:15:12 -0800 (PST)
Message-ID: <771a2551-cc6c-8c95-7df0-d607b9a9a53f@gmail.com>
Date: Tue, 1 Mar 2022 01:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 0/7] malta: Fix PCI IRQ levels to be preserved during
 migration, cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220217101924.15347-1-shentey@gmail.com>
 <2F99BEF0-8E45-40C6-B143-1976938E9E9C@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <2F99BEF0-8E45-40C6-B143-1976938E9E9C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 25/2/22 21:36, Bernhard Beschow wrote:
> Am 17. Februar 2022 10:19:17 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> Tested with [1]:
>>
>>   qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda \
>>   debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"
>>
>> It was possible to log in as root and `poweroff` the machine.
>>
>> [1] https://people.debian.org/~aurel32/qemu/mips/
>>
>>
>> v4:
>>   As suggested by BALATON Zoltan, gt64120_register() is now resolved by
>>     sysbus_create_simple() etc. This also fixes the nitpick pointed out by
>>     Philippe.
>>
>> v3:
>>   The migration bug now gets fixed in gt64xxx_pci before any cleanup. As
>>     suggested by PMM the patch is based on commit e735b55a8c11.
>>   The code movement patch now moves the already fixed code. I might be a bit
>>     too conservative here by removing Philippe's Reviewed-By tag.
>>   As suggested by BALATON Zoltan, the redundant i8259[] attribute is now
>>     resolved immediately after the code movement. As a side effect, it also
>>     removes moved code which doesn't adhere to the coding style (local loop
>>     variable).
>>   To address BALATON Zoltan's comment and to reduce the number of required
>>     Reviewed-By's, only piix4_set_irq() is modified to expect own DeviceState
>>     paremeter. Up to v2, all remaining set_irq() functions were changed this
>>     way.
>>   The patch resolving piix4's singleton variable got split into two patches:
>>     One which resolves the singleton variable and one which replaces magic
>>     constants. The split patches should be more comprehensible.
>>   Suggested by BALATON Zoltan, I took a chance to resolve gt64120_register(),
>>     a method akin to the legacy init functions we're trying to get rid of.
>>
>> v2:
>>   isa/piix4: Fix PCI IRQ levels to be preserved in VMState
>>   isa/piix4: Resolve redundant i8259[] attribute
>>
>> Bernhard Beschow (7):
>>   hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
>>     migration
>>   malta: Move PCI interrupt handling from gt64xxx_pci to piix4
>>   hw/isa/piix4: Resolve redundant i8259[] attribute
>>   hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
>>   hw/isa/piix4: Resolve global instance variable
>>   hw/isa/piix4: Replace some magic IRQ constants
>>   hw/mips/gt64xxx_pci: Resolve gt64120_register()
>>
>> hw/isa/piix4.c                | 54 +++++++++++++++++++++--
>> hw/mips/gt64xxx_pci.c         | 80 +++--------------------------------
>> hw/mips/malta.c               |  7 +--
>> include/hw/mips/mips.h        |  3 --
>> include/hw/southbridge/piix.h |  2 -
>> 5 files changed, 59 insertions(+), 87 deletions(-)
>>
> 
> Hi,
> 
> all patches have at least one Reviewed-by tag. What's missing for merging?

Time ;) Series queued to mips-next.

Thanks for the nice - long due - cleanup!

Phil.

