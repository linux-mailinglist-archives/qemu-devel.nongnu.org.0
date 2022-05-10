Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC2520F8D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 10:14:19 +0200 (CEST)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noL0b-0008Av-RA
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 04:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKqM-0005vm-WD
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKqK-00044C-C8
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652169819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c8YCsPCGQinA30dkcvvUIq84j+lPg7YQpqaqkzjFq4=;
 b=YQn5K5mKBDKviDbDVurh+baspth+iLYUOjKf1ER9a31nsfbulHiONpb/2y76w5DK6yXju6
 RqwEdGVDezwf8J9jGgQfbxNhpQsxRcp6+m58H/mPSRI4tqN1wGAB5Ot51vkjGlHKTBaMv+
 SOQy9TbIfz38vP7DhZDLEOcsolo+q50=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-VLiR2lbYOTmgb1QUKh3r9A-1; Tue, 10 May 2022 04:03:38 -0400
X-MC-Unique: VLiR2lbYOTmgb1QUKh3r9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so895533wml.8
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 01:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=9c8YCsPCGQinA30dkcvvUIq84j+lPg7YQpqaqkzjFq4=;
 b=Y/G26siyUknjC8A+VZFBeKpKnssP0BDKFDP5VdiXsHOvdn1se9TAGSciXNgETOBm/b
 7/P927fqbuLyODpuReoLuCWOPqcT8sEUA4DOkXgO1W49lV7XMyZI5mfkB7X8/MzVnDf1
 xcewgjoa9/l5aimTQIW7KUaOnp+L3PS0/BF+KHleUU/5sOj2zDyRFyud2RMq6xlKuN6n
 FjQC8fN4OBX09rrEP9BJ4g+lt3NxiSCXcf2Akb2lQQqhJRctOj1AjjZeMI0H+GhBJ9Mb
 +v2lGtOFLedCpJHBRGHYlgZNTt9zB6CTIl/1WVOIYen6/Z5dKQjRpzhr5c7KyoaLur5K
 Ss3Q==
X-Gm-Message-State: AOAM533VK2t4/JuISuoB1USwhfSiDsepyaXGIre+b7M6natgg+9sVxHk
 H+ckNzu5S2jPAFHCCGi0l7DTGjG1A1e1Hex7VDz8VVmQVCAIdkgiOU4FDan+lPN7F0uWi2ZT3qX
 wCn4k+owvkXzScfI=
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13759061wrb.368.1652169816901; 
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSVEUGuZYc4bBrbU8ohk1SrFi9e5dtCzivgtmG0UzGLDaWFPvcrdEEQvi2hE1Ubaez5pyDfA==
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13759021wrb.368.1652169816453; 
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f3dsm1652346wmj.22.2022.05.10.01.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
Message-ID: <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
Date: Tue, 10 May 2022 10:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU 32-bit vs. 64-bit binaries (was: [PATCH] mos6522: fix linking
 error when CONFIG_MOS6522 is not set)
In-Reply-To: <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2022 16.48, Mark Cave-Ayland wrote:
> On 04/05/2022 15:26, Fabiano Rosas wrote:
> 
>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>
>>> On 03/05/2022 15:06, Fabiano Rosas wrote:
>>>
>>>> Murilo Opsfelder Araújo <muriloo@linux.ibm.com> writes:
[...]
>>>> So ppc64-softmmu doesn't quite do what it says on the tin. I think in
>>>> the long run we need to revisit the conversation about whether to keep
>>>> the 32 & 64 bit builds separate. It is misleading that you're explicitly
>>>> excluding ppc-softmmu from the `--target-list`, but a some 32 bit stuff
>>>> still comes along implicitly.
>>>
>>> Unfortunately for historical reasons it isn't quite that simple: the 
>>> mac99 machine in
>>> hw/ppc/mac_newworld.c is both a 32-bit and a 64-bit machine, but with a 
>>> different PCI
>>> host bridge and a 970 CPU if run from qemu-system-ppc64. Unfortunately it 
>>> pre-dates
>>> my time working on QEMU's PPC Mac machines but I believe it was (is?) 
>>> capable of
>>> booting Linux, even though I doubt it accurately represents a real machine.
>>
>> Well, what you describe is fine in my view, the 64-bit machine uses
>> qemu-system-ppc64. If there is shared code with 32-bit, that is ok.
>>
>> What I would like to understand is what is the community's direction
>> with this, do we want:
>>
>> 1) the 64-bit build to include all of the code and have it run all
>>     machines, or;
>>
>> 2) the 64-bit build to run only 64-bit machines and the 32-bit build to
>>     run only 32-bit machines.
>>
>> There are things such as 'target_ulong' that go against #1, and this
>> thread shows that we're not doing #2 as well.
>>
>> I know there have been discussions about this in the past but I couldn't
>> find them in the archives.
> 
> Certainly if a 64-bit Mac machine were to be added today, I'd be inclined to 
> copy mac_newworld.c into a separate file and give it a separate machine name 
> for ppc64 to make a clear distinction between the two machines (and allow 
> them to evolve separately). Unfortunately I have no idea as to what the 
> reference machine for the PPC64 Mac machine was supposed to be which makes 
> it harder to decide what to do :(
> 
> In my mind it feels like qemu-system-ppc is for 32-bit guests and 
> qemu-system-ppc64 is for 64-bit guests which I believe is consistent with 
> how it currently works with MIPS and ARM (someone feel free to correct me 
> here).

For CPUs that have both, 32-bit and 64-bit variants, we have mixed approaches:

1) For x86_64/i386, aarch64/arm, mips64/mips and ppc64/ppc, the 64-bit 
variants are a superset of the 32-bit variants, i.e. if you build the 64-bit 
version, you normally don't need the 32-bit version anymore (see below for 
the KVM-case where you still might need it).

2) For sparc64/sparc and riscv64/riscv32, the set of machines is distinct 
between the 64-bit and 32-bit versions (well, riscv has some machines 
shared, and some machines are different).

I once suggested in the past already that we should maybe get rid of the 
32-bit variants in case the 64-bit variant is a full superset, so we can 
save compile- and test times (which is quite a bit for QEMU), but I've been 
told that the 32-bit variants are mostly still required for supporting KVM 
on 32-bit host machines.

But in the long run, I think we rather want to converge everything into one 
binary (to decrease testing and compilation time) instead of separating 
stuff into multiple binaries, so IMHO we should not start separating the 
32-bit machines into qemu-system-ppc and the 64-bit-only machines into 
qemu-system-ppc64 now.

  Thomas


