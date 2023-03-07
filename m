Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42386AD322
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKr1-0007fC-KU; Mon, 06 Mar 2023 19:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZKqw-0007ch-IH
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:06:51 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZKqr-000317-4f
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:06:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C343674635C;
 Tue,  7 Mar 2023 01:06:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8BD9374633D; Tue,  7 Mar 2023 01:06:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8A09D74632B;
 Tue,  7 Mar 2023 01:06:31 +0100 (CET)
Date: Tue, 7 Mar 2023 01:06:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <e101b894-c722-8def-f591-20fada45795c@redhat.com>
Message-ID: <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
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
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2059747351-1678147591=:54516"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2059747351-1678147591=:54516
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 7 Mar 2023, Paolo Bonzini wrote:
> On 3/6/23 23:56, Paolo Bonzini wrote:
>> On 2/21/23 13:55, BALATON Zoltan wrote:
>>> 
>>> To get that menu with Shut Down, first Quit the installer then again right 
>>> click or click on background first to get the menu of the Ambient desktop. 
>>> I also see an error from the firmware at the beginning:
>>> Initializing KBD...00000012    FAILED.
>>> when it's broken and it says Done without the hex number when it works. 
>>> (Two other FAILED messages about clock chip is normal as we don't emulate 
>>> that but all others should be green.)
>> 
>> Ok, I've reproduced it.  The mouse is a bit flaky but using the keyboard 
>> for everything except right clicking works better.
>
> Now the OS doesn't boot anymore, it doesn't get to the point where it 
> initializes the VGA.

Sorry, that is a known breakage from a recent series that's not yet fixed. 
This patch should fix it:

http://patchew.org/QEMU/cover.1677628524.git.balaton@eik.bme.hu/cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu/

or another proposed altenative is here:

http://patchew.org/QEMU/20230304114043.121024-1-shentey@gmail.com/20230304114043.121024-2-shentey@gmail.com/

Either of the above should work.

> I got some quick logs with .impl.min_access_size to 1, 
> to understand what the firmware (but not the OS) does.  With this at least I 
> could confirm that your patch is wrong:
>
> cnt 1 1 write 80
> evt 3 1 write 1         // enable timer
> evt 0 2 read
> evt 0 2 write 1         // just writes again the same value
> evt 1 1 write
> evt 1 1 write 0
>
> Since you have both 1-size and 2-size writes, and the 2-byte reads/writes are 
> done with byte swapping instructions lhbrx and sthbrx, your patch would cause 
> 0x100 to be read and written on the third and fourth lines.
>
> Likewise, any 4-byte read of the timer port would be byte swapped.
>
> The solution is a patch similar to mine, applied to both evt and cnt; while 
> perhaps tmr can be left as is and only accept 4-byte reads, I don't know. 
> I'll try to come up with something that can be tested at least with the 
> firmware.

I'm not sure I follow what you mean so I'd need a patch to see then I can 
test it with the clients I run on pegasos2.

Regards,
BALATON Zoltan
--3866299591-2059747351-1678147591=:54516--

