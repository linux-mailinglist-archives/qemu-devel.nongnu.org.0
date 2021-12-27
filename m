Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F5480487
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 21:33:21 +0100 (CET)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1wgK-0000yH-Ew
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 15:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1weW-00005O-I1; Mon, 27 Dec 2021 15:31:28 -0500
Received: from [2001:738:2001:2001::2001] (port=44043 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1weS-0004lg-8U; Mon, 27 Dec 2021 15:31:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 547C6748F51;
 Mon, 27 Dec 2021 21:31:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2D0E4746399; Mon, 27 Dec 2021 21:31:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2AC557462D3;
 Mon, 27 Dec 2021 21:31:17 +0100 (CET)
Date: Mon, 27 Dec 2021 21:31:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "mario@locati.it" <mario@locati.it>
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
Message-ID: <4667acde-ce55-5197-fd9d-297bbe08d15@eik.bme.hu>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E_=3CR4OPHT=247F12C66D110739799?=
 =?iso-8859-1?q?1E0E4C978FE6AF1=40locati=2Eit=3E_=3Ca17ceb16=2Dbce5=2D?=
 =?iso-8859-1?q?2090=2D8473=2D78b316bf5fb5=40eik=2Ebme=2Ehu=3E_=3Cec0c?=
 =?iso-8859-1?q?f758=2Df05f=2D9fcf=2Deb97=2D14cb7a1fd9a2=40kaod=2Eorg?=
 =?iso-8859-1?q?=3E?=
 <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-575118538-1640637077=:53559"
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
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-575118538-1640637077=:53559
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Mon, 27 Dec 2021, mario@locati.it wrote:
> I have updated  the guest VM but I get exactly the same result except that now I have libc-2.33.so installed.
>
> [...]
> VFS: Mounted root (ext4 filesystem) on device 254:0.
> devtmpfs: mounted
> Freeing unused kernel image (initmem) memory: 468K
> This architecture does not have kernel memory protection.
> Run /sbin/init as init process
> random: fast init done
> systemd[1]: illegal instruction (4) at 3fff8b7e615c nip 3fff8b7e615c lr 3fff8b7e613c code 1 in libc-2.33.so[3fff8b799000+1fe000]
> systemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 60000000 60000000 8122b7d0 2c090004 
> systemd[1]: code: 40820014 39200005 60000000 9122b7d0 <00000000> 60000000 8122b7d0 2c090005 
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> Rebooting in 180 seconds..
>
> I don't know anything about debugging, sorry, just an average user here.
> Currently asking for help to more expert users in the PowerProgressCommunity in order to understand what gdb is and how to use it but so far seems quite complicated, sorry.
> It will taka a while before I will be able to provide what Zoltan is asking for.

Maybe it's not needed, it was just an idea to get closer to the problem 
but you could also try finding this our from within the VM as Cedric 
suggested. As for attaching gdb to QEMU for debugging guest code here's an 
article but maybe you can find a better one elsewhere too:

http://nickdesaulniers.github.io/blog/2018/10/24/booting-a-custom-linux-kernel-in-qemu-and-debugging-it-with-gdb/

Do you have the libc-2.33.so binary with debugging symbols? (Maybe it's 
available in some debug package, I don't know how Debian handles this.) If 
so you could try to check what is at the offset shown in the log (I think 
it's 1fe000 above) either with gdb or objdump or maybe there are other 
ways as well.

> If anybody of you want a remote ssh access to our devkit please send me an email privately.
>
> Meanwhile, I successfully got a guest VM working with kvm simply by 
> changing "-cpu e6500" into "-cpu e5500" and still using the same kernel 
> I have compiled for the e6500, here the qemu commands I have used:
>
> qemu-system-ppc64 -enable-kvm -M ppce500 -cpu e5500 -smp 4 -m 2G -net 
> nic -net user -device virtio-vga -device virtio-mouse-pci -device 
> virtio-keyboard-pci -drive 
> format=raw,file=hdd_debian_ppc64_new.img,index=0,if=virtio -kernel 
> uImage -append "root=/dev/vda rw"
>
> And here a screenshot I took of the guest machine up and running quite well
> https://repo.powerprogress.org/t2080rdb/qemu/2021-12-27_qemu_e6500_kvm_kind_of_working.jpg
>
> What I find strange and that leave me puzzled is that running hardinfo the cpu is reported as an e6500 with altivec and not an e5500 that does not have altivec.

With KVM the code is run on the host CPU so depending on how it determines 
the CPU model you may still get the host CPU. I'm not sure what -cpu does 
with KVM but apparently it does something if it makes it boot. Probably 
libc takes a different path with these CPUs so you only get the problem 
when it has PVR set to e6500?.

Regards,
BALATON Zoltan
--3866299591-575118538-1640637077=:53559--

