Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B94808D0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 12:33:37 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2AjX-0006gM-Op
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 06:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mario@locati.it>) id 1n2AiP-0005oS-RI
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 06:32:25 -0500
Received: from smtpcmd01-s.aruba.it ([62.149.158.221]:41209)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mario@locati.it>) id 1n2AiN-0008Qc-5q
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 06:32:25 -0500
Received: from locati.it ([10.10.9.174]) by Aruba Outgoing Smtp  with ESMTPA
 id 2AiKnyVKxZs8s2AiKnvh6w; Tue, 28 Dec 2021 12:32:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640691140; bh=+WaIr3OX38sV2wy0dQ2rVwajtkRa5ogUnXncfMNWFFM=;
 h=Date:Subject:MIME-Version:Content-Type:From:To;
 b=ezHy8URZKp9m0stalRYR9iJROABKRzsSsnjMmfjEiqtQ42x46hcZzgjJT3yPb2MmF
 dkwtQ6bQo1UeRzYsUHM/f1iDNuwFGM+CikaLEZWn46+mlFE2bVdiuT7tD8Yn6MhxK+
 yI5JiS/jQN2142eFZJ8W9zYpfoPMbIRPH/kl7RRpcXIzdFhr1ep6mJogPhMVPKXG/h
 iSkP/j/iWhcO/EidJ5pi1zZlB/HBwuYjt3hZ2d+AOG/Dd6i2n/NHooeg7aKEuHIjBH
 gBOE2nAwefCtZADCKBiDNa4lZLmehxD5WSrBWdqkICp8It+A+J8poRyhpHUa6pysjt
 n19kgxUxnYQeg==
Date: Tue, 28 Dec 2021 12:32:20 +0100
Message-Id: <R4TPDW$C86797A2F461878EECDD3613AA35BE28@locati.it>
In-Reply-To: <87tuetrexx.fsf@linux.ibm.com>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E_=3CR4OPHT=247F12C66D110739799?=
 =?iso-8859-1?q?1E0E4C978FE6AF1=40locati=2Eit=3E_=3Ca17ceb16=2Dbce5=2D?=
 =?iso-8859-1?q?2090=2D8473=2D78b316bf5fb5=40eik=2Ebme=2Ehu=3E_=3Cec0c?=
 =?iso-8859-1?q?f758=2Df05f=2D9fcf=2Deb97=2D14cb7a1fd9a2=40kaod=2Eorg?=
 =?iso-8859-1?q?=3E_=3CR4SG07=24EE0184281B6DB251884FD0A5E86E2438=40loc?=
 =?iso-8859-1?q?ati=2Eit=3E_=3C87tuetrexx=2Efsf=40linux=2Eibm=2Ecom=3E?=
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "mario@locati.it" <mario@locati.it>
To: farosas@linux.ibm.com
X-XaM3-API-Version: V4(R2)
X-type: 0
X-SenderIP: 2.36.99.11
X-CMAE-Envelope: MS4wfIU2enS4A2GW46R4r9u+IyuGqG2NHjDmOo45sCgfiv9Xtx1NNxOE2Nx2Ls44K9RspBFJrTTkJ806tWreF9yISLboLX2cGOdtHZOUGsxIO4GTwrJEf9T6
 EN0UMxtLtZOUQDfuNykWI10DILPPksOhd1/KoXQ+ToRUFa8QwsgDDp6nJ0GmxjZAKNTbfDBidXvAVlkeSABJBQ11avdlbQr+rX/e5orM4Lk8BPs4AnHP4AlJ
 xvXCGem4R0e3EkXgcgdEZ5fZ+/Rh6iR3rzAEV4wBX3iKU/j85ZdudOgc6yUfOeWy426AGBBwVOOQDTXLCreGUA==
Received-SPF: none client-ip=62.149.158.221; envelope-from=mario@locati.it;
 helo=smtpcmd01-s.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From: "Fabiano Rosas" farosas@linux.ibm.com=0A>To: "mario@locati.it" mar=
io@locati.it, clg@kaod.org=0A>Cc: danielhb413@gmail.com, qemu-ppc@nongnu.=
org, qemu-devel@nongnu.org, balaton@eik.bme.hu=0A>Date: Mon, 27 Dec 2021 =
17:05:46 -0300=0A>Subject: Re: [PATCH] target/ppc: Fix e6500 boot=0A>=0A>=
"mario@locati.it" <mario@locati.it> writes:=0A>=C2=A0=0A>> I have updated=
=C2=A0 the guest VM but I get exactly the same result except that now I h=
ave libc-2.33.so installed.=0A>>=C2=A0=0A>> [...]=0A>> VFS: Mounted root =
(ext4 filesystem) on device 254:0.=0A>> devtmpfs: mounted=0A>> Freeing un=
used kernel image (initmem) memory: 468K=0A>> This architecture does not =
have kernel memory protection.=0A>> Run /sbin/init as init process=0A>> r=
andom: fast init done=0A>> systemd[1]: illegal instruction (4) at 3fff8b7=
e615c nip 3fff8b7e615c lr 3fff8b7e613c code 1 in libc-2.33.so[3fff8b79900=
0+1fe000]=0A>> systemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 6000=
0000 60000000 8122b7d0 2c090004=C2=A0=0A>> systemd[1]: code: 40820014 392=
00005 60000000 9122b7d0 <00000000> 60000000 8122b7d0 2c090005=C2=A0=0A>> =
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000004=
=0A>> Rebooting in 180 seconds..=0A>=C2=A0=0A>Can you make the hdd_debian=
_ppc64_new.img available? We won't be able to=0A>reproduce the exact same=
 scenario because we can't run KVM, but if it=0A>boots with TCG we can at=
 least look around the code that is failing to=0A>see if it gives us any =
clues.=0A=0A=0ASure, you may download the hdd of the VM I am using on the=
 NXP T2080RDB from=0Ahttps://repo.powerprogress.org/t2080rdb/qemu/hdd_deb=
ian_sid_ppc64.qcow2=0A=0AI have compressed the original raw disk (18.8GB)=
 into a smaller qcow2 (3.8GB), I cannot get a smaller image sorry.=0A=0AU=
se the following kernel to launch it=0Ahttps://repo.powerprogress.org/t20=
80rdb/qemu/uImage_5.16-rc6=0A=0ANo matter which video output I try, but o=
n my ubuntu 20.04 x86_64 I cannot get X11 working, so to launch qemu I us=
e=0Aqemu-system-ppc64 -accel tcg -M ppce500 -cpu e6500 -smp 4 -m 2G -vga =
none -nographic -net nic -net user -drive format=3Dqcow2,file=3Dhdd_debia=
n_sid_ppc64.qcow2,index=3D0,if=3Dvirtio -kernel uImage_5.16-rc6 -append "=
root=3D/dev/vda rw"=0Athat do now work=0Aqemu-system-ppc64 -accel tcg -M =
ppce500 -cpu e5500 -smp 4 -m 2G -vga none -nographic -net nic -net user -=
drive format=3Dqcow2,file=3Dhdd_debian_sid_ppc64.qcow2,index=3D0,if=3Dvir=
tio -kernel uImage_5.16-rc6 -append "root=3D/dev/vda rw"=0Athat works, th=
e system sees e5500 cores, whereas running it on the devkit, the system s=
ee the host e6500 cores=0A=0A=0A

