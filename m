Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3A3BF6B0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:04:01 +0200 (CEST)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1P0q-0004i4-9T
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1Ozr-0003IL-64
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1Ozm-0003dn-RW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625731372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSL00FjXKzwH4+Uc/ej94o1617SXgtJv0TtXEtJxZj0=;
 b=OhiEwYYY1WR1HREr1YTPYKOl7zXxSlHG9MgDF9fiHvM2ePPy7ET92R3BdTnb/2PGoQBgyo
 5HCKvaxeIoR5FEdns2xESRHcE11txF3L3CSy2y3T1CDHCicVjnbXftxgtyCYUavnpP1CGM
 9ho8louJD+q82ICrL2LDq+97OWjBY6Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-1MuXJ3JRN8C2eJVfK16uhQ-1; Thu, 08 Jul 2021 04:02:49 -0400
X-MC-Unique: 1MuXJ3JRN8C2eJVfK16uhQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c12b029020a5514128fso834445wms.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZSL00FjXKzwH4+Uc/ej94o1617SXgtJv0TtXEtJxZj0=;
 b=YvgJs/2zEYnwfWfaeRmIH+dE2nZlSNUZ7ROowJXByNjNRYL2/LUtBo3hsc7A4ZvGh5
 g6ST5zIQSQrZTLbHGUGck3U6F+DjmJ2UTWYrzHoQuORw9lFvT6qukRxrwgtZ45J7p2pG
 Ar3oUQkMAYIX+bEy2nlPqQV4ohJkZIJ21sxpLfg6YNibyFfit4qFzQ14Vqe4PCKQ/byb
 NJxe2WB65UdbABx4w1WsOdwDnLgKK80I7gtYNvh5daGoe0QfT8D5o+l+Bg/wtvmBg2yE
 CLXaroh1ryrmoR6qB/cv4iUtK6fdnpx2z9Kz7NHq8ZPuYfN3ojAz5IQ5/yi62IMNLpWf
 xm8A==
X-Gm-Message-State: AOAM533zmpmb1GQa0M+yUPo+P9E5hE0qgM/ghW/MUnbGm53ZwhxxL9gy
 FVx9lSD9vOm8iontHviF0jZbGs6Djs5cpfBXhSIKicNKTNr3sDjlUpYIwVvmVMO7ikrI1MIoCFK
 crLxlRlUbVp7mYJM=
X-Received: by 2002:a5d:64c5:: with SMTP id f5mr21312430wri.277.1625731368438; 
 Thu, 08 Jul 2021 01:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0ZOcyERI4bxpcYLQiEe5II2NayfQEwtxveqX2T/LdKtAMzwuX9LuSMbUCLHQAwbw436qsYg==
X-Received: by 2002:a5d:64c5:: with SMTP id f5mr21312417wri.277.1625731368255; 
 Thu, 08 Jul 2021 01:02:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b7sm1332074wri.96.2021.07.08.01.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 01:02:47 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: remove Laszlo Ersek's entries
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20210708071409.9671-1-lersek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9549ac78-44e7-e203-600f-14649c80343e@redhat.com>
Date: Thu, 8 Jul 2021 10:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708071409.9671-1-lersek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 9:14 AM, Laszlo Ersek wrote:
> I've relinquished my edk2 roles with the following commit message [1] [2]
> [3]:
> 
>> Maintainers.txt: remove Laszlo Ersek's entries
>>
>> I'm relinquishing all my roles listed in "Maintainers.txt", for personal
>> reasons.

Thank you Laszlo for your contributions and maintenance duties
fulfilled.

I learned a lot from your clean workflow and very detailed commit
messages. I'll certainly miss you, and wish you the best.

Kind regards,

Phil.

>>
>> My email address <lersek@redhat.com> remains functional.
>>
>> To my understanding, my employer is working to assign others engineers
>> to the edk2 project (at their discretion).
> 
> [1] https://edk2.groups.io/g/devel/message/77585
> [2] https://listman.redhat.com/archives/edk2-devel-archive/2021-July/msg00202.html
> [3] http://mid.mail-archive.com/20210708070916.8937-1-lersek@redhat.com
> 
> Accordingly, remove my entries from QEMU's MAINTAINERS file as well, which
> all relate to guest firmware.
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 684142e12eaa..7839f676dc3a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2165,7 +2165,6 @@ F: include/hw/southbridge/piix.h
>  
>  Firmware configuration (fw_cfg)
>  M: Philippe Mathieu-Daudé <philmd@redhat.com>
> -R: Laszlo Ersek <lersek@redhat.com>
>  R: Gerd Hoffmann <kraxel@redhat.com>
>  S: Supported
>  F: docs/specs/fw_cfg.txt
> @@ -2897,7 +2896,6 @@ F: include/hw/i2c/smbus_slave.h
>  F: include/hw/i2c/smbus_eeprom.h
>  
>  Firmware schema specifications
> -M: Laszlo Ersek <lersek@redhat.com>
>  M: Philippe Mathieu-Daudé <philmd@redhat.com>
>  R: Daniel P. Berrange <berrange@redhat.com>
>  R: Kashyap Chamarthy <kchamart@redhat.com>
> @@ -2905,7 +2903,6 @@ S: Maintained
>  F: docs/interop/firmware.json
>  
>  EDK2 Firmware
> -M: Laszlo Ersek <lersek@redhat.com>
>  M: Philippe Mathieu-Daudé <philmd@redhat.com>
>  S: Supported
>  F: pc-bios/descriptors/??-edk2-*.json
> 


