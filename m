Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503F407C62
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 10:17:18 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKft-0003BY-KX
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 04:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mPKeK-0002Qf-AZ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 04:15:40 -0400
Received: from relay.yourmailgateway.de ([188.68.63.165]:59657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mPKeH-0006lr-7D
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 04:15:39 -0400
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4H6j9024Hqz3rxM;
 Sun, 12 Sep 2021 10:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1631434532; bh=0DSOMxU3FJyhUu2hKm6P1CgLBQAymMJ9ANnHlP1/QPs=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=heCAwH45fs9ySL54hZzWaC7k48i1/0qx2gq9pILIPQbtQkAiNCEOEecUW8IdnnZDp
 tmQ6adg5yc6NFdoqal7UsgjV+nbUGzVr/mL3eTCqzQyvhHm3zZNY+PM27fXc+Ri5dP
 x9iS2IGKn1fSqkcJHxvT2OvPlS24cZIdARzce97ignA4NDzVoMLY531nRti0pymmee
 O/rJJ2NCLTp+we6O6qw80db6nz68B1og1KgPtUuHbP/6ZqK1UWY7aUY6Edn6qzg7Az
 SdrUSQwf100YCOjO+PYrNYQIctN6FM8qMi/EjkedvEtiMN0fb6T7eFE8RF+YVA9dE+
 yYuJtuPmm/b1Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4H6j901g2Qz3rrd;
 Sun, 12 Sep 2021 10:15:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4H6j8z274Jz8sgx;
 Sun, 12 Sep 2021 10:15:31 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-41.hsi16.unitymediagroup.de
 [95.223.69.41])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 922CA6516C;
 Sun, 12 Sep 2021 10:15:30 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.41) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
 <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
 <43043204-cb7a-5726-ecfc-9dad504f6aa3@zapateado.de>
 <3e6ea8d1-b275-206c-1888-eb3cfc2c7ebe@ilande.co.uk>
Message-ID: <aeb93f88-f2ec-9124-539c-5b0e393f0305@zapateado.de>
Date: Sun, 12 Sep 2021 10:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3e6ea8d1-b275-206c-1888-eb3cfc2c7ebe@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <163143453090.19476.11146210290545859654@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: EuVC3b80SOmnwu870gxNW5huK8sjY4D50gEiJhmygAB7
Received-SPF: pass client-ip=188.68.63.165; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.09.21 um 11:30 schrieb Mark Cave-Ayland:
> On 11/09/2021 10:17, Helge Konetzka wrote:
> 
>> Am 11.09.21 um 11:03 schrieb Mark Cave-Ayland:
>>
>>> So the question is: what has changed? I find it hard to believe that 
>>> MSYS2/MingW64 is configured out-of-the-box to break a standard 
>>> "./configure && make" build incantation.
>>>
>>
>> On my last attempt to build qemu without 
>> --cross-prefix=x86_64-w64-mingw32- (qemu-6.1.0.tar.xz) for building 
>> target soft-mmu-x86_64 I received
>>
>> make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'.  
>> Stop.
>> make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
>> make: *** Waiting for unfinished jobs....
>> ...
>> [1599/1599] Generating QAPI rST doc reference newline-sanitized with a 
>> custom command (wrapped by meson to capture output)
>> ==> ERROR: A failure occurred in build().
>>      Aborting...
> 
> Ah the multiboot.bin failure is a known issue with symlinks - see 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg750968.html and 
> unfortunately the wiki didn't get updated accordingly :(
> 
> Helge, can you test and see if this fixes your build issue?

Thanks for pointing to this thread. But I wasn't able to go exactly the 
described way.

I've finally succeeded in building Qemu natively from tarball using 
symlinks configuring winsymlinks:native instead of described 
winsymlinks:nativestrict. I haven't been able to build Qemu from git 
sources with symlinks active because of configure failures.

Comparing the native build with the cross build shows that 
pc-bios/optionrom/Makefile is only executed for native builds.

To build Qemu natively on default Msys2, I've found an alternative way 
WITHOUT creating symlinks by adjusting the copied (instead of linked) 
Makefile in build tree:

cd qemu
./configure
SMF="../../../pc-bios/optionrom/Makefile"
BMF="build/pc-bios/optionrom/Makefile"
[ -L $BMF ] || sed -i "s%^\(CURRENT_MAKEFILE\) := .*$%\1 = $SMF%" $BMF
make

The unit tests pass. Build succeeds on git sources and on tarball.

Regards, Helge.

