Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED54DE1F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:52:40 +0100 (CET)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIeM-0004QD-NI
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:52:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVId2-0003gB-R3
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:51:16 -0400
Received: from [2607:f8b0:4864:20::c35] (port=42681
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVId1-0006wW-4C
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:51:16 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so11369108oos.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=khy7Q7UkAhaZxQbGbRThSzQst3rhcv3MJSeWy81xvj4=;
 b=ViVE4/ylcCAqhwNI9Tmn4SUBvDRYw3wcAE3MenfqSZ3ciIbxEq8i9HaIy1zVOIOO1j
 Kdhpafc09EWXfC9Z+NMDvljybVwMggy11tqpxEUjjOn4ZE98ZiagzMyD/CjbTrzMsLb6
 GCJDi0RnnBXL9NqrN3wpn0dbzlVwZA8sMZlyUnvkEZltgbO4g4H2KBQGHQoisgLqKMqG
 XxcE19YQv/jGJtureZnTOn53Cpya68iFh/v34YCjc0A4r4/pHnpJCBiLIHtzVZOB7thF
 D4Te8enVky0kLPlJTVqz+Bu3yRPZlRzdnKSCc0OZ11p7AurZh8ACrJ0txYOe64ypm30V
 M8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=khy7Q7UkAhaZxQbGbRThSzQst3rhcv3MJSeWy81xvj4=;
 b=IzmEAQTN2q5GY7dTQOVu/jGHi6jhGPRW5GP3Rmn8UwOoZG0X0o2DNqJLKjDMdWGMDI
 gmY6x6bqego24PPTBBErkPa9f360VVThbTqNZkqRrvef1h+6sT98HvkYgZBdZW3tDHjI
 oRmowXz4QZrDbO2GU0q6PLyx7q34NFufG9yVp7fvytCTP2VreUGctYWCAYkKINiFKsgD
 GTNO9CgJ7Y45r9D7FlBK5UO8Fqmak+8jyT+g/ZIunNMa0G534la9+4Rk6eNHFZSw9Vgu
 jfdCXTITK/v1t2Z4vbDQzPneyQe2J0LQK62I6SsIX5hzXxqKAogcsQ8u5XIq4/dztjG3
 PEtw==
X-Gm-Message-State: AOAM532oJg9/2nYJ622CbqxV/ECAQAw12BjpVeQLd9ljTS0n7id9EP1B
 STlatNoEFAbhFdC6dCq3biM=
X-Google-Smtp-Source: ABdhPJzBQlD/7mElswasT0fobMyjtypemO01Jg0EaEZB08lYB3og+hTan+4qLY4Ioa6w2Z1At8NPgw==
X-Received: by 2002:a05:6870:3510:b0:d7:179e:7e90 with SMTP id
 k16-20020a056870351000b000d7179e7e90mr8020913oah.168.1647633073932; 
 Fri, 18 Mar 2022 12:51:13 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:d948:1d15:1451:398f?
 ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056870888d00b000d103280accsm3933976oam.16.2022.03.18.12.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 12:51:13 -0700 (PDT)
Message-ID: <caff9323-89c8-a44b-bf7a-882711efd5a6@gmail.com>
Date: Fri, 18 Mar 2022 16:51:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
 <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
 <YjNh2jSDpWvLJ1S3@work-vm> <YjP/5jzGh48ts5V+@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YjP/5jzGh48ts5V+@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/18/22 00:43, David Gibson wrote:
> On Thu, Mar 17, 2022 at 04:29:14PM +0000, Dr. David Alan Gilbert wrote:
>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>> On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
>>> <danielhb413@gmail.com> wrote:
>>>> I've been looking into converting some vmstate_register() calls to use dc->vmsd,
>>>> using as a base the docs in docs/devel/migration.rst. This doc mentions that we
>>>> can either register the vmsd by using vmstate_register() or we can use dc->vmsd
>>>> for qdev-based devices.
>>>>
>>>> When trying to convert this vmstate() call for the qdev alternative (hw/ppc/spapr_drc.c,
>>>> drc_realize()) I found this:
>>>>
>>>>       vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
>>>>                        drc);
>>>>
>>>> spapr_drc_index() is an unique identifier for these DRC devices and it's being used
>>>> as instance_id. It is not clear to me how we can keep using this same instance_id when
>>>> using the dc->vmsd alternative. By looking a bit into migration files I understood
>>>> that if dc->vmsd is being used the instance_id is always autogenerated. Is that correct?
>>>
>>> Not entirely. It is the intended common setup, but because changing
>>> the ID value breaks migration compatibility there is a mechanism
>>> for saying "my device is special and needs to set the instance ID
>>> to something else" -- qdev_set_legacy_instance_id().
>>
>> Yes, this is normally only an issue for 'system' or memory mapped
>> devices;  for things hung off a bus that has it's own device naming,
>> then each instance of a device has it's own device due to the bus name
>> so instance_id's aren't used.  Where you've got a few of the
>> same device with the same name, and no bus for them to be named by, then
>> the instance_id is used to uniquify them.


Thanks for the info. qdev_set_legacy_instance_id() was the missing piece I was
looking for to continue with the dc->vmsd transition I'd like to do.


> 
> Thanks for the information.  I remember deciding at the time that just
> using vmsd wouldn't work for the DRCs because we needed this fixed
> index.  At the time either qdev_set_legacy_instance_id() didn't exist,
> or I didn't know about it, hence the explicit vmstate_register() call
> so that an explicit instance id could be supplied.
> 

This is the commit that introduced DRC migration:


commit a50919dddf148b0a2008db4a0593dbe69e1059c0
Author: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Date:   Mon May 22 16:35:49 2017 -0300

     hw/ppc: migrating the DRC state of hotplugged devices


I'd say you can cut yourself some slack this time. Blame that guy instead.




Thanks,


Daniel





