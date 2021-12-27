Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8048045E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 20:14:50 +0100 (CET)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1vSK-0005aG-RK
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 14:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mario@locati.it>) id 1n1vPs-0004kI-Pe
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:12:16 -0500
Received: from smtpcmd0994.aruba.it ([62.149.156.94]:43745)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mario@locati.it>) id 1n1vPp-00021D-F9
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:12:16 -0500
Received: from locati.it ([10.10.9.172]) by Aruba Outgoing Smtp  with ESMTPA
 id 1vPjn880yq3qK1vPjnWSkS; Mon, 27 Dec 2021 20:12:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640632327; bh=vOXf1Y3c7OFq1dVvO8OBrx/QF7CBDrLlgLkPEAAhhVQ=;
 h=Date:Subject:MIME-Version:Content-Type:From:To;
 b=Hm82/oyDX3Dzm6aSlhUalsr6EBOuRRnr2xOjhANaNck9mtlCHFsKoqXQi6Qlbikum
 z0dlNyknod8iQgtfu3BVOexrPzvOqeWsHCHpGthmust7woXVmADkvipOUvR9JRhPbu
 jh/tcFzPlpaT7b3/X8Zj5zqPY68DsqhotFJfWrogdFyF9gZPe1t9EUn7bM2c6sSYZ9
 5evd8Fqx6vv/OXrYLK1TNBAc6Vg8WWng7KIRZx0f6RC3/VkSYfcCF1gUdkLe6GvRhu
 6OJqHlY3xgJ14QN3ANCW0mo0STj94R/uJMmnMAK7jXh2OdpFZKOvqLSNQwMmcGsy/u
 OreS8iHaPygKQ==
Date: Mon, 27 Dec 2021 20:12:07 +0100
Message-Id: <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
In-Reply-To: <ec0cf758-f05f-9fcf-eb97-14cb7a1fd9a2@kaod.org>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E_=3CR4OPHT=247F12C66D110739799?=
 =?iso-8859-1?q?1E0E4C978FE6AF1=40locati=2Eit=3E_=3Ca17ceb16=2Dbce5=2D?=
 =?iso-8859-1?q?2090=2D8473=2D78b316bf5fb5=40eik=2Ebme=2Ehu=3E_=3Cec0c?=
 =?iso-8859-1?q?f758=2Df05f=2D9fcf=2Deb97=2D14cb7a1fd9a2=40kaod=2Eorg?=
 =?iso-8859-1?q?=3E?=
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "mario@locati.it" <mario@locati.it>
To: clg@kaod.org
X-XaM3-API-Version: V4(R2)
X-type: 0
X-SenderIP: 2.36.99.11
X-CMAE-Envelope: MS4wfF7JVxn35X+z9mQf/Uqjxnrbt/o5SbJlrfx18Ap78F+YU5+MEqwgSW38H7CIPyD5RgkfACqdGl6xThyd8IgpHGuY9pH2EB9f+11FUL8EZkb9ftYNFZcA
 FSyxNvPTvXYwsFrWjow6GIOxLyeNu3oJyWG8AfVGwJR8ltYREHUjWAvwVY+DV7Jag8YvznGPxyKXBfxnrHqLXmTl5CAlsNgOOvR+QDsuoesx78SqCdEEymPR
 G3dJdCFUP6rLsN1RZN0QDZOfWbFinayUXq5/XJIy65khTfMIm1xbDdNrmo5Tnpc0Fh5qCu0Q/inZmJ57JOeVrA==
Received-SPF: none client-ip=62.149.156.94; envelope-from=mario@locati.it;
 helo=smtpcmd0994.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, farosas@linux.ibm.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0A=0A=0AFrom: "C=C3=A9dric Le Goater" clg@kaod.org=0ATo: "BALATON Zoltan=
" balaton@eik.bme.hu,"mario@locati.it" mario@locati.it=0ACc: farosas@linu=
x.ibm.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, danielhb413@gmail.=
com=0ADate: Sun, 26 Dec 2021 18:57:54 +0100=0ASubject: Re: [PATCH] target=
/ppc: Fix e6500 boot=0A=0A=0AOn 12/25/21 22:53, BALATON Zoltan wrote:=0A>=
 On Sat, 25 Dec 2021, mario@locati.it wrote:=0A>> I have tried to launch =
a freshly compiled qemu from git master on a NXP T2080RDB devkit that has=
 a e6500 CPU in combination with a freshly compiled kernel 5.16-rc6=0A>> =
I have Debian SID ppc64 up and running using such a kernel, and when I la=
unch qemu to run a VM with the same debian sid for ppc64 and the same ker=
nel using --enable-kvm I end up with a kernel panic=0A=C2=A0=0AThanks for=
 testing,=0A=C2=A0=0A>>=C2=A0=0A>> [....]=0A>> Run /sbin/init as init pro=
cess=0A>> random: fast init done=0A>> systemd[1]: illegal instruction (4)=
 at 3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[=
3fff96516000+1f7000]=0A=C2=A0=0Adebian ppc64 sid has a glibc 2.33 AFAICT=0A=
=C2=A0=0A>> systemd[1]: code: 60000000 38600006 9122b7e8 4801bead 6000000=
0 60000000 8122b7e8 2c090004=0A>> systemd[1]: code: 40820014 39200005 600=
00000 9122b7e8 <00000000> 60000000 8122b7e8 2c090005=0A> =0A> Looks like =
it trips on a 0 opcode here in the middle of other values that look like =
valid code so I wonder how that 0 got there? Did something overwrite it b=
efore it tried to execute it? =0A=C2=A0=0AThis looks like the abort() rou=
tine.=0A=C2=A0=0A> If it always happens on the same address maybe you cou=
ld try attaching gdb and put a watch point on that address to see what wr=
ites there, otherwise I don't know how to debug this.=0A=C2=A0=0ACould yo=
u deduce the routine name from the nip ?=0A=C2=A0=0AThanks,=0A=C2=A0=0AC.=
=0A=0A=0A=C2=A0=0AI have updated=C2=A0 the guest VM but I get exactly the=
 same result except that now I have libc-2.33.so installed.=0A=0A[...]=0A=
VFS: Mounted root (ext4 filesystem) on device 254:0.=0Adevtmpfs: mounted=0A=
Freeing unused kernel image (initmem) memory: 468K=0AThis architecture do=
es not have kernel memory protection.=0ARun /sbin/init as init process=0A=
random: fast init done=0Asystemd[1]: illegal instruction (4) at 3fff8b7e6=
15c nip 3fff8b7e615c lr 3fff8b7e613c code 1 in libc-2.33.so[3fff8b799000+=
1fe000]=0Asystemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 60000000 =
60000000 8122b7d0 2c090004=C2=A0=0Asystemd[1]: code: 40820014 39200005 60=
000000 9122b7d0 <00000000> 60000000 8122b7d0 2c090005=C2=A0=0AKernel pani=
c - not syncing: Attempted to kill init! exitcode=3D0x00000004=0ARebootin=
g in 180 seconds..=0A=0AI don't know anything about debugging, sorry, jus=
t an average user here.=0ACurrently asking for help to more expert users =
in the PowerProgressCommunity in order to understand what gdb is and how =
to use it but so far seems quite complicated, sorry.=0AIt will taka a whi=
le before I will be able to provide what Zoltan is asking for.=0AIf anybo=
dy of you want a remote ssh access to our devkit please send me an email =
privately.=0A=0AMeanwhile, I successfully got a guest VM working with kvm=
 simply by changing "-cpu e6500" into "-cpu e5500" and still using the sa=
me kernel I have compiled for the e6500, here the qemu commands I have us=
ed:=0A=0Aqemu-system-ppc64 -enable-kvm -M ppce500 -cpu e5500 -smp 4 -m 2G=
 -net nic -net user -device virtio-vga -device virtio-mouse-pci -device v=
irtio-keyboard-pci  -drive format=3Draw,file=3Dhdd_debian_ppc64_new.img,i=
ndex=3D0,if=3Dvirtio -kernel uImage -append "root=3D/dev/vda rw"=0A=0AAnd=
 here a screenshot I took of the guest machine up and running quite well=0A=
https://repo.powerprogress.org/t2080rdb/qemu/2021-12-27_qemu_e6500_kvm_ki=
nd_of_working.jpg=0A=0AWhat I find strange and that leave me puzzled is t=
hat running hardinfo the cpu is reported as an e6500 with altivec and not=
 an e5500 that does not have altivec.=0A=0A=0A=C2=A0=C2=A0

