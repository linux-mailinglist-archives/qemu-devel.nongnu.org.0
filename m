Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB02D1163
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:08:23 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGFa-0007o1-IW
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmFx4-0007Ro-FS
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmFwt-0001ly-68
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607345342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGrmReUySzhAOkAEmfV3DyRwu7HtQ0vo+6ZquhPUYVA=;
 b=F1kuxI0PUHb5kF1lY5wv9kkMelfgaOgWwKWhYCL3bsyB1gvx18RtomPOHdGzXExeO1qbd1
 8udr1fRefaxWN1YQdOjdjUEfETckTIZErNSMzmsk4Q1y3XHpNleIVDsrPP7TAiAmHIgpsI
 NiaM84eqqsUgIU2shOY2WWNzoE/gCC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-x2kqJ-KQNsuykpyaAWlDYQ-1; Mon, 07 Dec 2020 07:49:00 -0500
X-MC-Unique: x2kqJ-KQNsuykpyaAWlDYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D614C1E7D3;
 Mon,  7 Dec 2020 12:48:59 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D088C5C3E0;
 Mon,  7 Dec 2020 12:48:50 +0000 (UTC)
Date: Mon, 7 Dec 2020 13:48:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [PATCH 2/8] acpi: cpuhp: introduce 'firmware performs eject'
 status/control bits
Message-ID: <20201207134848.796901f6@redhat.com>
In-Reply-To: <8e0d95ec-2a49-5c7e-7ed0-dde807a8c028@oracle.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
 <20201204170939.1815522-3-imammedo@redhat.com>
 <891d22af-617c-7962-4fe8-e60cd18f4df3@oracle.com>
 <8e0d95ec-2a49-5c7e-7ed0-dde807a8c028@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 00:47:13 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> On 2020-12-06 10:31 p.m., Ankur Arora wrote:
> > On 2020-12-04 9:09 a.m., Igor Mammedov wrote: =20
> >> Adds bit #4 to status/control field of CPU hotplug MMIO interface.
> >> New bit will be used OSPM to mark CPUs as pending for removal by firmw=
are,
> >> when it calls _EJ0 method on CPU device node. Later on, when firmware
> >> sees this bit set, it will perform CPU eject which will clear bit #4
> >> as well.
> >>
> >> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >> v1:
> >> =C2=A0=C2=A0 - rearrange status/control bits description (Laszlo)
> >> =C2=A0=C2=A0 - add clear bit #4 on eject
> >> =C2=A0=C2=A0 - drop toggling logic from bit #4, it can be only set by =
guest
> >> =C2=A0=C2=A0=C2=A0=C2=A0 and clear as part of cpu eject
> >> =C2=A0=C2=A0 - exclude boot CPU from remove request
> >> =C2=A0=C2=A0 - add trace events for new bit
> >> ---
> >> =C2=A0 include/hw/acpi/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> >> =C2=A0 docs/specs/acpi_cpu_hotplug.txt | 19 ++++++++++++++-----
> >> =C2=A0 hw/acpi/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++++=
+++++
> >> =C2=A0 hw/acpi/trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> >> =C2=A0 4 files changed, 26 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> >> index 0eeedaa491..d71edde456 100644
> >> --- a/include/hw/acpi/cpu.h
> >> +++ b/include/hw/acpi/cpu.h
> >> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t arch_id;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_inserting;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_removing;
> >> +=C2=A0=C2=A0=C2=A0 bool fw_remove;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t ost_event;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t ost_status;
> >> =C2=A0 } AcpiCpuStatus;
> >> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hot=
plug.txt
> >> index 9bb22d1270..9bd59ae0da 100644
> >> --- a/docs/specs/acpi_cpu_hotplug.txt
> >> +++ b/docs/specs/acpi_cpu_hotplug.txt
> >> @@ -56,8 +56,11 @@ read access:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 no device check event to OSPM was issued.
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 It's valid only when bit 0 is set.
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 2: Device remove event, used to distinguish device for which
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 no device eject request to OSPM was issued.
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3-7: res=
erved and should be ignored by OSPM
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 no device eject request to OSPM was issued. Firmware must
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ignore this bit.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3: reser=
ved and should be ignored by OSPM
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4: if se=
t to 1, OSPM requests firmware to perform device eject.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5-7: res=
erved and should be ignored by OSPM
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x5-0x7] reserved
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x8] Command data: (DWORD access)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tains 0 unless value last stored in 'Command field' is one of:
> >> @@ -79,10 +82,16 @@ write access:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 selected CPU device
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2: if set to 1 clears device remove event, set by OSPM
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 after it has emitted device eject request for t=
he
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 selected CPU device
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 selected CPU device.
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 3: if set to 1 initiates device eject, set by OSPM when it
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 triggers CPU device removal and calls _EJ0 method
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4-=
7: reserved, OSPM must clear them before writing to register
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 triggers CPU device removal and calls _EJ0 method or by fir=
mware
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 when bit #4 is set. In case bit #4 were set, it's cleared a=
s
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 part of device eject. =20
>=20
> So I spent some time testing my OVMF series alongside this.
> Just sent out the code on the EDK2 list.
>=20
> To do the eject, I'm setting bit#3 after queuing up the processor
> for removal (via RemoveProcessor()).
>=20
> This means, however, that the unplug in QEMU would happen before the
> real firmware unplug (which'll happen in SmmCpuUpdate()).
>=20
> Clearly, the right place for eject would be either in the appropriate
> APHandler() or in the BSPHandler() after all the APs have been waited
> for but from my reading of related code I don't see any infrastructure
> for doing this (admittedly, I don't know the EDK2 source well enough
> so it's likely I missed something.)
>=20
> The other possibility might be to do it in the _EJ0 method itself
> after we return from the SMI:
>=20
> @@ -479,9 +515,8 @@ void build_cpus_aml(Aml *table, MachineState *machine=
, CPUHotplugFeatures opts,
>                   aml_append(method, aml_store(one, fw_ej_evt));
>                   aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD=
),
>                              aml_name("%s", opts.smi_path)));
> -            } else {
> -                aml_append(method, aml_store(one, ej_evt));
> -            }
> +           }
> +            aml_append(method, aml_store(one, ej_evt));
>               aml_append(method, aml_release(ctrl_lock));
>=20
> This seems to work but it is possible I'm missing something here.

theoretically this leaves unaccounted CPU on fw side,
what if SMM is entered again before CPU is ejected or OS doesn't eject it o=
n purpose?

I'd prefer firmware to remove CPU before returning from SMM.


>=20
>=20
> Opinions?
>=20
> Ankur
>=20
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4:=
 if set to 1, OSPM hands over device eject to firmware.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Firmware shall issue device eject request as described abov=
e
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (bit #3) and OSPM should not touch device eject bit (#3) in=
 case
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 it's asked firmware to perform CPU device eject.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5-=
7: reserved, OSPM must clear them before writing to register
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x5] Command field: (1 byte access)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
ue:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: selects a CPU device with inserting/removing events and
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index f099b50927..811218f673 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr =
addr, unsigned size)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev->=
cpu ? 1 : 0;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev->=
is_inserting ? 2 : 0;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev->=
is_removing=C2=A0 ? 4 : 0;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev->fw_remove=
=C2=A0 ? 16 : 0;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_cpuhp_acp=
i_read_flags(cpu_st->selector, val);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case ACPI_CPU_CMD_DATA_OFFSET_RW:
> >> @@ -148,6 +149,14 @@ static void cpu_hotplug_wr(void *opaque, hwaddr a=
ddr, uint64_t data,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 hotplug_ctrl =3D qdev_get_hotplug_handler(dev);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 object_unparent(OBJECT(dev));
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd=
ev->fw_remove =3D false;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (data & 16) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!cdev->cpu || cdev->cpu =3D=3D first_cpu) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 trace_cpuhp_acpi_fw_remove_invalid_cpu(cpu_st->select=
or);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tr=
ace_cpuhp_acpi_fw_remove_cpu(cpu_st->selector);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd=
ev->fw_remove =3D true;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; =20
> >=20
> > By the time the firmware gets the MMI, cdev->is_removing =3D=3D 0. So w=
e probably
> > need the cdev->fw_remove clause as well.
> >=20
> > @@ -168,7 +193,7 @@ static void cpu_hotplug_wr(void *opaque, hwaddr add=
r, uint64_t data,
> >=20
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdev =3D &cpu_st->devs[=
iter];
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cdev->is_inserting || cde=
v->is_removing) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cdev->is_inserting || cde=
v->is_removing || cdev->fw_remove) {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 cpu_st->selector =3D iter;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 trace_cpuhp_acpi_cpu_has_events(cpu_st->selector,
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cdev->is_inserting, cdev->is_removing);
> >=20
> >=20
> > Ankur
> >  =20
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case ACPI_CPU_CMD_OFFSET_WR:
> >> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> >> index afbc77de1c..f91ced477d 100644
> >> --- a/hw/acpi/trace-events
> >> +++ b/hw/acpi/trace-events
> >> @@ -29,6 +29,8 @@ cpuhp_acpi_clear_inserting_evt(uint32_t idx) "idx[0x=
%"PRIx32"]"
> >> =C2=A0 cpuhp_acpi_clear_remove_evt(uint32_t idx) "idx[0x%"PRIx32"]"
> >> =C2=A0 cpuhp_acpi_ejecting_invalid_cpu(uint32_t idx) "0x%"PRIx32
> >> =C2=A0 cpuhp_acpi_ejecting_cpu(uint32_t idx) "0x%"PRIx32
> >> +cpuhp_acpi_fw_remove_invalid_cpu(uint32_t idx) "0x%"PRIx32
> >> +cpuhp_acpi_fw_remove_cpu(uint32_t idx) "0x%"PRIx32
> >> =C2=A0 cpuhp_acpi_write_ost_ev(uint32_t slot, uint32_t ev) "idx[0x%"PR=
Ix32"] OST EVENT: 0x%"PRIx32
> >> =C2=A0 cpuhp_acpi_write_ost_status(uint32_t slot, uint32_t st) "idx[0x=
%"PRIx32"] OST STATUS: 0x%"PRIx32
> >> =20
>=20


