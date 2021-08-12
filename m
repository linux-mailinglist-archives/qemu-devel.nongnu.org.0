Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B673E9F66
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 09:24:02 +0200 (CEST)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE54L-0007Of-Ei
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 03:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE53W-0006aA-5z
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 03:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE53S-0003Th-UG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 03:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628752985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g//A56dxwyV1BiLecDUoY++xMeQa7EYcEh317e/Zj+E=;
 b=bVHAZTSwlkHrSy+4VPKU0634w4ekH1Fd6KlcyYU2i+oQxcJkGh7A/si6HRPXudjpamlJzj
 E6f27Dr0PVFik9S3VX3pHvjBnnxIrSkFCcLAf/Vr286c+AXIJxhpisvq2qQScsayX3Xc4C
 34yZH0IPJK97hNaLQP277JC3Sr59qHk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-iYd_qKzCNNu--_MwAmYGyA-1; Thu, 12 Aug 2021 03:23:03 -0400
X-MC-Unique: iYd_qKzCNNu--_MwAmYGyA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso1008601wru.20
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 00:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g//A56dxwyV1BiLecDUoY++xMeQa7EYcEh317e/Zj+E=;
 b=YrP7mU2XzqdehO30M44zgPVUvEU7tA35Xz7dE2oFYJcparqWJwPZYHp7C0fr+qHcpZ
 IU9K1Q/+iQit1bTS3099Q+st1ysFHMDSUSqiwYadPVWg9mt/NxDiuDM90C4X67eLI3Mj
 xhpImNTmmRkQnNyspnFuf9MzBvNTuErEHesoa3xBrIHyjTbFXX0irFRRnbCURFeZ6lAA
 dCuwzXedYTKbHcf0tawBJQzkD+dNMxD6nlHnj9xJXiGhTJoQizRCRMjnBASOiH87upKW
 HvSY+UJz6r5ZAhKV+JXEpMhlqyzxM0mHX7TrwZIdJT2vXLx61HlvzqKFNXNbAINtkvER
 RZCQ==
X-Gm-Message-State: AOAM530qjnQPKiWcjVmwDs3JmKMShRuMh1LL0b8rzIzbYIm2+bLLlWVU
 5lMjOz4lQfYQRt7g/N8td++ofPiv6GorHm44a0lPjH6hpfnKpveWlzZmkAY4i1KSAX3SHw4Cmyn
 /EKkePpdP7D8S7bA=
X-Received: by 2002:adf:8b86:: with SMTP id o6mr2329730wra.116.1628752981298; 
 Thu, 12 Aug 2021 00:23:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw871Ti7aLsPIafUAljMTQugGrpFs0T9rYzr1zD44PhWpFqjPCw9Qe87wapoV5cZAqyuAYD5g==
X-Received: by 2002:adf:8b86:: with SMTP id o6mr2329705wra.116.1628752981040; 
 Thu, 12 Aug 2021 00:23:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z15sm1867162wrp.30.2021.08.12.00.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 00:23:00 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: David Gibson <david@gibson.dropbear.id.au>, Thomas Huth
 <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
 <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
 <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com> <YRR79WcXu7SDmfJ/@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4dd91438-5116-83e3-8994-f299fb7c52de@redhat.com>
Date: Thu, 12 Aug 2021 09:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRR79WcXu7SDmfJ/@yekko>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 3:40 AM, David Gibson wrote:
> On Wed, Aug 11, 2021 at 11:07:31AM +0200, Thomas Huth wrote:
>> On 10/08/2021 11.09, Cédric Le Goater wrote:
>>> On 8/10/21 10:36 AM, Joel Stanley wrote:
>>>> On Tue, 10 Aug 2021 at 08:34, Cédric Le Goater <clg@kaod.org> wrote:
>>>>>
>>>>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>>>>> with a simple PCI layout.
>>>>>
>>>>> Cc: Cleber Rosa <crosa@redhat.com>
>>>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>>   tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>>>>>   1 file changed, 42 insertions(+)
>>>>>
>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>>>> index 5248c8097df9..da93a475ca87 100644
>>>>> --- a/tests/acceptance/boot_linux_console.py
>>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>>> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>>>>>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>>>>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>>>>
>>>>> +    def do_test_ppc64_powernv(self, proc):
>>>>> +
>>>>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>>>>> +
>>>>> +        skiboot_url = images_url + 'skiboot.lid'
>>>>> +        skiboot_hash = 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a4980efaf154f4a29'
>>>>> +        skiboot_path = self.fetch_asset(skiboot_url, asset_hash=skiboot_hash,
>>>>> +                                       algorithm='sha256')
>>>>
>>>> What's the thought that led you to using this instead of the one that
>>>> gets packaged with qemu?
>>>
>>> Good question.
>>>
>>> I considered that the skiboot.lid shipped with QEMU was somewhat a default
>>> to make things work. The official released versions are the ones used by
>>> the outside world on real systems and were a better target for tests.
>>>
>>> That said, using the default version might be enough. Maintainers, please
>>> advise !
>>
>> IMHO:
>>
>> - We want to test the things that *we* ship

I'd clarify here:

- We want to test "in the default pipeline" the things that *we* ship

>>
>> - We want to download as few things as possible, since downloads
>>   often slow down the tests and break CI runs if the network to
>>   the download site is not available
>>
>>  ==> I'd prefer to use the internal skiboot.lid unless there is
>>      really a compelling reason to use the external one.
>>
>> Just my 0.02 € though.
> 
> I agree 100%.  If the internal skiboot isn't the "real" one, then we
> should update it to something that is.

Here I'm in favor in adding the external skiboot as a non-default
test. So tests are shared in mainstream, and forks willing to run
them can opt for it. The current simplest way to do that is using
environment variables [*], and tag your tests with @skipUnless.
I.e.:

  def do_test_ppc64_powernv(self, proc, use_internal_skiboot_lid):
      ....

  def test_ppc_powernv8(self):
      self.do_test_ppc64_powernv('P8', true)

  @skipUnless(os.getenv('TEST_BLEEDING_EDGE_SKIBOOT'),
              'Restricted to internal skiboot.lid')
  def test_ppc_powernv8_bleeding_edge(self):
      self.do_test_ppc64_powernv('P8', false)

[*] https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables


