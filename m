Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A58467A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 09:56:41 +0200 (CEST)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvGoL-0007O7-0T
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 03:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38519)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hvGn7-0005G1-4M
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hvGn5-0003j5-Nc
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:55:25 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39954)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hvGmz-0003dh-Q1; Wed, 07 Aug 2019 03:55:18 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2D8F496F50;
 Wed,  7 Aug 2019 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565164515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmr5cHNGizkApLgOIIl0Cz/28sApj9LgWJnIN9Hcs0U=;
 b=KH/BTfDgUA7tkbzJE676oOOKArxWsr7DVZa5KASk8k8AcBK1c0C1NUF2lOjah9OOtGiEna
 J6xCU3SvonYOTuhAZWM68lbYym303mnfgElc7hPTVOnMrACVj8Vg0Oax6I2TpO70X9Pt97
 DVCWEdG49umCNkZGZKFm1XSj/1BM85U=
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-5-damien.hedde@greensocs.com>
 <20190731055640.GC2032@umbus.fritz.box>
 <98250dc3-c2db-844d-f9f5-46a27488e94f@greensocs.com>
 <20190806003504.GC14494@umbus.fritz.box>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <5da257a8-6d35-8618-2fa2-38cb2ed19fb4@greensocs.com>
Date: Wed, 7 Aug 2019 09:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806003504.GC14494@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565164515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmr5cHNGizkApLgOIIl0Cz/28sApj9LgWJnIN9Hcs0U=;
 b=2mIwbpJJwiz8i72AkpAHsOISbiNXRJhNrDapqiT5W7ttEWqEKSKFFFlPK3h0wmxrwTmbKp
 gndkz08mP2CLp6OIk0ZfPxxZNKwb2TOWDty02HgtbB6G97ANLeTKpumG9yWN7TnbOGMT7s
 rQnP5h9exOKdPmKzEmnVit3pRGltgA4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565164515; a=rsa-sha256; cv=none;
 b=3Yzo68Sz/Iyb+Myf9gfVkoIUdyJi+fylI+FsGXcTUEYlNtjKMXZQJZE4c13CJ8oNdaJLEO
 3x9Q/LCRK70ufZiwN3/md+6ErO0gGDYOKekqSz73Yd2brFkMDfBe+FS5HjXhC+Hp9YQfgh
 a0xFLT+7TGTuc/AxCZuEK42EqXiMWao=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [PATCH v3 04/33] make Device and Bus Resettable
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com, rth@twiddle.net,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/6/19 2:35 AM, David Gibson wrote:
> On Wed, Jul 31, 2019 at 11:09:05AM +0200, Damien Hedde wrote:
>>
>>
>> On 7/31/19 7:56 AM, David Gibson wrote:
>>> On Mon, Jul 29, 2019 at 04:56:25PM +0200, Damien Hedde wrote:
>>>> This add Resettable interface implementation for both Bus and Device.
>>>>
>>>> *resetting* counter and *reset_is_cold* flag are added in DeviceState
>>>> and BusState.
>>>>
>>>> Compatibility with existing code base is ensured.
>>>> The legacy bus or device reset method is called in the new exit phase
>>>> and the other 2 phases are let empty. Using the exit phase guarantee that
>>>> legacy resets are called in the "post" order (ie: children then parent)
>>>> in hierarchical reset. That is the same order as legacy qdev_reset_all
>>>> or qbus_reset_all were using.
>>>>
>>>> New *device_reset* and *bus_reset* function are proposed with an
>>>> additional boolean argument telling whether the reset is cold or warm.
>>>> Helper functions *device_reset_[warm|cold]* and *bus_reset_[warm|cold]*
>>>> are defined also as helpers.
>>>>
>>>> Also add a [device|bus]_is_resetting and [device|bus]_is_reset_cold
>>>> functions telling respectively whether the object is currently under reset and
>>>> if the current reset is cold or not.
>>>>
>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>> ---
>>>>  hw/core/bus.c          | 85 ++++++++++++++++++++++++++++++++++++++++++
>>>>  hw/core/qdev.c         | 82 ++++++++++++++++++++++++++++++++++++++++
>>>>  include/hw/qdev-core.h | 84 ++++++++++++++++++++++++++++++++++++++---
>>>>  tests/Makefile.include |  1 +
>>>>  4 files changed, 247 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/core/bus.c b/hw/core/bus.c
>>>> index 17bc1edcde..08a97addb6 100644
>>>> --- a/hw/core/bus.c
>>>> +++ b/hw/core/bus.c
>>>> @@ -22,6 +22,7 @@
>>>>  #include "qemu/module.h"
>>>>  #include "hw/qdev.h"
>>>>  #include "qapi/error.h"
>>>> +#include "hw/resettable.h"
>>>>  
>>>>  void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **errp)
>>>>  {
>>>> @@ -68,6 +69,75 @@ int qbus_walk_children(BusState *bus,
>>>>      return 0;
>>>>  }
>>>>  
>>>> +void bus_reset(BusState *bus, bool cold)
>>>> +{
>>>> +    resettable_reset(OBJECT(bus), cold);
>>>> +}
>>>> +
>>>> +bool bus_is_resetting(BusState *bus)
>>>> +{
>>>> +    return (bus->resetting != 0);
>>>> +}
>>>> +
>>>> +bool bus_is_reset_cold(BusState *bus)
>>>> +{
>>>> +    return bus->reset_is_cold;
>>>> +}
>>>> +
>>>> +static uint32_t bus_get_reset_count(Object *obj)
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    return bus->resetting;
>>>> +}
>>>> +
>>>> +static uint32_t bus_increment_reset_count(Object *obj)
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    return ++bus->resetting;
>>>> +}
>>>> +
>>>> +static uint32_t bus_decrement_reset_count(Object *obj)
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    return --bus->resetting;
>>>> +}
>>>> +
>>>> +static bool bus_set_reset_cold(Object *obj, bool cold)
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    bool old = bus->reset_is_cold;
>>>> +    bus->reset_is_cold = cold;
>>>> +    return old;
>>>> +}
>>>> +
>>>> +static bool bus_set_hold_needed(Object *obj, bool hold_needed)
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    bool old = bus->reset_hold_needed;
>>>> +    bus->reset_hold_needed = hold_needed;
>>>> +    return old;
>>>> +}
>>>> +
>>>> +static void bus_foreach_reset_child(Object *obj, void (*func)(Object *))
>>>> +{
>>>> +    BusState *bus = BUS(obj);
>>>> +    BusChild *kid;
>>>> +
>>>> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
>>>> +        func(OBJECT(kid->child));
>>>> +    }
>>>> +}
>>>
>>> IIUC, every resettable class would need more or less identical
>>> implementations of the above.  That seems like an awful lot of
>>> boilerplate.
>>
>> Do you mean the get/increment_count/decrement_count, set_cold/hold part ?
>> True, but it's limited to the base classes.
>> Since Resettable is an interface, we have no state there to store what
>> we need. Only alternative is to have some kind of single
>> get_resettable_state method returning a pointer to the state (allowing
>> us to keep the functions in the interface code).
>> Beyond Device and Bus, which are done here, there is probably not so
>> many class candidates for the Resettable interface.
> 
> Right.  I can't immediately see a better way to handle this, but it
> still seems like a mild code smell.
> 

Only definitive solution to this would be to make DeviceClass and
BusClass inherit from a common Resettable object.

Would it be better if I use a common struct (eg: ResettableState)
holding the different fields ?
Then I can have a single implementation of the method and do for example:
static uint32_t bus_decrement_reset_count(Object *obj)
{
     return decrement_reset_count(&(BUS(obj))->reset_state);
}
static uint32_t device_decrement_reset_count(Object *obj)
{
     return decrement_reset_count(&(DEV(dev))->reset_state);
}

I can also merge the 3 count related method into one if it helps.

--
Damien


