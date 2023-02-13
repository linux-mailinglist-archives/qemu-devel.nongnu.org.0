Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA65694BC0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRb7V-0005EN-Oz; Mon, 13 Feb 2023 10:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRb7T-0005DH-EA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:51:55 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRb7Q-0001Vd-7e
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:51:55 -0500
Received: by mail-wm1-x333.google.com with SMTP id r18so9010991wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7wjxKVS34nYhT2lmahABSvDzCKdjlNLAXKs9/HkJKBY=;
 b=u1G1sSZq2y7ZaEORiNLlX+eMCKLEnBMVeY5zPVf3AJU0rzxWaYS5N97ySgXWyT1pHx
 duiMx2yAJs2IZ/iRNK1Iw0koSNLv26GR6bVqVtpF2fr2PuRuW3ZkApWq7rX4I1KTm5jb
 /xQ5AX8HFfbjy17+mCKXkfPl4OUoEPI0DSbVx2foYtXzd4G8PyocbgGgmBrl7QfBuv70
 PdHYldXOQScMdNhMzJNd0EZrjtrbvGID7JbzWRjziPMDcZNWm9jjiHrZWwSEu/sLmX2k
 ht6MKlDIT/0BOhD2bLgrmyN7k9efNY7JowUiZ1/RCrQwANZ0lAMZ/DeY3y/i4nyrAwfx
 os/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7wjxKVS34nYhT2lmahABSvDzCKdjlNLAXKs9/HkJKBY=;
 b=AJ/ecXjlODuhlA81nBpUzd9+ajEBPrDJZ4KXblQhlwsjH6d9SL1CK+YMe8BCoWTF7J
 4IpvQw8kGBnraMT+0BAZdaWQGY35y/uMTxCYtCKL2+T99qWbeSOsBljzgYYPL3X6oa7K
 xEt5+XFWYinAiBZdc7vx+9gfb4gepSvBOacGno9G3dJ7t+/N2G5LL7SLHugrnd+P2iVv
 S3lMKZXwCNZ+djzqqgnrBIMhapsvqMf9AGImllgYqDmhMkPXg4qBrnYG56iBN+xRXi3h
 V+1posS6qkfGZpzu3l5moxOLfRLM/ojvSZ4JJKahTfQbRvEwECZdMu3uPKmIaPhx1+Yu
 /hxQ==
X-Gm-Message-State: AO0yUKX16pz2i2/tFBObhKxoX/V3mVpOg5ZpWa4CwhuuMJg8xMMP2OK+
 I/Mn8QLCNs/YebL3y7XhzB0DCw==
X-Google-Smtp-Source: AK7set896o468mdNEEP8oUEl4xoKHR2OVMAcTpZHESxyJHVA23DUSdX3ARRacZ2qd9cNCvD9y9FP3Q==
X-Received: by 2002:a05:600c:4d17:b0:3df:218d:b62c with SMTP id
 u23-20020a05600c4d1700b003df218db62cmr18893535wmp.12.1676303510469; 
 Mon, 13 Feb 2023 07:51:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003e118684d56sm15393442wmb.45.2023.02.13.07.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:51:50 -0800 (PST)
Message-ID: <499a75a2-5a43-6ec6-bedb-f6bc46aa60fe@linaro.org>
Date: Mon, 13 Feb 2023 16:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 16/19] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by
 VFIO_CCW()
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-17-philmd@linaro.org>
 <e036a2ff70eebeff03fc645685227fcc65fce40e.camel@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e036a2ff70eebeff03fc645685227fcc65fce40e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 16:29, Eric Farman wrote:
> On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daudé wrote:
>> Use the VFIO_CCW() QOM type-checking macro to avoid DO_UPCAST().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
>>   1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> index 0354737666..a8aa5b48c4 100644
>> --- a/hw/vfio/ccw.c
>> +++ b/hw/vfio/ccw.c
> 
> ...snip...
> 
>> @@ -252,8 +248,8 @@ again:
>>   static void vfio_ccw_reset(DeviceState *dev)
>>   {
>>       CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
> 
> If I'm not mistaken, I believe that this (and (un)realize below) could
> be changed to:
> 
>     CcwDevice *ccw_dev = CCW_DEVICE(dev);

Even ...

>> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj,
>> ccw_dev);
>> -    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>> +    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
>> +    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);

         VFIOCCWDevice *vcdev = VFIO_CCW(dev);

But I somehow got scared to of removing too many casts...

Are these paths covered by a "make check-qtest" on a s390x host?

>>       ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
>>   }
> 
> ...snip...
> 
>> @@ -657,9 +654,9 @@ static void vfio_ccw_realize(DeviceState *dev,
>> Error **errp)
>>   {
>>       VFIOGroup *group;
>>       CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
>> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj,
>> ccw_dev);
>> -    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>> +    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
>>       S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>> +    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
>>       Error *err = NULL;
>>   
>>       /* Call the class init function for subchannel. */
>> @@ -729,9 +726,9 @@ out_err_propagate:
>>   static void vfio_ccw_unrealize(DeviceState *dev)
>>   {
>>       CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
>> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj,
>> ccw_dev);
>> -    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>> +    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
>>       S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>> +    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
>>       VFIOGroup *group = vcdev->vdev.group;
>>   
>>       vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
> 


