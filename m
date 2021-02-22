Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F5322098
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:05:18 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHSG-0004U8-TT
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lEHR7-0003cG-78; Mon, 22 Feb 2021 15:04:05 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lEHR4-000432-AD; Mon, 22 Feb 2021 15:04:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02F4C7462D3;
 Mon, 22 Feb 2021 21:03:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B583A7462BD; Mon, 22 Feb 2021 21:03:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B37E474581E;
 Mon, 22 Feb 2021 21:03:55 +0100 (CET)
Date: Mon, 22 Feb 2021 21:03:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 04/11] hw/arm: Restrit KVM to the virt & versal machines
In-Reply-To: <20210219173847.2054123-5-philmd@redhat.com>
Message-ID: <36692cea-e747-b054-51ff-bbcfbbdd4151@eik.bme.hu>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-317435051-1614024235=:60531"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-317435051-1614024235=:60531
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Feb 2021, Philippe Mathieu-Daudé wrote:
> Restrit KVM to the following ARM machines:

Typo: "Restrict" (also in patch title).

Regards,
BALATON Zoltan

> - virt
> - xlnx-versal-virt
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> hw/arm/virt.c             | 5 +++++
> hw/arm/xlnx-versal-virt.c | 5 +++++
> 2 files changed, 10 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 371147f3ae9..8e9861b61a9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2527,6 +2527,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>     return NULL;
> }
>
> +static const char *const valid_accels[] = {
> +    "tcg", "kvm", "hvf", NULL
> +};
> +
> /*
>  * for arm64 kvm_type [7-0] encodes the requested number of bits
>  * in the IPA address space
> @@ -2582,6 +2586,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->valid_accelerators = valid_accels;
>     mc->kvm_type = virt_kvm_type;
>     assert(!mc->get_hotplug_handler);
>     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8482cd61960..d424813cae1 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -610,6 +610,10 @@ static void versal_virt_machine_instance_init(Object *obj)
> {
> }
>
> +static const char *const valid_accels[] = {
> +    "tcg", "kvm", NULL
> +};
> +
> static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
> {
>     MachineClass *mc = MACHINE_CLASS(oc);
> @@ -621,6 +625,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
>     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
>     mc->no_cdrom = true;
>     mc->default_ram_id = "ddr";
> +    mc->valid_accelerators = valid_accels;
> }
>
> static const TypeInfo versal_virt_machine_init_typeinfo = {
>
--3866299591-317435051-1614024235=:60531--

