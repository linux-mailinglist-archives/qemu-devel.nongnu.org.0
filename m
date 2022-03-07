Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E34D0051
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:42:23 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDd0-0002tO-4H
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDaU-0001O0-FK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:39:46 -0500
Received: from [2607:f8b0:4864:20::102e] (port=33293
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDaT-00063Y-1V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:39:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso6456071pjc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QimTf5LwIADT09QuguY3qOwFrUS7Di3hf0JMWoqGwBE=;
 b=hJ2lP16dwAMBz69a6CFn8KATg3ig/1B3Z6TKmaqXn/v1JjbaP9UqGxeOoSKl2HgZgw
 /SjrMlNpU6uwqdm3lZcoj7mVo+o+m9oVNyStlWxwDQtsCxNteWe2K1ESZ3Sg0cmM3qqo
 +Lx2/Bp1Hxj7G9CngXqosSDcmVo3aZdwUhsZjVdAJqcv08TSpli2bywihL/MBGWjREwC
 GWVj/4n7UBkF8ihpePOSpGyTi3jVCOONeHITlDHhLIVMmhCJ24+cXUE4jjaSDe7YfqIT
 pyJZRz1GoolOVbmc8LF74IcBu/ONAVTwjb5qpcJFc6fCQV7JvZ76iSXFH+V8zo2BruWw
 nKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QimTf5LwIADT09QuguY3qOwFrUS7Di3hf0JMWoqGwBE=;
 b=d70+qjp4lk5TBaoq65ZPqsXHTDazZ2RZg2JnJoU1S2/RVkaPsRi5D3hEinNC8hBibz
 bxSsMzrvR8kuAqYMhArd3otgstDFZoj5d9e/absLAjFhgOUfd1wCw9kLFafQ2znByxqM
 S0SYXT8XHIk3Gt7Gb0y9Onwt6lrb46Bfw1tQ0qwzKvMyBkw1MBvFbbbT99CiQRei4iPG
 HphKYozqJpmwWjmWx9eu3TCxLW82Vl8tP4SSD4manumt52SeB+sUQ6gzYYXJzRzkP814
 5v0gBU4a6LfnVq8ZdxclETD3MsXPzCiCwwTf+PcYHR4VRw/s65GR1PnwZTxlAPwyCIYk
 DDhw==
X-Gm-Message-State: AOAM532s37lYK3wyYe03IvjnCF43lCKr9ayir2NlsnAoqgf3mUe6rPTn
 2mRQk8eL3RIkuzjxz09yGMc=
X-Google-Smtp-Source: ABdhPJwWVpHJtYC3yimJc9nixezEYY1NXmNqGbsm+ML5a3YQv7FgfRTkOXdJRFzS9pMdplDGwRUsbg==
X-Received: by 2002:a17:902:e889:b0:14f:c4bc:677b with SMTP id
 w9-20020a170902e88900b0014fc4bc677bmr12099227plg.68.1646660383539; 
 Mon, 07 Mar 2022 05:39:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090a178c00b001bd036e11fdsm18901691pja.42.2022.03.07.05.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 05:39:42 -0800 (PST)
Message-ID: <434ff9b4-8385-473b-3410-06cb75281dae@gmail.com>
Date: Mon, 7 Mar 2022 14:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 15/16] isa: Inline and remove one-line isa_init_irq()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
 <20220307101207.90369-16-philippe.mathieu.daude@gmail.com>
 <E2DDF5EB-984C-42B9-9BA4-EA4C577EFA5B@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <E2DDF5EB-984C-42B9-9BA4-EA4C577EFA5B@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 12:29, Bernhard Beschow wrote:
> Am 7. März 2022 10:12:06 UTC schrieb "Philippe Mathieu-Daudé" <philippe.mathieu.daude@gmail.com>:
>> From: Bernhard Beschow <shentey@gmail.com>
>>
>> isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
>> It can therefore be removed.
>>
>> isa_ipmi_kcs)
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com> (tpm_tis_isa)
>> Acked-by: Corey Minyard <cminyard@mvista.com> (isa_ipmi_bt,
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> Message-Id: <20220301220037.76555-8-shentey@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/isa/piix4.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index fc3c8b3fd1..8607e0ac36 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>>      if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>          return;
>>      }
>> -    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
>> +    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
>> }
>>
>> static void piix4_init(Object *obj)
> 
> Hey Phil,
> 
> it looks like the majority of the patch is missing (only the resolved merge conflict is there). I can send this patch series rebased onto my Malta one which I could do later this day.

Thanks for being careful and catching this. Not sure what I screwed.
Since I have this done locally I'll repost so you can verify.

Regards,

Phil.

