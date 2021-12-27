Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F117648048C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 21:35:21 +0100 (CET)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1wiG-0002go-Qf
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 15:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1wh1-0001op-C8; Mon, 27 Dec 2021 15:34:03 -0500
Received: from [2001:738:2001:2001::2001] (port=13100 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1wgx-0004wa-01; Mon, 27 Dec 2021 15:34:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 80201746399;
 Mon, 27 Dec 2021 21:33:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6180E746353; Mon, 27 Dec 2021 21:33:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5FD077462D3;
 Mon, 27 Dec 2021 21:33:57 +0100 (CET)
Date: Mon, 27 Dec 2021 21:33:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <87tuetrexx.fsf@linux.ibm.com>
Message-ID: <b2e4870-86e-494e-d5f5-2ca44a7d3b48@eik.bme.hu>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
 <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
 <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
 <a17ceb16-bce5-2090-8473-78b316bf5fb5@eik.bme.hu>
 <ec0cf758-f05f-9fcf-eb97-14cb7a1fd9a2@kaod.org>
 <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
 <87tuetrexx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-953273813-1640637237=:53559"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com,
 "mario@locati.it" <mario@locati.it>, clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-953273813-1640637237=:53559
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Dec 2021, Fabiano Rosas wrote:
> "mario@locati.it" <mario@locati.it> writes:
>> I have updated  the guest VM but I get exactly the same result except that now I have libc-2.33.so installed.
>>
>> [...]
>> VFS: Mounted root (ext4 filesystem) on device 254:0.
>> devtmpfs: mounted
>> Freeing unused kernel image (initmem) memory: 468K
>> This architecture does not have kernel memory protection.
>> Run /sbin/init as init process
>> random: fast init done
>> systemd[1]: illegal instruction (4) at 3fff8b7e615c nip 3fff8b7e615c lr 3fff8b7e613c code 1 in libc-2.33.so[3fff8b799000+1fe000]
>> systemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 60000000 60000000 8122b7d0 2c090004 
>> systemd[1]: code: 40820014 39200005 60000000 9122b7d0 <00000000> 60000000 8122b7d0 2c090005 
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
>> Rebooting in 180 seconds..
>
> Can you make the hdd_debian_ppc64_new.img available? We won't be able to
> reproduce the exact same scenario because we can't run KVM, but if it
> boots with TCG we can at least look around the code that is failing to
> see if it gives us any clues.

Based on previous info it may just be a Debian install but pointing to the 
exact version or installer to reproduce it would help if the image cannot 
be made available.

Regards,
BALATON Zoltan
--3866299591-953273813-1640637237=:53559--

