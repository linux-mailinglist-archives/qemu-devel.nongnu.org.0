Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF6A30DF3C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:09:59 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kj8-0000e4-RQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7Kfa-0005Zk-48
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KfU-00064Y-Gg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93JGfjs/l2EA/9kk1qBaa364iqPDF/8w0EyOuT1SFCQ=;
 b=cI2MCRBoj9QgWnV1Cxv8ER0kadqll+b8VuZSGqo14INBZnI7Oz9kQR75aRdtwcDTvrvc90
 4FKNnARkSoHIaYnFdQU4Xl2O/uoMyMpKyZqkkvJTbqaRVezBkK8aiFxFuTU2Vu5mA1RxLA
 Eok6DavssNBpsbOMQU/8RN88axX1ugw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-ni-VPFkeMruFHIQHgNZEVw-1; Wed, 03 Feb 2021 11:06:04 -0500
X-MC-Unique: ni-VPFkeMruFHIQHgNZEVw-1
Received: by mail-ed1-f71.google.com with SMTP id bo11so76189edb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93JGfjs/l2EA/9kk1qBaa364iqPDF/8w0EyOuT1SFCQ=;
 b=RM5t0XtstCYBkVasFLbC1RXkARqqqNy+OQXUZr3XPscuvALN4BKaYg5Qs0//lOqU7k
 CXM2CjN8pOFBjqbunlwkhdd4dQtcr8wwdS+G3FsZpJnh5MHFgYGJDUdZOoJNO+7DdYLD
 OJdqYacPLuf1Hk5vGF9Q61aIXKMrE9WEkQJNfbIv1f4WeXcmO/TGD4C7B3pd6A5YcJUP
 UJ3MeWUIXaqqkbWnFdAwX6niZdPfYm6DzqIZxoJ5Gj26O6hYxMw9efSZ6j4Yf5orFGuu
 AIDnvxNFz9BZWuBRVUXuD5AP3mE9/jc4XdRh4TPMxxhGUhCbPNKiJv91RO3cb6MevTRV
 X5kw==
X-Gm-Message-State: AOAM533FV6mle8I5YqUT1LEqSmtYHfT3iGCVCZyETP7nOspXNawGCxgk
 /NcJWJIxf0TxuATENoS9YZzIf1ZsxC+Gt4a3JzS8h9jYmh5SifnOW9CTrakwIMsoKZvdcsJ9w2F
 2JkUHhvkdrKHjDGI=
X-Received: by 2002:a05:6402:149:: with SMTP id
 s9mr3672983edu.247.1612368363364; 
 Wed, 03 Feb 2021 08:06:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQMAQ8cHuGYY8MUGDglhP1ppIJ5KZCWyUBc2BEKBoxHvdotzvATi5vcRR1tzO9bDm3EE5orQ==
X-Received: by 2002:a05:6402:149:: with SMTP id
 s9mr3672937edu.247.1612368363156; 
 Wed, 03 Feb 2021 08:06:03 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id b2sm775585edk.11.2021.02.03.08.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:06:02 -0800 (PST)
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
To: avocado-devel <avocado-devel@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
 <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
 <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
 <CAFEAcA8hJ7bQeQNdWB6Rg4P7RzYmcXZmQKm7pnDAOutADHe9jA@mail.gmail.com>
 <20804096-7b34-9d79-1d93-fa9a31bbfd66@redhat.com>
 <20191021145729.GC5837@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <efbad09a-edd1-1806-1b4a-80bfad23f8d0@redhat.com>
Date: Wed, 3 Feb 2021 17:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20191021145729.GC5837@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, patchew-devel@redhat.com,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test idea.

On 10/21/19 4:57 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
>> Cc'ing Paolo/David.
>>
>> On 10/21/19 11:39 AM, Peter Maydell wrote:
>>> On Mon, 21 Oct 2019 at 10:34, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> On 10/21/19 11:22 AM, Peter Maydell wrote:
>>>>> On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> ---
>>>>>
>>>>>>    hw/arm/virt.c             | 2 +-
>>>>>
>>>>> I think from a quick code scan that this is ok, but did
>>>>> you test that migration compat from old to new still works?
>>>>> I vaguely recall that there are some cases when adding an
>>>>> owner to a memory region changes the name string used for
>>>>> identifying the ramblock in migration.
>>>>
>>>> It seems to still works:
>>>>
>>>> $ make check-qtest-aarch64 V=1
>>>
>>>> This test migrate the virt machine.
>>>>
>>>> Is this enough?
>>>
>>> No, you need to test migration from a QEMU binary without
>>> this patchset to a QEMU binary that has it. Otherwise you're
>>> only checking that the new version can migrate from itself
>>> to itself. I find the easiest way to test this is just to
>>> use the 'savevm' command to save a state snapshot to a
>>> qcow2 disk image while running the old binary, and then run
>>> 'loadvm' with the new binary and check it restored OK.
>>
>> I did not think if this case.
>>
>> I followed your blog post [*] and tested the migration works OK.
>>
>> Paolo, now thinking about regular testing, we should add this testing to
>> patchew too. Something like:
>>
>> - when mainstream/master is updated, patchew build QEMU (it should be
>> already mostly ccached) and generate some vm dumps with 'savevm'.
>>
>> - build/test the series
>>
>> - if series succeeded testing, run 'loadvm' tests
>>
>> [*] https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/
> 
> Avocado certainly already has an option for specifying source and
> destination qemu separately; I've used that for testing
> cross version in the past.
> 
> The challenge is finding a command line/set of devices for each
> architecture that's expected to be stable.
> You want a command line with as big a set of devices as possible (for
> coverage) yet really is tied to machine type.
> 
> Dave
> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


