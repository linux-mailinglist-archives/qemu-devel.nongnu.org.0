Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9840D9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:33:35 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqa6-0003cS-DS
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:33:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mQqW2-0001Xv-CX; Thu, 16 Sep 2021 08:29:22 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mQqVz-0007Qc-RM; Thu, 16 Sep 2021 08:29:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9BD52BE56AE0;
 Thu, 16 Sep 2021 14:29:13 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 16 Sep
 2021 14:29:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005483b7329-7dcb-4863-83f4-e0ca93d6bd1a,
 902CC554B2B666CF336F93082A9AEA4058B2700C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
Date: Thu, 16 Sep 2021 14:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bff97fe8-f601-4f6f-b697-d8ec445e8fd3
X-Ovh-Tracer-Id: 4078290941512878953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 17:22, Richard Henderson wrote:
> On 9/14/21 5:26 AM, Peter Maydell wrote:
>> (2) RAM blocks should have a length that fits inside a
>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>      is where the 2047MB limit is coming from; in theory this ought
>>      to be improveable but auditing the code for mishandling of
>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>      their size into a signed 'long' somewhere would be kind
>>      of painful)
> 
> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit while pointers are 64-bit, how close do we think we are to this being fixed already?

I removed the check from softmmu/vl.c and "all" tests on gitlab ran
fine. But, there is still a problem indeed. When running the Fuji
machine with a flash device to boot from  :

     $ gdb --args qemu-system-arm -M fuji-bmc -drive file=./flash-fuji,format=raw,if=mtd
     Thread 1 "qemu-system-arm" received signal SIGTRAP, Trace/breakpoint trap.
     _g_log_abort (breakpoint=1) at ../../../glib/gmessages.c:554
     554	../../../glib/gmessages.c: No such file or directory.
     (gdb) bt
     #0  _g_log_abort (breakpoint=1) at ../../../glib/gmessages.c:554
     #1  0xb7ae351d in g_logv
         (log_domain=0xb7b2d00e "GLib", log_level=G_LOG_LEVEL_ERROR, format=0xb7b36730 "%s: failed to allocate %u bytes", args=0xbfffed8c "\260f\263\267") at ../../../glib/gmessages.c:1373
     #2  0xb7ae36b9 in g_log (log_domain=0xb7b2d00e "GLib", log_level=G_LOG_LEVEL_ERROR, format=0xb7b36730 "%s: failed to allocate %u bytes")
         at ../../../glib/gmessages.c:1415
     #3  0xb7ae1e6a in g_malloc0 (n_bytes=134217728) at ../../../glib/gmem.c:137
     #4  0x006af2b7 in rom_add_blob
         (name=0xd65c67 "aspeed.boot_rom", blob=0xa3fa010, len=134217728, max_len=134217728, addr=0, fw_file_name=0x0, fw_callback=0x0, callback_opaque=0x0, as=0x0, read_only=true) at ../hw/core/loader.c:1068
     #5  0x0084b714 in write_boot_rom (addr=0, errp=<optimized out>, rom_size=134217728, dinfo=0x1766570) at ../hw/arm/aspeed.c:267
     #6  aspeed_machine_init (machine=0xb67c3010) at ../hw/arm/aspeed.c:397
     #7  0x0060e6d9 in machine_run_board_init (machine=<optimized out>) at ../hw/core/machine.c:1276
     #8  0x0099be9b in qemu_init_board () at ../softmmu/vl.c:2618
     ...

The last allocation of the machine (which is the boot ramblock) fails.

However, when using the 'execute-in-place' option of the Aspeed machine
which fetches directly instructions to execute from the flash MMIO region,
the machine boots correctly. No extra allocation for the ramblock.

>> Even if we did fix (2) we'd need to compromise on (3)
>> sometimes still -- if a board has 4GB of RAM that's
>> not going to fit in 32 bits regardless. But we would be
>> able to let boards with 2GB have 2GB.
> 
> I'm not opposed to deprecating 32-bit hosts...  ;-)

Until then, I am willing to make the following compromise for the fuji  :

     mc->default_ram_size = (HOST_LONG_BITS == 32 ? 1 : 2) * GiB;

Thanks,


C.

