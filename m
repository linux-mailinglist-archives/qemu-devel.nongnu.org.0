Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058F341BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:09:09 +0100 (CET)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDwB-0003UT-C7
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDuh-0002f1-JI; Fri, 19 Mar 2021 08:07:35 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDue-000818-TL; Fri, 19 Mar 2021 08:07:35 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4K6z-1lNUtQ44Cf-000KcQ; Fri, 19 Mar 2021 13:07:26 +0100
Subject: Re: [PATCH 1/4] m68k: add the virtio devices aliases
To: Cornelia Huck <cohuck@redhat.com>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-2-laurent@vivier.eu>
 <20210319123620.211ae2ea.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <beca9758-d02f-dace-301b-20b261450ff4@vivier.eu>
Date: Fri, 19 Mar 2021 13:07:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319123620.211ae2ea.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UhrzyuabdnglBFfJB+wsoegd8WNPcQJy4n1v79u4c6ds07tIBXb
 AODDSw1MseAuwFz+mo1i/3ZVE9X0YoyWgJd2CDwUXeQQAt2J2Yh67b0r8eq94rzprmpiY5J
 5jIQrAAHllumIgBYJbSjknFReT8LIaqg8aw9iqvUKr06OzX2RLZoB1k5gfn8xHYyiBo+G6q
 VikVRB2Kw6Ru4SiM6iGSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+qUwp7fIwY8=:DB2y53DQNBYM8E7yHN1njh
 PmOEaMpjWnIKfbPfJOAe3asNRAaqK3z2f+RI7SXOuLZFR7OzgdmMAmQJXoMDJNP55ZOfX7Dyp
 h7Lw/TMkvhQgxtwXZ+U/blNLqG4HnHaYw7Bbqg6mUL7r9kW2NTqpI8sxxd2OWE/g3u//7HnUC
 GK2bUN7KO1L/S4zjxcnxV+j6L6vpe1U7kFj7/KmKvyjkgibsq282dufnmHo7lUTezMSgsV3t2
 sOiHnwnAGRrcdCr4tgMFaObUhGlHUm9MeKo6ajR6IeFGrV7HQcPJeg7GrPqIAdNyFnqqyoeoG
 lJdwYbw55vB2ERcdppeP54ejzsuISg0kU8wnWdUj7CiLfF6+DdtXtZZXYBbO2dSfheU6PT5vn
 TrVDLhSdf63pz2esFl3cNKm5iYXiEA+rB4Drzf4lJlqtp1vDDNwwvIUvhth4g9STnnOUXVrIc
 IJ/G9gZIFg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 12:36, Cornelia Huck a écrit :
> On Thu, 18 Mar 2021 23:39:04 +0100
> Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
>> define the virtio aliases.
>>
>> This allows to start machines with virtio devices without
>> knowledge of the implementation type.
>>
>> For instance, we can use "-device virtio-scsi" on
>> m68k, s390x or PC, and the device will be
>> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
>>
>> This already exists for s390x and -ccw interfaces, adds them
>> for m68k and MMIO (-device) interfaces.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  softmmu/qdev-monitor.c | 46 +++++++++++++++++++++++++++---------------
>>  1 file changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 8dc656becca9..262d38b8c01e 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -42,6 +42,8 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/clock.h"
>>  
>> +#define QEMU_ARCH_NO_PCI (QEMU_ARCH_S390X | QEMU_ARCH_M68K)
> 
> The name of the #define is a tad misleading (we do have virtio-pci
> devices on s390x, unlike in 2012, we just don't want the aliases to
> point to them.) Maybe QEMU_ARCH_NONPCI_DEFAULT?

I have changed this patch to define QEMU_ARCH_VIRTIO_PCI with the list of archs with virtio-pci
devices, and QEMU_ARCH_VIRTIO_CCW and then QEMU_ARCH_VIRTIO_MMIO

> 
>> +
>>  /*
>>   * Aliases were a bad idea from the start.  Let's keep them
>>   * from spreading further.
> 
> Otherwise, LGTM.
> 

Thanks,
Laurent


