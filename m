Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9835A84C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 23:22:01 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUyZh-000868-Fe
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 17:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUyYT-0007Rc-34; Fri, 09 Apr 2021 17:20:41 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUyYR-0003rt-90; Fri, 09 Apr 2021 17:20:40 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w3so10785488ejc.4;
 Fri, 09 Apr 2021 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qiV2rJD7z0WhejnxHYzoYk0qi8MQsaYBW19kIGlDF/0=;
 b=EpkeozSONcpiqmXRIfAqaqH+rwbSnM5UyfUnGcwgBeJaLzfJBfeaVpmg0fwPgvbpgz
 VrhkFII5hHwj42KA4NFUCEaNxoNdIVFh2VE/ZC9ezpiLlUdEV/6NxIWLCA8TNVqtoxZr
 SitdEGyl9uZCg66LlAf3oKO54gTZn/nONoCEGNqdX8ebCd4+FaAfywIPR2TK7m2VOkAa
 hTt5eqVzdQAFRO0mdiFtrZ7BxxAIlHYwE+uuQgVbFXbCm/XnpRHgobKyDG6X8VYr6QAQ
 fRNf7lrFm8B+HnKCsCZCpTyoD8/yxgJPHP7iSzu4DkrbQ0erfkXEoFfY2/NR1hlYJN8s
 GN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qiV2rJD7z0WhejnxHYzoYk0qi8MQsaYBW19kIGlDF/0=;
 b=W64g2Vojvw09YyOqDnAyXmtIuyTyLOW9W70g4BBW8mlsRzpFK9TMwPOBk6TwZWgtV9
 hurT6XBquoi+G9+MwHnk7EHm20NSljEl57SoRw/xAUucJv1/00sdgZsVYI4Q/IX4KDvs
 GEW54amsflYtPMlSt6BlrIvFq3GvTUq2n2P7AcVslAAXxvr+E5LEeGmHmGJfwzRAd8HR
 /uvIBiVHFHotu/49NGjnnMMp/y/0Fl1aQ/EgWTiG1oTajWi41hhUbHPPmpCab0I/5wxC
 i9szFMTwVaMHxawyXC1R8bKksNVm5DRkgBG74olbMvt2ttwqvnS73l89Jq51VAeaLgaj
 VeqA==
X-Gm-Message-State: AOAM530/gzxtUoqtVW/1MVb/xf5pb9AN8NjaQzcySstqQQ42IGRszoiv
 uwzoa6U+ZoadGjRc6tvVbmD/xIRDwzBpqA==
X-Google-Smtp-Source: ABdhPJxyGzDIAKbO8nhfdEAHNN7U2ACRJ4VPOndZ6xKm1WpWwiSWx3yBotseTO8VLn2OSUebebgqLg==
X-Received: by 2002:a17:906:9bee:: with SMTP id
 de46mr4479149ejc.413.1618003236933; 
 Fri, 09 Apr 2021 14:20:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q16sm1759006ejd.15.2021.04.09.14.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 14:20:36 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: Patrick Venture <venture@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
 <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
 <CAO=notxOYxSyVDA9J-uOBio7d0PByvGLgn40GHbU-yQRpic1Jw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4c44381d-99ac-f1c9-60a9-0f3132422473@amsat.org>
Date: Fri, 9 Apr 2021 23:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxOYxSyVDA9J-uOBio7d0PByvGLgn40GHbU-yQRpic1Jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo/Thomas

On 4/9/21 7:21 PM, Patrick Venture wrote:
> On Fri, Apr 9, 2021 at 9:51 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Patrick,
>>
>> On 4/9/21 6:25 PM, Patrick Venture wrote:
>>> The pca954x is an i2c mux, and this adds support for two variants of
>>> this device: the pca9546 and pca9548.
>>>
>>> This device is very common on BMCs to route a different channel to each
>>> PCIe i2c bus downstream from the BMC.
>>>
>>> Signed-off-by: Patrick Venture <venture@google.com>
>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>>> ---
>>>  MAINTAINERS                      |   6 +
>>>  hw/i2c/Kconfig                   |   4 +
>>>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
>>>  hw/i2c/meson.build               |   1 +
>>>  hw/i2c/trace-events              |   5 +
>>>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
>>>  6 files changed, 325 insertions(+)
>>>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>>>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
>>
>>> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
>>> index 09642a6dcb..8d120a25d5 100644
>>> --- a/hw/i2c/Kconfig
>>> +++ b/hw/i2c/Kconfig
>>> @@ -28,3 +28,7 @@ config IMX_I2C
>>>  config MPC_I2C
>>>      bool
>>>      select I2C
>>> +
>>> +config PCA954X
>>> +    bool
>>> +    select I2C
>>
>> Do you have a circular dependency when also using:
>>
>>        depends on I2C
>>
>> ?
> 
> I'm somewhat new to qemu -- I don't know what you mean, since I2C
> doesn't depend on pca954x, I don't imagine there could be a circular
> dependency.

See
https://qemu-project.gitlab.io/qemu/devel/kconfig.html#guidelines-for-writing-kconfig-files

PCA954X is plugged on an I2C bus
-> depends on I2C

PCA954X provides I2C buses
-> select I2C

Your device is a particular case consuming and providing the Kconfig
'I2C' symbol. I expect a circular dependency problem. Easy to test with
your series but I haven't.

I suppose in this case, the "select" takes over on "depends on" so this
is OK.

Now (unrelated to your series) thinking at the graphical Kconfig tree
representation (like this one generated 2 years ago:
https://drive.google.com/open?id=1kvwl7guuAmCh2Y2UqeXynlA2HmjWcRs9),
I'd rather see a circular dep.

Regards,

Phil.

