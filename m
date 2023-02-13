Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFD694C15
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbPz-00063V-IP; Mon, 13 Feb 2023 11:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRbPk-0005qX-1g
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:10:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRbPi-00051F-2z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:10:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id by3so11478695wrb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XWFHVGNvD7f/S2ljkWD97ZOoAvtCN1MhEKpPbAsyCNY=;
 b=Y6nV1WRPf19yYJ9FfqI8SXaMchyGeG+c0OUjtYUbJvpl8qgdFtYELiQ1N4YE6S4vf1
 n2UJRR0fz65gETUjwu6T0VwLgkfSwy+tdaPuESY+bMitdlsiGo2ACnfwFlVqkPuuAoGX
 tJxTWWLFkAGfunwqE5eueJ/20hwqLfRl42RMfkl8XoECLLJloJVSYMM8C6jtRdrqENet
 IVWzv7KkiPmvMHpaS2VV9OGAVyUnMBHpVMXvGov4Z4aej0vYmQM5yJ+sZmR6iSDJ6U3q
 djzUHD1QV97hmn8itprxLAkC1YnG1AfhVJYflOdLlFhooUQVUnWh45uhIVLevmniiqWy
 YMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWFHVGNvD7f/S2ljkWD97ZOoAvtCN1MhEKpPbAsyCNY=;
 b=P0BaUAnUwdNLerijI8EPZYxkmYluFVge4QVPcuBQ0320L1NP97v8hrgRw8rvX/boN1
 QSzwVoiQa1OoBBnxDv4wFyuiqyK4ZLJ8lnWtA5zKjEJyepbTw2OyuUqI5sqQ/J+kEUHV
 LH1kzCikiIzjdEoCwwmMcY0iKuxHIWuMlCkUBth8eCRiI1vSTZROjZYY2YdO5yiYo7PK
 VExMAOYfemYJ2P5/HL9g49Us6LX1VCbhKWUrzi2b28q+dr/RyCx98/Oyk3Bee1kOt0T1
 2mRtsq5YEKwkD+kPs4QWvgxIHrQICZfZ1u0bznbo7PdRz1AeeX5iDwT7PWu4LmucUl02
 djKg==
X-Gm-Message-State: AO0yUKXVbbdWVM56wbcMWDNFfUBNEGZrndAiQgQ6tH01O+RM7tZGHISQ
 CraWOiy77g0cRsgX+Oq+BbGnDA==
X-Google-Smtp-Source: AK7set9h4kWGcbIUn8VdTDB5AfVyoHbqhLPD9yxylkQDRrQbGGcMJAChEFVtgqKNYzIMHZTMKBM76g==
X-Received: by 2002:a05:6000:49:b0:2c5:4c8e:ac5b with SMTP id
 k9-20020a056000004900b002c54c8eac5bmr8824138wrx.21.1676304643784; 
 Mon, 13 Feb 2023 08:10:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d7-20020adfe887000000b002c551f7d452sm5580766wrm.98.2023.02.13.08.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:10:43 -0800 (PST)
Message-ID: <b95e2be0-cf08-a04a-5667-063f7a9fc039@linaro.org>
Date: Mon, 13 Feb 2023 17:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 16/19] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by
 VFIO_CCW()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 <499a75a2-5a43-6ec6-bedb-f6bc46aa60fe@linaro.org>
In-Reply-To: <499a75a2-5a43-6ec6-bedb-f6bc46aa60fe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 13/2/23 16:51, Philippe Mathieu-Daudé wrote:
> On 13/2/23 16:29, Eric Farman wrote:
>> On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daudé wrote:
>>> Use the VFIO_CCW() QOM type-checking macro to avoid DO_UPCAST().
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
>>>   1 file changed, 16 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>>> index 0354737666..a8aa5b48c4 100644
>>> --- a/hw/vfio/ccw.c
>>> +++ b/hw/vfio/ccw.c
>>
>> ...snip...
>>
>>> @@ -252,8 +248,8 @@ again:
>>>   static void vfio_ccw_reset(DeviceState *dev)
>>>   {
>>>       CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
>>
>> If I'm not mistaken, I believe that this (and (un)realize below) could
>> be changed to:
>>
>>     CcwDevice *ccw_dev = CCW_DEVICE(dev);
> 
> Even ...
> 
>>> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj,
>>> ccw_dev);
>>> -    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>>> +    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
>>> +    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
> 
>          VFIOCCWDevice *vcdev = VFIO_CCW(dev);
> 
> But I somehow got scared to of removing too many casts...
> 
> Are these paths covered by a "make check-qtest" on a s390x host?

They are covered by the Avocado tests :)

$ avocado --show=app,console run -t arch:s390x tests/avocado


