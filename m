Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF48420951
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:28:23 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXLCo-0005gl-Oo
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXL1L-0000iM-T5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:16:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXL1J-0005uZ-9a
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:16:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64B467463B7;
 Mon,  4 Oct 2021 12:16:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3EFB7746398; Mon,  4 Oct 2021 12:16:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3D6D97462D3;
 Mon,  4 Oct 2021 12:16:27 +0200 (CEST)
Date: Mon, 4 Oct 2021 12:16:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 03/20] nubus-device: expose separate super slot memory
 region
In-Reply-To: <07339e4c-4b8c-1c8d-5126-99c36f9559e9@vivier.eu>
Message-ID: <94e6784a-6db7-ddda-9736-2c3c5b5b4136@eik.bme.hu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
 <20210929092843.2686234-4-laurent@vivier.eu>
 <CAFEAcA8528uFsvUU3+z-wiE7jz_g80ff4U=XaBifoYZbGBC5nA@mail.gmail.com>
 <07339e4c-4b8c-1c8d-5126-99c36f9559e9@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1176981280-1633342427=:36040"
Content-ID: <f6c2226c-3993-e8cd-7961-17e618f4c0b0@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1176981280-1633342427=:36040
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <2aedec85-482d-bc7a-4f2d-9a8181e26578@eik.bme.hu>

On Mon, 4 Oct 2021, Laurent Vivier wrote:
> Le 02/10/2021 à 12:33, Peter Maydell a écrit :
>> On Wed, 29 Sept 2021 at 10:49, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>
>>> According to "Designing Cards and Drivers for the Macintosh Family" each physical
>>> nubus slot can access 2 separate address ranges: a super slot memory region which
>>> is 256MB and a standard slot memory region which is 16MB.
>>>
>>> Currently a Nubus device uses the physical slot number to determine whether it is
>>> using a standard slot memory region or a super slot memory region rather than
>>> exposing both memory regions for use as required.
>>
>>
>>> +    /* Super */
>>> +    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
>>
>> Hi; Coverity thinks this multiply might overflow, because
>> we're calculating a hw_addr (64-bits) but the multiply is only
>> done at 32-bits. Adding an explicit cast or using 'ULL' in the
>> constant #define rather than just 'U' would fix this.
>> This is CID 1464070.
>>
>
> I'm wondering if adding "assert(nd->slot < NUBUS_SUPER_SLOT_NB)" would help coverity to avoid the
> error without using 64bit arithmetic?

Using ULL in constant is simpler and better, assert is an unnecessary 
condition evaluation in cases where it can't happen (that's not a 
performance problem here but could be in some frequently called code).

Regards,
BALATON Zoltan

>
>>> +
>>> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
>>> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
>>> +                       NUBUS_SUPER_SLOT_SIZE);
>>> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>>> +                                &nd->super_slot_mem);
>>> +    g_free(name);
>>> +
>>> +    /* Normal */
>>> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
>>
>> Same with this one.
>
> assert(nb->slot < NUBUS_SLOT_NB)
>
>> thanks
>> -- PMM
>>
>
> Laurent
>
>
>
--3866299591-1176981280-1633342427=:36040--

