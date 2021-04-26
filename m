Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C136B2B4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:05:44 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazzj-0001lh-FJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lazxk-0001Ia-Np
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:03:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lazxh-000868-UX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:03:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g65so676635wmg.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Bu6/VH0wP8a/zZTI6ONuTqI2RE8AsQF/UbVoaN/NCE=;
 b=GJKCo21mEA2cxIVAYVRbcQwMjXFoiqn2QULdcy8jmigSrj7tIxaICIglcPd8+CLqqA
 7MRtagRFOnUjTt/4twIIA4TCk0WSrcY8jch1OXN89pj20mnAWMBgUdUSxyLuJM/In3/O
 wvSLKqrFRV7HK4V8iCJysrG8PwssbAEwmx07askPySSj4FpSo6IZ3WDVYy9Gm/eAnHzt
 aa4IdXsNUcaUsffNjfHN844LketQCA5jOp4ocYtSiZAWqKC/91dEZkXuiW/X644LIBFN
 HqqzrpbYVXeE2FlOaZ1nsTNXLD6Osg+No8VaIOv7dI02mXBRfRv6SNfR465HFZAZCjGM
 FCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Bu6/VH0wP8a/zZTI6ONuTqI2RE8AsQF/UbVoaN/NCE=;
 b=VenVYete4CN8ae6AZswGdD/CvmTTL1cboqHEC/eRgF2Zg8lCFoDBrpjTliQps9lMnY
 TvjIiVm4KlvapcRPFzYgUBD2Gaai7EuvSTJhcef2D3ucAajfjDOZ/Iw6BwBH7Pw3sQ5O
 gxOG7H84CfJaBN1Vo1kJu0iU0GEdAcJgLTtPNu7HUZ1UTtnXr5fOE75cl2e7S/Ud/lCf
 ga57NZTYWqZIGIcvklT0aqcWG1wiApOoH7i/TfwjjvsB0gAvcqlJh5oFPmWgkVGyRi+C
 +ausFYPa1aiPNmdSKHMCm0Qxp9c0+qm8OkelMn71qRxT4541OQB6ke9we5K618T9kn/F
 zFUg==
X-Gm-Message-State: AOAM5329amoJVkkOwdFTe5psq8vmnPbTyr8Qd0sfKPg1u0Z29LttPgs1
 Q+yaos5TOl1ZoK74b3AiqqU=
X-Google-Smtp-Source: ABdhPJymkTagCcRR0d/X+/qrhrpcgWBrcwC3yFKoCH1TFM76XFQWrjEHG4RYhWJ8eDwyHGriduxcXQ==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr19765539wmi.186.1619438615988; 
 Mon, 26 Apr 2021 05:03:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q20sm47699567wmq.2.2021.04.26.05.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 05:03:35 -0700 (PDT)
Subject: Re: [PATCH v1 13/25] hw/tricore: Add testdevice for tests in
 tests/tcg/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-14-alex.bennee@linaro.org>
 <df3cbf07-562f-087d-47b2-6b366c11f4ae@amsat.org> <878s55tk2k.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6407ae11-2260-206a-6002-3d357b4c4e77@amsat.org>
Date: Mon, 26 Apr 2021 14:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s55tk2k.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/21 12:15 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 4/19/21 4:54 PM, Alex Bennée wrote:
>>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>>
>>> this device is used to verify the correctness of regression tests by
>>> allowing guests to write their exit status to this device. This is then
>>> used by qemu to exit using the written status.
>>>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>
>>> ---
>>>  include/hw/tricore/tricore_testdevice.h | 38 ++++++++++++
>>>  hw/tricore/tricore_testboard.c          |  8 +++
>>>  hw/tricore/tricore_testdevice.c         | 82 +++++++++++++++++++++++++
>>>  hw/tricore/meson.build                  |  1 +
>>>  4 files changed, 129 insertions(+)
>>>  create mode 100644 include/hw/tricore/tricore_testdevice.h
>>>  create mode 100644 hw/tricore/tricore_testdevice.c
>>
>>> +#include "hw/tricore/tricore_testdevice.h"
>>> +
>>> +static void tricore_testdevice_write(void *opaque, hwaddr offset,
>>> +                                      uint64_t value, unsigned size)
>>> +{
>>> +    exit(value);
>>
>>    ->  qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>>
>> I'd rather use a 2 steps check of value such watchdog devices do
>> (to be sure the guest is still in control and isn't nut).
> 
> This isn't any different to what we do for TARGET_SYS_EXIT_EXTENDED or
> the various other semihosting exits. Maybe we could do a better job of
> flagging that these devices (or features) give the guest an avenue to
> cause QEMU to shutdown but none of these are enabled by default.

My concern here is the console being modified and not being restored
correctly. Maybe not a problem for the current test, but could happens
later with more tests added, or the device re-used elsewhere.

This is a one-line change, which can be done later.

This concert also applies to the semihosting exit(). Can be done later too.

> 
>>
>> A general comments, all targets require a such test feature,
>> so we should have a generic user-creatable sysbus-testdev for that.
> 
> We also have the isa-debug-exit device used by x86. I believe there is
> also a PCI device (pci-testdev) used to submit error-exit results for
> kvm-unit-tests.
> 
> I'm all for modelling a cleaner abstraction that could be used by all
> these methods and avoiding multiple exit paths but I don't want to hold
> up Bastian's tests to a higher standard without addressing the other
> cases. In the meantime given it improves the testing situation for
> Tricore I don't think it's a major issue.

Agreed, not a major issue, my comment are not blocking this patch.

Thanks,

Phil.

