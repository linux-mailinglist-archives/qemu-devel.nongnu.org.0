Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834A314CEE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:28:04 +0100 (CET)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QFX-0001M9-2m
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9QDc-0000rP-5c
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9QDZ-0001lo-3A
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612866357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuqwAtQ1Pn+mk8JfyKBLNLA0+x7ioEn/uX0lOHTtcZQ=;
 b=cm99L84ESR8tsZ8XlTkR4f+iDa2WqKErd8BS5kR1gGg3BAAw6Uiz3ttQZyx2fyIfuu4TEz
 R2GDoiOYq+yj+lnx3rp+Pum4tgg63VLrK+UyhdZAFVLEgpkhSnNdf5/4jFagOL0+yFTQTE
 ZZz/0szhC5GLTgdg+jzPPUpJyr/m2es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-wQXQK3zlM52tHL7gEUvGbg-1; Tue, 09 Feb 2021 05:25:56 -0500
X-MC-Unique: wQXQK3zlM52tHL7gEUvGbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE6181934102;
 Tue,  9 Feb 2021 10:25:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-208.ams2.redhat.com
 [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7BA2CE01;
 Tue,  9 Feb 2021 10:25:45 +0000 (UTC)
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com> <8735ycq80u.fsf@linaro.org>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
Date: Tue, 9 Feb 2021 11:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8735ycq80u.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.02.21 14:23, Alex Bennée wrote:
> 
> Cleber Rosa <crosa@redhat.com> writes:
> 
>> If the vmlinuz variable is set to anything that evaluates to True,
>> then the respective arguments should be set.  If the variable contains
>> an empty string, than it will evaluate to False, and the extra
>> arguments will not be set.
>>
>> This keeps the same logic, but improves readability a bit.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/acceptance/virtiofs_submounts.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
>> index f1b49f03bb..f25a386a19 100644
>> --- a/tests/acceptance/virtiofs_submounts.py
>> +++ b/tests/acceptance/virtiofs_submounts.py
>> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>>   
>>           super(VirtiofsSubmountsTest, self).setUp(pubkey)
>>   
>> -        if len(vmlinuz) > 0:
>> +        if vmlinuz:
>>               self.vm.add_args('-kernel', vmlinuz,
>>                                '-append', 'console=ttyS0 root=/dev/sda1')
> 
> And this is were I gave up because I can't see how to run the test:
> 
>    ./tests/venv/bin/avocado run ./tests/acceptance/virtiofs_submounts.py
>    JOB ID     : b3d9bfcfcd603189a471bec7d770fca3b50a81ee
>    JOB LOG    : /home/alex/avocado/job-results/job-2021-02-04T13.21-b3d9bfc/job.log
>     (1/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_virtiofsd_set_up: CANCEL: vmlinuz parameter not set; you must point it to a Linux kernel binary to test (to run this test with the on-image kernel, set it to an empty string) (0.00 s)
>     (2/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launch_set_up: CANCEL: vmlinuz parameter not set; you must point it to a Linux kernel binary to test (to run this test with the on-image kernel, set it to an empty string) (0.00 s)
>     (3/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_launch_set_up: CANCEL: vmlinuz parameter not set; you must point it to a Linux kernel binary
>    to test (to run this test with the on-image kernel, set it to an empty string) (0.00 s)
>     (4/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_mount_set_up: CANCEL: vmlinuz parameter not set; you must point it to a Linux kernel binary to test (to run this test with the on-image kernel, set it to an empty string) (0.00 s)
>     (5/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.test_two_runs: CANCEL: vmlinuz parameter not set; you must point it to a Linux kernel binary to test (to run this test with the on-image kernel, set it to an empty string) (0.00 s)
>    RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 5
>    JOB TIME   : 0.56 s
> 
> Given the test seems to make assumptions about an environment being
> setup for it I think we need some documentation somewhere about what
> those pre-requisites are.

I find the cancel message pretty clear, but then again it was me who 
wrote it...

Either you point the vmlinuz parameter to some Linux kernel you built 
yourself, or you set it to the empty string to just use the kernel 
that’s part of the image.  Setting Avocado parameters is done via -p, 
i.e. “-p key=value”.  So in this case
“-p vmlinuz=/path/to/linux/build/arch/x86/boot/bzImage”, or
“-p vmlinuz=''”.

Ideally, vmlinuz='' would be the default, but there’s a problem with 
that: I submitted this test along with the patches that added the 
required feature to the Linux kernel, so at that point that feature was 
not part of Linux.  That’s why you generally have to point it to a Linux 
kernel binary you built yourself that has this feature (5.10 does).

Using vmlinuz='' you can test it with the kernel that is part of the 
cloud image.  Once that kernel is sufficiently new (i.e., >=5.10), we 
can make that the default.

Max


