Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DC63D2C9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jzv-0002aM-31; Wed, 30 Nov 2022 05:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Jzt-0002Xj-Io
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:07:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Jzp-0006mV-U7
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:07:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id o5so17244480wrm.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p9/6qQXNfMWMjtjvU3+F6G6cIepQnXNAxIsphAk3ga8=;
 b=leb6ZstsW/Kcs2sHRApiB/JEDfViW6VKM62FH9kgesTzx56d+/qjboH8h75rx3Jm4k
 EOs7xQTVJ2rru8C7QJG6lRF9ELNF8jcd+KNM8YysiR1DzAaOUAzqnJMwz2O+452n4log
 DmUsD7b3kDfoXCvqmIGxUPsTg0gkvPse0HoW7wlc2Ouc2PXWb4nTbuJyMNwtsFBoDqM0
 SyVbGNZTvoGs89OcOnAT/wJQEa8MoOtBVTC5sLOMXWeUYwUdDAWqcOgdzFYfdXSae3wi
 HxdAxd7dRSzOX9MuJ8rL3jsNesxo4uFETeU+YOiWqmpvsQUIaSHV5dTB7g7baT7yTd+b
 Lgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p9/6qQXNfMWMjtjvU3+F6G6cIepQnXNAxIsphAk3ga8=;
 b=Tds9TjyCP7NCJCaqeGRzMj2MwydWxBETmIrMkgsbSGcox/hFPNHWcgNonKTJiI6Quu
 LFJXO7wze37UA1zzsbz0npC78bF/0k9+oRlelx0LWtXOIS9QKL7MxWKbUTiHUcdnVMSa
 lgoZPnX9MYai3QODUYoimC68mQh6bWoyDke72AL2v3yEqpKqEC2oCnGgBktqulZzjCXk
 sxXSUbzGtZyhZlaBjoto5ECsUoKeUaDFdSU6/Emu0ItKC4u3O4IzH3VTRmTuD/bqYZmV
 UdtuRMWjyYqVPdTLIPj4exYANZj3hmws2n94yYCx4xl/vi9bvrt/arlfyaaigD/bEHjZ
 mdNA==
X-Gm-Message-State: ANoB5pkAdegrSRHIEbWckA+OJEFbFWAS1flze7gFmq6if3mNDrsEsila
 DteaT2Z/zipTRf10UvIEDcsgmA==
X-Google-Smtp-Source: AA0mqf6a89LsD9P8eZd+2wMWE+ls54/MvdWGmTEJHi/mOSGnql8u5dePNQL8CM7v7ZmD1cMTFHj70w==
X-Received: by 2002:a05:6000:1e12:b0:242:1522:249b with SMTP id
 bj18-20020a0560001e1200b002421522249bmr9773163wrb.326.1669802835251; 
 Wed, 30 Nov 2022 02:07:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b00236488f62d6sm1088966wrp.79.2022.11.30.02.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:07:14 -0800 (PST)
Message-ID: <6481c37f-6ed2-eedb-e8b9-9d36681bcab2@linaro.org>
Date: Wed, 30 Nov 2022 11:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 1/9] hw/s390x/s390-pci-inst.c: Use
 device_cold_reset() to reset PCI devices
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
 <20221104161513.2455862-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
> The semantic difference between the deprecated device_legacy_reset()
> function and the newer device_cold_reset() function is that the new
> function resets both the device itself and any qbuses it owns,
> whereas the legacy function resets just the device itself and nothing
> else.
> 
> In s390-pci-inst.c we use device_legacy_reset() to reset an
> S390PCIBusDevice.  This device doesn't have any child qbuses, so the
> functions do the same thing and we can stop using the deprecated one.
> 
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/s390x/s390-pci-inst.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



