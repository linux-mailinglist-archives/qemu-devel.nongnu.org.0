Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB731EC37
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:27:38 +0100 (CET)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCm9R-0005bt-Ca
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCm6y-0004li-G0
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:25:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCm6q-0005nL-UK
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613665494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU475d9VekeKMdKnfPpwjlu0p5EzJboiKI2j8VyuqaI=;
 b=TTbXudjC+CoaiwsndqfIfSrY9DyBQxi1AaaqBJoeI3vliPjQdZFCCgn7A9n8u7RChfhW85
 x9wsUEdz+295C0NWAZiHD4BXM7aUkH5IhW/+lXLvIxrrybP4lhFdATaasXqLSEmpPbxdkc
 lobNt9SRXeEUse0FE8rOOzNYJUZpA1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-XEMlJTNMPOCVAzI15hvEKw-1; Thu, 18 Feb 2021 11:24:49 -0500
X-MC-Unique: XEMlJTNMPOCVAzI15hvEKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCEA9193410E;
 Thu, 18 Feb 2021 16:24:48 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54C060BF1;
 Thu, 18 Feb 2021 16:24:44 +0000 (UTC)
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
To: Cleber Rosa <crosa@redhat.com>
References: <20210212151649.252440-1-mreitz@redhat.com>
 <20210212185814.GA2653579@localhost.localdomain>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e61cfa4e-c1c9-337b-fc9b-8981cf52b12b@redhat.com>
Date: Thu, 18 Feb 2021 17:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212185814.GA2653579@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.02.21 19:58, Cleber Rosa wrote:
> On Fri, Feb 12, 2021 at 04:16:49PM +0100, Max Reitz wrote:
>>  From the cancel message, it is not entirely clear why this parameter is
>> mandatory now, or that it will be optional in the future.  Add such a
>> more detailed explanation as a comment in the test source file.
>>
>> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>> I’ve uploaded a build of Linux 5.10 here:
>>    https://xanclic.moe/linux-5.10
>>
>> But I’ve decided against mentioning it in this new comment or the cancel
>> message, because, well, it’s my private server and I have limited
>> bandwidth.
>> ---
>>   tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
>> index 949ca87a83..9a69b6b17b 100644
>> --- a/tests/acceptance/virtiofs_submounts.py
>> +++ b/tests/acceptance/virtiofs_submounts.py
>> @@ -228,6 +228,18 @@ class VirtiofsSubmountsTest(BootLinux):
>>       def setUp(self):
>>           vmlinuz = self.params.get('vmlinuz')
>>           if vmlinuz is None:
>> +            """
>> +            The Linux kernel supports FUSE auto-submounts only as of 5.10.
>> +            boot_linux.py currently provides Fedora 31, whose kernel is too
>> +            old, so this test cannot pass with the on-image kernel (you are
>> +            welcome to try, hence the option to force such a test with
>> +            -p vmlinuz='').  Therefore, for now the user must provide a
>> +            sufficiently new custom kernel, or effectively explicitly
>> +            request failure with -p vmlinuz=''.
>> +            Once an image with a sufficiently new kernel is available
>> +            (probably Fedora 34), we can make -p vmlinuz='' the default, so
>> +            that this parameter no longer needs to be specified.
>> +            """
>>               self.cancel('vmlinuz parameter not set; you must point it to a '
>>                           'Linux kernel binary to test (to run this test with ' \
>>                           'the on-image kernel, set it to an empty string)')
>> -- 
>> 2.29.2
>>
> 
> Hi Max,
> 
> This looks good to me, and I've also tested your kernel build and
> works like a charm.

Great :)

> As further work on top of this, it may be beneficial to have test
> documentation in a predictable place.  The possibilities that come to
> my mind:
> 
>   * docs/devel/testing.rst
>   * tests/acceptance/$test_file.py/data/README

Hm.  I think I’d prefer a dedicated file, i.e. the second one.  In any 
case, sounds good.

> On a different topic, the "https://avocado-project.org/data/assets" has
> enough bandwidth and can be used to hold this type asset.

I think it can’t hurt to put the kernel there, and then link to it in 
the cancel message.

> Alternatively,
> we can add a bit more automation to this test by letting people do something
> like:
> 
>   $ avocado assets register virtiofs-auto-submounts-vmlinuz /path/to/vmlinuz
> 
> And on the test:
> 
>   vmlinuz = self.fetch_asset('virtiofs-auto-submounts-vmlinuz')
> 
> And the test should cancel if that asset has not been previously registered.

Thanks, I wasn’t aware of this system.  Though I have no idea how 
“assets register” works, I can’t seem to find doc on it on
avocado-framework.readthedocs.io.  Is it global?  Is there a way to 
register an asset of a specific name only for a specific test?

Because I think this would make more sense if we tried to fetch the 
asset from e.g. https://avocado-project.org/data/assets, i.e. just put 
its name as linux-5.10.  Though perhaps it would also work with 
name='virtiofs-auto-submounts-vmlinuz', as you suggested.  But in any 
case, I’m a bit uneasy about a global namespace, which “assets register” 
seems to use.

Max


