Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14F87484
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 10:46:56 +0200 (CEST)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw0Y3-0003w3-L6
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 04:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41477)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw0X2-0002nE-Sc
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 04:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw0X1-0000IU-Pa
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 04:45:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48248)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hw0Wx-0000C5-5l; Fri, 09 Aug 2019 04:45:47 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9209796F50;
 Fri,  9 Aug 2019 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565340344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH2GCR90nlrb6642sacXGWJuMxDwtb/WWQmlYkgUsPs=;
 b=pRtTP7ZVaFLc80fvNDaR1uQicQgNBqo50aVhFBdSSNugLCx6bBDyZMAun870loHgYzP34q
 mMWDMhga9VLlFgzLdAHG5f3pF8ztbmH7g4+Ds8mqSBhB6nyGfu2yuNrz5QHf0z5mUjCGSo
 gEJl9BRk/Jnztq2+mfJmQVJ0qiMnrB4=
To: David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
 <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
 <20190809055132.GT5465@umbus.fritz.box>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <5ba72330-dbbc-fdae-d003-9f7d08ba4600@greensocs.com>
Date: Fri, 9 Aug 2019 10:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809055132.GT5465@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565340344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH2GCR90nlrb6642sacXGWJuMxDwtb/WWQmlYkgUsPs=;
 b=YQCtrTT3PydaKnal38MASFwn5Hwr2MMPCBKOBxqsh9FNShjL5ZhVSl0U4j6tpW0aaCrI7n
 qW0BS7W/02tMMLudSEQPTiIpsX3GTGh+9XxKJ/xcLogtFVgZ946Yr06M6GcZCIY//vk98R
 FptUpJqoMIBe4FLOw2CiqmjWyO0nzY4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565340344; a=rsa-sha256; cv=none;
 b=XllIP/eq0D/WO1uh+oMOpikYU03kJTp8GkJvVL8xjQ12T4ga5+tDZu+1llLAHrjj09Xupo
 Z7CWtmV9alj+6q2vjORG11VDtmqmTphkVveKA9CYxqzCcsPS+N0lM+juJMmeYM/ZWxkmOT
 bcgzyWIl+hjXSeNDyljehOxIzhUBCZk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [PATCH v3 08/33] Add function to control reset
 with gpio inputs
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/9/19 7:51 AM, David Gibson wrote:
> On Wed, Aug 07, 2019 at 11:37:51AM +0100, Peter Maydell wrote:
>> On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> wrote:
>>>
>>> On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
>>>> It adds the possibility to add 2 gpios to control the warm and cold reset.
>>>> With theses ios, the reset can be maintained during some time.
>>>> Each io is associated with a state to detect level changes.
>>>>
>>>> Vmstate subsections are also added to the existsing device_reset
>>>> subsection.
>>>
>>> This doesn't seem like a thing that should be present on every single
>>> DeviceState.
>>
>> It's a facility that's going to be useful to multiple different
>> subclasses of DeviceState, so it seems to me cleaner to
>> have base class support for the common feature rather than
>> to reimplement it entirely from scratch in every subclass
>> that wants it.
> 
> Hm, I suppose so.  Would it really have to be from scratch, though?
> Couldn't some suitable helper functions make adding such GPIOs to a
> device pretty straightforward?
> 

This patch does that. A device does have to use the helper to add the
gpio. Either qdev_init_warm_reset_gpio(...) or
qdev_init_cold_reset_gpio(...) , like any another gpio.

The mechanics to control the reset with gpio change is done in the base
class and there is some state pre-allocated (and associated vmstate
description) to it.

If that's a problem I can only provide helpers and let devices handle
state allocation and vmstate addition.

Damien

