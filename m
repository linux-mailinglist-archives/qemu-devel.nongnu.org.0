Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F33E83B5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:29:31 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXRK-0008II-Kp
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXPz-0007c9-KM
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXPx-0003kl-2n
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628623684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60FjnfF/VE1FZXF//1bXT4oS7IT3XndXQNySQNf4/HU=;
 b=TKB/RWIWSlGO5TVA8JPL5Dl5vtac9i+jkGjBCiErO+1liFV7jdvBLZr52vR1WvVONhPmR8
 S1GNGda2O7yWPTA8WkMIsHwOTrY+NACRbjjD85PhWOQ0B7Tc17P1iyTEwHQ7Xz32BcInmN
 P2yF66x4N8b2YgVK3U6fW35PfWmwpF0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-6TnqrQ5wPK6uoYEEmamxgg-1; Tue, 10 Aug 2021 15:28:02 -0400
X-MC-Unique: 6TnqrQ5wPK6uoYEEmamxgg-1
Received: by mail-wm1-f70.google.com with SMTP id
 85-20020a1c01580000b02902511869b403so1367066wmb.8
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=60FjnfF/VE1FZXF//1bXT4oS7IT3XndXQNySQNf4/HU=;
 b=DfeV6KroHg9Uw3egsh9ohggCmR1T+uF3IoacRVDxoF0SBsbt/7m4Sax+DIJuhmkr3d
 LTuyNUjea6QoqaI2j2G8to/GMrgU1LtYs+4L+Z7zHE2TsE8LG0BDPum7jUKS4fpe/VAT
 UvOS6AXdPhBDVX4PP9y0h3F8npWi+W4VyH+ZGZ1etDdA0xt/FzDrBoZ4xvSRyP/QKr2A
 Fwy8a/HIsvFnutdzjEHj/zlwfXzhj8asPihvQUVWu3a30ViFqygMZ6+VeSTt4nGiYT3s
 HGQSfKJtJuuZhTl1rzvmoeJ5Fp9dXUvfNNb0KTZlF62TvXetneEE142uC5F5suKUhf9G
 9a4A==
X-Gm-Message-State: AOAM531K5qPTdwTjJF8lkyrMrbFHaJrF3FuL0FNzAejX5l9DXsRTC+aE
 i9uiCrol3Wxoq9q5ujkwiaPS6N/KJFZ7N1hV+6S2smGUBVbK2EYYmRAilpfKvuBZCVMxe4+D320
 lwtwbe4631ZdkO3Y=
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr2882795wmc.66.1628623681670; 
 Tue, 10 Aug 2021 12:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfirbmeWtJc+rpsSOmeSgwcnyuUzI+Nlp3xZs7tnijAmOxB2yJ2caooVRGllMLzEn5lqoaKg==
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr2882774wmc.66.1628623681432; 
 Tue, 10 Aug 2021 12:28:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q5sm24448634wrx.33.2021.08.10.12.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:28:01 -0700 (PDT)
Subject: Re: [PATCH-for-6.2] tests/acceptance: Allow overwrite smp and memory
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210802222257.50946-1-email@aabouzied.com>
 <ae891a6f-fc3d-5234-010f-58356140e752@redhat.com>
Message-ID: <a874f5ea-80e5-1eb6-b687-4403787a0573@redhat.com>
Date: Tue, 10 Aug 2021 21:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ae891a6f-fc3d-5234-010f-58356140e752@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: "Allow overwrite default smp and memsize command line options"?

On 8/10/21 9:18 PM, Philippe Mathieu-Daudé wrote:
> On 8/3/21 12:22 AM, Ahmed Abouzied wrote:
>> Removes the hard-coded values in setUp(). Class inheriting from
>> avocado_qemu.LinuxTest can overwrite the default smp and memory instead.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
>> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
>> ---
>>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>> index 2c4fef3e14..2639b89c84 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>>      distro = None
>>      username = 'root'
>>      password = 'password'
>> +    smp = '2'
>> +    memory = '1024'
>>  
>>      def _set_distro(self):
>>          distro_name = self.params.get(
>> @@ -471,8 +473,8 @@ def _set_distro(self):
>>      def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>>          super(LinuxTest, self).setUp()
>>          self._set_distro()
>> -        self.vm.add_args('-smp', '2')
> 
> I don't understand why we use 2 as default value, but this is unrelated
> to this patch, so:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> -        self.vm.add_args('-m', '1024')
>> +        self.vm.add_args('-smp', self.smp)
>> +        self.vm.add_args('-m', self.memory)
>>          # The following network device allows for SSH connections
>>          self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
>>                           '-device', '%s,netdev=vnet' % network_device_type)
>>
> 


