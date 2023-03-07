Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A06ADF3F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWqU-0005Ec-U1; Tue, 07 Mar 2023 07:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZWqS-0005Cg-2i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:08 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZWqP-0004me-SR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D2765746335;
 Tue,  7 Mar 2023 13:54:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F54774634B; Tue,  7 Mar 2023 13:54:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8E056746346;
 Tue,  7 Mar 2023 13:54:48 +0100 (CET)
Date: Tue, 7 Mar 2023 13:54:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
Message-ID: <68f3c8a7-c990-00c0-4872-68acee86c28c@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
 <e101b894-c722-8def-f591-20fada45795c@redhat.com>
 <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
 <CABgObfZLuVgG8pPcF1o517z0wSZTk5SmV8Enn=PC8QmOEVou8w@mail.gmail.com>
 <c2b19806-db0f-54b8-ed41-2e74c19d029e@eik.bme.hu>
 <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 7 Mar 2023, Paolo Bonzini wrote:
> On 3/7/23 11:01, BALATON Zoltan wrote:
>>>> I'm not sure I follow what you mean so I'd need a patch to see then I can
>>>> test it with the clients I run on pegasos2.
>>> 
>>> Do you have a spec, or pointer to the morphos kernel sources, to figure 
>>> out how the hardware works?
>> 
>> No, that's closed source and only available as a demo iso but it's known to 
>> work on real hardware and freely downloadable so is a good test. (AFAIK 
>> those who developed MorphOS had close connection to those who wrote the 
>> firmware for Pegasos II.) Maybe the VT8231 datasheet or similar parts (we 
>> only emulate VT82C686B and VT8231 in QEMU) has some info on this.
>
> I agree it's a good test, but it's not clear what it means to do sub-word 
> writes to the register.
>
> For example, in the dump I posted you have:
>
> evt 3 1 write 1      // enable timer
> evt 0 2 read
> evt 0 2 write 1      // just writes again the same value, clearing sts
>
> It's important to note that the comments are just my guess.
>
> Before even looking at the effect of the write, the trace tells us that your 
> patch is incomplete.  With both current QEMU and your patch it would do 
> nothing because addr is not 0 or 2; but since the firmware of your machine 
> does use addr == 3, you need to handle it.  In other words, before looking at 
> this trace, I was wary of accepting your patch because it made no sense to 
> me; but I couldn't exclude that I was missing something.  Now, instead, I am 
> certain it shouldn't be accepted.

Well at least that question is cleared then.

> I am quite confident that the second guess is correct, because "write the 
> same value that was read" only makes sense for evt_sts and not for evt_en.

It could also make sense if the guest is trying to flip a bit that's 
already set or cleared. It could be that the reset value on QEMU is not 
the same as on hardware or the firmware just runs the same routine on 
reset and cold start and wants to make sure a bit is in a state it wants 
it even if it already is that way so it could read value, unconditionally 
apply mask which in our case does not change the value and write it back.

> We learnt something: no matter what bus this device sits on, it does not flip 
> bit 1 of the address for subword writes.  As I mentioned yesterday, we also 
> observe that the load and store use lhbrx and sthbrx.  Assuming this is not a 
> harmless bug in the firmware, this means the device is indeed little endian.

AFAIU the device is little endian (VT8231 is a PCI device and primarily a 
PC part so it's expected to be little endian) but the guest also knows 
this and writes byte swaped values to it. But since the memory region is 
set to LITTLE_ENDIAN and we're on a big endian CPU QEMU will byte swap it 
again which it should not do as the guest already did that. Setting it to 
NATIVE_ENDIAN solves this and it oes not break anything for little endian 
machines on little endian hosts for sure. The only part I'm not sure about 
is big endian hosts which I don't have any to test.

> This means that the first write is almost certainly to evt_en.  On a 
> little-endian machine the write would set bit 8 of evt.en (power button), but 
> what about a big-endian machine like yours?  Should it set bit 0 or bit 8? 
> If it's bit 0 (which resides at offset 2 according to the device), who flips 
> the low bit of the address?  Why is bit 0 flipped but not bit 1?

I think the guest already writes byte swapped value so it should work the 
same as on little endian machine but the QEMU memory layer gets in the 
way.

> You simply cannot fix the emulation of this machine until you can answer the 
> above questions.  If there is no source and no spec, the two ways to do it 
> are:
>
> - get a real machine, and figure out whether the write to offset 3 
> corresponds to the PM timer or the power button.

I don't have real machine but know somebody who does but I'm not sure what 
to ast to test on it. Can you describe it what you want to see or maybe 
write a sctipt for the fimrware to test it (if you're familiar enough with 
Forth for that). I can try to find some more info on this but so far I was 
concentrating on other bigger issues. This is a minor annoyance but would 
be nice to fix eventually.

Regards,
BALATON Zoltan

> - continue the trace up to the point the OS runs, and see if you get some 
> clues similar to the one above that placed evt_sts at offset 2.


