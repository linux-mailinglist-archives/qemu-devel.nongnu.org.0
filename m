Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0442065E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:03:30 +0200 (CEST)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXI0X-0005Gd-9O
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXHyn-000460-Fq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:01:42 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXHyl-00078v-5i
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:01:41 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MYvHa-1mK8ow3UCe-00UrcG; Mon, 04 Oct 2021 09:01:26 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210929092843.2686234-1-laurent@vivier.eu>
 <20210929092843.2686234-4-laurent@vivier.eu>
 <CAFEAcA8528uFsvUU3+z-wiE7jz_g80ff4U=XaBifoYZbGBC5nA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 03/20] nubus-device: expose separate super slot memory
 region
Message-ID: <07339e4c-4b8c-1c8d-5126-99c36f9559e9@vivier.eu>
Date: Mon, 4 Oct 2021 09:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8528uFsvUU3+z-wiE7jz_g80ff4U=XaBifoYZbGBC5nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7tvk5txvB/crAGF728VfI/2lnrP7gNXENi0byKJC5M8a31xnkAZ
 MkgT/9SuaBMVnggv2AFAfLi81IWPJjy7xzDDA7j3unKqzIGCH1DLR0sOzCSTpYxXZ2rVAXH
 aGYt7RSpua2CtndaHoMg3fvC+IXjyXEwOJHbQDkT3krlSXffOTm41fE+D3jQjyLstoIFPAZ
 xUNnTD4TeBB9ZU9NYA/rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pwY9mh6Lqf0=:8tWXw6U/P6G7Clg1NFxJTg
 LzdrBKNchju8ybN8qAerTGDc7E07avHm4Ud9NlnRqSpDCOck5CqGYOy9TNq1C4DyoQN+rFsng
 1+dKIqnokBe7JAJLKRAXqyJEqhSyWH+r4VYwnkJAF+gp6kM4Gl40Bw1TOV1pWLeFFozgo0Wxm
 xbPKzHdHJv706XLe7tZzXvnzPc8oSnqfdM7xQ68DwEB/ENyRLR25/RROE7FXyNXtmrEOPLfQ7
 kM2DWRW7ZOuf9zesREyuBIr4nMRu6kpbpctGTCJMun59yHgvbfEJYBzsh8jicxapEIGXxo5jb
 Bi4fy/DhHiqgo8LOsbkI3rxdT9+25CtgPdqRmB/UvRWe0AtB4tq2zWEuYKjm08QmM+8p9632i
 hi+vKoeEVt/SdQf0k6YNWIAhDYbHHQF9QoAQohZvqIuaWL7yCvM4xaMc+DvB6CDP1yacvAQTW
 b4bSsoTthIWJYAmSQoRsadQ+NslxMe00tB/1CKvWVJkA09g1PVcVcac7uIleqpoRgtRRwI4wm
 o4OP66ECbL5uVXId8U3M1TZUCmM8p13uYSzY/fhJPC1+l4k4h8fzM+3jS8J3oCVMQnRY69tmH
 INTwbnKIHe9Mek6YHvjZ/pjrdRdRrarqQmS9R+CiqCCxJsb0EnKvjvhLl8J22mAZqahZnUQy/
 XIc3Isuy6gQ6l0TLiBkA3795oxNrDOZSSZMme65f+QOf8M5tfH3p1ugovBpiTY2le6i+T/VDt
 7i3/X/16jOoKXz0dO0SuVwW9dTyjg1IF0oPNmg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/10/2021 à 12:33, Peter Maydell a écrit :
> On Wed, 29 Sept 2021 at 10:49, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> According to "Designing Cards and Drivers for the Macintosh Family" each physical
>> nubus slot can access 2 separate address ranges: a super slot memory region which
>> is 256MB and a standard slot memory region which is 16MB.
>>
>> Currently a Nubus device uses the physical slot number to determine whether it is
>> using a standard slot memory region or a super slot memory region rather than
>> exposing both memory regions for use as required.
> 
> 
>> +    /* Super */
>> +    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
> 
> Hi; Coverity thinks this multiply might overflow, because
> we're calculating a hw_addr (64-bits) but the multiply is only
> done at 32-bits. Adding an explicit cast or using 'ULL' in the
> constant #define rather than just 'U' would fix this.
> This is CID 1464070.
> 

I'm wondering if adding "assert(nd->slot < NUBUS_SUPER_SLOT_NB)" would help coverity to avoid the
error without using 64bit arithmetic?


>> +
>> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
>> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
>> +                       NUBUS_SUPER_SLOT_SIZE);
>> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>> +                                &nd->super_slot_mem);
>> +    g_free(name);
>> +
>> +    /* Normal */
>> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
> 
> Same with this one.

assert(nb->slot < NUBUS_SLOT_NB)

> thanks
> -- PMM
> 

Laurent


