Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376882A638D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 12:47:08 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaHFr-0000Xy-9h
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 06:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaHEZ-0008Fi-Ax
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaHEW-0003wt-U5
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604490342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTz4BIu+lJhge0597cwPjRjpeauN6Tp6qnwXKuuktqA=;
 b=Mmu/2tHEtakti+iCFCqHJYZvmxbdoGs7LljYIwihHEszq+9auzPdxSh9wGr5hxXrfPm330
 m4y1R95mzGmyQO7y96dKo2Bsr6dOW1kPhGE7Ng4tQX3kwHuCctTjJqojr0Rr/hNl/h/d1H
 XDpHqzQoL0Vk7MaDHjVL4xRoO+2Y7TM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-qZ4sCBukNpSS3mug1QO1Kw-1; Wed, 04 Nov 2020 06:45:41 -0500
X-MC-Unique: qZ4sCBukNpSS3mug1QO1Kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E8D1868426;
 Wed,  4 Nov 2020 11:45:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57F0D5C1D0;
 Wed,  4 Nov 2020 11:45:27 +0000 (UTC)
Subject: Re: [PATCH-for-5.2? 3/5] tests/acceptance: Skip incomplete
 virtio_version tests using '@skip'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-4-philmd@redhat.com>
 <6fd67527-b887-54c5-8de6-4f54c8d66934@redhat.com>
 <68b4585b-2cfd-7b24-af63-674d004d8e51@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <92822f0a-5b47-6772-9956-c050f736bbc3@redhat.com>
Date: Wed, 4 Nov 2020 12:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <68b4585b-2cfd-7b24-af63-674d004d8e51@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2020 12.27, Philippe Mathieu-Daudé wrote:
> On 11/4/20 12:13 PM, Thomas Huth wrote:
>> On 02/11/2020 15.42, Philippe Mathieu-Daudé wrote:
>>> Prefer skipping incomplete tests with the "@skip" keyword,
>>> rather than commenting the code.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  tests/acceptance/virtio_version.py | 11 +++++++----
>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
>>> index 33593c29dd0..187bbfa1f42 100644
>>> --- a/tests/acceptance/virtio_version.py
>>> +++ b/tests/acceptance/virtio_version.py
>>> @@ -140,17 +140,20 @@ def check_all_variants(self, qemu_devtype, virtio_devid):
>>>          self.assertIn('conventional-pci-device', trans_ifaces)
>>>          self.assertNotIn('pci-express-device', trans_ifaces)
>>>  
>>> +    @skip("virtio-blk requires 'driver' parameter")
>>
>> Shouldn't that be 'drive' instead of 'driver' ?
> 
> No clue, this is the previous commented line.
> 
>>
>>> +    def test_conventional_devs_driver(self):
>>> +        self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
>>> +
>>> +    @skip("virtio-9p requires 'fsdev' parameter")
>>> +    def test_conventional_devs_fsdev(self):
>>> +        self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
>>>  
>>>      def test_conventional_devs(self):
>>>          self.check_all_variants('virtio-net-pci', VIRTIO_NET)
>>> -        # virtio-blk requires 'driver' parameter
>>> -        #self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
>>>          self.check_all_variants('virtio-serial-pci', VIRTIO_CONSOLE)
>>>          self.check_all_variants('virtio-rng-pci', VIRTIO_RNG)
>>>          self.check_all_variants('virtio-balloon-pci', VIRTIO_BALLOON)
>>>          self.check_all_variants('virtio-scsi-pci', VIRTIO_SCSI)
>>> -        # virtio-9p requires 'fsdev' parameter
>>> -        #self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
>>
>> I think I'd prefer to keep the stuff commented ... otherwise it will show up
>> in the logs, giving the impression that you could run the tests somehow if
>> you just provided the right environment, which is just not possible right now.
> 
> Well, we usually don't commit commented code like that.
> If it is committed, it is important, then it has to show up in
> the log. If you don't want it logged, why not remove it then?

Then I'd rather remove it. Or leave a comment saying "we cannot exercise
virtio-9p-pci and virtio-blk-pci here (yet) since they need additional
parameters to be set".

 Thomas



