Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E601B178
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 09:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ5hC-0006hy-K8
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 03:48:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hQ5fr-0006K8-QW
	for qemu-devel@nongnu.org; Mon, 13 May 2019 03:47:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hQ5fq-00034p-3o
	for qemu-devel@nongnu.org; Mon, 13 May 2019 03:47:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hQ5fp-00034Q-SN; Mon, 13 May 2019 03:47:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 240F4307D8E3;
	Mon, 13 May 2019 07:47:00 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E461163BAB;
	Mon, 13 May 2019 07:46:55 +0000 (UTC)
To: Collin Walling <walling@linux.ibm.com>, qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org, cohuck@redhat.com, rth@twiddle.net,
	pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
	pbonzini@redhat.com
References: <1556749903-19221-1-git-send-email-walling@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a87c71be-5bf8-a115-5843-720c9ad10c7b@redhat.com>
Date: Mon, 13 May 2019 09:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556749903-19221-1-git-send-email-walling@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 13 May 2019 07:47:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4] s390: diagnose 318 info reset and
 migration support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.05.19 00:31, Collin Walling wrote:
> DIAGNOSE 0x318 (diag318) is a privileged s390x instruction that must
> be intercepted by SIE and handled via KVM. Let's introduce some
> functions to communicate between QEMU and KVM via ioctls. These
> will be used to get/set the diag318 related information (also known
> as the "Control Program Code" or "CPC"), as well as check the system
> if KVM supports handling this instruction.
>=20
> The availability of this instruction is determined by byte 134, bit 0
> of the Read Info block. This coincidentally expands into the space used
> for CPU entries, which means VMs running with the diag318 capability
> will have a reduced maximum CPU count. To alleviate this, let's calcula=
te
> the actual max CPU entry space by subtracting the size of Read Info fro=
m
> the SCCB size then dividing that number by the size of a CPU entry. If
> this value is less than the value denoted by S390_MAX_CPUS, then let's
> reduce the max cpus for s390 from 248 to 240 in an effort to anticipate
> this potentially happening again in the future.
>=20
> In order to simplify the migration and system reset requirements of
> the diag318 data, let's introduce it as a device class and include
> a VMStateDescription.
>=20
> Diag318 is reset on during modified clear and load normal.
>=20
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
>  hw/s390x/Makefile.objs       |   1 +
>  hw/s390x/diag318.c           | 100 +++++++++++++++++++++++++++++++++++=
++++++++
>  hw/s390x/diag318.h           |  39 +++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c   |  23 ++++++++++
>  hw/s390x/sclp.c              |   5 +++
>  include/hw/s390x/sclp.h      |   2 +
>  linux-headers/asm-s390/kvm.h |   4 ++
>  target/s390x/kvm-stub.c      |  15 +++++++
>  target/s390x/kvm.c           |  32 ++++++++++++++
>  target/s390x/kvm_s390x.h     |   3 ++
>  10 files changed, 224 insertions(+)
>  create mode 100644 hw/s390x/diag318.c
>  create mode 100644 hw/s390x/diag318.h
>=20
> diff --git a/hw/s390x/Makefile.objs b/hw/s390x/Makefile.objs
> index e02ed80..93621dc 100644
> --- a/hw/s390x/Makefile.objs
> +++ b/hw/s390x/Makefile.objs
> @@ -34,3 +34,4 @@ obj-$(CONFIG_KVM) +=3D s390-stattrib-kvm.o
>  obj-y +=3D s390-ccw.o
>  obj-y +=3D ap-device.o
>  obj-y +=3D ap-bridge.o
> +obj-y +=3D diag318.o
> diff --git a/hw/s390x/diag318.c b/hw/s390x/diag318.c
> new file mode 100644
> index 0000000..94b44da
> --- /dev/null
> +++ b/hw/s390x/diag318.c
> @@ -0,0 +1,100 @@
> +/*
> + * DIAGNOSE 0x318 functions for reset and migration
> + *
> + * Copyright IBM, Corp. 2019
> + *
> + * Authors:
> + *  Collin Walling <walling@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
(at your
> + * option) any later version. See the COPYING file in the top-level di=
rectory.
> + */
> +
> +#include "hw/s390x/diag318.h"
> +#include "qapi/error.h"
> +#include "kvm_s390x.h"
> +#include "sysemu/kvm.h"
> +
> +static int diag318_post_load(void *opaque, int version_id)
> +{
> +    DIAG318State *d =3D opaque;
> +
> +    kvm_s390_set_cpc(d->cpc);
> +
> +    /* It is not necessary to retain a copy of the cpc after migration=
. */
> +    d->cpc =3D 0;
> +
> +    return 0;
> +}
> +
> +static int diag318_pre_save(void *opaque)
> +{
> +    DIAG318State *d =3D opaque;
> +
> +    kvm_s390_get_cpc(&d->cpc);
> +    return 0;
> +}
> +
> +static bool diag318_needed(void *opaque)
> +{
> +    DIAG318State *d =3D opaque;
> +
> +    return d->enabled;
> +}
> +
> +const VMStateDescription vmstate_diag318 =3D {
> +    .name =3D "vmstate_diag318",
> +    .post_load =3D diag318_post_load,
> +    .pre_save =3D diag318_pre_save,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D diag318_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(cpc, DIAG318State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void s390_diag318_realize(DeviceState *dev, Error **errp)
> +{
> +    DIAG318State *d =3D DIAG318(dev);
> +
> +    if (kvm_s390_has_diag318()) {
> +        d->enabled =3D true;
> +    }
> +}
> +
> +static void s390_diag318_reset(DeviceState *dev)
> +{
> +    DIAG318State *d =3D DIAG318(dev);
> +
> +    if (d->enabled) {
> +        kvm_s390_set_cpc(0);
> +    }
> +}
> +
> +static void s390_diag318_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D s390_diag318_realize;
> +    dc->reset =3D s390_diag318_reset;
> +    dc->vmsd =3D &vmstate_diag318;
> +    dc->hotpluggable =3D false;
> +    /* Reason: Set automatically during IPL */
> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo s390_diag318_info =3D {
> +    .class_init =3D s390_diag318_class_init,
> +    .parent =3D TYPE_DEVICE,
> +    .name =3D TYPE_S390_DIAG318,
> +    .instance_size =3D sizeof(DIAG318State),
> +};
> +
> +static void s390_diag318_register_types(void)
> +{
> +    type_register_static(&s390_diag318_info);
> +}
> +
> +type_init(s390_diag318_register_types)
> diff --git a/hw/s390x/diag318.h b/hw/s390x/diag318.h
> new file mode 100644
> index 0000000..c154b0a
> --- /dev/null
> +++ b/hw/s390x/diag318.h
> @@ -0,0 +1,39 @@
> +/*
> + * DIAGNOSE 0x318 functions for reset and migration
> + *
> + * Copyright IBM, Corp. 2019
> + *
> + * Authors:
> + *  Collin Walling <walling@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
(at your
> + * option) any later version. See the COPYING file in the top-level di=
rectory.
> + */
> +
> + #ifndef DIAG318_H
> + #define DIAG318_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev.h"
> +
> +#define TYPE_S390_DIAG318 "diag318"
> +#define DIAG318(obj) \
> +    OBJECT_CHECK(DIAG318State, (obj), TYPE_S390_DIAG318)
> +
> +typedef struct DIAG318State {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    uint64_t cpc;
> +    bool enabled;
> +} DIAG318State;
> +
> +typedef struct DIAG318Class {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +
> +    /*< public >*/
> +} DIAG318Class;
> +
> +#endif /* DIAG318_H */
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index d11069b..44a424b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -36,6 +36,7 @@
>  #include "cpu_models.h"
>  #include "hw/nmi.h"
>  #include "hw/s390x/tod.h"
> +#include "hw/s390x/diag318.h"
> =20
>  S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
>  {
> @@ -92,6 +93,7 @@ static const char *const reset_dev_types[] =3D {
>      "s390-sclp-event-facility",
>      "s390-flic",
>      "diag288",
> +    TYPE_S390_DIAG318,
>  };
> =20
>  static void subsystem_reset(void)
> @@ -246,6 +248,17 @@ static void s390_create_sclpconsole(const char *ty=
pe, Chardev *chardev)
>      qdev_init_nofail(dev);
>  }
> =20
> +static void s390_init_diag318(void)
> +{
> +    Object *new =3D object_new(TYPE_S390_DIAG318);
> +    DeviceState *dev =3D DEVICE(new);
> +
> +    object_property_add_child(qdev_get_machine(), TYPE_S390_DIAG318,
> +                              new, NULL);
> +    object_unref(new);
> +    qdev_init_nofail(dev);
> +}
> +
>  static void ccw_init(MachineState *machine)
>  {
>      int ret;
> @@ -302,6 +315,8 @@ static void ccw_init(MachineState *machine)
> =20
>      /* init the TOD clock */
>      s390_init_tod();
> +
> +    s390_init_diag318();
>  }
> =20
>  static void s390_cpu_plug(HotplugHandler *hotplug_dev,
> @@ -570,6 +585,7 @@ static void machine_set_loadparm(Object *obj, const=
 char *val, Error **errp)
>          ms->loadparm[i] =3D ' '; /* pad right with spaces */
>      }
>  }
> +
>  static inline void s390_machine_initfn(Object *obj)
>  {
>      object_property_add_bool(obj, "aes-key-wrap",
> @@ -652,6 +668,13 @@ static void ccw_machine_4_0_instance_options(Machi=
neState *machine)
> =20
>  static void ccw_machine_4_0_class_options(MachineClass *mc)
>  {
> +    /*
> +     * Read Info might reveal more bytes used to detect facilities, th=
us
> +     * reducing the number of CPU entries. Let's reduce the max CPUs b=
y
> +     * an arbitrary number in effort to anticipate future facility byt=
es.
> +     */
> +    if ((SCCB_SIZE - sizeof(ReadInfo)) / sizeof(CPUEntry) < S390_MAX_C=
PUS)
> +        mc->max_cpus =3D S390_MAX_CPUS - 8;

This is too complicated, just set it always to 240.

However, I am still not sure how to best handle this scenario. One
solution is

1. Set it statically to 240 for machine > 4.1
2. Keep the old machines unmodifed
3. Don't indicate the CPU feature for machines <=3D 4.0

#3 is the problematic part, as it mixes host CPU features and machines.
Bad. The host CPU model should always look the same on all machines. I
don't like this.

--=20

Thanks,

David / dhildenb

