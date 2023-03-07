Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F56AE483
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ8Q-0008L4-3r; Tue, 07 Mar 2023 10:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ8N-0008KY-Jr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:21:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ8L-0001Xx-GA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:21:47 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 308DC74634B;
 Tue,  7 Mar 2023 16:21:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E68D5746335; Tue,  7 Mar 2023 16:21:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E440E746346;
 Tue,  7 Mar 2023 16:21:30 +0100 (CET)
Date: Tue, 7 Mar 2023 16:21:30 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <357c8c40-8b16-d53c-c453-b8cebe4a312f@redhat.com>
Message-ID: <f16d495e-3f7b-d253-601f-c2566c49e521@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
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
 <68f3c8a7-c990-00c0-4872-68acee86c28c@eik.bme.hu>
 <357c8c40-8b16-d53c-c453-b8cebe4a312f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-478380890-1678202490=:65948"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-478380890-1678202490=:65948
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 7 Mar 2023, Paolo Bonzini wrote:
> On 3/7/23 13:54, BALATON Zoltan wrote:
>>> evt 3 1 write 1      // enable timer
>>> evt 0 2 read
>>> evt 0 2 write 1      // just writes again the same value, clearing sts
>>> 
>>> I am quite confident that the second guess is correct, because "write the 
>>> same value that was read" only makes sense for evt_sts and not for evt_en.
>> 
>> It could also make sense if the guest is trying to flip a bit that's 
>> already set or cleared.
>
> No, I checked what the guest actually does and it's read followed immediately 
> by a write, with no other ALU values in the middle.
>
>> AFAIU the device is little endian (VT8231 is a PCI device and primarily a 
>> PC part so it's expected to be little endian) but the guest also knows this 
>> and writes byte swaped values to it. But since the memory region is set to 
>> LITTLE_ENDIAN and we're on a big endian CPU QEMU will byte swap it again 
>> which it should not do as the guest already did that.
>
> It's the opposite.
>
> The CPU first swaps the value that was in the register, when it executes 
> sthbrx instructions.  With DEVICE_LITTLE_ENDIAN, QEMU does the second swap 
> and restores the value that was in the register.  With DEVICE_NATIVE_ENDIAN 
> it happens to fix the cases that matter for your testcase, but it breaks 
> others.
>
>>> This means that the first write is almost certainly to evt_en.  On a 
>>> little-endian machine the write would set bit 8 of evt.en (power button), 
>>> but what about a big-endian machine like yours?  Should it set bit 0 or 
>>> bit 8? If it's bit 0 (which resides at offset 2 according to the device), 
>>> who flips the low bit of the address?  Why is bit 0 flipped but not bit 1?
>> 
>> I think the guest already writes byte swapped value so it should work the 
>> same as on little endian machine but the QEMU memory layer gets in the way.
>
> The write in question is "evt addr=3 size=1 value=1" so it's a one-byte 
> write.  There's no byte swapping involved here, rather the question is how 
> the addresses are interpreted.
>
>>> - get a real machine, and figure out whether the write to offset 3 
>>> corresponds to the PM timer or the power button.
>> 
>> I don't have real machine but know somebody who does but I'm not sure what 
>> to ast to test on it. Can you describe it what you want to see or maybe 
>> write a sctipt for the fimrware to test it (if you're familiar enough with 
>> Forth for that). I can try to find some more info on this but so far I was 
>> concentrating on other bigger issues. This is a minor annoyance but would 
>> be nice to fix eventually.
>
> I didn't even have an idea that Forth was involved, honestly, or how to write 
> Forth code for this machine that I barely know exists. :)

It's supposed to be CHRP compatible which mandates OpenFirmware so it 
should work about the same as similar IBM and Apple machines but those are 
also kind of obscure. If you can describe what you want tested I can try 
to make that a script and ask somebody to run it on real machine but I'm 
not sure what to test.

Regards,
BALATON Zoltan

>>> - continue the trace up to the point the OS runs, and see if you get some 
>>> clues similar to the one above that placed evt_sts at offset 2.
>
> I'll try this once the machine is back in shape.
>
> Paolo
>
>
--3866299591-478380890-1678202490=:65948--

