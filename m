Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF5332EB1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:07:49 +0100 (CET)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhhs-00040s-FZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfm6-0003ah-Ml; Tue, 09 Mar 2021 12:04:02 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfm4-0000h2-QI; Tue, 09 Mar 2021 12:04:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id bm21so29682449ejb.4;
 Tue, 09 Mar 2021 09:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vVM6wFe4bKZ1btWGfkXbVefoXhJyME3i5G6PHiPcvX8=;
 b=numjzj/2eRfToS2xrWTZmAYPNTb8LdtG5jzirsO+/2qeOX99t9aB+GdbtHtzl6O8Fh
 3LIVB4LhMgq2qmuajGfQv4tODK1ci4ih+a1cagQgRo4jk2AdckyUg/iYnTyONeV7paIl
 5wE8Q6fkKZr5SKY0YxtLxyubkmYM/u/tijX6/WE5bhnJIP1U69U9mZlkIJLH/8LgDgyw
 k4QA354cGF6eNMl7vHsoMZnqWCoVbLQTiOynaTL+tnw2qOooCpmjM77hTUp10SQn8GsQ
 XBbn+b+pe3PZtsrHGbohBqfJNJvX3JCRfcI7kZ7CZ5Jqj3HK2U3JoITqxpay5gqjZNhz
 QLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vVM6wFe4bKZ1btWGfkXbVefoXhJyME3i5G6PHiPcvX8=;
 b=MnRUkOhatlnNKhTHAKFRC6216Rq15FEGxpdjgdWQ62D/vwt34T5HV+NiWwc38CKPHl
 Bu2GnTJpScEb7K1x6oum9fu9HCJffy8Ohb1pgsuRlt6T9nleR9BxdOjAiySwfmIum76C
 NmO0CxEAz+BQL1wyviPQ+mgaUe8jjfj4F0jdCWziJ8b0QIljCdzf4ol4JcdrgqNp8lCf
 1RF/ZpQDSEi0raPuB3jE1MGmaQXRkXcN+8D8ApV/Rdr1tQ7zyGPZxwGzjWlE7uKMll4V
 kFdkIZqARFcpQuuz00zUluVWj1tg3K4cUusdc84hVcfRjE3taaM+dak5yBrdqSeIDJVA
 Zchg==
X-Gm-Message-State: AOAM531estonhCixdWW87ALPNBI/qwBO4lMosNFa0Sxvgj7IFEeSxoPD
 kRj5Nk+Tltk8qqdQuxM6TZk=
X-Google-Smtp-Source: ABdhPJwEQhDGl3E4s3lxKvV73DGT2RKJzSnvekMPAoXkF0lNZkNpm9oq0XEQsFN4q36g3yIzwVDCCQ==
X-Received: by 2002:a17:906:3882:: with SMTP id
 q2mr16455265ejd.540.1615309438832; 
 Tue, 09 Mar 2021 09:03:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id gn3sm7315319ejc.2.2021.03.09.09.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 09:03:58 -0800 (PST)
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box> <YEebhGGvGeWpK5+x@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8f3f750-b9b5-8a99-4df7-93bb7daf0cb6@amsat.org>
Date: Tue, 9 Mar 2021 18:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEebhGGvGeWpK5+x@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Gerd

On 3/9/21 5:00 PM, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
>> On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
>>>> On Thu, 4 Mar 2021, Philippe Mathieu-Daudé wrote:
>>>>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
>>>>>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>>>>>> state of vt82c686b_isa emulation in an abstract via_isa class.
>>>>>>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>>>>>>  include/hw/pci/pci_ids.h |  2 +-
>>>>>>  2 files changed, 40 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>> index 72234bc4d1..5137f97f37 100644
>>>>>> --- a/hw/isa/vt82c686.c
>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info = {
>>>>>>  };
>>>>>>
>>>>>>
>>>>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>>>>>> +#define TYPE_VIA_ISA "via-isa"
>>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>>>>>>
>>>>>> -struct VT82C686BISAState {
>>>>>> +struct ViaISAState {
>>>>>>      PCIDevice dev;
>>>>>>      qemu_irq cpu_intr;
>>>>>>      ViaSuperIOState *via_sio;
>>>>>>  };
>>>>>>
>>>>>> +static const VMStateDescription vmstate_via = {
>>>>>> +    .name = "via-isa",
>>>>>
>>>>> You changed the migration stream name, so I think we have
>>>>> a problem with migration... No clue how to do that properly.
>>>>
>>>> I don't think these machines support migration or state description of
>>>> vt86c686b was not missing something before these patches that would make
>>>> it not work anyway so I did not worry about this too much. I doubt
>>>> anybody wants to migrate a fuloong2e machine so this should not be a
>>>> problem in practice but maybe you can mention it in the release notes if
>>>> you think that would be necessary.
>>>
>>> Maybe just add in the description:
>>>
>>>  This change breaks migration back compatibility, but
>>>  this is not an issue for the Fuloong2E machine.
>>
>> Hrm.  If migration was never supported, why is there a vmstate
>> description there at all though?
>>
>> That said, I don't think breaking compat is a problem: that's only an
>> issue where we actually have versioned machine types, which covers
>> only pc, pseries, arm virt and a very few others.  I don't think this
>> device was used on any of them.
> 
> Except 'vt82c686b-usb-uhci' is a generic PCI device that anyone can
> instantiate, so it's not actually Fuloong specific.

I tend to see this as a bug, as this is a function specific to the
southbridge chipset and isn't meant to be used apart...

If this isn't a feature but really a bug, a simple way to clean this
is to make struct UHCIInfo and usb_uhci_common_realize() public, and
type_register "vt82c686b-usb-uhci" elsewhere.

Gerd would that work with you?

