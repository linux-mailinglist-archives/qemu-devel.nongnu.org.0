Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A154A65F143
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTC9-0002qC-SA; Thu, 05 Jan 2023 11:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTC8-0002ph-0L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:34:20 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTC5-0008KZ-Gg
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:34:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ay40so28466008wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Ff/yrvx/MYEzojsSUOOSS4B62Zsgu3gBqlzUfbFepg=;
 b=fbtHcLAgfCcm0kzVmEP2+9e1gGqqTdcxdUmZ79uvPXHUaJshsmvIuitBrtc7rVgVbx
 a02gOmU+hoj3c9krVACCQmge+22nXaIZ1gbnB+M/+XHiZMAqS6MXt9NoDWcgfxOxSKQS
 IGekCmiYSdKw/+kuAs3Sj0FOHsO9TUdwP72wLb/HGMWo8qkNp/iP7QeFMcsAvSOnwRlU
 QDzuiJCjJKNaY/W0stNj2xgcE+uFhsMFO+CsZh5b5cBGipiUMCT7JxBRwGZ2w6ShB+Av
 6I92LQFhrMlqVpcihvz6mo7jVWk9cZ5LKqY1LQEaCuZgPkRqoALWkDcGu6EOHC94Lrnd
 3HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ff/yrvx/MYEzojsSUOOSS4B62Zsgu3gBqlzUfbFepg=;
 b=5xavi6hvJj/MzunjRc4DEsE6wgi55Y9WFdtc+/fXJP0Tm8O+25oKAbox5Hsy8+x7+D
 obPk3R37x81PO6wBfiDlDx7PrxQmUVpbgHboDEAnw3WvarOmghMF5im57ijkXPSspZ9T
 9zjavOqd+u+OjGUV3AVRlZwQfA3zPKWdFtCo72ajrtnprMECbLYzs2rUJSRUKErFJNAW
 DcspMiYU0PkUZHtkxQ9caQ5Vl4X2cytye3+M6LoQZUbzDVTs8qvKUvI2zKDjCdnn6FyY
 mI9XLlUjqGSyID/xLJbj4xU9CvObiWv/n2STfa+x9wHsiXHmlIPEM4QNef/X5vC9qH3X
 3/Ow==
X-Gm-Message-State: AFqh2krgseI/UI4O/W3uJBPE/Lgt/Cg+DTX0ULavy40AgncBv5Szoin2
 KaU94J4NsZt8yRI8+THJTYws9Svy7Yggt9DC
X-Google-Smtp-Source: AMrXdXtIt0QEhow8U3uDZBxE1CaSjjW0qy9qB2/0OVMOoNDPB9B+kY/opIL5INCNdUALJRg6+2LE8g==
X-Received: by 2002:a05:600c:2142:b0:3d5:365b:773e with SMTP id
 v2-20020a05600c214200b003d5365b773emr44918879wml.39.1672936455784; 
 Thu, 05 Jan 2023 08:34:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm3461502wmb.29.2023.01.05.08.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 08:34:15 -0800 (PST)
Message-ID: <741765df-a46a-6020-35b7-239117534e69@linaro.org>
Date: Thu, 5 Jan 2023 17:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/pci-host: Use register definitions from PCI standard
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230105144142.51990-1-philmd@linaro.org>
 <2489f6ef-997a-0cf5-fbdc-c05e4fb7c7fd@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2489f6ef-997a-0cf5-fbdc-c05e4fb7c7fd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/1/23 17:02, BALATON Zoltan wrote:
> On Thu, 5 Jan 2023, Philippe Mathieu-Daudé wrote:
>> No need to document magic values when the definition names
>> from "standard-headers/linux/pci_regs.h" are self-explicit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/pci-host/grackle.c  |  2 +-
>> hw/pci-host/raven.c    |  6 +++---
>> hw/pci-host/uninorth.c | 30 +++++++++++-------------------
>> 3 files changed, 15 insertions(+), 23 deletions(-)


>> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
>> index 8396c91d59..342baff12a 100644
>> --- a/hw/pci-host/uninorth.c
>> +++ b/hw/pci-host/uninorth.c
>> @@ -277,11 +277,11 @@ static void pci_unin_internal_init(Object *obj)
>> static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
>> {
>>     /* cache_line_size */
>> -    d->config[0x0C] = 0x08;
>> +    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
>>     /* latency_timer */
>> -    d->config[0x0D] = 0x10;
>> +    d->config[PCI_LATENCY_TIMER] = 0x10;
>>     /* capabilities_pointer */
>> -    d->config[0x34] = 0x00;
>> +    d->config[PCI_CAPABILITY_LIST] = 0x00;
> 
> Did you mean to remove the comments here as well?

Good point, thanks!

