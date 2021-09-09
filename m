Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C24053E1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:27:12 +0200 (CEST)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOK58-00034P-PU
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOK3k-0001bF-I1
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOK3f-0002wI-Gz
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631193937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07JmK5oJ+AriCu4N3Y0KTNBhq43TMdEe0ojOxkM9Sms=;
 b=i1VLvEqc0bMIFEPYt1qEnHFBjuxBsUwjGd8XbiLZj7juTjTzwp7HB0bo9M6XaSwXE1Xsk8
 QUj1pzLtrbjFzOtMch2Y8aCfU5Ong5FsgW3ciALKS/Zi6KYS3FJpCBTfneRzjK6vX7ML9k
 UYHC95uUJ6jpILXfBoN2jo11/15ydzE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-xdfjTZYnMPScIoAtZlLfIw-1; Thu, 09 Sep 2021 09:25:36 -0400
X-MC-Unique: xdfjTZYnMPScIoAtZlLfIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so713094wmr.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=07JmK5oJ+AriCu4N3Y0KTNBhq43TMdEe0ojOxkM9Sms=;
 b=feBuJHAl8Iq8uvLMM2UTXt9aKtmEshI/2BQwWtnKtwqEGgdFrTSCu4vf465X3q4jKv
 XbrwOSuduERxpqkHTBxOBrmablo6/jpOU1pIryezG3aWHNQyIzIGNagU3QHo7rdgV3Up
 7Fw0YDFh5wvAORq5Xw8ZzuFDwKXJFyyH5IssjPVLapSZySTv9eRjBMjGZst6TOALpMvh
 4kLn7NXvW4PYHfQkBANEBhWUOzWO7apvBDE521vcZEBd8d05NyzJVTGTwhfiObPsHg7V
 Sze0ab5rZHFI6hrAXlIEiaBGajPb2BwJSYX4UIiwdG0KThjqtOfIp2nktuUDimqUKNEQ
 k+3A==
X-Gm-Message-State: AOAM530nKHOvVIlrLXgef2Bj8OtjQV9Qb6yZ5Yn1eekVcnxwnv6W47AZ
 BujZUSFfI6A9MP9RF1CxDTowEezc3WuUMXBssyxmP0gh8qbXW2S4QJ7pEwTtDUAKw6ql7nUAbls
 fqP2HmFs5oKn73WQ=
X-Received: by 2002:adf:f88d:: with SMTP id u13mr3621705wrp.297.1631193935769; 
 Thu, 09 Sep 2021 06:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZpnnJWwMOl+kNLB6HlHnQ6sqb5rjQqLsRvWYJKbxL3ly/uiqs8eS8qtTdfVozYzp2/GuJTA==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr3621675wrp.297.1631193935490; 
 Thu, 09 Sep 2021 06:25:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a6sm1608810wmb.7.2021.09.09.06.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:25:34 -0700 (PDT)
Subject: Re: [PATCH 5/7] qmp: Add the qmp_query_sgx_capabilities()
To: Yang Zhong <yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-6-yang.zhong@intel.com>
 <fe8b02c8-d7f8-c733-9577-311251a5f66d@redhat.com>
 <20210909025105.GC21362@yangzhon-Virtual>
 <a36ebd16-3cef-7287-9bd3-9a08b99ba1e9@redhat.com>
 <20210909120646.GG21362@yangzhon-Virtual>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bfd2fea1-e804-e3e7-0634-f6e3037c6a62@redhat.com>
Date: Thu, 9 Sep 2021 15:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909120646.GG21362@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 2:06 PM, Yang Zhong wrote:
> On Thu, Sep 09, 2021 at 11:36:58AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/9/21 4:51 AM, Yang Zhong wrote:
>>> On Wed, Sep 08, 2021 at 10:38:59AM +0200, Philippe Mathieu-Daudé wrote:
>>>> On 9/8/21 10:19 AM, Yang Zhong wrote:
>>>>> Libvirt can use qmp_query_sgx_capabilities() to get the host
>>>>> sgx capabilities.
>>>>>
>>>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>>>>> ---
>>>>>  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
>>>>>  include/hw/i386/sgx.h      |  1 +
>>>>>  qapi/misc-target.json      | 18 +++++++++++
>>>>>  target/i386/monitor.c      |  5 +++
>>>>>  tests/qtest/qmp-cmd-test.c |  1 +
>>>>>  5 files changed, 91 insertions(+)
>>>>
>>>>> +SGXInfo *sgx_get_capabilities(Error **errp)
>>>>> +{
>>>>> +    SGXInfo *info = NULL;
>>>>> +    uint32_t eax, ebx, ecx, edx;
>>>>> +
>>>>> +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
>>>>> +    if (fd < 0) {
>>>>> +        error_setg(errp, "SGX is not enabled in KVM");
>>>>> +        return NULL;
>>>>> +    }
>>>>
>>>> Is this Linux specific?
>>>
>>>   Philippe, The /dev/sgx_vepc node is used for KVM side to expose the SGX
>>>   EPC section to guest. Libvirt then use the '-machine none' qemu command 
>>>   to query host SGX capabilities(especially for host SGX EPC section size)
>>>   to decide how many SGX VMs will be started in server. If this node doesn't
>>>   exist, the reason is host can't support SGX or SGX KVM module is not compiled
>>>   in the kernel. thanks!
>>
>> Sorry but you didn't answer my question in an obvious way... Yes or no?
> 
>   Yes, this is Linux specific. thanks!

You made me have a deeper look at the code. So SGX (Kconfig) requires
KVM, which is only supported on Linux host. Thus this Linux specific
code is only built on Linux host. Thanks.


