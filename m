Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC863D2F6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K7F-0007PS-Ch; Wed, 30 Nov 2022 05:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K7D-0007PC-U4
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:14:55 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0K7C-0008CD-6v
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:14:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 5so12825470wmo.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ONs8zKFhD7zdhrL8x11ZNusE9Q3mVzImqZ2ouVxp5/g=;
 b=sBbDKFv6D/162rXbOeWmUTJqQJdOsXsOt3HeVLuszmIJ2KRnQ1rbn3WGkitkLF8D4Q
 15E+eaaxnN/VT7zkKg/o4ctPIstQJx1ZmB2fZM6Z6wmKhXR4Ngur1OpM+PeEmY69OVRg
 6Dy2um1f6oyXxGlnJV/03uh6+We8+hqjw49SvIQwsgCgbDyd2Hhj4bb6gZFKgZ8meGkb
 4gX3dYAsea6Xq3SBZb5ET2e1w4kfp1Q/+n7fpALrAiXB1sEr1SB+6x1RQrMYhorGKBFe
 pDzzT6CrLigtX5Omg+3sOtFMBgOqMHLbRIVN7EzurSF8jxD5snlSD5megu32d05j06AK
 wUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONs8zKFhD7zdhrL8x11ZNusE9Q3mVzImqZ2ouVxp5/g=;
 b=Nw9pAvEktfb6Jmo37hRI0BKjiEQRmMqcVEYVJA6a1ZLbf8RM0GU2kE/S9nLl3Dt8VF
 hfTi1JtuVAXqufC7uHzg8YiTUUghRq8yRgY/JR9wSg5sNijol1M5ScwC7gbNaY4iItwB
 M0UIcDX2/mxnrsR6ZCifRL1HKP5Akms2/eGt0lnTPHk4HzOXN0j5tgXSjRmwV8Xljtob
 wghSGeWH6o6GbsGou7eWOi+lQxRHnUrBXI1RLhR7kb+Dwtl9GHjrFOnUSGdY9AFYIbgD
 o0pkoR9fCTbDMiVoGx4xLSmHsxAAqkgkxAiV1UEzrv+Qk2dqilG43yb7FEa2l9ALEago
 nCsA==
X-Gm-Message-State: ANoB5pkbzOO86idbLhTO/5p+xs2agPWp4+1LabIvHinSwAFZ6TiHjHkO
 lh/eud0rzYZYoW5qzBhw+bNjzw==
X-Google-Smtp-Source: AA0mqf6go20mIJA94yob+d7ckdxGhxBuiNq7d+QwXm52nF5mJ1sXoVrzTA6aAsO+NYJuJ58WUTcbfw==
X-Received: by 2002:a05:600c:524c:b0:3d0:1a32:e2a6 with SMTP id
 fc12-20020a05600c524c00b003d01a32e2a6mr30541094wmb.132.1669803292613; 
 Wed, 30 Nov 2022 02:14:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fn9-20020a05600c688900b003cf75213bb9sm4960191wmb.8.2022.11.30.02.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:14:52 -0800 (PST)
Message-ID: <c3ae5f86-8be6-b25a-d0d9-188d3d2c1687@linaro.org>
Date: Wed, 30 Nov 2022 11:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 7/9] Replace use of qdev_reset_all() with
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
 <20221104161513.2455862-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
> The legacy function qdev_reset_all() performs a recursive reset,
> starting from a qdev.  However, it does not permit any of the devices
> in the tree to use three-phase reset, because device reset goes
> through the device_legacy_reset() function that only calls the single
> DeviceClass::reset method.
> 
> Switch to using the device_cold_reset() function instead.  This also
> performs a recursive reset, where first the children are reset and
> then finally the parent, but it uses the new (...in 2020...)
> Resettable mechanism, which supports both the old style single-reset
> method and also the new 3-phase reset handling.
> 
> This commit changes the five remaining uses of this function.
> 
> Commit created with:
>   sed -i -e 's/qdev_reset_all/device_cold_reset/g' hw/i386/xen/xen_platform.c hw/input/adb.c hw/remote/vfio-user-obj.c hw/s390x/s390-virtio-ccw.c hw/usb/dev-uas.c
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/i386/xen/xen_platform.c | 2 +-
>   hw/input/adb.c             | 2 +-
>   hw/remote/vfio-user-obj.c  | 2 +-
>   hw/s390x/s390-virtio-ccw.c | 2 +-
>   hw/usb/dev-uas.c           | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


