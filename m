Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A592666C21D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQNg-0008O0-Ig; Mon, 16 Jan 2023 09:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHQNM-0008NQ-S3
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:22:16 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHQNL-0004JX-65
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:22:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id z5so26574405wrt.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W9LvbnLfICzdXVIgtxiUsRt6gyN0IbIo+3AsRPMW1xM=;
 b=oJKzeEFiMar2MPbDy0Kad/Lh/bon4vea5n9P38ybGE83pnh810/ukBeYiYpAx3Y64j
 C1aKWR/jsc9W9DENc6oXcrAwS9XYIGhJDTy7fQzgGll8bMZkAL2AGImhuYEJfEUrA14c
 xDZg3Y4fs0h9hMZTmBAtbKeDgnvTlrLB3Pq4nmt+mbg+PUbKg31p39e1SzRnmDPwKguU
 JWZu3U5vsp/c0Ad0oBRFrRvuzIrz52jYYSWALvWZSZxM2O4KzK1Wzxyc03hH8ACNdnvI
 kkzpS+W68DIwzkf8449eoYyO1IYgSDY/6Vr0MZCjnckasIjrF+8eIPr4raYTB6T7yX2d
 krJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W9LvbnLfICzdXVIgtxiUsRt6gyN0IbIo+3AsRPMW1xM=;
 b=X32P+g9FWD/iDV3XkrxdysBUUrrtyCk3vTOMY6OaEwoRt94OHqdM/AjNuL3cW1BxU0
 amo4Qu0dhMjpxQNLkMX4S03Yi1qdnf3p+yy6+KK1sTh0wpFO09n0kzTJ90vJ0W/l01vz
 oxhbSAbnREGfpLUfqcrcnnE3Zu7L+th+gYoHtzF5e1gSbH7jggX+Y6FEUM0O2cqJqQGa
 aKUkEHZmbbgYY0VOWUDOLl12XTAl/5vdBrmF08yuKOuYdh5qx11v2sKycM1lvvUcQVMD
 Kqu+mMgqCu2AaRZRn1imKuc9Qy8GAcfegDP6NLjksVE8QdMA/sa/vzqRR2K/SJgWN6CY
 reuQ==
X-Gm-Message-State: AFqh2kpJhcSRdXLUy8HYS6Ggs1zfXjQkE56vF+9IGtBQLb+8W0/g5hvl
 c65N586w8F3RVDs6eiAnPwMP0Q==
X-Google-Smtp-Source: AMrXdXuXR4uKPmPWgIZ3CY1dxgVOnrxftI7n8qinxtaqptq6RV5BbcXSkBhF6nG0uUVJOUbde2LleQ==
X-Received: by 2002:a05:6000:812:b0:2be:1535:e5b3 with SMTP id
 bt18-20020a056000081200b002be1535e5b3mr1108820wrb.41.1673878933694; 
 Mon, 16 Jan 2023 06:22:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b002a01e64f7a1sm3018454wrb.88.2023.01.16.06.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:22:13 -0800 (PST)
Message-ID: <b2ad8a0d-0860-77c6-7b91-912d17e7e2b9@linaro.org>
Date: Mon, 16 Jan 2023 15:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] hw/i386/acpi-microvm: Reuse qbus_build_aml()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-7-shentey@gmail.com>
 <7ba3aa3e-9cb4-e092-9768-7b14da49f2b1@linaro.org>
 <1136C54B-D813-48C0-A19B-5366D18454C2@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1136C54B-D813-48C0-A19B-5366D18454C2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 16/1/23 15:02, Bernhard Beschow wrote:
> Am 16. Januar 2023 09:14:28 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 14/1/23 23:27, Bernhard Beschow wrote:
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/i386/acpi-microvm.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Possibly squash with next patch, regardless:
> 
> Not sure how to name the patches then. Hm...

"hw/isa: Reuse generic qbus_build_aml()" ?

