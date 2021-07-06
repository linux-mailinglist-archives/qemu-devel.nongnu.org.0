Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C53BD837
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:27:29 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0m2p-0005AS-1h
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0m0t-0003Yn-1Y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0m0n-00072m-NP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625581519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fAwElEk3X91YWKsZqLao7xYfpwkzSe0vD5P3gniH9M=;
 b=QFpTTSnJiyJyIUsiPaWCKzXluvyX2O9Uu7XOp5n2UNxNtQ6rsyUmGRxpt9QrYaA30LXSSN
 bB1Jlsez70cDMg+bbAyOTBKpCCsL+4Blu/W+dq62x4XgTJfjkLnM7M2JC/ZVMcQ8dYRIjw
 2zIX22aFqhWI9SNhYN/0Z4+QLprchRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Ysv69qWtMsqyJb4wr1EmKw-1; Tue, 06 Jul 2021 10:25:17 -0400
X-MC-Unique: Ysv69qWtMsqyJb4wr1EmKw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n37-20020a05600c3ba5b02901fe49ba3bd0so1008804wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fAwElEk3X91YWKsZqLao7xYfpwkzSe0vD5P3gniH9M=;
 b=Eqm0ytK/iVhMcz09AQITEBELdu4uVxX7dKNksRIIMS2vqjGj4O4oY39lom+4QBg95W
 4B9t/dse3wQxI5OOKdJ4X/X5uTfqmcMtR6yyMdjC3tSzLEqWf0xg338IKFb/gykS8+dL
 k7XBHnSykrDauEry+qbMtcKTXe0uNxl9v8UGUmWVIeOCaqDrrlrJtGbG65nbqqirNvPy
 62jGzJ/G00Ix8yw7RSXCBt56N8xRJORtGzSaFQgK1JthFXN8ZzJLHGzOed/Q8Hf6lAdb
 AWs3egVsARUv+FlSPe9zryOLelQRM7EE8bZaeOuLbfTNObs3S6KXr3t3ZSp23ER41yjm
 XtHQ==
X-Gm-Message-State: AOAM531UmjCE/3HcLhdjFM+kbUBY7ENu7cL8GHIYXNB0xKw4JS7Miype
 UTv6rAEnuiRk8xxdmCuV+oMsFf6MbV6Z6/JkLEPchPaH+JE47ykE38Zpu1r4I4p5fnpPOtinhCl
 m+rqvRBSoCaDwzWI=
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr1099560wmo.132.1625581516758; 
 Tue, 06 Jul 2021 07:25:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq3pkX+BxiAbqC+ZtdBbXyDISmR/1KhoIuFI9X+ORcQMCIeaJW2KfBnYiiVL+uciAuii02wA==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr1099536wmo.132.1625581516578; 
 Tue, 06 Jul 2021 07:25:16 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm17020332wrh.67.2021.07.06.07.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:25:15 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] avocado_qemu: Add SMMUv3 tests
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 crosa@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-4-eric.auger@redhat.com>
 <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
 <43273a56-8deb-3db5-2a90-96f508b3a2d4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c15f5c68-0580-84c4-3ed6-eaa29aa6d036@redhat.com>
Date: Tue, 6 Jul 2021 16:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <43273a56-8deb-3db5-2a90-96f508b3a2d4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 3:57 PM, Eric Auger wrote:
> Hi Philippe,
> 
> On 7/6/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>> On 7/6/21 3:17 PM, Eric Auger wrote:
>>> Add new tests checking the good behavior of the SMMUv3 protecting
>>> 2 virtio pci devices (block and net). We check the guest boots and
>>> we are able to install a package. Different guest configs are tested:
>>> standard, passthrough an strict=0. This is tested with both fedora 31 and
>>> 33. The former uses a 5.3 kernel without range invalidation whereas the
>>> latter uses a 5.8 kernel that features range invalidation.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>
>>> ---
>>>
>>> v4 -> v5:
>>> - Added the skipIf statement (William) and William's R-b
>>> - added Wainer's R-b and T-b
>>> ---
>>>  tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 133 insertions(+)
>>>  create mode 100644 tests/acceptance/smmu.py
>>> +    def run_and_check(self):
>>> +        if self.kernel_path:
>>> +            self.vm.add_args('-kernel', self.kernel_path,
>>> +                             '-append', self.kernel_params,
>>> +                             '-initrd', self.initrd_path)
>>> +        self.launch_and_wait()
>> IIUC above is the 'run' part and below is the 'check' part?
>>
>> So the check succeed if the VM booted, right?
>>
>>> +        self.ssh_command('cat /proc/cmdline')
>>> +        self.ssh_command('dnf -y install numactl-devel')
> 
> For the test to succeed, the guests needs to boot, the ssh connection
> needs to be established and  the dnf command needs to complete.
> See launch_and_wait() in __init__.py

OK. I see the Test class provide a .fail() method:

  fail(msg=None)

    Signals a test failure unconditionally, with msg or None
    for the error message.

but no .succeed() one...

Willian: Should we add a comment here mentioning the test
succeeded by that point? Would it be more explicit to add
.succeed() in avocado.Test or avocado_qemu.Test?


