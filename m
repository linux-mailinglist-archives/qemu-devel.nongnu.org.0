Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1255BF18A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:51:52 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oan1r-0000i8-Ja
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaiYu-0001oh-Sn; Tue, 20 Sep 2022 15:05:40 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaiYs-0002gO-Ud; Tue, 20 Sep 2022 15:05:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x1so3355834plv.5;
 Tue, 20 Sep 2022 12:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=P6RkJlJYnSXUYFlnbR6lGV0+LzVLLBK5JOGkkK5aU5c=;
 b=XX3HC6ODm+4XfKtnPcVnKlAXYE39pQcdCDp+3aTCPXok/WMttmul7cmVeG517rz8UM
 XmZPI9ngc00gNHhXowTtgjPyIiJlkXP5dkQQupWTUn5GRSpQ+RJBZj5+XJ+nu+FA1gjL
 y7gX5+k9xxJwKQnBWKh1OiyJg6HEG673Sy2x5MSdTbjD2LWlaQ/ooediQCxaSL+boDmq
 fUKl375WSFcEou2Z3fxAcHAdY/Bq75vHZWvDVGRKEPkZMZ2wrEbU8o6gaTBrlnspyNLp
 695Nw8sKcCJCeIwmqQ+8JSg024NrMfbKALJGUyre2gyHYU72GdSCXNDhMlv+eu/HGikW
 Udww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=P6RkJlJYnSXUYFlnbR6lGV0+LzVLLBK5JOGkkK5aU5c=;
 b=MYqq/JF7Da0k7oq1Ox8l8vZhiSxcLHbQYRH8/AHQCERIDkH+ePnkw1dnEsbo3YlCUI
 SxgEs5/QWKrNyU2BGr3vkXUAJ0l2kb1Q8QDkZPHk0skTIdzffjhRRyX3+lowWHXsA0zn
 kKDJSQxVggoSduRC8Fd5vyrwqjMaNskg8rt3bbLs7VX9y0VM2WkEiESMWzmGGtD6ZT8y
 e1llAg+fGIapzzf2pGJQm1jhYpBXGmHE5uol+fzrMZFT3mVaKgOutayFulmwSpOQD0CE
 Ezmqc5jaft1Ya6gce6SxFLbEOIcMuaG9SUCVa5jxxGBwcDS70xouZPzdvWfWeVr3Iox3
 0v2A==
X-Gm-Message-State: ACrzQf01yxE10DVvxFjvB4+dIdIUx0/o1YSkwg9kz+ICVbMDVd/BRRX0
 mQyO3UPxn6SBWnzWrGVTmA0=
X-Google-Smtp-Source: AMsMyM5vuBL8ko7Zq4vtfVd0DlwuoZF2KvhfVXtuZMdzvMzF2HLM2J2bQ7G5NG6eGxsnlJvzXZSb7w==
X-Received: by 2002:a17:902:e547:b0:178:2aee:ab1d with SMTP id
 n7-20020a170902e54700b001782aeeab1dmr1014023plf.29.1663700736599; 
 Tue, 20 Sep 2022 12:05:36 -0700 (PDT)
Received: from [192.168.232.175] (29.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.29]) by smtp.gmail.com with ESMTPSA id
 v28-20020aa799dc000000b0053e4baecc14sm257721pfi.108.2022.09.20.12.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 12:05:35 -0700 (PDT)
Message-ID: <59521509-4c36-2d9a-828d-45e236888095@amsat.org>
Date: Tue, 20 Sep 2022 21:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [Phishing Risk] [External] Re: [PATCH 0/3] Add a host power device
Content-Language: en-US
To: Zhang Jian <zhangjian.3032@bytedance.com>
Cc: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yulei.sh@bytedance.com,
 tangyiwei.2022@bytedance.com, chentingting.2150@bytedance.com,
 yuhao.17@bytedance.com, wangxiaohua.1217@bytedance.com,
 xiening.xll@bytedance.com
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
 <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
 <CA+J-oUt96e0kNwDsee8YgmRkKSzPb==aD=VHU0My9a=CV-8RuQ@mail.gmail.com>
In-Reply-To: <CA+J-oUt96e0kNwDsee8YgmRkKSzPb==aD=VHU0My9a=CV-8RuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.182,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 20/9/22 17:17, Zhang Jian wrote:
> Hi Philippe,
> 
> Thanks for your reply.
> 
> On Tue, Sep 20, 2022 at 7:09 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Jian,
>>
>> On 19/9/22 19:21, Jian Zhang wrote:
>>> This patchset adds a host power device and added it into the g220a
>>> mahcine. The BMC have a important is to control the power of the host,
>>> usually it is nessary in a hardware platform.
>>>
>>> The BMC(soc) usually had a output pin to control the power of the host,
>>> and a input pin to get the power status of the host.
>>>
>>> The host power device is a generic device to simulate the host power,
>>> accept the power control command from the BMC and report the power
>>> status.
>>>
>>> Test on the g220a machine, the host power control command can be simply
>>> work.
>>>
>>> Jian Zhang (3):
>>>     hw/gpio/aspeed_gpio: Add gpios in/out init
>>>     hw/misc/host_power: Add a simple host power device
>>>     hw/arm/aspeed: g220a: Add host-power device
>>
>> "power-good" is just a TYPE_LED object, but it doesn't seem you are
>> really interested in using it.
>>
> yeah, i'd like to just send an irq when the `switch` status changed.

You can do that using feeding the switch latch output to a 2-lines
TYPE_SPLIT_IRQ object, then wire 1 line to the SoC input, and the
other one to the TYPE_LED input.

