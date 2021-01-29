Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF980308D35
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:23:22 +0100 (CET)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZMY-0005q9-1k
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5ZJA-0004UY-Li
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:19:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5ZJ4-0003M4-2u
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611947982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2lVP1m+1Mb2sceQ4Gr7lNxplBWv5ouZPRtSCXMf3Cc=;
 b=J8oRlC+CSrFU4W4zJAQH3wkuEapjjQX3ZX7ocXW3yaXCI3uQP62g5nWX+bZ2I9ZdP3cqCA
 toR2cYMlZMdodf3/Ilx5mez7t2YsU51Z7kPOb3EHHctNXAmKUhJ0zJIQK8qg3Xba7O7QtW
 2nCwVX1PJvLXofGiCLcBp6XnZtl7dOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-4FaXtrFBNZu4J9mEDJNLkg-1; Fri, 29 Jan 2021 14:19:40 -0500
X-MC-Unique: 4FaXtrFBNZu4J9mEDJNLkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC018030A5;
 Fri, 29 Jan 2021 19:19:38 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 241A760BE2;
 Fri, 29 Jan 2021 19:19:34 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Re-enable the microblaze test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210128152815.585478-1-thuth@redhat.com>
 <a2a8bc19-bc7f-1228-9eac-357784fe819b@redhat.com>
 <514b7f02-030f-7dec-8bf1-84fa6a971caf@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bc738bec-ea58-c061-bbfa-96fd46637493@redhat.com>
Date: Fri, 29 Jan 2021 16:19:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <514b7f02-030f-7dec-8bf1-84fa6a971caf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 1/29/21 2:40 AM, Thomas Huth wrote:
> On 28/01/2021 20.34, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 1/28/21 12:28 PM, Thomas Huth wrote:
>>> The microblaze kernel sometimes gets stuck during boot (ca. 1 out of 
>>> 200
>>> times), so we disabled the corresponding acceptance tests some months
>>> ago. However, it's likely better to check that the kernel is still
>>> starting than to not testing it at all anymore. Move the test to
>>> a separate file, enable it again and check for an earlier console
>>> message that should always appear.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   MAINTAINERS                            |  1 +
>>>   tests/acceptance/boot_linux_console.py |  9 -------
>>>   tests/acceptance/machine_microblaze.py | 35 
>>> ++++++++++++++++++++++++++
>>>   3 files changed, 36 insertions(+), 9 deletions(-)
>>>   create mode 100644 tests/acceptance/machine_microblaze.py
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 34359a99b8..157ad4f7ef 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1112,6 +1112,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>>   S: Maintained
>>>   F: hw/microblaze/petalogix_s3adsp1800_mmu.c
>>>   F: include/hw/char/xilinx_uartlite.h
>>> +F: tests/acceptance/machine_microblaze.py
>>>   petalogix_ml605
>>>   M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>> diff --git a/tests/acceptance/boot_linux_console.py 
>>> b/tests/acceptance/boot_linux_console.py
>>> index fb41bb7144..969fbf3952 100644
>>> --- a/tests/acceptance/boot_linux_console.py
>>> +++ b/tests/acceptance/boot_linux_console.py
>>> @@ -1047,15 +1047,6 @@ class BootLinuxConsole(LinuxKernelTest):
>>>           tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
>>>           self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
>>> -    @skip("Test currently broken") # Console stuck as of 5.2-rc1
>>> -    def test_microblaze_s3adsp1800(self):
>>> -        """
>>> -        :avocado: tags=arch:microblaze
>>> -        :avocado: tags=machine:petalogix-s3adsp1800
>>> -        """
>>> -        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
>>> -        self.do_test_advcal_2018('17', tar_hash, 'ballerina.bin')
>>> -
>>>       def test_or1k_sim(self):
>>>           """
>>>           :avocado: tags=arch:or1k
>>> diff --git a/tests/acceptance/machine_microblaze.py 
>>> b/tests/acceptance/machine_microblaze.py
>>> new file mode 100644
>>> index 0000000000..7f6d18495d
>>> --- /dev/null
>>> +++ b/tests/acceptance/machine_microblaze.py
>>> @@ -0,0 +1,35 @@
>>> +# Functional test that boots a microblaze Linux kernel and checks 
>>> the console
>>> +#
>>> +# Copyright (c) 2018, 2021 Red Hat, Inc.
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>> +# later. See the COPYING file in the top-level directory.
>>> +
>>> +from avocado_qemu import Test
>>> +from avocado_qemu import wait_for_console_pattern
>>> +from avocado.utils import archive
>>> +
>>> +class MicroblazeMachine(Test):
>>> +
>>> +    timeout = 90
>>> +
>>> +    def test_microblaze_s3adsp1800(self):
>>> +        """
>>> +        :avocado: tags=arch:microblaze
>>> +        :avocado: tags=machine:petalogix-s3adsp1800
>>> +        """
>>> +
>>> +        tar_url = ('https://www.qemu-advent-calendar.org'
>>> +                   '/2018/download/day17.tar.xz')
>>> +        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
>>> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>>> +        archive.extract(file_path, self.workdir)
>>> +        self.vm.set_console()
>>> +        self.vm.add_args('-kernel', self.workdir + 
>>> '/day17/ballerina.bin')
>>> +        self.vm.launch()
>>> +        wait_for_console_pattern(self, 'This architecture does not 
>>> have '
>>> +                                       'kernel memory protection')
>>> +        # Note:
>>> +        # The kernel sometimes gets stuck after the "This 
>>> architecture ..."
>>> +        # message, that's why we don't test for a later string 
>>> here. This
>>> +        # needs some investigation by a microblaze wizard one day...
>>
>>
>> The change looks good to me.
>>
>> Also I appreciate the note you left on code. In addition I suggest to 
>> put some tag to indicate it needs some investigation or that it is 
>> flaky (although that's not the case anymore), because it will ease 
>> the discovery and filtering of "problematic" tests. What do you think?
>
> Sounds reasonable, but I'm not aware of any such tags in the 
> "acceptance" code yet... what exactly do you have in mind?

First, I don't want to hold this patch any longer. So:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Then back to the tags discussion...

I agree with Philippe when he says [1] that Avocado tags might be 
underused. But unlike his idea (see [1], which I think is very good btw) 
here I mentioned the use of tags to solve a different problem: ease the 
search for tests that need maintenance.

The test in this patch, for example, could be tagged "needReview" 
(sorry, there must exist a better tag name). If it was failing 
intermittently (and we hope your changes prevent that) then we could 
have it tagged "flaky". Disabled tests get marked as "disabled", and so 
on. Thus, one can use the `avocado list -t needReview` command to get 
the list of tests.

I will come up with a RFC series so we may continue this conversation on 
concrete examples. Sounds good to you?

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg772651.html

Thanks!

- Wainer

>
>
>  Thomas


