Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FE68C625
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bj-0004wB-OE; Mon, 06 Feb 2023 13:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6bZ-0004vZ-Tk
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:50 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6bW-0005RD-00
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so9626564wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=euw2DqlC8cs3IIL7aKpu5NwRAp5I1Awdy07JI7NWZrM=;
 b=X2hpMZ/i/s5N4UIGK3F1DGMIBAoiyrIY5hbeQFmqSLq+BwG5QwQzM0Y9AubgmnjYFM
 1/ombkfffnVXMRQeMZgKSw153eRV5/OrwVbIen3VNM/SxNSKn4SXcneeYOuFfog/btH6
 gVrLP9/JM623wdGkWaLRu64A50kF2O8PUP2UayOxQOeS13beqxlIPyYyOKWj9536/3nl
 aeATF5F+0OVr1n3IWusMeDhOOr524szu1Iq25NDhDM2flq6OxjxrOA6fjnkFWZAA+Z6v
 6U2Ow6cd93lrw10VsVsr+Ev0Sy/A9voxe842f/k0UZmGdmP9aM4FRAHHoYPmv8YYTF5y
 mzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=euw2DqlC8cs3IIL7aKpu5NwRAp5I1Awdy07JI7NWZrM=;
 b=MNQ23CckhXlvh4Zgwf6Zn35EbYjqs80oODtmTBASIEkKCMVaWP1dE8IjFAPgXHXf6m
 Qf4I1WHSIRYjpxZUMMz7AIJIzk/pYGef5LvoitRhYGAlSHjvNV/V7kwm5nvcj5XHVpcj
 9AbZTBLNATwjq52SdtcV7EfmGV5u1eW/Dydshh/n2qnrNSZY8ve1kbFmoe6L44o4kRfQ
 2u7qcLeeMLMUBrG5cHSzK9qunGJc3YaU9E5b2mMInRFucz3meDPhziTXDTZ2t1ggjMES
 rRlsxoAWmw6NF34XE68avCE7f318kM+9zXg+jFRaF60LYmxwibPIeFS4avLKJ9buXoN3
 RMLw==
X-Gm-Message-State: AO0yUKUh0LXh53jJB/JDIuFpLn9RRH87f+X6oySQYCuzz8vC3LrpVDvo
 5WxM54xxf+EaUjSAgi96ATc3WQ==
X-Google-Smtp-Source: AK7set/0jWAB7oma4fqR6wuxybqRWFFOhqzS8QEqqBrJ++YUYGkQmVLu5jWIjP6Bfcgl/3YkWrKp7A==
X-Received: by 2002:a05:600c:3198:b0:3e0:15c:3573 with SMTP id
 s24-20020a05600c319800b003e0015c3573mr602583wmp.35.1675709556358; 
 Mon, 06 Feb 2023 10:52:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k32-20020a05600c1ca000b003ddf2865aeasm18185942wms.41.2023.02.06.10.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:52:35 -0800 (PST)
Message-ID: <fe5f2115-ba3e-aa4a-049f-7741b82d107d@linaro.org>
Date: Mon, 6 Feb 2023 19:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
 <4ea8eec3-1d4e-0d09-4bf4-eb2987238594@linaro.org> <877cwuadr6.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <877cwuadr6.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 18:46, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 6/2/23 16:04, Fabiano Rosas wrote:
>>> The tests are built once for all the targets, so as long as one QEMU
>>> binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
>>> run. However some binaries might not include the device. So check this
>>> again in runtime.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
>>> index 392a7ae7ed..a9254b455d 100644
>>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>>> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>>>    
>>>    int main(int argc, char **argv)
>>>    {
>>> +    if (!qtest_has_device("lsi53c895a")) {
>>> +        return 0;
>>> +    }
>>
>> Shouldn't we update Kconfig to now add the test unconditionally?

(I meant meson.build, not Kconfig).

>> Squashing:
> 
> I think we'd still want to not build this test if nothing selected
> CONFIG_LSI_SCSI_PCI.

Yeah, no need to waste resources building/testing if not available.

OTOH the qtest's meson.build is too complicated.

