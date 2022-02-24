Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF434C2B2E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:49:24 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCcc-0005ig-Vn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nNCWt-0004Ll-JL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:43:27 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nNCWq-0005uJ-IS
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:43:27 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4272C20770;
 Thu, 24 Feb 2022 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645703002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suRoupgWcDoJhffVuDpcgIR5QwSobNDw/NzbEWPsjcQ=;
 b=T6az+wh5faQ1GCcRsUO2Q2sMq8JxRQ1Ql9SAaw2SThB5Xe+R4AAUBy6Wzyp+6lHpS8twkI
 5N30OF8qYV4UUIxmSIEqVu61/Euuz/1LG93i8KWcbvbpbjAdvHiX+rvCjF0ON9R40KdBgd
 30X7WCMvALabMCAFSaBF9Ri7XhkQ7Q4=
Message-ID: <2e1bef30-3227-5137-cab8-5dbd7011f39c@greensocs.com>
Date: Thu, 24 Feb 2022 12:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Content-Language: en-US-large
To: Igor Mammedov <imammedo@redhat.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
 <20220223104450.196e9624@redhat.com>
 <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
 <20220224105521.1b760212@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220224105521.1b760212@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, edgari@xilinx.com, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/24/22 10:55, Igor Mammedov wrote:
> On Wed, 23 Feb 2022 11:19:49 +0100
> Damien Hedde <damien.hedde@greensocs.com> wrote:
> 
>> On 2/23/22 10:44, Igor Mammedov wrote:
>>> On Wed, 23 Feb 2022 10:07:05 +0100
>>> Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>    
>>>> This device can be used to create a memory wrapped into a
>>>> sysbus device.
>>>> This device has one property 'readonly' which allows
>>>> to choose between a ram or a rom.
>>>>   
>>>    
>>>> The purpose for this device is to be used with qapi command
>>>> device_add.
>>> that's the way to add a device to QEMU but a don't actual
>>> purpose described here, i.e. how board will use this
>>> device/actual usecase and how it will be wired to board
>>> and why it does have to be a sysbus device.
>>>    
>> Sorry, this was unclear.
>>
>> It is a sysbus device in order to use it like any other sysbus device.
>> The memory region it contains is exposed as a sysbus mmio.
> 
> aside of that sysbus is legacy fictional bus (albeit widely used),
> it doesn't scale to non sysbus devices (me thinking about buss-less
> pc-dimm & co) since eventually we would like to create mainstream
> machine types via QMP as well.
> 
>> I can replace the commit message by the following paragraph:
>>
>> Boards instantiate memories by creating memory region objects which is
>> not possible using QAPI commands.
> 
> That's not entirely true, you can use object-add with hostmem backends
> which do provide a means to allocate memory_region.
> (there is no rom hostmem backend probably (i.e. one that return rom memory region)
> but that could be added).
> Another benefit of approach is that one can replace backing
> memory any other backend (file/memfd/pmem...) without affecting
> device model.

I'm not familiar with memory backends. I need to take a look at them.
> 
>> To create a memory, the user can instantiate and map this device by
>> issuing the following commands:
>> device_add driver=sysbus-memory size=0x1000 id=someram
>> sysbus-mmio-map device=someram addr=0
> 
> I'd imagine more generic approach would look like:
> 
> object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
> device_add memdevice_frontend,memdev=mem1,addr=0x0
> 
> where [pre]plug hooks in machine can map device to
> an appropriate address space/place at device realize time.
> (see memory_device_[pre_]plug() for starters).
> 

We cannot rely on hooks the machine would define, because we start
from an empty machine. So anything must come from qapi and we would
need to do something like that I suppose:
object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
device_add sysbus-memory-frontend,memdev=mem1,id=memdev_fe
sysbus-mmio-map device=memdev_fe addr=0

Thanks,
--
Damien



