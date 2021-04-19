Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D6364DA8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 00:29:43 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYcOj-0007jY-K8
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 18:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYcNc-0007IG-GD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 18:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYcNZ-0007Qj-9h
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 18:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618871307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzwzCqCP+aM33wJLrf7XhAPpLuEUhse8LqiN9fqbC3w=;
 b=dcH7YTA5M0lkxg438gtGJX8XxGnuTdBprsURm/wrc/EUQQv66eWX/Pfs8gi5e3ex6N0uKy
 ZGjxhbIb4UlvyMVhHwhF/mTFnhNnmKFx5COzHQcqJUSqc0zp44qM1hIwIHqC4PeG+wMUtb
 6Oit+4GG1uPH+WxZCABUzr8KW3uMfco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-n5xZRKIAN6GAAFa0g8o88g-1; Mon, 19 Apr 2021 18:28:23 -0400
X-MC-Unique: n5xZRKIAN6GAAFa0g8o88g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FAF501EC;
 Mon, 19 Apr 2021 22:28:22 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7852860CED;
 Mon, 19 Apr 2021 22:28:14 +0000 (UTC)
Subject: Re: [PATCH 2/3] Acceptance Tests: move definition of distro checksums
 to the framework
To: Cleber Rosa <crosa@redhat.com>
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-3-crosa@redhat.com>
 <bc2b4167-4f4a-3c21-0283-3bf8b32a63b2@redhat.com>
 <20210419183532.GA2114760@amachine.somewhere>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cdc621ec-a42d-a4c7-500e-4cdec44747ab@redhat.com>
Date: Mon, 19 Apr 2021 19:28:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210419183532.GA2114760@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/19/21 3:35 PM, Cleber Rosa wrote:
> On Mon, Apr 19, 2021 at 12:25:44PM -0300, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 4/14/21 7:14 PM, Cleber Rosa wrote:
>>> Instead of having, by default, the checksum in the tests, and the
>>> definition of tests in the framework, let's keep them together.
>>>
>>> A central definition for distributions is available, and it should
>>> allow other known distros to be added more easily.
>>>
>>> No behavior change is expected here, and tests can still define
>>> a distro_checksum value if for some reason they want to override
>>> the known distribution information.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    tests/acceptance/avocado_qemu/__init__.py | 34 +++++++++++++++++++++--
>>>    tests/acceptance/boot_linux.py            |  8 ------
>>>    2 files changed, 32 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>>> index aae1e5bbc9..97093614d9 100644
>>> --- a/tests/acceptance/avocado_qemu/__init__.py
>>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>>> @@ -299,6 +299,30 @@ def ssh_command(self, command):
>>>            return stdout_lines, stderr_lines
>>> +#: A collection of known distros and their respective image checksum
>>> +KNOWN_DISTROS = {
>> Do you plan to expand that mapping to record values other than checksums?
>> Otherwise it could be named KNOWN_DISTROS_CHECKSUMS.
>>
> Let's just say I had an intuition about it being used for other
> purposes.  Talking to Eric Auger earlier this morning, he will expand
> this mapping with default kernel args distros, so that he can *add*
> to the common args.
Ok
>
>>> +    'fedora': {
>>> +        '31': {
>>> +            'x86_64':
>>> +            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
>>> +            'aarch64':
>>> +            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>>> +            'ppc64':
>>> +            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>>> +            's390x':
>>> +            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +
>>> +def get_known_distro_checksum(distro, distro_version, arch):
>>> +    try:
>>> +        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('checksum')
>>> +    except AttributeError:
>>> +        return None
>>> +
>>> +
>> Currently we have a few loose methods on avocado_qemu/__init__.py, and I'm
>> about to send a series to wrap them in a mixin class. This series will
>> introduce more loose code on the file; so would you consider moving
>> KNOWN_DISTROS and get_known_distro_checksum() to the LinuxTest class, and
>> possibly making the latest a class method?
>>
> Some of our experience in "avocado.Test" revealed that users would:
>
>    1) find it confusing to have so many methods in the class that are not useful
>       to them
>
>    2) would conflict with variables/attributes of their own
>
> About #2, we end up turning a lot of variables atttributes into
> properties so that errors would be explicit when users tried to
> overwrite them unknowingly.
>
> But, in the specific example of KNOWN_DISTROS and its expansion I
> mentioned before, it may indeed make sense to have a Test or LinuxTest
> method that test writers can use.  It'd probably need to be a bit more
> generic and evolved than this current version though.
>
> Maybe wait for Eric's input based on real world use case here?
Sure, we can wait on Eric's input.
>
>>>    class LinuxTest(Test, LinuxSSHMixIn):
>>>        """Facilitates having a cloud-image Linux based available.
>>> @@ -348,14 +372,20 @@ def download_boot(self):
>>>            vmimage.QEMU_IMG = qemu_img
>>>            self.log.info('Downloading/preparing boot image')
>>> +        distro = 'fedora'
>>> +        distro_version = '31'
>>> +        known_distro_checksum = get_known_distro_checksum(distro,
>>> +                                                          distro_version,
>>> +                                                          self.arch)
>>> +        distro_checksum = self.distro_checksum or known_distro_checksum
>>
>> distro_checksum may be None. In this case vmimage.get() will silently skip
>> the check? I suggest to log a warn message.
>>
>>
> Yes, good point.  But, I think adding that warning to Avocado's
> vmimage.get() method itself is even better.  What do you think?

I like the idea. IMHO avocado_qemu should be a thin layer upon Avocado, 
so such as kind of code should live on avocado's side.

I just opened the PR: https://github.com/avocado-framework/avocado/pull/4539

- Wainer

>
> Thanks for the review!
> - Cleber.


