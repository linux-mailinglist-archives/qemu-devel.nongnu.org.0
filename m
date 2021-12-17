Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA674478961
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 12:01:40 +0100 (CET)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAzb-0005Ee-RY
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 06:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAxu-0003k3-8P; Fri, 17 Dec 2021 05:59:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAxs-0006fv-JR; Fri, 17 Dec 2021 05:59:53 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmU9X-1mGYUD0Swb-00iQ9O; Fri, 17 Dec 2021 11:59:36 +0100
Message-ID: <0cc480da-aa6d-d0ab-7c91-f2b6df41ea23@vivier.eu>
Date: Fri, 17 Dec 2021 11:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210903174510.751630-1-philmd@redhat.com>
 <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5XS31+n5lZ7ddrgxHNrvM4qnHivM5umP6pYcBSGt/TheNYM6DQc
 xlKjNMOMKJYbV1wgb0i/MB5URP/fzr5HvCTy9OIRJXwXnoywfwkTpat272v9zTwJltXrF8s
 1lN9Qe0W6mGH2i1RgB97UN2hCKwpDVRN0qb0ZpmhQUi3cnFSkmL7wHv+ItRrSvSBKq8Y1BP
 l2b93x01QKCJhjarD2pHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+qUylvyHy0c=:u0wFTS+mA/IBULKzNfebzN
 0eQHaffALNfpesYKZrPEGSzQEnBFTPb9pxjIsz9KhgB4cxzxvTGlYDgXGb1HnaVlm6Lby6s7g
 tC4u9/kIHsgL8nq7HeaC3rbCvB417mFapANqJP2FRehsKdyWEiA7fWMNd0nrwmW/UTPVrQG3y
 q65InHGoDkXNVf2JNsfssXrCQ+fnh4cdL9xK36hEh35Xv06a2ftzn2mZuqtQ6A9RTNkeCAfz8
 VyedmAg30iD5kThzQOgBltxUzzvH5DLEe+twcLC2/VvPT92vz4zyQecSsSxHMMs/WnNPbI91r
 kv1V93sOTmDGBZqX8gYwpWE81kgnA821Ska2QVq4sS5UaSjCL2bM4KjHjLj/37hwMg3gl0FVx
 LRiQssyjqPAdsbczCdIT7EIaqsD/ArmQIm5kOzWBleguUCKl0JbbG3zcsdhAfwv/pVLY68XMA
 nd8wB+GD2CpetYoo5TDTRn4EAgVreh16PTcnWUsTcSH7GxviIa91wTr5ngr2abJ6nv/oAOPvy
 M2oqkVEEvCdmeeb3yAI8lZGBGnjyM8ZCDxgOsFQWk72HYrh0G7Ov63eQCeyGiIGAZSY+2JbBo
 ZPSsxwBB4GbZHFzQJlicogcJz0kV8IZW9bfbtAvH2yWpbeHZBtgWV7uZ8jBp8mOKXqrzVUikQ
 VEsoe5DRLlSDmtT80VWkfvjCIOZqdJLerTdnK9ZQ/ffpE/hxY2xBlJCv8HKsC6aoJypo=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/12/2021 à 17:54, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> On 9/3/21 19:44, Philippe Mathieu-Daudé wrote:
> 
>> This series provides the safely equivalent g_memdup2() wrapper,
>> and replace all g_memdup() calls by it.
> 
>> Philippe Mathieu-Daudé (28):
>>    hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>>    glib-compat: Introduce g_memdup2() wrapper
>>    qapi: Replace g_memdup() by g_memdup2()
>>    accel/tcg: Replace g_memdup() by g_memdup2()
>>    block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>>    softmmu: Replace g_memdup() by g_memdup2()
>>    hw/9pfs: Replace g_memdup() by g_memdup2()
>>    hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>>    hw/acpi: Replace g_memdup() by g_memdup2()
>>    hw/core/machine: Replace g_memdup() by g_memdup2()
>>    hw/hppa/machine: Replace g_memdup() by g_memdup2()
>>    hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>>    hw/net/eepro100: Replace g_memdup() by g_memdup2()
>>    hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>>    hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>>    hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>>    hw/rdma: Replace g_memdup() by g_memdup2()
>>    hw/vfio/pci: Replace g_memdup() by g_memdup2()
>>    hw/virtio: Replace g_memdup() by g_memdup2()
>>    net/colo: Replace g_memdup() by g_memdup2()
>>    ui/clipboard: Replace g_memdup() by g_memdup2()
>>    linux-user: Replace g_memdup() by g_memdup2()
>>    tests/unit: Replace g_memdup() by g_memdup2()
>>    tests/qtest: Replace g_memdup() by g_memdup2()
>>    target/arm: Replace g_memdup() by g_memdup2()
>>    target/ppc: Replace g_memdup() by g_memdup2()
>>    contrib: Replace g_memdup() by g_memdup2()
>>    checkpatch: Do not allow deprecated g_memdup(
> Is it possible to take the reviewed patches 2, 24 and 28
> via qemu-trivial, so the rest can be merged slowly by
> each submaintainer?
> 
> 

Done for these 3 patches.

Thanks,
Laurent

