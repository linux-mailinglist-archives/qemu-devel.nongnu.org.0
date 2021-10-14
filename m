Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50F42DEBA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:54:58 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb34L-00038n-Dp
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mb2nX-00011t-Vv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mb2nU-0008LM-MD
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjPgnkeVpFhq2itu2s9ZDFo6omIhq8jgGqSXCf6CRes=;
 b=JssDsWMegRrMcyeHdVeRqFI8Pc0oj/edLeFaMsU2cb5ABv4jlU8hxrtrRd6vYxxYOZJ+sz
 0I7oZLQexo8iQJ1bNviw9g3TBdcatmGLzQ6mK5t1nJdvtBqd9Mb16mZe42w2vh4fHJfsu3
 tw9FkXFdnUbFIKEnhA9nofTHKz7e3Io=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-rMgOUmACOOysHzcDdTMR7A-1; Thu, 14 Oct 2021 11:37:24 -0400
X-MC-Unique: rMgOUmACOOysHzcDdTMR7A-1
Received: by mail-ed1-f72.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso5495786ede.16
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jjPgnkeVpFhq2itu2s9ZDFo6omIhq8jgGqSXCf6CRes=;
 b=LXy96GOZXu6BaUFEb9/aD16uvsm978O/xrjfJi0HQEyIC1H/wQAXRjVo30YDkvbxUc
 Vv9s//e24cpJi4bPivhlycoxQd3+OrgZMCPDD9lk7UThkfY0sYcPnmGCuJBflrhjvnwy
 zgFdthFZPPiGajdWYwgHaVUr85MJPFYhGQQMSACO5wdWVPs3bDNmcu0G6dGLkhv05xpf
 zjIWUAOCjD98rB5mz5rkcuqIR3HCJetEx3Usg+NGBTn1TZZ/w0XDf9kQgWHjAAojxdmq
 Nz1z7fxCreeq3iU3A7KPK/bJJQsaAOoony4DKTgeXe6IJVVZmAH8b5bXv4CaZOIh776G
 Xv8w==
X-Gm-Message-State: AOAM533NxsmdYuVcA3Ywv61nglaHGEYgWXqfF8FpobVW1xsywWA9sWUq
 VLhoOTYqmLU3/3sv5N07FkK+aG/yVujlAqmh1b9Wy4+w6c2EIIzPg7B/b5AW/JVe2YVKjvFkHoS
 L6D4Ni53L22OqqCQ=
X-Received: by 2002:a17:907:a061:: with SMTP id
 ia1mr4490071ejc.372.1634225843537; 
 Thu, 14 Oct 2021 08:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztEpfXccupj5tLYp61K/yeNQj8jlWajzg2ty5WVqyR54Jc84kEPZ6GcOjITdCuDrQwllFG5A==
X-Received: by 2002:a17:907:a061:: with SMTP id
 ia1mr4490040ejc.372.1634225843322; 
 Thu, 14 Oct 2021 08:37:23 -0700 (PDT)
Received: from thuth.remote.csb (p549d10d7.dip0.t-ipconnect.de.
 [84.157.16.215])
 by smtp.gmail.com with ESMTPSA id n22sm2112842eja.120.2021.10.14.08.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:37:22 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
 <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
Message-ID: <25d90a22-63d9-6c15-5ee2-eadda449bcaf@redhat.com>
Date: Thu, 14 Oct 2021 17:37:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 17.26, Philippe Mathieu-Daudé wrote:
> On 10/14/21 13:29, Cédric Le Goater wrote:
>> On 10/14/21 12:34, Christophe Leroy wrote:
> 
>>> I have the following change in QEMU to be able to run the bamboo,
>>> found it some time ago via google (can't remember where):
>>>
>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>> index 8147ba6f94..600e89e791 100644
>>> --- a/hw/ppc/ppc4xx_pci.c
>>> +++ b/hw/ppc/ppc4xx_pci.c
>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
>>> int irq_num)
>>>
>>>        trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>>
>>> -    return slot - 1;
>>> +    return slot ? slot - 1 : slot;
>>>    }
>>>
>>>    static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>
>> could you try to use :
>>
>> static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
>> {
>>      return (devno + irq_num) % 4;
>> }
> 
> Is this pci_swizzle()?

It's pci_swizzle, but I don't think that we should take irq_num into account 
here. The comment right in front of the function says:

  On Bamboo, all pins from each slot are tied to a single board IRQ

Similar comment in pc-bios/bamboo.dts:

  Bamboo has all 4 IRQ pins tied together per slot

So the return value should only depend on the slot number.

Not sure how to properly fix this yet, though.

  Thomas


PS: Found a working pre-compiled kernel for bamboo:
http://landley.net/aboriginal/downloads/binaries/system-image-powerpc-440fp.tar.gz


