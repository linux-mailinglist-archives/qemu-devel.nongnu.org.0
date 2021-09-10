Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67179407189
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 20:57:39 +0200 (CEST)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOliU-0001vH-33
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 14:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mOlg4-0000Ph-Sw; Fri, 10 Sep 2021 14:55:08 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mOlg2-0003ql-VH; Fri, 10 Sep 2021 14:55:08 -0400
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout02.t-online.de (Postfix) with SMTP id 47ADE53F7;
 Fri, 10 Sep 2021 20:54:49 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.31]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mOlfk-103YJN0; Fri, 10 Sep 2021 20:54:49 +0200
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210908222157.2377282-1-philmd@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
Date: Fri, 10 Sep 2021 20:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210908222157.2377282-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1631300089-000145A5-D09525AB/0/0 CLEAN NORMAL
X-TOI-MSGID: 3833e6de-54b4-4308-aa62-7d435bd73223
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Fix 'hotplugabble' -> 'hotpluggabble' typo.

I'm convinced that the correct spelling is hotpluggable. Only the 
consonant g is doubled.

With best regards
Volker

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/i386/acpi-build.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d1f5fa3b5a5..478263e12c9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       PCMachineState *pcms = PC_MACHINE(machine);
>       int nb_numa_nodes = machine->numa_state->num_nodes;
>       NodeInfo *numa_info = machine->numa_state->nodes;
> -    ram_addr_t hotplugabble_address_space_size =
> +    ram_addr_t hotpluggabble_address_space_size =
>           object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                   NULL);
>   
> @@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>        * Memory devices may override proximity set by this entry,
>        * providing _PXM method if necessary.
>        */
> -    if (hotplugabble_address_space_size) {
> +    if (hotpluggabble_address_space_size) {
>           numamem = acpi_data_push(table_data, sizeof *numamem);
>           build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, nb_numa_nodes - 1,
> +                          hotpluggabble_address_space_size, nb_numa_nodes - 1,
>                             MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>       }
>   


