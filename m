Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE273AB9E0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:46:11 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltv9d-0000iX-Ow
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1ltv7u-0008EY-1q; Thu, 17 Jun 2021 12:44:22 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1ltv7q-0005oN-3J; Thu, 17 Jun 2021 12:44:21 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5SS14wDgz1BNTK;
 Fri, 18 Jun 2021 00:38:57 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 00:44:00 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 00:43:59 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 18 Jun 2021 00:43:59 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Thu, 17 Jun 2021 16:43:59 +0000
Message-ID: <d8acff2435364e019931b8d13296ad69@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=andrey.shinkevich@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, "Cota@braap.org" <Cota@braap.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?Windows-1252?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear Shashi,=0A=
=0A=
I have applied the version 4 of the series "GICv3 LPI and ITS feature =0A=
implementation" right after the commit 3e9f48b as before (because the =0A=
GCCv7.5 is unavailable in the YUM repository for CentOS-7.9).=0A=
=0A=
The guest OS still hangs at its start when QEMU is configured with 4 or =0A=
more vCPUs (with 1 to 3 vCPUs the guest starts and runs OK and the MTTCG =
=0A=
works properly):=0A=
=0A=
Welcome to EulerOS 2.0 ... (Initramfs)!=0A=
=0A=
=85=0A=
=0A=
[  OK  ] Mounted Kernel Configuration File System.=0A=
=0A=
[  OK  ] Started udev Coldplug all Devices.=0A=
=0A=
[  OK  ] Reached target System Initialization.=0A=
=0A=
[  OK  ] Reached target Basic System.=0A=
=0A=
=0A=
=0A=
IT HANGS HERE=0A=
  (with 4 or more vCPUs)!!!=0A=
=0A=
=0A=
[  OK  ] Found device /dev/mapper/euleros-root.=0A=
=0A=
[  OK  ] Reached target Initrd Root Device.=0A=
=0A=
[  OK  ] Started dracut initqueue hook.=0A=
=0A=
          Starting File System Check on /dev/mapper/euleros-root...=0A=
=0A=
[  OK  ] Reached target Remote File Systems (Pre).=0A=
=0A=
[  OK  ] Reached target Remote File Systems.=0A=
=0A=
[  OK  ] Started File System Check on /dev/mapper/euleros-root.=0A=
=0A=
          Mounting /sysroot...=0A=
=0A=
[  OK  ] Mounted /sysroot.=0A=
=0A=
=85=0A=
=0A=
=0A=
The back trace of threads in QEMU looks like a dead lock in MTTCG, =0A=
doesn't it?=0A=
=0A=
Thread 7 (Thread 0x7f476e489700 (LWP 24967)):=0A=
=0A=
#0  0x00007f477c2bbd19 in syscall () at /lib64/libc.so.6=0A=
=0A=
#1  0x000055747d41a270 in qemu_event_wait (val=3D<optimized out>, =0A=
f=3D<optimized out>) at /home/andy/git/qemu/include/qemu/futex.h:29=0A=
=0A=
#2  0x000055747d41a270 in qemu_event_wait (ev=3Dev@entry=3D0x55747e051c28 =
=0A=
<rcu_call_ready_event>) at ../util/qemu-thread-posix.c:460=0A=
=0A=
#3  0x000055747d444d78 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at =
=0A=
../util/rcu.c:258=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 6 (Thread 0x7f472ce42700 (LWP 24970)):=0A=
=0A=
#0  0x00007f477c2b6ccd in poll () at /lib64/libc.so.6=0A=
=0A=
#1  0x00007f47805c137c in g_main_context_iterate.isra.19 () at =0A=
/lib64/libglib-2.0.so.0=0A=
=0A=
#2  0x00007f47805c16ca in g_main_loop_run () at /lib64/libglib-2.0.so.0=0A=
=0A=
#3  0x000055747d29b071 in iothread_run =0A=
(opaque=3Dopaque@entry=3D0x55747f85f280) at ../iothread.c:80=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 5 (Thread 0x7f461f9ff700 (LWP 24971)):=0A=
=0A=
#0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at =0A=
/lib64/libpthread.so.0=0A=
=0A=
#1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f916670, =0A=
mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c =0A=
"../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174=0A=
=0A=
#2  0x000055747d20ae36 in qemu_wait_io_event =0A=
(cpu=3Dcpu@entry=3D0x55747f8b7920) at ../softmmu/cpus.c:417=0A=
=0A=
#3  0x000055747d18d6a1 in mttcg_cpu_thread_fn =0A=
(arg=3Darg@entry=3D0x55747f8b7920) at ../accel/tcg/tcg-accel-ops-mttcg.c:98=
=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 4 (Thread 0x7f461f1fe700 (LWP 24972)):=0A=
=0A=
#0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at =0A=
/lib64/libpthread.so.0=0A=
=0A=
#1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f9897e0, =0A=
mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c =0A=
"../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174=0A=
=0A=
#2  0x000055747d20ae36 in qemu_wait_io_event =0A=
(cpu=3Dcpu@entry=3D0x55747f924bc0) at ../softmmu/cpus.c:417=0A=
=0A=
#3  0x000055747d18d6a1 in mttcg_cpu_thread_fn =0A=
(arg=3Darg@entry=3D0x55747f924bc0) at ../accel/tcg/tcg-accel-ops-mttcg.c:98=
=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 3 (Thread 0x7f461e9fd700 (LWP 24973)):=0A=
=0A=
#0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at =0A=
/lib64/libpthread.so.0=0A=
=0A=
#1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f9f5b40, =0A=
mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c =0A=
"../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174=0A=
=0A=
#2  0x000055747d20ae36 in qemu_wait_io_event =0A=
(cpu=3Dcpu@entry=3D0x55747f990ba0) at ../softmmu/cpus.c:417=0A=
=0A=
#3  0x000055747d18d6a1 in mttcg_cpu_thread_fn =0A=
(arg=3Darg@entry=3D0x55747f990ba0) at ../accel/tcg/tcg-accel-ops-mttcg.c:98=
=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 2 (Thread 0x7f461e1fc700 (LWP 24974)):=0A=
=0A=
#0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at =0A=
/lib64/libpthread.so.0=0A=
=0A=
---Type <return> to continue, or q <return> to quit---=0A=
=0A=
#1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747fa626c0, =0A=
mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c =0A=
"../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174=0A=
=0A=
#2  0x000055747d20ae36 in qemu_wait_io_event =0A=
(cpu=3Dcpu@entry=3D0x55747f9fcf00) at ../softmmu/cpus.c:417=0A=
=0A=
#3  0x000055747d18d6a1 in mttcg_cpu_thread_fn =0A=
(arg=3Darg@entry=3D0x55747f9fcf00) at ../accel/tcg/tcg-accel-ops-mttcg.c:98=
=0A=
=0A=
#4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at =0A=
../util/qemu-thread-posix.c:521=0A=
=0A=
#5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
=0A=
#6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
=0A=
=0A=
=0A=
Thread 1 (Thread 0x7f4781db4d00 (LWP 24957)):=0A=
=0A=
#0  0x00007f477c2b6d8f in ppoll () at /lib64/libc.so.6=0A=
=0A=
#1  0x000055747d431439 in qemu_poll_ns (__ss=3D0x0, =0A=
__timeout=3D0x7ffcc3188330, __nfds=3D<optimized out>, __fds=3D<optimized ou=
t>) =0A=
at /usr/include/bits/poll2.h:77=0A=
=0A=
#2  0x000055747d431439 in qemu_poll_ns (fds=3D<optimized out>, =0A=
nfds=3D<optimized out>, timeout=3Dtimeout@entry=3D3792947) at =0A=
../util/qemu-timer.c:348=0A=
=0A=
#3  0x000055747d4466ce in main_loop_wait (timeout=3D<optimized out>) at =0A=
../util/main-loop.c:249=0A=
=0A=
#4  0x000055747d4466ce in main_loop_wait =0A=
(nonblocking=3Dnonblocking@entry=3D0) at ../util/main-loop.c:530=0A=
=0A=
#5  0x000055747d2695c7 in qemu_main_loop () at ../softmmu/runstate.c:725=0A=
=0A=
#6  0x000055747ccc1bde in main (argc=3D<optimized out>, argv=3D<optimized =
=0A=
out>, envp=3D<optimized out>) at ../softmmu/main.c:50=0A=
=0A=
(gdb)=0A=
=0A=
=0A=
I run QEMU with virt-manager as this:=0A=
=0A=
qemu      7311     1 70 19:15 ?        00:00:05 =0A=
/usr/local/bin/qemu-system-aarch64 -name =0A=
guest=3DEulerOS-2.8-Rich,debug-threads=3Don -S -object =0A=
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-95-=
EulerOS-2.8-Rich/master-key.aes =0A=
-machine virt-6.1,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff,gic-version=
=3D3 =0A=
-cpu max -drive =0A=
file=3D/usr/share/AAVMF/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=3D0,rea=
donly=3Don =0A=
-drive =0A=
file=3D/var/lib/libvirt/qemu/nvram/EulerOS-2.8-Rich_VARS.fd,if=3Dpflash,for=
mat=3Draw,unit=3D1 =0A=
-m 4096 -smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid =0A=
c95e0e92-011b-449a-8e3f-b5f0938aaaa7 -display none -no-user-config =0A=
-nodefaults -chardev socket,id=3Dcharmonitor,fd=3D26,server,nowait -mon =0A=
chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shutd=
own =0A=
-boot strict=3Don -device =0A=
pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=
=3Don,addr=3D0x1 =0A=
-device =0A=
pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=3D0x1.0x=
1 =0A=
-device =0A=
pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=3D0x1.0x=
2 =0A=
-device =0A=
pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x1.0x=
3 =0A=
-device qemu-xhci,p2=3D8,p3=3D8,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device =0A=
virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.3,addr=3D0x0 -drive =0A=
file=3D/var/lib/libvirt/images/EulerOS-2.8-Rich.qcow2,format=3Dqcow2,if=3Dn=
one,id=3Ddrive-scsi0-0-0-0 =0A=
-device =0A=
scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0-0=
-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 =0A=
-drive if=3Dnone,id=3Ddrive-scsi0-0-0-1,readonly=3Don -device =0A=
scsi-cd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D1,drive=3Ddrive-scsi0-0=
-0-1,id=3Dscsi0-0-0-1 =0A=
-netdev tap,fd=3D28,id=3Dhostnet0 -device =0A=
virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:f9:e0:69,bus=3Dpc=
i.1,addr=3D0x0 =0A=
-chardev pty,id=3Dcharserial0 -serial chardev:charserial0 -msg timestamp=3D=
on=0A=
=0A=
The issue is reproducible and persists.=0A=
1. Do you think that applying the series results in the dead lock in =0A=
MTTCG? Or it may be other reason?=0A=
2. Which piece of QEMU source code should I investigate to locate the issue=
?=0A=
=0A=
Best regards,=0A=
Andrey Shinkevich=0A=
=0A=
=0A=
On 5/13/21 7:45 PM, Shashi Mallela wrote:=0A=
> Hi Andrey,=0A=
> =0A=
> To clarify, the patch series=0A=
> =0A=
>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>     "GICv3 LPI and ITS feature implementation"=0A=
> =0A=
> is applicable for virt machine 6.1 onwards,i.e ITS TCG functionality is =
=0A=
> not available for version 6.0 that is being tried=0A=
> here.=0A=
> =0A=
> Thanks=0A=
> Shashi=0A=
> =0A=
> On May 13 2021, at 12:35 pm, Andrey Shinkevich =0A=
> <andrey.shinkevich@huawei.com> wrote:=0A=
> =0A=
>     Dear colleagues,=0A=
> =0A=
>     Thank you all very much for your responses. Let me reply with one=0A=
>     message.=0A=
> =0A=
>     I configured QEMU for AARCH64 guest:=0A=
>     $ ./configure --target-list=3Daarch64-softmmu=0A=
> =0A=
>     When I start QEMU with GICv3 on an x86 host:=0A=
>     qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3=0A=
> =0A=
>     QEMU reports this error from hw/pci/msix.c:=0A=
>     error_setg(errp, "MSI-X is not supported by interrupt controller");=
=0A=
> =0A=
>     Probably, the variable 'msi_nonbroken' would be initialized in=0A=
>     hw/intc/arm_gicv3_its_common.c:=0A=
>     gicv3_its_init_mmio(..)=0A=
> =0A=
>     I guess that it works with KVM acceleration only rather than with TCG=
.=0A=
> =0A=
>     The error persists after applying the series:=0A=
>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>     "GICv3 LPI and ITS feature implementation"=0A=
>     (special thanks for referring me to that)=0A=
> =0A=
>     Please, make me clear and advise ideas how that error can be fixed?=
=0A=
>     Should the MSI-X support be implemented with GICv3 extra?=0A=
> =0A=
>     When successful, I would like to test QEMU for a maximum number of co=
res=0A=
>     to get the best MTTCG performance.=0A=
>     Probably, we will get just some percentage of performance enhancement=
=0A=
>     with the BQL series applied, won't we? I will test it as well.=0A=
> =0A=
>     Best regards,=0A=
>     Andrey Shinkevich=0A=
> =0A=
> =0A=
>     On 5/12/21 6:43 PM, Alex Benn=E9e wrote:=0A=
>      >=0A=
>      > Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
>      >=0A=
>      >> Dear colleagues,=0A=
>      >>=0A=
>      >> I am looking for ways to accelerate the MTTCG for ARM guest on=0A=
>     x86-64 host.=0A=
>      >> The maximum number of CPUs for MTTCG that uses GICv2 is limited=
=0A=
>     by 8:=0A=
>      >>=0A=
>      >> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
>      >>=0A=
>      >> The version 3 of the Generic Interrupt Controller (GICv3) is not=
=0A=
>      >> supported in QEMU for some reason unknown to me. It would allow t=
o=0A=
>      >> increase the limit of CPUs and accelerate the MTTCG performance o=
n a=0A=
>      >> multiple core hypervisor.=0A=
>      >=0A=
>      > It is supported, you just need to select it.=0A=
>      >=0A=
>      >> I have got an idea to implement the Interrupt Translation=0A=
>     Service (ITS)=0A=
>      >> for using by MTTCG for ARM architecture.=0A=
>      >=0A=
>      > There is some work to support ITS under TCG already posted:=0A=
>      >=0A=
>      > Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation=
=0A=
>      > Date: Thu, 29 Apr 2021 19:41:53 -0400=0A=
>      > Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>=0A=
>      >=0A=
>      > please do review and test.=0A=
>      >=0A=
>      >> Do you find that idea useful and feasible?=0A=
>      >> If yes, how much time do you estimate for such a project to=0A=
>     complete by=0A=
>      >> one developer?=0A=
>      >> If no, what are reasons for not implementing GICv3 for MTTCG in=
=0A=
>     QEMU?=0A=
>      >=0A=
>      > As far as MTTCG performance is concerned there is a degree of=0A=
>      > diminishing returns to be expected as the synchronisation cost=0A=
>     between=0A=
>      > threads will eventually outweigh the gains of additional threads.=
=0A=
>      >=0A=
>      > There are a number of parts that could improve this performance. T=
he=0A=
>      > first would be picking up the BQL reduction series from your=0A=
>     FutureWei=0A=
>      > colleges who worked on the problem when they were Linaro assignees=
:=0A=
>      >=0A=
>      > Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from=0A=
>     cpu_handle_interrupt/exception path=0A=
>      > Date: Wed, 19 Aug 2020 14:28:49 -0400=0A=
>      > Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>=0A=
>      >=0A=
>      > There was also a longer series moving towards per-CPU locks:=0A=
>      >=0A=
>      > Subject: [PATCH v10 00/73] per-CPU locks=0A=
>      > Date: Wed, 17 Jun 2020 17:01:18 -0400=0A=
>      > Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>=0A=
>      >=0A=
>      > I believe the initial measurements showed that the BQL cost=0A=
>     started to=0A=
>      > edge up with GIC interactions. We did discuss approaches for this=
=0A=
>     and I=0A=
>      > think one idea was use non-BQL locking for the GIC. You would need=
 to=0A=
>      > revert:=0A=
>      >=0A=
>      > Subject: [PATCH-for-5.2] exec: Remove=0A=
>     MemoryRegion::global_locking field=0A=
>      > Date: Thu, 6 Aug 2020 17:07:26 +0200=0A=
>      > Message-Id: <20200806150726.962-1-philmd@redhat.com>=0A=
>      >=0A=
>      > and then implement a more fine tuned locking in the GIC emulation=
=0A=
>      > itself. However I think the BQL and per-CPU locks are lower hangin=
g=0A=
>      > fruit to tackle first.=0A=
>      >=0A=
>      >>=0A=
>      >> Best regards,=0A=
>      >> Andrey Shinkevich=0A=
>      >=0A=
>      >=0A=
> =0A=
> Sent from Mailspring=0A=
=0A=

