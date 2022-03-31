Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CE4EE3D1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:08:36 +0200 (CEST)
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na2y3-0000mu-9y
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:08:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1na2wl-0008WM-N2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 18:07:15 -0400
Received: from mta02.hs-regensburg.de ([194.95.104.12]:48670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1na2wi-0007iw-Vd
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 18:07:15 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KTy863HlRzy9W;
 Fri,  1 Apr 2022 00:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta02-20211122; t=1648764422;
 bh=ux07M3NISOdDLv+80QWZRtcHDyKCXi7gqtEX58I62fA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=poqb4kcVsnoKVgBgz2GJRiw2H2LVZqwXy6JWuUf7a2Qg7RyWMxa7fE3WYWxAgbNld
 XWqt6s+r8ortrF2ynqIBFY4xnchq5a50rNiTEWU/c06jaz9D8fYttttDRsM0NldAw+
 qHUIQbmdY0zqqSxUUQTMaFIjglLajJXQjtSW6xHuq/ydNykBPWg+1DrblfRJ+aCRfm
 nr2tJMK0WlWyRHbBwtK9Du+e87FrZn7rQliypb9P7HlWLgmKkO4AF5KTtgcfbk+Nkl
 pIFf0B3TjVjcA3RcZT0Okc59rDZ/BxF5cPVm3yoKzkz+2poEswSaO/P6iroYyBGcr7
 OIdwOY7nGaFJA==
Received: from [IPV6:2a02:810d:8fc0:44bc::da43] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Apr 2022 00:07:01 +0200
Message-ID: <a3326b8d-9b52-04b5-799a-07ab880bf0c8@oth-regensburg.de>
Date: Fri, 1 Apr 2022 00:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: [PATCH] hw/riscv: virt: Warn the user if -bios is
 provided when using KVM
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
 <Yjw1At8ig+UzFKXn@redhat.com>
 <CAKmqyKMaRuw552K9zU+maKgHpfVC42j00pD++vdw1hg8posRgw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAKmqyKMaRuw552K9zU+maKgHpfVC42j00pD++vdw1hg8posRgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.12;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta02.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/03/2022 02:11, Alistair Francis wrote:
> On Thu, Mar 24, 2022 at 7:08 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Wed, Mar 23, 2022 at 06:13:46PM +0100, Ralf Ramsauer wrote:
>>> The -bios option is silently ignored if used in combination with -enable-kvm.
>>> The reason is that the machine starts in S-Mode, and the bios typically runs in
>>> M-Mode.
>>>
>>> Warn the user that the bios won't be loaded.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>   hw/riscv/virt.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index 4496a15346..a4d13114ee 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machine)
>>>        * when KVM is enabled.
>>>        */
>>>       if (kvm_enabled()) {
>>> +        if (machine->firmware && strcmp(machine->firmware, "none"))
>>> +            warn_report("BIOS is not supported in combination with KVM. "
>>> +                        "Ignoring BIOS.");
>>
>> If the usage scenario isn't supportable, then ultimately we should be
>> raising an error and immediately exiting.
>>
>> If you know of common usage that is already mistakenly passing -bios,
>> then we could start with a warning and list it as deprecated, then
>> change to an error_report 2 releases later. If we don't thing people
>> are often mistakenly passing -bios, then go straight for error_report
>> and exit.
> 
> That's a good point. The original thinking was that we did support
> -bios and so we should warn the user that it's unlikely they want to
> use it. This would still allow S mode UEFI loaders to be used (they
> don't exist today).
> 
> Considering we are currently just ignoring the option I agree it's
> better to report an error.
> 
> Do you mind sending a v2 Ralf?

Yes, will return with another revision. Anyway, I'll choose to exit 
immediately, as I doubt that there are any non-development users of this 
particular feature (RISCV/Qemu + KVM) due to the lack of physical hardware.

Thanks
   Ralf

> 
> Alistair
> 
>>
>>>           g_free(machine->firmware);
>>>           machine->firmware = g_strdup("none");
>>>       }
>>> --
>>> 2.32.0
>>>
>>>
>>
>> With regards,
>> Daniel
>> --
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>>

