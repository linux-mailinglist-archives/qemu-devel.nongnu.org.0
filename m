Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0C204C40
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:24:15 +0200 (CEST)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jneE3-00063H-15
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jneCw-0005Gn-66
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:23:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29852
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jneCt-0002P3-6d
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592900581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WBocIYEs3qc/YC/LoNZO5dWSeB0pAgII+eW6V4vfEc=;
 b=ELUN8ij9scNHlnR/JQj8Dt27pOrZmkqBXQ0jxVqVbhNb1B+TcXAOmIdpFugnoFRIrCWBNH
 DSFsQp03H1k6Vol3ageJjDB2O0qORq91Q9fu7vMdOAPgg2lP82djhPU9S4+Anm3nJAZhZJ
 R61ox8ImrYTwWRjrwx91NkDH+PNNTyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-OEZaExvkMdSwplWLZ8zDzA-1; Tue, 23 Jun 2020 04:22:59 -0400
X-MC-Unique: OEZaExvkMdSwplWLZ8zDzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0518C100CCC4;
 Tue, 23 Jun 2020 08:22:58 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F92C5D9DA;
 Tue, 23 Jun 2020 08:22:49 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] qdev: Introduce DEFINE_PROP_RESERVED_REGION
To: Markus Armbruster <armbru@redhat.com>
References: <20200611151209.22547-1-eric.auger@redhat.com>
 <20200611151209.22547-2-eric.auger@redhat.com>
 <87k0zzz6nt.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f0ec7470-d683-1bfd-103d-54c57ebd3863@redhat.com>
Date: Tue, 23 Jun 2020 10:22:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87k0zzz6nt.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 6/22/20 1:22 PM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> Introduce a new property defining a reserved region:
>> <low address>, <high address>, <type>.
>>
>> This will be used to encode reserved IOVA regions.
>>
>> For instance, in virtio-iommu use case, reserved IOVA regions
>> will be passed by the machine code to the virtio-iommu-pci
>> device (an array of those). The type of the reserved region
>> will match the virtio_iommu_probe_resv_mem subtype value:
>> - VIRTIO_IOMMU_RESV_MEM_T_RESERVED (0)
>> - VIRTIO_IOMMU_RESV_MEM_T_MSI (1)
>>
>> on PC/Q35 machine, this will be used to inform the
>> virtio-iommu-pci device it should bypass the MSI region.
>> The reserved region will be: 0xfee00000, 0xfeefffff, 1.
>>
>> On ARM, we can declare the ITS MSI doorbell as an MSI
>> region to prevent MSIs from being mapped on guest side.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v11 -> v12:
>> - rename into DEFINE_PROP_RESERVED_REGION
>> - do not use g_strsplit anymore, use endptr instead
>> - remove 0x references
>> ---
>>  include/exec/memory.h        |  6 +++
>>  include/hw/qdev-properties.h |  3 ++
>>  include/qemu/typedefs.h      |  1 +
>>  hw/core/qdev-properties.c    | 89 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 99 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 3e00cdbbfa..3ee8224fa7 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -57,6 +57,12 @@ struct MemoryRegionMmio {
>>      CPUWriteMemoryFunc *write[3];
>>  };
>>  
>> +struct ReservedRegion {
>> +    hwaddr low;
>> +    hwaddr high;
>> +    unsigned int type;
>> +};
>> +
>>  typedef struct IOMMUTLBEntry IOMMUTLBEntry;
>>  
>>  /* See address_space_translate: bit 0 is read, bit 1 is write.  */
>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>> index f161604fb6..03bf850a7e 100644
>> --- a/include/hw/qdev-properties.h
>> +++ b/include/hw/qdev-properties.h
>> @@ -19,6 +19,7 @@ extern const PropertyInfo qdev_prop_string;
>>  extern const PropertyInfo qdev_prop_chr;
>>  extern const PropertyInfo qdev_prop_tpm;
>>  extern const PropertyInfo qdev_prop_macaddr;
>> +extern const PropertyInfo qdev_prop_reserved_region;
>>  extern const PropertyInfo qdev_prop_on_off_auto;
>>  extern const PropertyInfo qdev_prop_multifd_compression;
>>  extern const PropertyInfo qdev_prop_losttickpolicy;
>> @@ -183,6 +184,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>>      DEFINE_PROP(_n, _s, _f, qdev_prop_drive_iothread, BlockBackend *)
>>  #define DEFINE_PROP_MACADDR(_n, _s, _f)         \
>>      DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
>> +#define DEFINE_PROP_RESERVED_REGION(_n, _s, _f)         \
>> +    DEFINE_PROP(_n, _s, _f, qdev_prop_reserved_region, ReservedRegion)
>>  #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
>>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
>>  #define DEFINE_PROP_MULTIFD_COMPRESSION(_n, _s, _f, _d) \
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index ecf3cde26c..85c4f891f4 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -59,6 +59,7 @@ typedef struct ISABus ISABus;
>>  typedef struct ISADevice ISADevice;
>>  typedef struct IsaDma IsaDma;
>>  typedef struct MACAddr MACAddr;
>> +typedef struct ReservedRegion ReservedRegion;
>>  typedef struct MachineClass MachineClass;
>>  typedef struct MachineState MachineState;
>>  typedef struct MemoryListener MemoryListener;
>> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
>> index cc924815da..15b84adbee 100644
>> --- a/hw/core/qdev-properties.c
>> +++ b/hw/core/qdev-properties.c
>> @@ -14,6 +14,7 @@
>>  #include "qapi/visitor.h"
>>  #include "chardev/char.h"
>>  #include "qemu/uuid.h"
>> +#include "qemu/cutils.h"
>>  
>>  void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>>                                    Error **errp)
>> @@ -577,6 +578,94 @@ const PropertyInfo qdev_prop_macaddr = {
>>      .set   = set_mac,
>>  };
>>  
>> +/* --- Reserved Region --- */
>> +
>> +/*
>> + * accepted syntax version:
>> + *   <low address>,<high address>,<type>
>> + *   where low/high addresses are uint64_t in hexadecimal
>> + *   and type is an unsigned integer in decimal
>> + */
>> +static void get_reserved_region(Object *obj, Visitor *v, const char *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    DeviceState *dev = DEVICE(obj);
>> +    Property *prop = opaque;
>> +    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
>> +    char buffer[64];
>> +    char *p = buffer;
>> +
>> +    snprintf(buffer, sizeof(buffer), "0x%"PRIx64",0x%"PRIx64",%u",
>> +             rr->low, rr->high, rr->type);
> 
> Matches existing practice in other getters.  Nevertheless, I'd suggest
> something like
> 
>        n = snprintf(buffer, sizeof(buffer), ...);
>        assert(n < sizeof(buffer);
OK
> 
>> +
>> +    visit_type_str(v, name, &p, errp);
>> +}
>> +
>> +static void set_reserved_region(Object *obj, Visitor *v, const char *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    DeviceState *dev = DEVICE(obj);
>> +    Property *prop = opaque;
>> +    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
>> +    Error *local_err = NULL;
>> +    const char *endptr;
>> +    char *str;
>> +    int ret;
>> +
>> +    if (dev->realized) {
>> +        qdev_prop_set_after_realize(dev, name, errp);
>> +        return;
>> +    }
>> +
>> +    visit_type_str(v, name, &str, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    ret = qemu_strtou64(str, &endptr, 16, &rr->low);
>> +    if (ret) {
>> +        error_setg(errp, "Failed to decode reserved region low addr");
>> +        error_append_hint(errp,
>> +                          "should be an address in hexadecimal\n");
> 
> Comes out like this:
> 
>     qemu-system-x86_64: -device ...: Failed to decode reserved region low addr
>     should be an address in hexadecimal
> 
> I'd capitalize the other way, to get
> 
>     qemu-system-x86_64: -device ...: failed to decode reserved region low addr
>     Should be an address in hexadecimal
> 
> Note: output is made up; I failed at figuring out how to use the new
> property.  An example in PATCH 4's commit message might help.
OK I will add one example. In practice in the virtio-iommu case the
property is not really meant to be passed by the end-user but should be
set by the machine code. However I have just tested from the cmd line
and it looks using commas as separators is a bad idea because it
collides with ',' separating properties. So if you're OK I will change
the comma into ':'.

> 
> Since the error message fails to mention @name, the user is left
> guessing unless "-device ..." contains just one reserved region
> parameter.
> 
> What about something like this:
> 
>            error_setg(errp, "start address of reserved region '%s'"
>                       " must be a hexadecimal integer",
>                       name);
Sure. Given the fact the property is named reserved-region[n], this may
be simplified into
            error_setg(errp, "start address of '%s'"
                       " must be a hexadecimal integer",
>                      name);
> 
> No need to mess around with error_append_hint() then.
OK
> 
> Same for the other error messages.
> 
>> +        goto out;
>> +    }
>> +    if (*endptr != ',') {
>> +        goto separator_error;
>> +    }
>> +
>> +    ret = qemu_strtou64(endptr + 1, &endptr, 16, &rr->high);
>> +    if (ret) {
>> +        error_setg(errp, "Failed to decode reserved region high addr");
>> +        error_append_hint(errp,
>> +                          "should be an address in hexadecimal\n");
>> +        goto out;
>> +    }
>> +    if (*endptr != ',') {
>> +        goto separator_error;
>> +    }
>> +
>> +    ret = qemu_strtoui(endptr + 1, &endptr, 10, &rr->type);
>> +    if (ret) {
>> +        error_setg(errp, "Failed to decode reserved region type");
>> +        error_append_hint(errp, "should be an unsigned integer in decimal\n");
>> +    }
> 
> I dimly remember discussing the wisdom of numeric type here, dig, dig,
> ..., aha:
> 
>     Subject: Re: [PATCH for-5.0 v11 12/20] qapi: Introduce DEFINE_PROP_INTERVAL
>     Date: Fri, 13 Dec 2019 11:03:02 +0100
>     Message-ID: <87y2vg4k6h.fsf@dusky.pond.sub.org>
> 
>     >> So the "label" part of "<low address>,<high address>,label" is a number?
>     > yes it is.
>     >> 
>     >> Is a number appropriate for your use case, or would an enum be better?
>     > I think a number is OK. There might be other types of reserved regions
>     > in the future. Also if we want to allow somebody else to reuse that
>     > property in another context, I would rather leave it open?
> 
>     I'd prioritize the user interface over possible reuse (which might never
>     happen).  Mind, I'm not telling you using numbers is a bad user
>     interface.  In general, enums are nicer, but I don't know enough about
>     this particular case.
Yep I remember too ;-) I left as it was because I think this property
could be used for other use cases.
> 
>> +    goto out;
>> +
>> +separator_error:
>> +    error_setg(errp, "reserved region fields must be separated with commas");
> 
> I'm not sure de-duplicating this error message is worth the extra goto.
> 
>> +out:
>> +    g_free(str);
>> +    return;
>> +}
>> +
>> +const PropertyInfo qdev_prop_reserved_region = {
>> +    .name  = "reserved_region",
>> +    .description = "Reserved Region, example: 0xFEE00000,0xFEEFFFFF,0",
>> +    .get   = get_reserved_region,
>> +    .set   = set_reserved_region,
>> +};
>> +
>>  /* --- on/off/auto --- */
>>  
>>  const PropertyInfo qdev_prop_on_off_auto = {
> 
> Can't find anything that's actually wrong, so
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
Thanks

Eric
> 


