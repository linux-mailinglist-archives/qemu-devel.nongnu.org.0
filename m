Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A14A652C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:49:35 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEz9i-0002e0-8j
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nExFT-00070P-OY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:47:23 -0500
Received: from [2607:f8b0:4864:20::432] (port=43568
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nExFR-0003Yw-Od
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:47:23 -0500
Received: by mail-pf1-x432.google.com with SMTP id d187so16504279pfa.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ahp1W4zCU0tTf8DZt74il2SL4ZRqhc4Ixq5VPMBoeGY=;
 b=apdqjNbCJvesCUEQ707Z91JyBACpfKSljclY5T58LVqU7W7ry2hkADUbZk6UtHMbXE
 a1jYUTcZUiyKynqC1ross6eSSQ0VCm+ZRAYLUORIlxOAavv3Z/S1xA2vLGBENngOPziK
 FU4vd2ZUi7qXD8hznrYUGMHFGysHDHIiO/fYXjVdNvWHcdCtWG2+6PUSJ/1cbE0vrabw
 DTNZpBQWHynaPjK3C+M5kj7XfItC0HVNDwW8Erj/1i+URW9Erb6z5+BO/4E8Td/QaiPf
 /UCmGwx7lvY+Qj08dRNP7pB2lL4ld6Vil9SnMgR5pVjom1labC3FSBlhcQSd76U9rbC2
 3Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ahp1W4zCU0tTf8DZt74il2SL4ZRqhc4Ixq5VPMBoeGY=;
 b=kZqWFirmfZVYZcEqN4/8PMD/QaYlY58L3Beb+OLLehJvuDUDFyDnIOxiagRDVZEfDR
 /ky5o2DZ1NTT3uT9NSXze8pn0+03j2zhQz1jil+XzxypmJBM1ipeLOfhrTE17eWczWQL
 7LQQFjRkMBK+cLoHIwKPqwelY78/+0m3qgYD4GFljwKajJQsMEu9e5ZbVaquQAL5U/oM
 OC+7SvlsRBFoY6B+x7wnUre/ZwARnP+J4m1Vk7yKUDK5gSELmlH615hZ1BCFxcQLn3CS
 BsKbGVnv5upkbgSAodLYKDtSfgd1mrJqT0izq9bUBNlTSEPDc9WS0tHA2NdpYlc7DD4z
 Ca/Q==
X-Gm-Message-State: AOAM531D+L3rIUsbuHAvvZr9SuLzaoBPLwPyh4OzpZITTIRIC5aVmQuL
 S5qEqc4yOBeROX63YkueuaI=
X-Google-Smtp-Source: ABdhPJzfoDslB2j7jz1k6JzQ5ACvWmmlaJk7llmEUfNbECpgizOqMKMFwhZlY6+sRSnjc9RbtdWpjw==
X-Received: by 2002:aa7:8706:: with SMTP id b6mr25938510pfo.61.1643737640118; 
 Tue, 01 Feb 2022 09:47:20 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b13sm22168288pfm.27.2022.02.01.09.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:47:19 -0800 (PST)
Message-ID: <64143667-7027-e64a-26c8-99f1c72ebacd@amsat.org>
Date: Tue, 1 Feb 2022 18:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
 <87k0eexze4.fsf@linaro.org>
In-Reply-To: <87k0eexze4.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 1/2/22 18:35, Alex Bennée wrote:
> 
> Andrea Bolognani <abologna@redhat.com> writes:
> 
>> On Tue, Feb 01, 2022 at 11:19:11AM +0100, Thomas Huth wrote:
>>> +++ b/tests/docker/dockerfiles/centos8.docker
>>> @@ -1,10 +1,10 @@
>>>   # THIS FILE WAS AUTO-GENERATED
>>>   #
>>> -#  $ lcitool dockerfile centos-8 qemu
>>> +#  $ lcitool dockerfile centos-stream-8 qemu
>>>   #
>>>   # https://gitlab.com/libvirt/libvirt-ci
>>>
>>> -FROM docker.io/library/centos:8
>>> +FROM quay.io/centos/centos:stream8
>> [...]
>>> +++ b/tests/lcitool/refresh
>>> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
>>>   ]
>>>
>>>   try:
>>> -   generate_dockerfile("centos8", "centos-8")
>>> +   generate_dockerfile("centos8", "centos-stream-8")
>>
>> I'm not convinced this is a good idea.
>>
>> CentOS 8 and CentOS Stream 8 are two pretty distinct operating
>> systems in terms of update cadence and stability expectations, so I
>> think that using the label "centos8" for containers and CI jobs that
>> are actually consuming CentOS Stream 8 is going to be a source of
>> confusion.
>>
>> I recommend proceeding with a thorough rename, after which the string
>> "centos8" no longer shows up anywhere, instead.
> 
> Thomas do you agree? Should I drop the patch in favour or a new version
> with a more extensive rename?

I agree with Andrea :)

Andrea, do you think it is acceptable to merge this and fix on top, or
we should do it properly from start?

