Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560321426FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 10:19:34 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itTDZ-0008Hj-D3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 04:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itTCO-0007iZ-Pj
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:18:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itTCI-0005HN-MD
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:18:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59796
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itTCH-0005Ga-Ou
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 04:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579511892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1eG5DBbHBxtUYMbHiw0pDzfNdJpz+WsmdngU6SvYvw=;
 b=fTsFSZg0pTaNJrT6S1s/oK3eRVCRl8EXYaEbW+KVUbgR9GYxmPh3yLyMx+qLRSHtIFbk+l
 u4rj95K1tB9rzsHB0nm5oza30IrphwjiSkznP7zepzySdJ7BQbfAXQhCvjWMS2Q7M2fOGg
 bEzQn52Hl7UCyivvb+fdBXvlpKkGhbI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-qfo5BqRqNLOat6AwT33HgA-1; Mon, 20 Jan 2020 04:18:10 -0500
Received: by mail-wr1-f69.google.com with SMTP id f17so13922381wrt.19
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 01:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z7bUlgHpcig6AhfOGBfJ6rR1fzeJbYum88MsDUbCzAI=;
 b=VYufkWKdVxTC7FA5QZBfis+u1pjpMyCcXYxCece0/vNdXsIbVhtprBoL8tnGqHvFC9
 0Mu87C0gdkQ6jaVNhuxaD9r1babjwyiIvao8LH2HvraMGoKXCwm4+WAsWAk70k07eUZH
 vRNRyOHOKrIzaglXmVOXXjV26hzgWg7AiowPdXwwdBG+Yjafu/sUCxdHRo8ITbx5tL7W
 weBS5z2Utzn4X/ePZYgAhuOe7Pnwu6FQ/UYVZI6bWYYQrEw7VwMCJshaK2AmIynEwvh6
 WaI6Zaa/qy/XsGbA/ae3CXInSer86SnEux1hSTiymgHDi//H5m2O9p0mThDCVZ9sVPdY
 1b9A==
X-Gm-Message-State: APjAAAXpP2MQqDMOQxw5X/y7Ku+v+qacfmoQN1aJBiqDPxgA35aABwNM
 WqvCrwrioVJf9rI4WbVlSG4tJmz0RcAwaLkrHvGDLzSSL7YY7DFY+3nVA8xyPmiI3EO4/cZ8TVY
 yNeWT5MXsZr68qo8=
X-Received: by 2002:a1c:5444:: with SMTP id p4mr18456691wmi.33.1579511889209; 
 Mon, 20 Jan 2020 01:18:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6I0itr6VUa5lI6tMseF1bQmlf5xaaGqRp5jLe8ORhbH06+4dHxC+aoTfKsjhUi3++LFypHw==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr18456653wmi.33.1579511888772; 
 Mon, 20 Jan 2020 01:18:08 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id y20sm4832803wmi.25.2020.01.20.01.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 01:18:08 -0800 (PST)
Subject: Re: [PATCH v7 03/11] hw/core: create Resettable QOM interface
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20200115123620.250132-1-damien.hedde@greensocs.com>
 <20200115123620.250132-4-damien.hedde@greensocs.com>
 <b527f52b-a632-2044-4813-c06751b663ce@redhat.com>
 <19a6a511-a259-8d25-cba6-7059fbe4fe6f@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f357f91-277c-1a6a-d007-2990ceac00c9@redhat.com>
Date: Mon, 20 Jan 2020 10:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <19a6a511-a259-8d25-cba6-7059fbe4fe6f@greensocs.com>
Content-Language: en-US
X-MC-Unique: qfo5BqRqNLOat6AwT33HgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org, edgari@xilinx.com,
 pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/20 10:08 AM, Damien Hedde wrote:
> On 1/18/20 7:42 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/15/20 1:36 PM, Damien Hedde wrote:
>>> This commit defines an interface allowing multi-phase reset. This aims
>>> to solve a problem of the actual single-phase reset (built in
>>> DeviceClass and BusClass): reset behavior is dependent on the order
>>> in which reset handlers are called. In particular doing external
>>> side-effect (like setting an qemu_irq) is problematic because receiving
>>> object may not be reset yet.
>>>
>>> The Resettable interface divides the reset in 3 well defined phases.
>>> To reset an object tree, all 1st phases are executed then all 2nd then
>>> all 3rd. See the comments in include/hw/resettable.h for a more complet=
e
>>> description. The interface defines 3 phases to let the future
>>> possibility of holding an object into reset for some time.
>>>
>>> The qdev/qbus reset in DeviceClass and BusClass will be modified in
>>> following commits to use this interface. A mechanism is provided
>>> to allow executing a transitional reset handler in place of the 2nd
>>> phase which is executed in children-then-parent order inside a tree.
>>> This will allow to transition devices and buses smoothly while
>>> keeping the exact current qdev/qbus reset behavior for now.
>>>
>>> Documentation will be added in a following commit.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>
>>> v7 update: un-nest struct ResettablePhases
>>> ---
>>>  =C2=A0 Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>  =C2=A0 include/hw/resettable.h | 211 +++++++++++++++++++++++++++++++++=
++
>>>  =C2=A0 hw/core/resettable.c=C2=A0=C2=A0=C2=A0 | 238 ++++++++++++++++++=
++++++++++++++++++++++
>>>  =C2=A0 hw/core/Makefile.objs=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>  =C2=A0 hw/core/trace-events=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +++
>>>  =C2=A0 5 files changed, 468 insertions(+)
>>>  =C2=A0 create mode 100644 include/hw/resettable.h
>>>  =C2=A0 create mode 100644 hw/core/resettable.c
>>>
>>> diff --git a/Makefile.objs b/Makefile.objs
>>> index 7c1e50f9d6..9752d549b4 100644
>>> --- a/Makefile.objs
>>> +++ b/Makefile.objs
>>> @@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
>>>  =C2=A0 trace-events-subdirs +=3D net
>>>  =C2=A0 trace-events-subdirs +=3D ui
>>>  =C2=A0 endif
>>> +trace-events-subdirs +=3D hw/core
>>>  =C2=A0 trace-events-subdirs +=3D hw/display
>>>  =C2=A0 trace-events-subdirs +=3D qapi
>>>  =C2=A0 trace-events-subdirs +=3D qom
>>> diff --git a/include/hw/resettable.h b/include/hw/resettable.h
>>> new file mode 100644
>>> index 0000000000..58b3df4c22
>>> --- /dev/null
>>> +++ b/include/hw/resettable.h
>>> @@ -0,0 +1,211 @@
>>> +/*
>>> + * Resettable interface header.
>>> + *
>>> + * Copyright (c) 2019 GreenSocs SAS
>>> + *
>>> + * Authors:
>>> + *=C2=A0=C2=A0 Damien Hedde
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>>> later.
>>> + * See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#ifndef HW_RESETTABLE_H
>>> +#define HW_RESETTABLE_H
>>> +
>>> +#include "qom/object.h"
>>> +
>>> +#define TYPE_RESETTABLE_INTERFACE "resettable"
>>> +
>>> +#define RESETTABLE_CLASS(class) \
>>> +=C2=A0=C2=A0=C2=A0 OBJECT_CLASS_CHECK(ResettableClass, (class),
>>> TYPE_RESETTABLE_INTERFACE)
>>> +
>>> +#define RESETTABLE_GET_CLASS(obj) \
>>> +=C2=A0=C2=A0=C2=A0 OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESET=
TABLE_INTERFACE)
>>> +
>>> +typedef struct ResettableState ResettableState;
>>> +
>>> +/**
>>> + * ResetType:
>>> + * Types of reset.
>>> + *
>>> + * + Cold: reset resulting from a power cycle of the object.
>>> + *
>>> + * TODO: Support has to be added to handle more types. In particular,
>>> + * ResettableState structure needs to be expanded.
>>> + */
>>> +typedef enum ResetType {
>>> +=C2=A0=C2=A0=C2=A0 RESET_TYPE_COLD,
>>> +} ResetType;
>>> +
>>> +/*
>>> + * ResettableClass:
>>> + * Interface for resettable objects.
>>> + *
>>> + * See docs/devel/reset.rst for more detailed information about how
>>> QEMU models
>>> + * reset. This whole API must only be used when holding the iothread
>>> mutex.
>>> + *
>>> + * All objects which can be reset must implement this interface;
>>> + * it is usually provided by a base class such as DeviceClass or
>>> BusClass.
>>> + * Every Resettable object must maintain some state tracking the
>>> + * progress of a reset operation by providing a ResettableState
>>> structure.
>>> + * The functions defined in this module take care of updating the
>>> + * state of the reset.
>>> + * The base class implementation of the interface provides this
>>> + * state and implements the associated method: get_state.
>>> + *
>>> + * Concrete object implementations (typically specific devices
>>> + * such as a UART model) should provide the functions
>>> + * for the phases.enter, phases.hold and phases.exit methods, which
>>> + * they can set in their class init function, either directly or
>>> + * by calling resettable_class_set_parent_phases().
>>> + * The phase methods are guaranteed to only only ever be called once
>>> + * for any reset event, in the order 'enter', 'hold', 'exit'.
>>> + * An object will always move quickly from 'enter' to 'hold'
>>> + * but might remain in 'hold' for an arbitrary period of time
>>> + * before eventually reset is deasserted and the 'exit' phase is calle=
d.
>>> + * Object implementations should be prepared for functions handling
>>> + * inbound connections from other devices (such as qemu_irq handler
>>> + * functions) to be called at any point during reset after their
>>> + * 'enter' method has been called.
>>> + *
>>> + * Users of a resettable object should not call these methods
>>> + * directly, but instead use the function resettable_reset().
>>> + *
>>> + * @phases.enter: This phase is called when the object enters reset. I=
t
>>> + * should reset local state of the object, but it must not do
>>> anything that
>>> + * has a side-effect on other objects, such as raising or lowering a
>>> qemu_irq
>>> + * line or reading or writing guest memory. It takes the reset's type =
as
>>> + * argument.
>>> + *
>>> + * @phases.hold: This phase is called for entry into reset, once
>>> every object
>>> + * in the system which is being reset has had its @phases.enter
>>> method called.
>>> + * At this point devices can do actions that affect other objects.
>>> + *
>>> + * @phases.exit: This phase is called when the object leaves the
>>> reset state.
>>> + * Actions affecting other objects are permitted.
>>> + *
>>> + * @get_state: Mandatory method which must return a pointer to a
>>> + * ResettableState.
>>> + *
>>> + * @get_transitional_function: transitional method to handle
>>> Resettable objects
>>> + * not yet fully moved to this interface. It will be removed as soon
>>> as it is
>>> + * not needed anymore. This method is optional and may return a
>>> pointer to a
>>> + * function to be used instead of the phases. If the method exists
>>> and returns
>>> + * a non-NULL function pointer then that function is executed as a
>>> replacement
>>> + * of the 'hold' phase method taking the object as argument. The two
>>> other phase
>>> + * methods are not executed.
>>> + *
>>> + * @child_foreach: Executes a given callback on every Resettable
>>> child. Child
>>> + * in this context means a child in the qbus tree, so the children of
>>> a qbus
>>> + * are the devices on it, and the children of a device are all the
>>> buses it
>>> + * owns. This is not the same as the QOM object hierarchy. The
>>> function takes
>>> + * additional opaque and ResetType arguments which must be passed
>>> unmodified to
>>> + * the callback.
>>> + */
>>> +typedef void (*ResettableEnterPhase)(Object *obj, ResetType type);
>>> +typedef void (*ResettableHoldPhase)(Object *obj);
>>> +typedef void (*ResettableExitPhase)(Object *obj);
>>> +typedef ResettableState * (*ResettableGetState)(Object *obj);
>>> +typedef void (*ResettableTrFunction)(Object *obj);
>>> +typedef ResettableTrFunction (*ResettableGetTrFunction)(Object *obj);
>>> +typedef void (*ResettableChildCallback)(Object *, void *opaque,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ResetType type);
>>> +typedef void (*ResettableChildForeach)(Object *obj,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ResettableChildCallback cb,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 void *opaque, ResetType type);
>>> +typedef struct ResettablePhases {
>>> +=C2=A0=C2=A0=C2=A0 ResettableEnterPhase enter;
>>> +=C2=A0=C2=A0=C2=A0 ResettableHoldPhase hold;
>>> +=C2=A0=C2=A0=C2=A0 ResettableExitPhase exit;
>>> +} ResettablePhases;
>>> +typedef struct ResettableClass {
>>> +=C2=A0=C2=A0=C2=A0 InterfaceClass parent_class;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Phase methods */
>>> +=C2=A0=C2=A0=C2=A0 ResettablePhases phases;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* State access method */
>>> +=C2=A0=C2=A0=C2=A0 ResettableGetState get_state;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Transitional method for legacy reset compatibili=
ty */
>>> +=C2=A0=C2=A0=C2=A0 ResettableGetTrFunction get_transitional_function;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Hierarchy handling method */
>>> +=C2=A0=C2=A0=C2=A0 ResettableChildForeach child_foreach;
>>> +} ResettableClass;
>>> +
>>> +/**
>>> + * ResettableState:
>>> + * Structure holding reset related state. The fields should not be
>>> accessed
>>> + * directly; the definition is here to allow further inclusion into
>>> other
>>> + * objects.
>>> + *
>>> + * @count: Number of reset level the object is into. It is
>>> incremented when
>>> + * the reset operation starts and decremented when it finishes.
>>
>> Maybe you can add this comment and the variable in patch 5/11, that
>> would make patch 5 easier to review.
>=20
> The variable is used in this patch so I cannot do that.

Oops you are right o_O ...

>>
>>> + * @hold_phase_pending: flag which indicates that we need to invoke
>>> the 'hold'
>>> + * phase handler for this object.
>>> + * @exit_phase_in_progress: true if we are currently in the exit phase
>>> + */
>>> +struct ResettableState {
>>> +=C2=A0=C2=A0=C2=A0 uint32_t count;
>>
>> Maybe simply 'unsigned'?
>>
>=20
> Ok.
>=20
> --
> Damien


