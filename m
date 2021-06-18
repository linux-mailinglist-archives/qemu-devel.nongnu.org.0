Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF83ACBF9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:18:43 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luEOQ-00031A-Kf
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luEN2-000288-U0
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:17:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luEN0-0004DH-48
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:17:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id e22so7167625wrc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QQvxaOz6c2g8MRhk4Qn0CzbTl30B3O/mk1n8ac2Baak=;
 b=q4xxUjwO4OaduO9jp4N9kI9P8gfRBCkqsqI3JIabr9/+awFkp4PJE/9XM55XGyJrYN
 HnVdqkaTjR/DapkzLeG4llZQeNHKeT8i3hB5oOUXF09eKw28Be6fwDDlBdKciYnyLqI3
 q3kuGAhX9aWXZ2ksV+omrlTvkj0dvrmWa8A4fYAnP1UzmNYx6BDfa2dfKQv+pT4U/BPW
 Dw6AIB9MnY1tS6yx3wNyk+l3C4hB4SP3+wms5JEfGQgzQriQ48QZ3R2ujrjIEb5Ae2Dd
 BYarrRV3LY+QCLPLvkoH1n1Ho1sbHOe4ZzzvFdncRnB/tI5aY0sgZUHFABK4JAVdiPUa
 cxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QQvxaOz6c2g8MRhk4Qn0CzbTl30B3O/mk1n8ac2Baak=;
 b=mvpQJBG3M09bf2RcvckVXRs1UO0TB6/Rs9H8hrEpH1IbJwWpPxGoewrOp7nA278G0r
 D9X94YwSUDipA0Usv9VB558lpt/oJgYYoo5YCZ6T5VACTrNlLNDYlCO2foXfg3sR2MmH
 v0XS7klsrWyr9UfoPwEIVP8idfeEAGAs47ZsD4Kf4hSclbOHOH1KOfqvVez6OgFB4I/L
 iXa6fBe8kitPp7QZPJujlcnCW2+xDz6eNYE3VxSRnvZyG6ljRWlcVgQgpm0nAn7Et20r
 14cGlE2ME6s6BxfSTNdfAx5BRzrjqCgsOQzB8oai7KpAY5qPaxSXwktovQhNEDwDvXYF
 9Oow==
X-Gm-Message-State: AOAM531I6Q3N5Ihsk8i63xt9MoHP3x1okR5Tlp9XoEQWVot6KDEX6Uoa
 pTAY05FsHiHXdD5byOWP80Vp5Q==
X-Google-Smtp-Source: ABdhPJzd5InLkwMOL6vG0FF9keLg/xswwsvPjsX/1GZj5MFIVDg23EIW21SzG5PFDDvgAZCp6ezKXQ==
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr12242027wra.74.1624022232110; 
 Fri, 18 Jun 2021 06:17:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm10969647wmj.1.2021.06.18.06.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 06:17:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5824D1FF7E;
 Fri, 18 Jun 2021 14:17:10 +0100 (BST)
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
 <d8acff2435364e019931b8d13296ad69@huawei.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Subject: Re: GICv3 for MTTCG
Date: Fri, 18 Jun 2021 14:15:19 +0100
In-reply-to: <d8acff2435364e019931b8d13296ad69@huawei.com>
Message-ID: <87h7hve2i1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Shashi Mallela <shashi.mallela@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:

> Dear Shashi,
>
> I have applied the version 4 of the series "GICv3 LPI and ITS feature=20
> implementation" right after the commit 3e9f48b as before (because the=20
> GCCv7.5 is unavailable in the YUM repository for CentOS-7.9).
>
> The guest OS still hangs at its start when QEMU is configured with 4 or=20
> more vCPUs (with 1 to 3 vCPUs the guest starts and runs OK and the MTTCG=
=20
> works properly):

Does QEMU itself hang? If you attach gdb to QEMU and do:

  thread apply all bt

that should dump the backtrace for all threads. Could you post the backtrac=
e?

>
> Welcome to EulerOS 2.0 ... (Initramfs)!
>
> =E2=80=A6
>
> [  OK  ] Mounted Kernel Configuration File System.
>
> [  OK  ] Started udev Coldplug all Devices.
>
> [  OK  ] Reached target System Initialization.
>
> [  OK  ] Reached target Basic System.
>
>
>
> IT HANGS HERE
>   (with 4 or more vCPUs)!!!
>
>
> [  OK  ] Found device /dev/mapper/euleros-root.
>
> [  OK  ] Reached target Initrd Root Device.
>
> [  OK  ] Started dracut initqueue hook.
>
>           Starting File System Check on /dev/mapper/euleros-root...
>
> [  OK  ] Reached target Remote File Systems (Pre).
>
> [  OK  ] Reached target Remote File Systems.
>
> [  OK  ] Started File System Check on /dev/mapper/euleros-root.
>
>           Mounting /sysroot...
>
> [  OK  ] Mounted /sysroot.
>
> =E2=80=A6
>
>
> The back trace of threads in QEMU looks like a dead lock in MTTCG,=20
> doesn't it?
>
> Thread 7 (Thread 0x7f476e489700 (LWP 24967)):
>
> #0  0x00007f477c2bbd19 in syscall () at /lib64/libc.so.6
>
> #1  0x000055747d41a270 in qemu_event_wait (val=3D<optimized out>,=20
> f=3D<optimized out>) at /home/andy/git/qemu/include/qemu/futex.h:29
>
> #2  0x000055747d41a270 in qemu_event_wait (ev=3Dev@entry=3D0x55747e051c28=
=20
> <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:460
>
> #3  0x000055747d444d78 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) a=
t=20
> ../util/rcu.c:258
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 6 (Thread 0x7f472ce42700 (LWP 24970)):
>
> #0  0x00007f477c2b6ccd in poll () at /lib64/libc.so.6
>
> #1  0x00007f47805c137c in g_main_context_iterate.isra.19 () at=20
> /lib64/libglib-2.0.so.0
>
> #2  0x00007f47805c16ca in g_main_loop_run () at /lib64/libglib-2.0.so.0
>
> #3  0x000055747d29b071 in iothread_run=20
> (opaque=3Dopaque@entry=3D0x55747f85f280) at ../iothread.c:80
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 5 (Thread 0x7f461f9ff700 (LWP 24971)):
>
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at=20
> /lib64/libpthread.so.0
>
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f916670,=20
> mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c=20
> "../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174
>
> #2  0x000055747d20ae36 in qemu_wait_io_event=20
> (cpu=3Dcpu@entry=3D0x55747f8b7920) at ../softmmu/cpus.c:417
>
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn=20
> (arg=3Darg@entry=3D0x55747f8b7920) at ../accel/tcg/tcg-accel-ops-mttcg.c:=
98
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 4 (Thread 0x7f461f1fe700 (LWP 24972)):
>
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at=20
> /lib64/libpthread.so.0
>
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f9897e0,=20
> mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c=20
> "../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174
>
> #2  0x000055747d20ae36 in qemu_wait_io_event=20
> (cpu=3Dcpu@entry=3D0x55747f924bc0) at ../softmmu/cpus.c:417
>
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn=20
> (arg=3Darg@entry=3D0x55747f924bc0) at ../accel/tcg/tcg-accel-ops-mttcg.c:=
98
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 3 (Thread 0x7f461e9fd700 (LWP 24973)):
>
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at=20
> /lib64/libpthread.so.0
>
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747f9f5b40,=20
> mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c=20
> "../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174
>
> #2  0x000055747d20ae36 in qemu_wait_io_event=20
> (cpu=3Dcpu@entry=3D0x55747f990ba0) at ../softmmu/cpus.c:417
>
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn=20
> (arg=3Darg@entry=3D0x55747f990ba0) at ../accel/tcg/tcg-accel-ops-mttcg.c:=
98
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 2 (Thread 0x7f461e1fc700 (LWP 24974)):
>
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at=20
> /lib64/libpthread.so.0
>
> ---Type <return> to continue, or q <return> to quit---
>
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747fa626c0,=20
> mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c=20
> "../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174
>
> #2  0x000055747d20ae36 in qemu_wait_io_event=20
> (cpu=3Dcpu@entry=3D0x55747f9fcf00) at ../softmmu/cpus.c:417
>
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn=20
> (arg=3Darg@entry=3D0x55747f9fcf00) at ../accel/tcg/tcg-accel-ops-mttcg.c:=
98
>
> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>) at=20
> ../util/qemu-thread-posix.c:521
>
> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0
>
> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6
>
>
>
> Thread 1 (Thread 0x7f4781db4d00 (LWP 24957)):
>
> #0  0x00007f477c2b6d8f in ppoll () at /lib64/libc.so.6
>
> #1  0x000055747d431439 in qemu_poll_ns (__ss=3D0x0,=20
> __timeout=3D0x7ffcc3188330, __nfds=3D<optimized out>, __fds=3D<optimized =
out>)=20
> at /usr/include/bits/poll2.h:77
>
> #2  0x000055747d431439 in qemu_poll_ns (fds=3D<optimized out>,=20
> nfds=3D<optimized out>, timeout=3Dtimeout@entry=3D3792947) at=20
> ../util/qemu-timer.c:348
>
> #3  0x000055747d4466ce in main_loop_wait (timeout=3D<optimized out>) at=20
> ../util/main-loop.c:249
>
> #4  0x000055747d4466ce in main_loop_wait=20
> (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-loop.c:530
>
> #5  0x000055747d2695c7 in qemu_main_loop () at ../softmmu/runstate.c:725
>
> #6  0x000055747ccc1bde in main (argc=3D<optimized out>, argv=3D<optimized=
=20
> out>, envp=3D<optimized out>) at ../softmmu/main.c:50
>
> (gdb)
>
>
> I run QEMU with virt-manager as this:
>
> qemu      7311     1 70 19:15 ?        00:00:05=20
> /usr/local/bin/qemu-system-aarch64 -name=20
> guest=3DEulerOS-2.8-Rich,debug-threads=3Don -S -object=20
> secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-9=
5-EulerOS-2.8-Rich/master-key.aes=20
> -machine virt-6.1,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff,gic-version=
=3D3=20
> -cpu max -drive=20
> file=3D/usr/share/AAVMF/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=3D0,r=
eadonly=3Don=20
> -drive=20
> file=3D/var/lib/libvirt/qemu/nvram/EulerOS-2.8-Rich_VARS.fd,if=3Dpflash,f=
ormat=3Draw,unit=3D1=20
> -m 4096 -smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid=20
> c95e0e92-011b-449a-8e3f-b5f0938aaaa7 -display none -no-user-config=20
> -nodefaults -chardev socket,id=3Dcharmonitor,fd=3D26,server,nowait -mon=20
> chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shu=
tdown=20
> -boot strict=3Don -device=20
> pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifuncti=
on=3Don,addr=3D0x1=20
> -device=20
> pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=3D0x1.=
0x1=20
> -device=20
> pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=3D0x1.=
0x2=20
> -device=20
> pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x1.=
0x3=20
> -device qemu-xhci,p2=3D8,p3=3D8,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device=20
> virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.3,addr=3D0x0 -drive=20
> file=3D/var/lib/libvirt/images/EulerOS-2.8-Rich.qcow2,format=3Dqcow2,if=
=3Dnone,id=3Ddrive-scsi0-0-0-0=20
> -device=20
> scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0=
-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1=20
> -drive if=3Dnone,id=3Ddrive-scsi0-0-0-1,readonly=3Don -device=20
> scsi-cd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D1,drive=3Ddrive-scsi0=
-0-0-1,id=3Dscsi0-0-0-1=20
> -netdev tap,fd=3D28,id=3Dhostnet0 -device=20
> virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:f9:e0:69,bus=3D=
pci.1,addr=3D0x0=20
> -chardev pty,id=3Dcharserial0 -serial chardev:charserial0 -msg timestamp=
=3Don
>
> The issue is reproducible and persists.
> 1. Do you think that applying the series results in the dead lock in=20
> MTTCG? Or it may be other reason?
> 2. Which piece of QEMU source code should I investigate to locate the iss=
ue?
>
> Best regards,
> Andrey Shinkevich
>
>
> On 5/13/21 7:45 PM, Shashi Mallela wrote:
>> Hi Andrey,
>>=20
>> To clarify, the patch series
>>=20
>>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
>>     "GICv3 LPI and ITS feature implementation"
>>=20
>> is applicable for virt machine 6.1 onwards,i.e ITS TCG functionality is=
=20
>> not available for version 6.0 that is being tried
>> here.
>>=20
>> Thanks
>> Shashi
>>=20
>> On May 13 2021, at 12:35 pm, Andrey Shinkevich=20
>> <andrey.shinkevich@huawei.com> wrote:
>>=20
>>     Dear colleagues,
>>=20
>>     Thank you all very much for your responses. Let me reply with one
>>     message.
>>=20
>>     I configured QEMU for AARCH64 guest:
>>     $ ./configure --target-list=3Daarch64-softmmu
>>=20
>>     When I start QEMU with GICv3 on an x86 host:
>>     qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3
>>=20
>>     QEMU reports this error from hw/pci/msix.c:
>>     error_setg(errp, "MSI-X is not supported by interrupt controller");
>>=20
>>     Probably, the variable 'msi_nonbroken' would be initialized in
>>     hw/intc/arm_gicv3_its_common.c:
>>     gicv3_its_init_mmio(..)
>>=20
>>     I guess that it works with KVM acceleration only rather than with TC=
G.
>>=20
>>     The error persists after applying the series:
>>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
>>     "GICv3 LPI and ITS feature implementation"
>>     (special thanks for referring me to that)
>>=20
>>     Please, make me clear and advise ideas how that error can be fixed?
>>     Should the MSI-X support be implemented with GICv3 extra?
>>=20
>>     When successful, I would like to test QEMU for a maximum number of c=
ores
>>     to get the best MTTCG performance.
>>     Probably, we will get just some percentage of performance enhancement
>>     with the BQL series applied, won't we? I will test it as well.
>>=20
>>     Best regards,
>>     Andrey Shinkevich
>>=20
>>=20
>>     On 5/12/21 6:43 PM, Alex Benn=C3=A9e wrote:
>>      >
>>      > Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:
>>      >
>>      >> Dear colleagues,
>>      >>
>>      >> I am looking for ways to accelerate the MTTCG for ARM guest on
>>     x86-64 host.
>>      >> The maximum number of CPUs for MTTCG that uses GICv2 is limited
>>     by 8:
>>      >>
>>      >> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
>>      >>
>>      >> The version 3 of the Generic Interrupt Controller (GICv3) is not
>>      >> supported in QEMU for some reason unknown to me. It would allow =
to
>>      >> increase the limit of CPUs and accelerate the MTTCG performance =
on a
>>      >> multiple core hypervisor.
>>      >
>>      > It is supported, you just need to select it.
>>      >
>>      >> I have got an idea to implement the Interrupt Translation
>>     Service (ITS)
>>      >> for using by MTTCG for ARM architecture.
>>      >
>>      > There is some work to support ITS under TCG already posted:
>>      >
>>      > Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
>>      > Date: Thu, 29 Apr 2021 19:41:53 -0400
>>      > Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>
>>      >
>>      > please do review and test.
>>      >
>>      >> Do you find that idea useful and feasible?
>>      >> If yes, how much time do you estimate for such a project to
>>     complete by
>>      >> one developer?
>>      >> If no, what are reasons for not implementing GICv3 for MTTCG in
>>     QEMU?
>>      >
>>      > As far as MTTCG performance is concerned there is a degree of
>>      > diminishing returns to be expected as the synchronisation cost
>>     between
>>      > threads will eventually outweigh the gains of additional threads.
>>      >
>>      > There are a number of parts that could improve this performance. =
The
>>      > first would be picking up the BQL reduction series from your
>>     FutureWei
>>      > colleges who worked on the problem when they were Linaro assignee=
s:
>>      >
>>      > Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from
>>     cpu_handle_interrupt/exception path
>>      > Date: Wed, 19 Aug 2020 14:28:49 -0400
>>      > Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>
>>      >
>>      > There was also a longer series moving towards per-CPU locks:
>>      >
>>      > Subject: [PATCH v10 00/73] per-CPU locks
>>      > Date: Wed, 17 Jun 2020 17:01:18 -0400
>>      > Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>
>>      >
>>      > I believe the initial measurements showed that the BQL cost
>>     started to
>>      > edge up with GIC interactions. We did discuss approaches for this
>>     and I
>>      > think one idea was use non-BQL locking for the GIC. You would nee=
d to
>>      > revert:
>>      >
>>      > Subject: [PATCH-for-5.2] exec: Remove
>>     MemoryRegion::global_locking field
>>      > Date: Thu, 6 Aug 2020 17:07:26 +0200
>>      > Message-Id: <20200806150726.962-1-philmd@redhat.com>
>>      >
>>      > and then implement a more fine tuned locking in the GIC emulation
>>      > itself. However I think the BQL and per-CPU locks are lower hangi=
ng
>>      > fruit to tackle first.
>>      >
>>      >>
>>      >> Best regards,
>>      >> Andrey Shinkevich
>>      >
>>      >
>>=20
>> Sent from Mailspring


--=20
Alex Benn=C3=A9e

