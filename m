Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072B63D2E2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K4A-0004IM-Ck; Wed, 30 Nov 2022 05:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K47-0004GH-W6
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:11:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K3x-0007Vd-72
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:11:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1003701wmo.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iB2nn7/7H8+gOoddWz8/lzwtIzG1SqWSTqPlwFyF9w=;
 b=rI32kl9tA5d9L/RU+Y45jMo38yr3dm2/77SIKm2Rrv3sNu0R8Vj1sAmGtriqR6TFjE
 f1DFkvY7EbcOUQTQ/TftaLcUWx0j6tlBZ+ljAggFWv2zAajHKuG4bq4o4ovmZILSGbiG
 /OOaJF66J8By1MtBmp5R9k+tP59DSkSbgbs4sRfpdyuD949t4fbDdT0jRpkfOU8Q+6F/
 XTsYdk/JQ2iOiFiXyAP8K9xnxxToit0bQgDw/FzVRFvBGioCllYa1zohNtzyZUi+qsL2
 KlTvvE4CrlHamZoWVhYu+0ddda7f26oUYo2vm0Rnf8U3wf5PXrxiDirmCifbmKSNgdhl
 JNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iB2nn7/7H8+gOoddWz8/lzwtIzG1SqWSTqPlwFyF9w=;
 b=DHx2qcIb8KhrNwvBBXUG9o7R02yS61VH8hqTsSDfeJKz+lZ65myyPPBuzpXzbMM70J
 k3okH26loze7MAdc0BaIuXQ/3X0Qd5tF0QYWLleKQf/mrQNPZMSJMSmMV+z1GEWMzO8u
 VAvBMIl8U1T8uyeiXdU0/5U5QqY1iGUSPW9evmE5c/DJlnHJV1nZmJBrc5R2YJ+9p0kv
 c62IkzsALOwzOa/ohYYb5xEVCXztfjMD3T0ZapcXdwcTmnsUTW1oaTA8n53hfDcvkwoc
 ASHm/fxLqA6jyU6x/iE7CALU+SLhRszvKQa0yIn/afnrWxW/0EGKEtdu4xJPUiC4uzRg
 9lZw==
X-Gm-Message-State: ANoB5pnYDDmu5uo4jdgGkPDIS5zPhnfiphDLq8GTCHducqXghBipy2Py
 vX/l60E2PXqrML2X4A1bz29pBA==
X-Google-Smtp-Source: AA0mqf6dcWdLbiugiPJmpt3/a/IvxGXSRCCBbx39Wcmnc71rZoQ2yb579SbHAQr7dyhiwjT8eWY5JQ==
X-Received: by 2002:a7b:ca43:0:b0:3cf:ade4:d529 with SMTP id
 m3-20020a7bca43000000b003cfade4d529mr31166786wml.193.1669803091398; 
 Wed, 30 Nov 2022 02:11:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003cf4eac8e80sm1719352wmq.23.2022.11.30.02.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:11:30 -0800 (PST)
Message-ID: <d9e5ad2a-dd09-3134-3326-0085c65c6cfd@linaro.org>
Date: Wed, 30 Nov 2022 11:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 4/9] hw/usb/hcd-xhci: Reset the XHCIState with
 device_cold_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 4/11/22 17:15, Peter Maydell wrote:
> Currently the hcd-xhci-pci and hcd-xhci-sysbus devices, which are

s/which// ?

> mostly wrappers around the TYPE_XHCI device, which is a direct
> subclass of TYPE_DEVICE.  Since TYPE_DEVICE devices are not on any
> qbus and do not get automatically reset, the wrapper devices both
> reset the TYPE_XHCI device in their own reset functions.  However,
> they do this using device_legacy_reset(), which will reset the device
> itself but not any bus it has.
> 
> Switch to device_cold_reset(), which avoids using a deprecated
> function and also propagates reset along any child buses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> It's possible this might result in USB devices on the bus getting
> reset more than once (once via the descent-along-qbus and once when
> xhci_reset() etc manually reset each port), but in my testing with
> gdb I couldn't get that to happen.  It should be harmless anyway.
> ---
>   hw/usb/hcd-xhci-pci.c    | 2 +-
>   hw/usb/hcd-xhci-sysbus.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



