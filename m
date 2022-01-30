Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9D4A3ACE
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:56:44 +0100 (CET)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJ7j-00078i-Lv
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJ4u-0006PE-6T
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:53:48 -0500
Received: from [2a00:1450:4864:20::42d] (port=46733
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJ4s-0005oM-8T
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:53:47 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so21830343wrb.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 14:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xT1JWYcIv5yn2BWIHoXyobVXLWtxve7av3GDOx5Lrvg=;
 b=ABsIjji938+7wG+FCVseZLJzbw/owXYcaeflrgq+smn12M+sOli6WaO1+PrwJbjMkf
 Q/bsxKA9sMF/KDHU+wFVlhjxM/j6PYERsCHqal5LoZZRMqtrOqf2vM73mTudfjzxSsIc
 AoZ5ierpZUWhfU3enGU0v5BUWdB+KaPEKuxb1Cm0vUYleNKZVM9W7Gj5rmYS0LbYFQzu
 EO8DZVlulwxT+/onaZasAlb8rWm9Y7HnJLfF6vyG3aadvUzvEJcNTThVE0g5I+BzJDzy
 a15DTP2Trcaa05FJRA8WAm/n9fuM/LAIJ0uSeiXmn01kZf3T7ko93VF3eN+e4VudyO7u
 rORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xT1JWYcIv5yn2BWIHoXyobVXLWtxve7av3GDOx5Lrvg=;
 b=q4gJEMx82TS1zmMuzsgrjJfQvOS7ikVPdcWcJKc2eSCniAGBUk7gB1uO+S1LcQLkA0
 F2TmoLrpq6EI+tc90ShTpyfTLDYez9qlG2x05rg1aYxIevHNHhgD7KH3QcxDxpTuVgqS
 yKI8fHYGsb9BRgB8pBDxYgNtR7hAd2wa3R1hTLjOqFEaoCDwAPGsESfHtZLE6f/IfDSq
 1thmGW2Tlv/zXmZVKKRwY08YX2yH8efOPCnlPdSsy/7x6ftA+1f2j8dGWyvmaPqTWqsz
 uPcA0CtMJYqZ6p8pN3SrkC6yp9kvVnxs0NSDdko1q+wxiWcND1rPOeQP2+8JWxVfWkD2
 s3pw==
X-Gm-Message-State: AOAM533vP2zxUtIXCqF2g4W9Wd40WCuUpRk8aaFm8GukcWlqW7jOuBw+
 gKB2QVidml5ResJIm0Ji+QU=
X-Google-Smtp-Source: ABdhPJwjrOO9ApMHXRHVr+iAnBkfnzUA15Mv2+kWeAwrIfiNwD1BaVCZInzaqM4nkZ9wREpUNXFPaw==
X-Received: by 2002:adf:f045:: with SMTP id t5mr14805829wro.387.1643583224299; 
 Sun, 30 Jan 2022 14:53:44 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g6sm10016066wrq.97.2022.01.30.14.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 14:53:43 -0800 (PST)
Message-ID: <b21fefc6-a7f6-c101-5f1f-99cd3191933b@amsat.org>
Date: Sun, 30 Jan 2022 23:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] isa/piix4: Resolve global variables
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-4-shentey@gmail.com>
 <CAFEAcA_HE6UCaeyM7+5n0O+hFKLGk=Sc6Mpr_VBD_RJR=WJg=w@mail.gmail.com>
In-Reply-To: <CAFEAcA_HE6UCaeyM7+5n0O+hFKLGk=Sc6Mpr_VBD_RJR=WJg=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 14/1/22 14:36, Peter Maydell wrote:
> On Wed, 12 Jan 2022 at 22:02, Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Now that piix4_set_irq's opaque parameter references own PIIX4State,
>> piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4State.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/isa/piix4.c                | 22 +++++++++-------------
>>   include/hw/southbridge/piix.h |  2 --
>>   2 files changed, 9 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index a31e9714cf..964e09cf7f 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -39,14 +39,14 @@
>>   #include "sysemu/runstate.h"
>>   #include "qom/object.h"
>>
>> -PCIDevice *piix4_dev;
>> -
>>   struct PIIX4State {
>>       PCIDevice dev;
>>       qemu_irq cpu_intr;
>>       qemu_irq *isa;
>>       qemu_irq i8259[ISA_NUM_IRQS];
>>
>> +    int pci_irq_levels[PIIX_NUM_PIRQS];
>> +
> 
> I wondered how we were migrating this state, and the answer
> seems to be that we aren't (and weren't before, when it was
> a global variable, so this is a pre-existing bug).

Indeed the migrated VM starts with PCI IRQ levels zeroed.

> Does the malta platform support migration save/load?

Maybe a "best effort" support, but not versioned machines.

> We should probably add this field to the vmstate struct
> (which will be a migration compatibility break, which is OK
> as the malta board isn't versioned.)

Yeah good catch.

Bernhard, do you mind adding it?

Regards,

Phil.

