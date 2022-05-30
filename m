Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F8537969
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:49:09 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcxO-0000jC-69
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvct0-0007Tj-N7
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:44:34 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvcsz-0007ae-83
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:44:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so10367965pjt.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=AZMkSkBXI/ZPC6YRVQDjWgwmtIkp7wCDHdMUNv+4WtA=;
 b=pwgRoBYXwBEW6I9NsvB96RxrKILAq9yNBTK+jgyLX2Tk056aRYDR/Fec5ijd71XKx+
 ku0s7+cMSW9jVcuvjCA0ur4rnt8FO7YpM2tvCSMlaS2P6z/Fcq58AiYHIxLTI+DsoNSt
 zT34DrwHP41Ob3t49rBiCU1CxTYcnRe0LRbMVHXezyD61gMg/QMDttHgjp8mi9VoIRaf
 wulfoiB+S6GhZnO394fJyXsYAzURhZAB0ITKcWXwQDJKHCMglclkGzPv2z23Dxf+l70m
 b/F8MnDElOr2GIVYq4Hb114xQ12ou7pXswviHRoFbeSXqvyJGu9oipRoyuiq0/DpKU2r
 ME9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=AZMkSkBXI/ZPC6YRVQDjWgwmtIkp7wCDHdMUNv+4WtA=;
 b=fmCITCVHhneEQihcUmzAHObnL5dWB9mYXtgOoO3mdEFilAuIn1M75MNpl7yUUP99vT
 XOv70YSzmW/NFO+14c6O1nf81ic7e/cd97r7IYSvNsjpE5sirefScBWjuuBi1CanslTk
 gYEP4djhR6HlIJkoW83oFitb0O+MlvIKoXIlIb+IvvdM3Y6B1Azv75iCtwD33WEU4p58
 8oQMPI+zsyA2K6LFugw44+SkQy31sjaZAvOAjgrsr7s26PNj19yEeSvyVOmSOfACnCXs
 4p5Xx/GO69fTonBMdCCfm+/fQ9LYZHU9HsOy6XfwiRxJIOIKM4JX3tk2ZAWi8ENCFBVp
 LVxQ==
X-Gm-Message-State: AOAM530jqDUPUsjV0RS6g6PCdVfBxL+V4mNJOMZudcXmtom56xIroXmv
 XrN4iW21tEKse+vY17euj2A=
X-Google-Smtp-Source: ABdhPJwPvE42NWJ0j6jkA1XSNm2w6em/zk3ekc6TdxMuQsQlhdWOmFDD1r3YdaDKHmpBqQSrUt2r3A==
X-Received: by 2002:a17:90b:1d90:b0:1df:d0ae:1443 with SMTP id
 pf16-20020a17090b1d9000b001dfd0ae1443mr22437139pjb.122.1653907471796; 
 Mon, 30 May 2022 03:44:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a056a00099500b0050dc76281bcsm8616461pfg.150.2022.05.30.03.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 03:44:30 -0700 (PDT)
Message-ID: <8f06b804-5b48-d89e-742c-24f2839d8728@amsat.org>
Date: Mon, 30 May 2022 12:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 07/12] hw/acpi/piix4: introduce piix4_pm_init() instance
 init function
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-8-mark.cave-ayland@ilande.co.uk>
 <4BDCA8D0-F8C1-4C0D-8EFB-E003E1444AAA@gmail.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, aurelien@aurel32.net, imammedo@redhat.com,
 eduardo@habkost.net, hpoussin@reactos.org, richard.henderson@linaro.org,
 pbonzini@redhat.com
In-Reply-To: <4BDCA8D0-F8C1-4C0D-8EFB-E003E1444AAA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
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

On 29/5/22 21:06, Bernhard Beschow wrote:
> Am 28. Mai 2022 09:19:29 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> Use the new piix4_pm_init() instance init function to initialise 2 separate qdev
>> gpios for the SCI and SMI IRQs.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/acpi/piix4.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index d897d2dee6..454fa34df1 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -497,6 +497,14 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>>      piix4_pm_add_properties(s);
>> }
>>
>> +static void piix4_pm_init(Object *obj)
>> +{
>> +    PIIX4PMState *s = PIIX4_PM(obj);
>> +
>> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>> +    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
>> +}
> 
> The two IRQs still get connected internally. Doesn't this create the risk of double connections until patches 8 and 9 are applied?

The same field is initialized twice indeed, but we shouldn't have 
"double connections". It could be cleaner to split this patch
and squash in the following 2 patches. Can do.

