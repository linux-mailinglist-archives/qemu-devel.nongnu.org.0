Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAB694DA0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcFG-0006vd-4o; Mon, 13 Feb 2023 12:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcFD-0006iW-KS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:03:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcFB-0007sI-Iq
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:03:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id bk16so12949995wrb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mJPaw9yfd3YExA9G5jCURDLg7P+dm36lB/tyaUi3ai0=;
 b=ibRt9JnFlxP9/Kkd4fFnH8UnDsadnXcibEsFqT+vdFxlc03h0VbOVqjTP6jQvKHNAy
 5nxkvR07sw0RWL3bZhJff/w5OrLOoZ8QnczkjZ9EKH/Uht9Xu+/DRlfmtjcUDv3uv3c9
 JUUdxySegMKUQWR18KQUzXfTV+zJVQufvry1rPdtLClHaJnqH1C6wnz496WeonIWQkcG
 +fDgJ48DYc9BhKnNmiUixewoiQ4icO7i8UhSJQqTHLgiqJOCqabPlycBPXGN1GMcwxGx
 XV2imJ2gU3clkPV3upye7qCbO3PIAxwZ/4LtLT63EQnoP5rR1awg+TSlUdxXqFUEdGL7
 Wzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJPaw9yfd3YExA9G5jCURDLg7P+dm36lB/tyaUi3ai0=;
 b=GK/VzYyANMw5RnSNcx1tFjvwOrTOJyw9EqagWsUI+ZiRiUsu6mXW8/4hzBjTvmuq/d
 EnbT4oepSFYslZWfydMuw8J/asyyo5JTeOJEZXoQ7HX8dCHBp32flcacjWnvRtsA+Fjj
 Fd8ey4wbQGrDVKLlSV0itX3DBaSshqxmR+EiziWWZdHKH+u4vuie4fjryTeFudnp5pw9
 CVoANtaBkljt9gUF2MovMlowEYQdb+eXbFgS/Bt6PoxwwklAoW6iskdT3Z457lftSkgp
 gYALvDx8MDA8aYiWwkFZ5gpUmpqefPpPvJ6mKFzpEDX7yLfDnHlUiPnAgTeb+Ehzqhf+
 4Elg==
X-Gm-Message-State: AO0yUKW7SXv2bmLfGz0nj8N0GOXgDLaJlnmHy45A82N3siUlpGBKz6uv
 2Wf1ETCF7KdwBz7PmvVTmS7xsg==
X-Google-Smtp-Source: AK7set+fCvfw/92iBOaipDjZp3Cm0k43NVtGsmju7ow/hXd+MskQTkB7ljuYQmYnCKuiTHidFD4AtA==
X-Received: by 2002:a5d:4604:0:b0:2c5:598a:dd0c with SMTP id
 t4-20020a5d4604000000b002c5598add0cmr2743933wrq.0.1676307835890; 
 Mon, 13 Feb 2023 09:03:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b002be5bdbe40csm10986153wrt.27.2023.02.13.09.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:03:55 -0800 (PST)
Message-ID: <39a4b977-cd94-0f77-e215-c17f8521f6e3@linaro.org>
Date: Mon, 13 Feb 2023 18:03:53 +0100
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
 <499a75a2-5a43-6ec6-bedb-f6bc46aa60fe@linaro.org>
 <b95e2be0-cf08-a04a-5667-063f7a9fc039@linaro.org>
 <f1a92e40dec55f77e95a4512dbf6fcd3a6ae235b.camel@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f1a92e40dec55f77e95a4512dbf6fcd3a6ae235b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 13/2/23 17:24, Eric Farman wrote:
> On Mon, 2023-02-13 at 17:10 +0100, Philippe Mathieu-Daudé wrote:
>> On 13/2/23 16:51, Philippe Mathieu-Daudé wrote:
>>> On 13/2/23 16:29, Eric Farman wrote:
>>>> On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daudé wrote:
>>>>> Use the VFIO_CCW() QOM type-checking macro to avoid
>>>>> DO_UPCAST().
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>>    hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
>>>>>    1 file changed, 16 insertions(+), 19 deletions(-)

>>>>>        CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj,
>>>>> dev);
>>>>
>>>> If I'm not mistaken, I believe that this (and (un)realize below)
>>>> could
>>>> be changed to:
>>>>
>>>>      CcwDevice *ccw_dev = CCW_DEVICE(dev);
>>>
>>> Even ...

>>>           VFIOCCWDevice *vcdev = VFIO_CCW(dev);
> 
> Ha, I didn't look to see if we cared about the intermediary ones, but
> this is true here. (Realize cares a bit, but that's easy enough.)
> 
>>>
>>> But I somehow got scared to of removing too many casts...
>>>
>>> Are these paths covered by a "make check-qtest" on a s390x host?
>>
>> They are covered by the Avocado tests :)
>>
>> $ avocado --show=app,console run -t arch:s390x tests/avocado
>>
> 
> Woo! Then I'm happy with the big squash then.
> 
> Reviewed-by: Eric Farman <farman@linux.ibm.com>

Thanks! Posted cleaned v3 here:
https://lore.kernel.org/qemu-devel/20230213170145.45666-1-philmd@linaro.org/

