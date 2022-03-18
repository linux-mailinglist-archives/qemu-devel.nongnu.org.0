Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC84DD5E4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:16:46 +0100 (CET)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV7mv-00022l-Be
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:16:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nV7lU-0001Lx-Kc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:15:16 -0400
Received: from [2001:41c9:1:41f::167] (port=47238
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nV7lT-00010z-0a
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:15:16 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nV7ka-0007Qx-02; Fri, 18 Mar 2022 08:14:20 +0000
Message-ID: <d710c6e1-a9b7-ed0d-ca23-c4315355268c@ilande.co.uk>
Date: Fri, 18 Mar 2022 08:14:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
 <20220306163119-mutt-send-email-mst@kernel.org>
 <20220307093918.00002f20@Huawei.com> <YihiHNxVjDFI0Z8r@xz-m1.local>
 <20220309112827.00002c73@Huawei.com> <Yimwjtd8SsVLOU5e@xz-m1.local>
 <20220316165034.000037e7@Huawei.com>
 <1efbfeeb-2598-57c5-2e2d-4f5fa2538aa7@ilande.co.uk>
 <20220316175846.00007463@Huawei.com> <20220316182618.00003ce5@Huawei.com>
 <31f383e6-01bb-cf9a-6af8-d0f1821b3fd1@ilande.co.uk>
 <20220317164723.00001c14@huawei.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220317164723.00001c14@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 00/46] CXl 2.0 emulation Support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Samarth Saxena <samarths@cadence.com>, Chris Browy <cbrowy@avery-design.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Shreyas Shah <shreyas.shah@elastics.cloud>,
 linuxarm@huawei.com, linux-cxl@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 David Hildenbrand <david@redhat.com>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2022 16:47, Jonathan Cameron via wrote:

>> Ah great! As you've already noticed my particular case was performing partial
>> decoding on a memory region, but there are no issues if you need to dispatch to
>> another existing address space such as PCI/IOMMU. Creating a separate address space
>> per device shouldn't be an issue either, as that's effectively how the PCI bus master
>> requests are handled.
>>
>> The address spaces are visible in "info mtree" so if you haven't already, I would
>> recommend generating a dynamic name for the address space based upon the device
>> name/address to make it easier for development and debugging.
> info mtree already provides the following with a static name
> address-space: cxl-type3-dpa-space
>    0000000000000000-000000000fffffff (prio 0, nv-ram): cxl-mem2
> 
> So the device association is there anyway.  Hence I'm not sure a dynamic name adds
> a lot on this occasion and code is simpler without making it dynamic.

Is this using a single address space for multiple memory devices, or one per device 
as you were suggesting in the thread? If it is one per device and cxl-mem2 is the 
value of the -device id parameter, I still think it is worth adding the same device 
id into the address space name for the sake of a g_strdup_printf() and corresponding 
g_free().

Alas I don't currently have the time (and enough knowledge of CXL!) to do a more 
comprehensive review of the patches, but a quick skim of the series suggests it seems 
quite mature. The only thing that I noticed was that there doesn't seem to be any 
trace-events added, which I think may be useful to aid driver developers if they need 
to debug some of the memory access routing.

Finally I should point out that there are a number of more experienced PCI developers 
on the CC list than me, and they should have the final say on patch review. So please 
consider these comments as recommendations based upon my development work on QEMU, 
and not as a NAK for proceeding with the series :)


ATB,

Mark.

