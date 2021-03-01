Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480332805B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:10:55 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjGA-0001wX-66
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGj1y-0005cU-33
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:56:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGj1w-00022T-AJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:56:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 y22-20020a1c4b160000b029010b2094f5deso3039165wma.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4aLeke3d6PjmteHvWUJ5i7IPFX72j04f/yQTMkm5Stc=;
 b=rKxbpeq/nRLLBvC1EvnBOaqweeS+dI2Y797FBa4QlOvxXmK7hELuH/VgG0to8fXkqm
 RDMhjBAb/9pxl9Iixi6J1YFGnKZcC9EzFBJs1Dz7lNEDK4G7z31WcPGomeIu0sNh07JY
 Mjt/GfFt3IbJ/NV7G0jDQ4PvIMT5MbFSZbeE5ovT3f6qLdXdxvZnc9P0+/jX6DaWR9y+
 5JtICnDHg4iIwHixZGnrOjZzAzhI5sX3siT0iyOyWWZZrEpTJnf9hJ6+MwGp1dQUZBqo
 6nyU3GJ929XTKMcRyPewyKLINjVF7V5z3OZFTxf3leWI8Sz1w1lBM0heH3pQvFYLJg/N
 x1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4aLeke3d6PjmteHvWUJ5i7IPFX72j04f/yQTMkm5Stc=;
 b=fK+FoRb6fZqDgQdyfn1fnIXnX4e9DVisF7rh192uC+BZLbgEJBD2CTEHzW6Pnaw5NA
 KD60OodVhAWqjGMgzhzUpZl99HBo6wJYVWSUdiIFcDGIEDkfR1uDqfkPSRs+M9eep1pD
 jkLwQ6GlfXPWFP2sP8FbZIVWqAM3PZ1dA9cMoDVsMaRK1DeOgrH6YqkQ/lbUYKUQR/tj
 dyz2mfAXxCyjUNX7oHyO39YGCymQEum27B9b4ctj2aAtkfahO2oga3+JZM0NSXyD3nv1
 NMeZVzlnMq0IxUcbzFpw33dimhb6+/5rgjvYDGkLZ6NFUQpHzT9VPa71TtE0n0gkl2bP
 IyBw==
X-Gm-Message-State: AOAM532lqCuD9lJKCKrDhNou+x1W/Vg4dcSM0cmv20X9NEJLD7+wwwp2
 A7QG1TlyJid9RmtRzhwqD0Y=
X-Google-Smtp-Source: ABdhPJx+MmN6n89nCePUvYCnmiFDxzw2VYlE+vYvpYSVANCfYGeAPIh4RorK2O17XAgGWHTuQMJybA==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr6721798wmi.151.1614606970797; 
 Mon, 01 Mar 2021 05:56:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm23952526wrs.16.2021.03.01.05.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 05:56:10 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22
 artifacts
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210228224343.310677-1-f4bug@amsat.org>
 <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0dc999b-ddd1-fc4b-cd7d-56905c85616b@amsat.org>
Date: Mon, 1 Mar 2021 14:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:30 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 2/28/21 7:43 PM, Philippe Mathieu-Daudé wrote:
>> Having artifacts stored in personal namespace is not ideal,
>> as these might get closed and disappear. Use the original URL
>> where these artifacts could be found.
>>
>> For more references:
>> https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips64el
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/acceptance/boot_linux_console.py | 4 ++--
>>   tests/acceptance/replay_kernel.py      | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py
>> b/tests/acceptance/boot_linux_console.py
>> index eb012867997..138bd8cb7d3 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>>           :avocado: tags=machine:malta
>>           :avocado: tags=endian:little
>>           """
>> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
>> -                      'raw/9ad2df38/mips/malta/mips64el/'
>> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
>> +                      'mips64el/images/20150601/'
>>                         'vmlinux-3.19.3.mtoman.20150408')
> 
> http://mipsfedora.imgtec.com/development/22/mips64el/images/20150601/vmlinux-3.19.3.mtoman.20150408
> did not get resolve here. Could you please double-check the url is correct?

Yes it is correct, the domain is dead. It was working when I wrote
the test. Should I remove the test instead?

>>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>>           kernel_path = self.fetch_asset(kernel_url,
>> asset_hash=kernel_hash)
>> diff --git a/tests/acceptance/replay_kernel.py
>> b/tests/acceptance/replay_kernel.py
>> index c1cb8624683..efdd4233bc2 100644
>> --- a/tests/acceptance/replay_kernel.py
>> +++ b/tests/acceptance/replay_kernel.py
>> @@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>>           :avocado: tags=endian:little
>>           :avocado: tags=slowness:high
>>           """
>> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
>> -                      'raw/9ad2df38/mips/malta/mips64el/'
>> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
>> +                      'mips64el/images/20150601/'
>>                         'vmlinux-3.19.3.mtoman.20150408')
>>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>>           kernel_path = self.fetch_asset(kernel_url,
>> asset_hash=kernel_hash)
> 

