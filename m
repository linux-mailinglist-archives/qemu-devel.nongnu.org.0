Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EDE3DBD5C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 18:52:01 +0200 (CEST)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Vjs-0005nH-2A
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 12:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m9Vil-0004R6-CH; Fri, 30 Jul 2021 12:50:51 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:38321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m9Vij-0004cM-2B; Fri, 30 Jul 2021 12:50:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id D9EDE13B00E;
 Fri, 30 Jul 2021 16:50:36 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 30 Jul
 2021 18:50:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ec237e8f-032d-4d35-b36c-aebf9ceb075f,
 76D9A100687C30740A262902056384F06FAB8BF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: need help with my config
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Lindsay Ryan
 <Ryan.Lindsay@petermac.org>, "qemu-discuss@nongnu.org"
 <qemu-discuss@nongnu.org>
References: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
 <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <39f8272b-2c2f-08d6-1fb5-cd519fdf2bbd@kaod.org>
Date: Fri, 30 Jul 2021 18:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5fcfd26e-a954-40d3-86cb-29ad85156738
X-Ovh-Tracer-Id: 3304516228816407459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhedtheelgfeuvdeffeelheelgfejuddtiedvgfduffevieelhffhgfegjeduieenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphhhihhlmhgusehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.125,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 7/30/21 3:25 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-ppc@
> 
> On 7/30/21 6:25 AM, Lindsay Ryan wrote:
>> Hi
>> I'm trying to emulate some physical IBM Power 9's that we have. There
>> seems to be plenty of examples of using x86_64 qemu, but slightly less
>> for Power. 

For baremetal emulation, please use the PowerNV machine. See this page : 

  https://qemu.readthedocs.io/en/latest/system/ppc/powernv.html

HW is not fully emulated but QEMU has enough support to start a multichip
system running any distro.  

>> Unless it's specifically for installing AIX

AIX only runs under the pseries machine (virtualized) and not on baremetal. 

>> Anyway, I'm trying to boot the VM as I guess a bare metal Power 9 box,
>> then install redhat from Iso on a disk and have it on the network.
>>
>> ./qemu-system-ppc64 -cpu POWER9 -smp cpus=4 -machine pseries -m 4096 -M
>> accel=tcg  -serial stdio -nodefaults -nographic -device
>> megasas,id=scsi0,bus=pci.0,addr=0x5 -drive
>> file=/home/hdisk1.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none
>> -device
>> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2
>> -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor
>> telnet:0.0.0.0:3344,server,nowait -netdev
>> bridge,id=net0,helper=qemu-bridge-helper,br=bridge0,id=hostnet0

This is a pseries machine (virtualized) and not baremetal.

Which machine do you want to run ? pseries is the VM platform as run by KVM, 
It can run under TCG also. PowerNV is the baremetal platform on which KVM 
runs using the OPAL firmware. QEMU only has a PowerNV emulator, so TCG. 

These are two very different PPC machines.

>> So the megasas gets detected as a raid controller. Yay. 
>> But my qcow2 disk image doesn't seem to be plugged into it correctly as
>> it's not detected. 
>> It sees the cdrom image and I can boot from it.
>> The other thing I can't get working is the network card. 

because you don't have any :) Add a device and link it to the netdev.


That's how I run a TCG pseries POWER9 machine on my x86 laptop:

qemu-system-ppc64 -M pseries,cap-cfpc=workaround,cap-sbbc=workaround,cap-ibs=workaround,cap-ccf-assist=on,ic-mode=dual -m 4G -accel tcg,thread=multi -cpu POWER9 -smp 4,cores=4,maxcpus=8,threads=1 -device virtio-net-pci,netdev=net0,mac=C0:FF:EE:00:00:02,bus=pci.0,addr=0x2 -netdev tap,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,vhost=on -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x1 -drive file=./ubuntu-ppc64le.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 -device qemu-xhci,id=usb,bus=pci.0,addr=0x4 -nographic -nodefaults -serial mon:stdio    

and a PowerNV POWER9 machine :

qemu-system-ppc64 -m 4G -machine powernv9 -smp 2 -accel tcg,thread=multi -kernel ./open-power/images/witherspoon-latest/zImage.epapr -initrd ./open-power/images/witherspoon-latest/rootfs.cpio.xz -bios ./open-power/images/witherspoon-latest/skiboot.lid -device pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0 -device ich9-ahci,id=sata0,bus=pcie.0,addr=0x0 -drive file=./ubuntu-ppc64le-powernv.qcow2,if=none,id=drive0,format=qcow2,cache=none -device ide-hd,bus=sata0.0,unit=0,drive=drive0,id=ide,bootindex=1 -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=bridge1,addr=0x3 -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 -device nec-usb-xhci,bus=bridge1,addr=0x2 -device usb-storage,drive=usbkey -drive file=./usb.img,if=none,id=usbkey,format=raw,cache=none -serial mon:stdio -nographic

You will need firmware images for the latter.


Cheers,
C.

