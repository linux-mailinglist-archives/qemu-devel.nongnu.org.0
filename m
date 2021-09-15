Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B940C5A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:50:56 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUNL-0004vN-27
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQULP-0003BH-De; Wed, 15 Sep 2021 08:48:55 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQULN-0004ny-73; Wed, 15 Sep 2021 08:48:55 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Ml72g-1nBbmt0eKq-00lYTK; Wed, 15 Sep 2021 14:48:47 +0200
Subject: Re: [PATCH v2] hw/i386/acpi-build: Fix a typo
From: Laurent Vivier <laurent@vivier.eu>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210911082036.436139-1-philmd@redhat.com>
 <420999a6-dfa5-a4e3-c95b-0854da15fc20@vivier.eu>
Message-ID: <c2f4f543-c475-494f-b4a6-3cd92bbe7c81@vivier.eu>
Date: Wed, 15 Sep 2021 14:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <420999a6-dfa5-a4e3-c95b-0854da15fc20@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OQp5lFj406DP4LxWqEy1zgIcVlqYt9+bFaOSeqFmWtvC778q0fC
 w3ntKUc/u/qnyssljD5W8r0HwIonqzwxwlw31lnFoJMVogg5SCxaJ05nRXJEx8UbNwAPtmB
 nA/jHi2cz7r8syefbJ82W9qkwRxyO05nirWbW8nU3aqECbm6nWCTBbUjArutoeZWKlZTMIL
 VD6thekYxWSijQ/NYXgSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DcosyRwItnY=:pGNfpkM+r1pVCMNXrnsnD0
 lvdaUP4q/nfyNiXL1rkNbNSqGvtlHzDNjNbWGDtsytvO11PgdZnKvnWe9J7vzkg6MD6wrRdAm
 kTQVIxBN68iHhspWRRU9/SXKrpaQ4u+a3Ft5aj21dRF02eIDLZlw3CMd2ad8of+F0eikmNC22
 ZOsGkKL7Qu9Tjo7YouWkQVi2pnSTUVKTVUjOb8qyCl7Akf29hEb+lmJyYIioDB0HWcKWYKJO1
 3xKm536vHZFbr54CtDjpxBKApi6+Af6gQf2ml/a/B6gzrU54Yu6A45Cf6kPEQ6/+wvXjGNNns
 GDqcz0VhOoQo9nm/h2giqs0EfaWXJpoVqSzbENnfC1/ApDBBtuVwgAkdd9dZv+CUNuZFFrUjK
 xs1N7o2kJckV385z2WwXX8iNrSG3wqd+1BZ/dAEJGF1goRZ8MpNqxj6NE1Dd31aEzIeB1q3tA
 MJ66YKHPXk2LXwf5RMbdAE33fu+7+aSpBTwDV8GmdE/YtL3ejd1w46bLJNZxTx2Gl+Rma3mfJ
 TK+1QfXWWOCtGhHxEPF7e9ngKa7gBkm+4pW17IKPofErfYR+2jLMOGPrEPmONmbpz0fXgzZSo
 e5xBDdTJM8CSi7vSO3d8S4C6IbPQCMhygKva8wbRR/wXoRv3enUBkof8idLr+kYgPTjXUdiQQ
 cF1QpHTrbQX3llcHzY5kNsa1b6H89Dan+56QNXOUIFwoWhR9YPAXrutX5kVnDWqeF9vLrMO8v
 6CWDR5e6xOtoAlSbvPuyVdUiovNxMICb93VuhQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/09/2021 à 14:48, Laurent Vivier a écrit :
> Le 11/09/2021 à 10:20, Philippe Mathieu-Daudé a écrit :
>> Fix 'hotplugabble' -> 'hotpluggable' typo.
>>
>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v1 still had a typo =) (Volker Rümelin)
>> ---
>>  hw/i386/acpi-build.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index d1f5fa3b5a5..dfaa47cdc20 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>      PCMachineState *pcms = PC_MACHINE(machine);
>>      int nb_numa_nodes = machine->numa_state->num_nodes;
>>      NodeInfo *numa_info = machine->numa_state->nodes;
>> -    ram_addr_t hotplugabble_address_space_size =
>> +    ram_addr_t hotpluggable_address_space_size =
>>          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>>                                  NULL);
>>  
>> @@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       * Memory devices may override proximity set by this entry,
>>       * providing _PXM method if necessary.
>>       */
>> -    if (hotplugabble_address_space_size) {
>> +    if (hotpluggable_address_space_size) {
>>          numamem = acpi_data_push(table_data, sizeof *numamem);
>>          build_srat_memory(numamem, machine->device_memory->base,
>> -                          hotplugabble_address_space_size, nb_numa_nodes - 1,
>> +                          hotpluggable_address_space_size, nb_numa_nodes - 1,
>>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>>      }
>>  
>>
> 
> Applied to my linux-user-for-6.2 branch.

I mean "trivial-patches"

Thanks,
Laurent

