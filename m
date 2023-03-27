Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C86CAF28
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 21:50:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgsqF-0007dG-6M; Mon, 27 Mar 2023 15:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pgsqA-0007cz-LZ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:49:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pgsq8-00084t-Mc
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WBXT66cwrbPc6SoECR7s4j9HEp9YQQP7ClgZztfVnyE=; b=BDN3X2nD10f/fE52D3aGTRQmSP
 Ikmm5ludleLUUWc9E/ew3/ZYdiOx1TViKaVP2DtUts2OpfoCfzrMNr9VrWiXHBt+zF04zA9szQBE4
 tSnhwkcI+j61pS1zdxb+VW+3P0ckOdz/+cbrX4GTTUPHQDYQ64ujkz61pEa1G2AJ6gOapv+g8elhV
 VkuF3wiva/8/rbQDwqFURRnVv433LQJzW/A/VVdhdikXMx7t7Lt9gW25zIj+xJ30vftl5tuwS2sal
 4D7c5u3ZtRZHIuyFjlmp6xtsh85kbSMgU1x6eOOK7yYHEc8c5k3nTQwpGY/RHM8FIyY92EWLrr2xm
 b2kcI+wuuG5BJVd8M4uJH/oqdltpXUMOKhxchI55pLRRHD4GcmZbTWNJjmewjNF+QcpdVJBKx45qP
 W15IW8yYZQhu6fOS0eslz8ElqS3MdsdNeaJUAVYTcE+6LBIwpJjZ146O014qa95qJF+Mkkqa0OxbM
 TAUjsjogc/+WFD5Z5dlP7B/yAdISlR1ByQS0j7xiM6qSO5BuIkWkPBiWYHp/AHw6azK4QZcD7m0LQ
 +oVgER7/w9D0e/FZ/U09Z7g5KyP7cYeZkRhPDYe8lFRDBfILWpn/IqB1HeebK33YYoJrUPfdQhLTT
 WlmRKfjJHzNb9kUnjFBJzREEMZe1aJeQ+c1CWlCQ0=;
Received: from [2a00:23c4:8bac:200:3870:f067:8488:5afb]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pgspK-0009PT-Iz; Mon, 27 Mar 2023 20:48:26 +0100
Message-ID: <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
Date: Mon, 27 Mar 2023 20:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
 <87mt3yrx1w.fsf@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <87mt3yrx1w.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:200:3870:f067:8488:5afb
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/03/2023 17:12, Alex Bennée wrote:

> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> 
>> On 27/03/2023 14:15, Alex Bennée wrote:
>>
>>> I'm still not sure how I achieve by use case of the parent class
>>> defining the following properties:
>>>     static Property vud_properties[] = {
>>>         DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>>         DEFINE_PROP_END_OF_LIST(),
>>>     };
>>> But for the specialisation of the class I want the id to default to
>>> the actual device id, e.g.:
>>>     static Property vu_rng_properties[] = {
>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG),
>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>>         DEFINE_PROP_END_OF_LIST(),
>>>     };
>>> And so far the API for doing that isn't super clear.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    include/hw/qdev-core.h | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index bd50ad5ee1..d4bbc30c92 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>>>    char *qdev_get_fw_dev_path(DeviceState *dev);
>>>    char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
>>>    +/**
>>> + * device_class_set_props(): add a set of properties to an device
>>> + * @dc: the parent DeviceClass all devices inherit
>>> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF_LIST()
>>> + *
>>> + * This will add a set of properties to the object. It will fault if
>>> + * you attempt to add an existing property defined by a parent class.
>>> + * To modify an inherited property you need to use????
>>> + */
>>>    void device_class_set_props(DeviceClass *dc, Property *props);
>>>      /**
>>
>> Hmmm that's an interesting one. Looking at the source in
>> hw/core/qdev-properties.c you could possibly get away with something
>> like this in vu_rng_class_init():
>>
>>      ObjectProperty *op = object_class_property_find(klass, "id");
>>      object_property_set_default_uint(op, VIRTIO_ID_RNG);
>>
>> Of course this is all completely untested :)
> 
> Sadly we assert on the existing prop->defval:
> 
>    static void object_property_set_default(ObjectProperty *prop, QObject *defval)
>    {
>        assert(!prop->defval);
>        assert(!prop->init);
> 
>        prop->defval = defval;
>        prop->init = object_property_init_defval;
>    }
> 
> Maybe the assert is too aggressive or we need a different helper, maybe
> a:
> 
>    void object_property_update_default_uint(ObjectProperty *prop, uint64_t value)
> 
> ?

It seems in that case once the default has been set, it is impossible to change. The 
only other immediate option I can think of is to define a specific 
DEFINE_VHOST_PROPERTIES macro in a similar way to DEFINE_AUDIO_PROPERTIES which you 
can use to set the common properties for all VHostUserDevice devices, including 
providing the default ID.


ATB,

Mark.

