Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F8115D72
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Dec 2019 17:18:56 +0100 (CET)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idcnH-0007m3-Db
	for lists+qemu-devel@lfdr.de; Sat, 07 Dec 2019 11:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1idcjj-00067x-Vz
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 11:15:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1idcjg-00048M-EC
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 11:15:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20027
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1idcjg-00047u-03
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 11:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575735310;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgtK9b3B9Bdcu8CEacjV7/FRXPwRgLumnGE0VYf4yEI=;
 b=NFuWGLd33bjlQ9HFV2x0SxRhaSHeMNWzhSG+wvWdlHHx2dxlhO/EnPG4FpSjifv4+MzAzQ
 hdtCrS9akKNifW8W1bh9IeSnqhT/yrfnPJqNf/hEWc5Ffn73RvPgF7OuK9hwlDMOAPy00G
 exdm22GxHvYC1T264y/eygZniddcov8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-5HJDCgOxMEO8Fh7gTZQKfA-1; Sat, 07 Dec 2019 08:14:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E6A100551C;
 Sat,  7 Dec 2019 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-34.bne.redhat.com [10.64.54.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1DFE60308;
 Sat,  7 Dec 2019 13:14:02 +0000 (UTC)
Subject: Re: [PATCH] hw/core: Fix data type in do_nmi()
To: Greg Kurz <groug@kaod.org>
References: <20191206063642.40942-1-gshan@redhat.com>
 <20191206175031.66f62929@bahia.w3ibm.bluemix.net>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8b4e97d1-eddb-b7d2-1069-453ec4a4263a@redhat.com>
Date: Sun, 8 Dec 2019 00:14:00 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191206175031.66f62929@bahia.w3ibm.bluemix.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5HJDCgOxMEO8Fh7gTZQKfA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/19 3:50 AM, Greg Kurz wrote:
> On Fri,  6 Dec 2019 17:36:42 +1100
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> object_dynamic_cast() should return machine (or GPIO) state instad of NMI
>> state in do_nmi(). So it's wrong to convert it to NMI state unconditionally.
>>
> 
> object_dynamic_cast() returns either its first argument if it can be cast
> to the given typename or NULL. Since the x86, ccw and spapr machines and
> the PowerMac GPIO implement the NMI interface, nothing is wrong here.
> 
> The do_nmi() function is called for all objects in the QOM tree and simply
> filters out the ones that don't implement the NMI interface.
> 
> I do agree that this isn't super obvious though. It would be clearer to
> do the filtering in the foreach() function. Something like:
> 
> https://patchwork.ozlabs.org/patch/1182232/
> 

Greg, Thanks for the review and comments. I think we're talking about
different issues. I do agree it's worthy to simplify the code with the
object_child_foreach_type(), but later.

When we have below parameters to qemu, object_dynamic_cast(o, TYPE_NMI)
returns object of "pc-q35-4.2-machine", which is passed to the subquent
NMIClass::nmi_monitor_handler(). However, the function expects a NMIState
from its prototype as below. This patch changes the prototype to fill the
gap.

    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);

    Changed to:

    void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error **errp);

    ~/sandbox/src/qemu/qemu.main.x86/x86_64-softmmu/qemu-system-x86_64              \
    --enable-kvm -machine type=q35,accel=kvm,kernel-irqchip=on -cpu host -smp 2 -m 1G    \
    -monitor none -serial mon:stdio -nographic -s                                        \
    -bios ~/sandbox/src/firmware/seabios/out/bios.bin                                    \
    -kernel ~/sandbox/src/linux/linux.main.x86/arch/x86/boot/bzImage                     \
    -initrd ~/sandbox/src/util/buildroot/output/images/rootfs.cpio.xz                    \
    -append "earlyprintk=ttyS0 console=ttyS0 debug"                                      \
    -device virtio-net-pci,netdev=unet,mac=52:54:00:f1:26:a6                             \
    -netdev user,id=unet,hostfwd=tcp::50959-:22                                          \
    -drive file=~/sandbox/images/vm.img,if=none,format=raw,id=nvme0                      \
    -device nvme,drive=nvme0,serial=foo                                                  \
    -drive file=~/sandbox/images/vm1.img,if=none,format=raw,id=nvme1                     \
    -device nvme,drive=nvme1,serial=foo1

>> This changes the prototype of NMIClass::nmi_monitor_handler() to accept
>> the parent object of NMI state instead of itself. With this, he parent object
>> is passed to the function, to avoid potential data corruption.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/nmi.c              | 8 ++++----
>>   hw/i386/x86.c              | 2 +-
>>   hw/misc/macio/gpio.c       | 6 +++---
>>   hw/ppc/spapr.c             | 2 +-
>>   hw/s390x/s390-virtio-ccw.c | 2 +-
>>   include/hw/nmi.h           | 2 +-
>>   6 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
>> index 481c4b3c7e..554708d0db 100644
>> --- a/hw/core/nmi.c
>> +++ b/hw/core/nmi.c
>> @@ -37,13 +37,13 @@ static void nmi_children(Object *o, struct do_nmi_s *ns);
>>   static int do_nmi(Object *o, void *opaque)
>>   {
>>       struct do_nmi_s *ns = opaque;
>> -    NMIState *n = (NMIState *) object_dynamic_cast(o, TYPE_NMI);
>> +    Object *parent = object_dynamic_cast(o, TYPE_NMI);
>>   
>> -    if (n) {
>> -        NMIClass *nc = NMI_GET_CLASS(n);
>> +    if (parent) {
>> +        NMIClass *nc = NMI_GET_CLASS(parent);
>>   
>>           ns->handled = true;
>> -        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
>> +        nc->nmi_monitor_handler(parent, ns->cpu_index, &ns->err);
>>           if (ns->err) {
>>               return -1;
>>           }
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 394edc2f72..b98204f104 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -190,7 +190,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>>       return ms->possible_cpus;
>>   }
>>   
>> -static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
>> +static void x86_nmi(Object *parent, int cpu_index, Error **errp)
>>   {
>>       /* cpu index isn't used */
>>       CPUState *cs;
>> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
>> index 6cca6b27d6..6b4dfcc188 100644
>> --- a/hw/misc/macio/gpio.c
>> +++ b/hw/misc/macio/gpio.c
>> @@ -196,10 +196,10 @@ static void macio_gpio_reset(DeviceState *dev)
>>       macio_set_gpio(s, 1, true);
>>   }
>>   
>> -static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
>> +static void macio_gpio_nmi(Object *parent, int cpu_index, Error **errp)
>>   {
>> -    macio_set_gpio(MACIO_GPIO(n), 9, true);
>> -    macio_set_gpio(MACIO_GPIO(n), 9, false);
>> +    macio_set_gpio(MACIO_GPIO(parent), 9, true);
>> +    macio_set_gpio(MACIO_GPIO(parent), 9, false);
>>   }
>>   
>>   static void macio_gpio_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index e076f6023c..3b92e4013d 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3377,7 +3377,7 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg)
>>       ppc_cpu_do_system_reset(cs);
>>   }
>>   
>> -static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
>> +static void spapr_nmi(Object *parent, int cpu_index, Error **errp)
>>   {
>>       CPUState *cs;
>>   
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index d3edeef0ad..a49952a8b9 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -431,7 +431,7 @@ static void s390_hot_add_cpu(MachineState *machine,
>>       s390x_new_cpu(object_class_get_name(oc), id, errp);
>>   }
>>   
>> -static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
>> +static void s390_nmi(Object *parent, int cpu_index, Error **errp)
>>   {
>>       CPUState *cs = qemu_get_cpu(cpu_index);
>>   
>> diff --git a/include/hw/nmi.h b/include/hw/nmi.h
>> index a1e128724e..75afa67790 100644
>> --- a/include/hw/nmi.h
>> +++ b/include/hw/nmi.h
>> @@ -38,7 +38,7 @@ typedef struct NMIState NMIState;
>>   typedef struct NMIClass {
>>       InterfaceClass parent_class;
>>   
>> -    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
>> +    void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error **errp);
>>   } NMIClass;
>>   
>>   void nmi_monitor_handle(int cpu_index, Error **errp);
> 

Regards,
Gavin


