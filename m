Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE73E8D03
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:16:27 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkLa-0001of-Qj
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDkD5-0008JZ-F6
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDkD3-0000kD-R2
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628672856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Di//N0V8UBqPSWu534sBXFlDY4vvy00KZwxOASOyZG8=;
 b=dvzQJIT0k1t3nz6mxjXQPWlozm31fRKQ81WvMkHyjKuzLkP9UNz0mHc4unfAEk1LgbgkRw
 ft0zZP3nH4jeJUCWbzZbLI18o8YnhmViCUBbUshsi/zl9uKNeFu9NMjfP1j9wz5y3KvTVd
 fp3juN/x+r11ATN6TYf7+FpJPNs1DQk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-VE8MA-26MuqhsA6Cv1g9xQ-1; Wed, 11 Aug 2021 05:07:34 -0400
X-MC-Unique: VE8MA-26MuqhsA6Cv1g9xQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso476504wrs.22
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 02:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Di//N0V8UBqPSWu534sBXFlDY4vvy00KZwxOASOyZG8=;
 b=d4XmhkA/jvYTMaEuou3xeEAbtQyZQMb0OVoxrViwgYWduEE9Ficm/ql/X8sWi9Y7JV
 DilP4icywObiywwhWh81QkdKrq5fpYkwg21/g86HwSSL9EOjj74wzH5dFftj1CP29jnY
 JM7xZuIcjR36b0LnRc+xkaAGCeBzVJLAAQt4qZeqgL1jlujdexAfELG3RXgJf2enhW/9
 J26uQnSX9UBbq529oaWQPqW4hscpdPWA6KgIvkTL9xhq/z00y0JYyNGMNxqWZIt5fx/B
 SbSnb5whI2FrElTcwlhzQe63zOhr5xmag0VqhFwuJjFAp/R4vYOoGE51P6t4ymgjDc1D
 g7YQ==
X-Gm-Message-State: AOAM531KJ4zaW5ppugH5I1p+esTAZNgfHR3Som0Onr7dFN5FI2m8/jM1
 5R1RXCd+4iThdyt9om2O+FoAiTKAvVWbwadI1nno8Iiv6M4S/s5eAkhAxU4C1Foji0+TM3vmS63
 2ohpvegwCa/S3jqo=
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr15643566wrs.188.1628672853427; 
 Wed, 11 Aug 2021 02:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkTgjCqFXV6B73TSqq/GgdgTCN7DezL/DROy/S58Gf4WBkbb5Uh4Rk13IPDePnWSzkgGMhMA==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr15643546wrs.188.1628672853227; 
 Wed, 11 Aug 2021 02:07:33 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u23sm5369125wmc.24.2021.08.11.02.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 02:07:32 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
 <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
Date: Wed, 11 Aug 2021 11:07:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 11.09, Cédric Le Goater wrote:
> On 8/10/21 10:36 AM, Joel Stanley wrote:
>> On Tue, 10 Aug 2021 at 08:34, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>>> with a simple PCI layout.
>>>
>>> Cc: Cleber Rosa <crosa@redhat.com>
>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>>>   1 file changed, 42 insertions(+)
>>>
>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>> index 5248c8097df9..da93a475ca87 100644
>>> --- a/tests/acceptance/boot_linux_console.py
>>> +++ b/tests/acceptance/boot_linux_console.py
>>> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>>>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>>
>>> +    def do_test_ppc64_powernv(self, proc):
>>> +
>>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>>> +
>>> +        skiboot_url = images_url + 'skiboot.lid'
>>> +        skiboot_hash = 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a4980efaf154f4a29'
>>> +        skiboot_path = self.fetch_asset(skiboot_url, asset_hash=skiboot_hash,
>>> +                                       algorithm='sha256')
>>
>> What's the thought that led you to using this instead of the one that
>> gets packaged with qemu?
> 
> Good question.
> 
> I considered that the skiboot.lid shipped with QEMU was somewhat a default
> to make things work. The official released versions are the ones used by
> the outside world on real systems and were a better target for tests.
> 
> That said, using the default version might be enough. Maintainers, please
> advise !

IMHO:

- We want to test the things that *we* ship

- We want to download as few things as possible, since downloads
   often slow down the tests and break CI runs if the network to
   the download site is not available

  ==> I'd prefer to use the internal skiboot.lid unless there is
      really a compelling reason to use the external one.

Just my 0.02 € though.

  Thomas


