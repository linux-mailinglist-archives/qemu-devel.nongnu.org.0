Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763A2D4744
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:58:07 +0100 (CET)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2n0-00048w-GS
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2lX-0003RN-5c
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:56:36 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2lT-0007a5-3Q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:56:34 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9GtRkV045712;
 Wed, 9 Dec 2020 16:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=OT3NgzSHiUqGzAc135vUgmtVNTJDX6Mo4utqIzrG9/c=;
 b=FARLyNzEp1/64kM1ofRg4wJGZLEfTVKL1JBN/M6Tcp0+hrb7A6fgVTplL7AEUEdx3wzj
 CxsbJSLa2+99jnM4RcwYbMG16MqFcLNmAhCkSbcPAjTITNdTTH1quuZty5KjS9ii8Crs
 jkzLrbjSYsevjXzSr92/h2hRWilImev9M8YBVWKbN9STWGBV8J7aXfWZCtboisU5LlM7
 mO0xKpLxcrPBpgVnLvVk9hClCEmEF61pOL0wWI2IHB0m4tHrfleXshkt7GB1i5aKgaaf
 liy1n0FzeinWwsVkNltSnSFA4O8OOH3ua/6W9Fj0Qk7mDBHknmCKPC2bC6EGzuitpFDR ew== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35825m97wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 16:56:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9GojXS039029;
 Wed, 9 Dec 2020 16:56:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 358kyuybry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 16:56:22 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9GuKh6004126;
 Wed, 9 Dec 2020 16:56:20 GMT
Received: from dhcp-10-39-220-44.vpn.oracle.com (/10.39.220.44)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 08:56:19 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v12 06/19] multi-process: setup a machine object for
 remote device process
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAJ+F1CLt8ysY6er9wLEfgAcoE0rMXaX2kfjOeHGK_VKOQoudkw@mail.gmail.com>
Date: Wed, 9 Dec 2020 11:56:16 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F7AC7EA-6EDA-4831-A843-82BE6C51E22F@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <8b654f7ac999a3594f117fcf3b2da1c4cfe4cc65.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1CLt8ysY6er9wLEfgAcoE0rMXaX2kfjOeHGK_VKOQoudkw@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=4 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090119
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 4, 2020, at 9:35 AM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
>=20
>=20
>=20
> On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman =
<jag.raman@oracle.com> wrote:
> x-remote-machine object sets up various subsystems of the remote
> device process. Instantiate PCI host bridge object and initialize RAM, =
IO &
> PCI memory regions.
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/pci-host/remote.h |  1 +
>  include/hw/remote/machine.h  | 28 ++++++++++++++++++
>  hw/remote/machine.c          | 69 =
++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |  2 ++
>  hw/meson.build               |  1 +
>  hw/remote/meson.build        |  5 ++++
>  6 files changed, 106 insertions(+)
>  create mode 100644 include/hw/remote/machine.h
>  create mode 100644 hw/remote/machine.c
>  create mode 100644 hw/remote/meson.build
>=20
> diff --git a/include/hw/pci-host/remote.h =
b/include/hw/pci-host/remote.h
> index bab6d3c..cc0fff4 100644
> --- a/include/hw/pci-host/remote.h
> +++ b/include/hw/pci-host/remote.h
> @@ -25,6 +25,7 @@ typedef struct RemotePCIHost {
>=20
>      MemoryRegion *mr_pci_mem;
>      MemoryRegion *mr_sys_io;
> +    MemoryRegion *mr_sys_mem;
>=20
> Why is this not part of the previous patch?

Hi Marc-Andre,

We originally defined this variable in a previous patch. But we were
not using it in that patch.

Based on feedback we previously received, we moved it to this patch
as it is used for the first time here.

Thank you!
=E2=80=94
Jag

>=20
>  } RemotePCIHost;
>=20
>  #endif
> diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
> new file mode 100644
> index 0000000..d312972
> --- /dev/null
> +++ b/include/hw/remote/machine.h
> @@ -0,0 +1,28 @@
> +/*
> + * Remote machine configuration
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_MACHINE_H
> +#define REMOTE_MACHINE_H
> +
> +#include "qom/object.h"
> +#include "hw/boards.h"
> +#include "hw/pci-host/remote.h"
> +
> +typedef struct RemoteMachineState {
> +    MachineState parent_obj;
> +
> +    RemotePCIHost *host;
> +} RemoteMachineState;
> +
> +#define TYPE_REMOTE_MACHINE "x-remote-machine"
> +#define REMOTE_MACHINE(obj) \
> +    OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)
> +
> +#endif
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> new file mode 100644
> index 0000000..c5658bf
> --- /dev/null
> +++ b/hw/remote/machine.c
> @@ -0,0 +1,69 @@
> +/*
> + * Machine for remote device
> + *
> + *  This machine type is used by the remote device process in =
multi-process
> + *  QEMU. QEMU device models depend on parent busses, interrupt =
controllers,
> + *  memory regions, etc. The remote machine type offers this =
environment so
> + *  that QEMU device models can be used as remote devices.
> + *
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/machine.h"
> +#include "exec/address-spaces.h"
> +#include "exec/memory.h"
> +#include "qapi/error.h"
> +
> +static void remote_machine_init(MachineState *machine)
> +{
> +    MemoryRegion *system_memory, *system_io, *pci_memory;
> +    RemoteMachineState *s =3D REMOTE_MACHINE(machine);
> +    RemotePCIHost *rem_host;
> +
> +    system_memory =3D get_system_memory();
> +    system_io =3D get_system_io();
> +
> +    pci_memory =3D g_new(MemoryRegion, 1);
> +    memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
> +
> +    rem_host =3D =
REMOTE_HOST_DEVICE(qdev_new(TYPE_REMOTE_HOST_DEVICE));
> +
> +    rem_host->mr_pci_mem =3D pci_memory;
> +    rem_host->mr_sys_mem =3D system_memory;
> +    rem_host->mr_sys_io =3D system_io;
> +
> +    s->host =3D rem_host;
> +
> +    object_property_add_child(OBJECT(s), "remote-device", =
OBJECT(rem_host));
>=20
> "remote-pcihost" instead ?
>=20
> +    memory_region_add_subregion_overlap(system_memory, 0x0, =
pci_memory, -1);
> +
> +    qdev_realize(DEVICE(rem_host), sysbus_get_default(), =
&error_fatal);
> +}
> +
> +static void remote_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->init =3D remote_machine_init;
>=20
> Set mc->desc =3D "Experimental remote machine" ?
>=20
> +}
> +
> +static const TypeInfo remote_machine =3D {
> +    .name =3D TYPE_REMOTE_MACHINE,
> +    .parent =3D TYPE_MACHINE,
> +    .instance_size =3D sizeof(RemoteMachineState),
> +    .class_init =3D remote_machine_class_init,
> +};
> +
> +static void remote_machine_register_types(void)
> +{
> +    type_register_static(&remote_machine);
> +}
> +
> +type_init(remote_machine_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4515476..c45ac1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3139,6 +3139,8 @@ F: docs/devel/multi-process.rst
>  F: tests/multiprocess/multiprocess-lsi53c895a.py
>  F: hw/pci-host/remote.c
>  F: include/hw/pci-host/remote.h
> +F: hw/remote/machine.c
> +F: include/hw/remote/machine.h
>=20
>  Build and test automation
>  -------------------------
> diff --git a/hw/meson.build b/hw/meson.build
> index 010de72..e615d72 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -56,6 +56,7 @@ subdir('moxie')
>  subdir('nios2')
>  subdir('openrisc')
>  subdir('ppc')
> +subdir('remote')
>  subdir('riscv')
>  subdir('rx')
>  subdir('s390x')
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> new file mode 100644
> index 0000000..197b038
> --- /dev/null
> +++ b/hw/remote/meson.build
> @@ -0,0 +1,5 @@
> +remote_ss =3D ss.source_set()
> +
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('machine.c'))
> +
> +softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --=20
> 1.8.3.1
>=20
>=20
>=20
> --=20
> Marc-Andr=C3=A9 Lureau


