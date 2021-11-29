Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB1462312
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 22:14:17 +0100 (CET)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrnyZ-00058M-QW
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 16:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mrnuG-0001Rx-5q; Mon, 29 Nov 2021 16:09:49 -0500
Received: from [2607:f8b0:4864:20::92a] (port=44006
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mrnuD-0001gN-TM; Mon, 29 Nov 2021 16:09:47 -0500
Received: by mail-ua1-x92a.google.com with SMTP id j14so36860137uan.10;
 Mon, 29 Nov 2021 13:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OLYo7OrKBE1C0bgqzEskXbMndvNeVcg/ZIVgPp7ZSZw=;
 b=ad5VJo7VUma3W70jk6tIXmVt2t9tGdb5YjDfSpDrYdeUFR08GbW/gsW9SCeno8oDet
 R8ScdToFo58QvbZQWoq3wCiYDYZFVfZhOHlVgZOfa0fXWk9uM2kvqc11FyeBNylpRWlS
 8WAM8/RW2Pgdmg9bzJ1XlY+LnrKqMW8OqJYjUgP10xaw1jXHT9H4aJdOzEnRLK1OMEI1
 9IjnhjDyPl0MtTHEErW5joUV6qhqY8pFAkjhL1BTNGnlVwimUwX71Pj7vEwkd8pIrF9y
 yBYKMXXz8f+v4RYhRkFRevFQjXbOhkMal1TKkijcEEdv7TtZqNBDNK3gSzVN4DpCFiJX
 WhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OLYo7OrKBE1C0bgqzEskXbMndvNeVcg/ZIVgPp7ZSZw=;
 b=Fkwhb8KsDK7L7ch1w+XNGqR1t4Sib8HO084YDZq78bA9iAMPsRG3AREuQCRDnVcsn1
 POktJLpFkPFDuNUPZAePea0RhiDbI+NnEZ4jAB0awMJ/JCV/nIhBYwEZBEyLxeqIofut
 pR5sJur7qHeHhAtvRONHy1Qnd9PPfvd8vqFQqVA/PhGacSZkKqPTRL8RB1DI8AaI+v0C
 nLD96NYDaiz3YZQs/SZ3t+XN00o8jC+o0T+ngR7K9e0wRI1UCsQ7mzBFa7SHJkadHRDI
 6i7NLBoIBgxZpTCvA00EMPEHabbwAwBMYdQDZiV/LVE+RHCUwUD43VruPehreJZKRuiT
 Ux7w==
X-Gm-Message-State: AOAM533g1OWk08jE8ZLcwqSltGGB+/5gf7hwMIQ22JPNvzINQf0XKole
 kJmwHNuXzLfCiOiFaErwxNE=
X-Google-Smtp-Source: ABdhPJwgMeM9rkkYDCzpCUfKWXpJ4kviuti9KgOEl6ujwAoO//VwQmbHtiYP5awa8EuSFobSaranVQ==
X-Received: by 2002:a05:6102:11ed:: with SMTP id
 e13mr36345138vsg.57.1638220184055; 
 Mon, 29 Nov 2021 13:09:44 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id y7sm9517506uad.2.2021.11.29.13.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 13:09:43 -0800 (PST)
Message-ID: <4ec67484-d328-7a8d-fb77-c43b151da80c@gmail.com>
Date: Mon, 29 Nov 2021 18:09:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20211125224202.632658-1-danielhb413@gmail.com>
 <YaA0SIVnltlrarQZ@yekko> <077efeac-3672-8b8f-dbe4-901c47c23eda@kaod.org>
 <YaG+ue4IWkXpu0oJ@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YaG+ue4IWkXpu0oJ@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/27/21 02:14, David Gibson wrote:
> On Fri, Nov 26, 2021 at 06:51:38PM +0100, Cédric le Goater wrote:
>> On 11/26/21 02:11, David Gibson wrote:
>>> On Thu, Nov 25, 2021 at 07:42:02PM -0300, Daniel Henrique Barboza wrote:
>>>> If one tries to use -machine powernv9,accel=kvm in a Power9 host, a
>>>> cryptic error will be shown:
>>>>
>>>> qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, only "-cpu host" is possible
>>>> qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
>>>>
>>>> Appending '-cpu host' will throw another error:
>>>>
>>>> qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
>>>>
>>>> The root cause is that in IBM PowerPC we have different specs for the bare-metal
>>>> and the guests. The bare-metal follows OPAL, the guests follow PAPR. The kernel
>>>> KVM modules presented in the ppc kernels implements PAPR. This means that we
>>>> can't use KVM accel when using the powernv machine, which is the emulation of
>>>> the bare-metal host.
>>>>
>>>> All that said, let's give a more informative error in this case.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    hw/ppc/pnv.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>>> index 71e45515f1..e5b87e8730 100644
>>>> --- a/hw/ppc/pnv.c
>>>> +++ b/hw/ppc/pnv.c
>>>> @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
>>>>        DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
>>>>        DeviceState *dev;
>>>> +    if (kvm_enabled()) {
>>>> +        error_report("The powernv machine does not work with KVM acceleration");
>>>> +        exit(EXIT_FAILURE);
>>>> +    }
>>>
>>>
>>> Hmm.. my only concern here is that powernv could, at least
>>> theoretically, work with KVM PR.  I don't think it does right now,
>>> though.
>>
>> At the same time, it is nice to not let the user think that it could work
>> in its current state. Don't you think so ?
> 
> Right, I'm thinking of the implication if you have an old qemu but a
> new KVM which let it work.  Chances of KVM actually implementing this
> probably aren't good though, so requiring the qemu update if we ever
> do is probably the better deal.


If the KVM module implements powernv accel support in the future, I wouldn't
take my the chances with the powernv machine working out of the box with it.

Most likely, if an endeavor of supporting KVM accel for powernv ever takes
place, we'll need QEMU changes to go with it. And when that happens we can
revert this patch and make the other necessary changes/fixes.

All that said, perhaps it's useful to add a note in docs/system/ppc/powernv.rst
explaining the the rationale for what we're doing here.



Thanks,


Daniel



> 

