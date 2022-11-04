Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B0619EF8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0ff-0004TK-P6; Fri, 04 Nov 2022 13:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1or0fS-0004O8-6R; Fri, 04 Nov 2022 13:39:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1or0fP-0004B0-Uy; Fri, 04 Nov 2022 13:39:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id 5so3446247wmo.1;
 Fri, 04 Nov 2022 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GGAy0XD3vbssCqV5TwNlbCkGmIFU3U2rNVQ+buwSZ78=;
 b=SxNXov2SOg+q3iFbPIBNMAHzuzGi9IkzWg32B39Wi2wWqWHN2mi0UMihny7z4gDUlZ
 vZlVimDyeH6ZR3b3NZLc/BFLQxHYROup+TtHO6RcI9ZmgiJW/iuzYpfb6a/YajqLcm0/
 cFR+4rn7e4+850kcq059EVq5PxA1g4sA5+FBzlhVOtddEbb3hVl1RhZ7Hf0xilFvlRI6
 h3acR94dNryGE9VS+QRzRJVgXcJq+B7wOFZWto6LRCRBeb+5QNag5JX+jKjLlHwQ/ESA
 y9Y0jIWg4B4kxtDEc62ivN2t6CZy90ulNG3DurKRqk+tq6mk4E9ifD28ecDU8I6Fg8zX
 PFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GGAy0XD3vbssCqV5TwNlbCkGmIFU3U2rNVQ+buwSZ78=;
 b=rEfKjqm0m2SLUL3zDsNWEyTDMS+WRyqMhTZBz3nXKB0MTExTffpSe65cMFXMMLQIj1
 XVEmg5BDHydh3pPoqTMRI4T11pSjp7KU6r9rOPJhsaNgvQUWti7t9X6HIzim7meIsypG
 GuxR435D9Y0lA0B+fmRN6jvpFUnFR3sIfbm0Ed3j5LBpC0ig7tCI6qXvg82LeQJ0H1bE
 jy8cg4jVWyE4KqLmNewJOImjmi+oO1FOD3vvSIdrR/auTLzTwsd73C0lBdUzsT48O1U9
 RWwNUJjZ+wjv4Bom1N6kyue8/ghGx41b6HAZGfpIBkXrWFhhs6J4wTTcJOeZK7XBCiqu
 KeEA==
X-Gm-Message-State: ACrzQf05A22L5MvTx3c0iEE3tamJQ55tMrWuCsQPXAeK59ekxWPHXbtJ
 aw/xzB8jZCQfWG61L3B8s7w=
X-Google-Smtp-Source: AMsMyM6PvbxWicc8ltrhqdQFxHPiG+NugmKaDARL1v3c9OwvEY1xNHaMAAWKXI649Cwx4fQIcjqRGg==
X-Received: by 2002:a05:600c:15d6:b0:3cf:8e4b:957e with SMTP id
 v22-20020a05600c15d600b003cf8e4b957emr6939590wmf.118.1667583578898; 
 Fri, 04 Nov 2022 10:39:38 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a8434530bbsm3892232wms.13.2022.11.04.10.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:39:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <85709ff1-2f0c-11af-fbc8-caf3c2bf96e1@xen.org>
Date: Fri, 4 Nov 2022 17:39:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 7/9] Replace use of qdev_reset_all() with
 device_cold_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-8-peter.maydell@linaro.org>
Organization: Xen Project
In-Reply-To: <20221104161513.2455862-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/11/2022 16:15, Peter Maydell wrote:
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

Reviewed-by: Paul Durrant <paul@xen.org>

>   hw/input/adb.c             | 2 +-
>   hw/remote/vfio-user-obj.c  | 2 +-
>   hw/s390x/s390-virtio-ccw.c | 2 +-
>   hw/usb/dev-uas.c           | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)


