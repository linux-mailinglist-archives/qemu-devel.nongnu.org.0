Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEF443FE6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:19:41 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miDMq-000250-Ht
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miDLg-0001OU-55
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miDLc-0005V2-27
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635934703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Zk0KtCz1ltimjIccaCjrTN+Iz3yJqGWmXGZ62os6pQ=;
 b=Mps+I0JXJA3aAnUt4EIN2DWzSnHH7PpHrBegPW3Ny4JZxTayXFjRa2qf7bUEZIDKM+1qrh
 eOkvAANafEK78/ePjdHWRaYyMO+g/AL1ESzBDUtfn9QlwDYkTtiy34tcDV3p7KHSUA2mEr
 iBJ2gU7S7vOqbPfRc2yc0E5izRJpJpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-q_TJWbhpO5a4SyHQnmdmEg-1; Wed, 03 Nov 2021 06:16:58 -0400
X-MC-Unique: q_TJWbhpO5a4SyHQnmdmEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C91F180831A;
 Wed,  3 Nov 2021 10:16:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B3057CD3;
 Wed,  3 Nov 2021 10:16:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C210B11380A7; Wed,  3 Nov 2021 11:16:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
 <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
 <e2afad0e-8116-a1b0-f473-7c44ba32112f@amsat.org>
Date: Wed, 03 Nov 2021 11:16:54 +0100
In-Reply-To: <e2afad0e-8116-a1b0-f473-7c44ba32112f@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 2 Nov 2021 09:55:17
 +0100")
Message-ID: <87tugtilwp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> +Markus/Eduardo
>
> On 11/1/21 18:33, Peter Maydell wrote:
>> On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>>>
>>> The ID can be used to indicate SMBus modules when adding
>>> dynamic devices to them.
>>>
>>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
>>> ---
>>>  hw/arm/npcm7xx.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
>>> index 2ab0080e0b..72953d65ef 100644
>>> --- a/hw/arm/npcm7xx.c
>>> +++ b/hw/arm/npcm7xx.c
>>> @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
>>>      for (i =3D 0; i < ARRAY_SIZE(s->smbus); i++) {
>>>          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
>>>                                  TYPE_NPCM7XX_SMBUS);
>>> +        DEVICE(&s->smbus[i])->id =3D g_strdup_printf("smbus[%d]", i);
>>>      }
>>=20
>> This one looks weird to me -- I'm pretty sure we shouldn't be messing
>> about with the DeviceState id string like that. It's supposed to be
>> internal to the QOM/qdev code.

It's meant for the user.  Devices created by code shouldn't set it.  Not
least because any ID they pick could clash with the user's.

> I agree with you, however:
>
> $ git grep -F -- '->id =3D g_strdup' hw
> hw/arm/virt.c:1512:    dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE);
> hw/block/xen-block.c:761:    drive->id =3D g_strdup(id);
> hw/block/xen-block.c:853:    iothread->id =3D g_strdup(id);
> hw/core/machine-qmp-cmds.c:169:        m->id =3D g_strdup(object_get_cano=
nical_path_component(obj));
> hw/mem/pc-dimm.c:244:        di->id =3D g_strdup(dev->id);
> hw/pci-bridge/pci_expander_bridge.c:248:        bds->id =3D g_strdup(dev_=
name);
> hw/ppc/e500.c:1009:        dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE)=
;
> hw/s390x/s390-pci-bus.c:1003:            dev->id =3D g_strdup_printf("aut=
o_%02x:%02x.%01x",
> hw/sh4/sh7750.c:819:    dev->id =3D g_strdup("sci");
> hw/sh4/sh7750.c:836:    dev->id =3D g_strdup("scif");
> hw/virtio/virtio-mem-pci.c:69:        vi->id =3D g_strdup(dev->id);
> hw/virtio/virtio-pmem-pci.c:74:        vi->id =3D g_strdup(dev->id);

This includes false positives, i.e. assignments to members of structs
other than DeviceState.  It also misses other ways to mess with
DeviceState member id.

Compiling with

    diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
    index 1bad07002d..b17ccd6065 100644
    --- a/include/hw/qdev-core.h
    +++ b/include/hw/qdev-core.h
    @@ -176,7 +176,7 @@ struct DeviceState {
         Object parent_obj;
         /*< public >*/

    -    char *id;
    +    char *const id;
         char *canonical_path;
         bool realized;
         bool pending_deleted_event;

ferrets out the actual assignments.  I got:

../hw/ppc/spapr_vio.c: In function =E2=80=98spapr_vio_busdev_realize=E2=80=
=99:
../hw/ppc/spapr_vio.c:505:22: error: assignment of read-only member =E2=80=
=98id=E2=80=99
  505 |         dev->qdev.id =3D id;
      |                      ^

This supplies a default ID to a vio-spapr-device.  Feels like a bad
idea.

../softmmu/qdev-monitor.c: In function =E2=80=98qdev_set_id=E2=80=99:
../softmmu/qdev-monitor.c:593:21: error: assignment of read-only member =E2=
=80=98id=E2=80=99
  593 |             dev->id =3D id;
      |                     ^

This assigns the user-supplied ID.

../hw/dma/xlnx-zdma.c: In function =E2=80=98zdma_realize=E2=80=99:
../hw/dma/xlnx-zdma.c:777:12: error: assignment of read-only location =E2=
=80=98*r=E2=80=99
  777 |         *r =3D (RegisterInfo) {
      |            ^

This *clobbers* the DeviceState embedded in *r, including its member id.
Suspicious.

../hw/pci-bridge/pci_expander_bridge.c: In function =E2=80=98pxb_dev_realiz=
e_common=E2=80=99:
../hw/pci-bridge/pci_expander_bridge.c:248:17: error: assignment of read-on=
ly member =E2=80=98id=E2=80=99
  248 |         bds->id =3D g_strdup(dev_name);
      |                 ^

This creates a pci-bridge device and gives it the same ID as the pxb
device being realized.  Doesn't this result in duplicate IDs?!?

../hw/arm/virt.c: In function =E2=80=98create_platform_bus=E2=80=99:
../hw/arm/virt.c:1512:13: error: assignment of read-only member =E2=80=98id=
=E2=80=99
 1512 |     dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE);
      |             ^

Helper function to create a platform-bus-device.  ID is set to
"platform-bus-device".  Feels like a bad idea.

../hw/ppc/e500.c: In function =E2=80=98ppce500_init=E2=80=99:
../hw/ppc/e500.c:1009:17: error: assignment of read-only member =E2=80=98id=
=E2=80=99
 1009 |         dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE);
      |                 ^

Likewise.

../hw/s390x/s390-pci-bus.c: In function =E2=80=98s390_pcihost_plug=E2=80=99=
:
../hw/s390x/s390-pci-bus.c:1003:21: error: assignment of read-only member =
=E2=80=98id=E2=80=99
 1003 |             dev->id =3D g_strdup_printf("auto_%02x:%02x.%01x",
      |                     ^

This supplies a default ID to a the device being plugged (I think).
Feels like a bad idea.

../hw/sh4/sh7750.c: In function =E2=80=98sh7750_init=E2=80=99:
../hw/sh4/sh7750.c:819:13: error: assignment of read-only member =E2=80=98i=
d=E2=80=99
  819 |     dev->id =3D g_strdup("sci");
      |             ^
../hw/sh4/sh7750.c:836:13: error: assignment of read-only member =E2=80=98i=
d=E2=80=99
  836 |     dev->id =3D g_strdup("scif");
      |             ^


These create sh-serial devices.  Their IDs are set to "sci" and "scif",
respectively.  Feels like a bad idea.


