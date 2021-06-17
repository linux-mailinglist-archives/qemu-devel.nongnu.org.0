Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130593ABAE3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:52:02 +0200 (CEST)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwBN-0004hb-51
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltw4Q-0008AT-Ml
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:50 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1ltw4I-0001jd-TF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:50 -0400
Received: by mail-qt1-x82f.google.com with SMTP id p21so5404734qtw.6
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFdquHj9VQH1n+mdTB25irCwrDwLzVW8hXGZTieZvs8=;
 b=yikZr85MwXdKkg7Fw1OxJltvNrRwrZWYoAP/640I6LPrj5dHfzIm3OSbXcnMq/iWvS
 B0AE7G3yvECCqifVwedXDLo5CMazngLPwUzfICX0+l7B4+oUZPoTLxiS0lZN2VebH2pR
 j+5wVlcISZ6n61dGLaGDkm6tsGEIpOoV2WGkJixnLlSlC3pYNTysUYItTGVHQWaFDB98
 D1TSEqz4rQ7VT/YjkCgOEUOOJtTJjFuiuWzny9DoXCE+TQv+vU8c4QPAFj2j90+68j8T
 bWIWvglDxllF8T5iLYf+R4DKlHEPvFqOzaXus+FssJC8EAdulS1D91mCEsSLibTxPTFk
 tTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFdquHj9VQH1n+mdTB25irCwrDwLzVW8hXGZTieZvs8=;
 b=mVEk9zgmFwgXjndWTwKbkNICFQJaDmY4W4gwLjfmJ6yvN1CGOgsykcN4sRTONXseL+
 KHCCacbQ2Juxe8dySmsMsnM8dAKlWc2BwHHRx7g3x58SwEx99fQJMRpf8bTKyuCXSmZ0
 mjwwkiYkPNdg7RsjjsNkPWZ64ebx6EJnKLXJrZnXqkzO5TySiJ7hTG0CUHGjH8EMOb2U
 GI1aVUlRQ3QU6ye7jDZ9VpcD5bJn/iOtJdPuDWmxWi5fXaBzx8pB///hr2cZ67JWj12E
 GYVBMjwktSdzfDePLkchDcnaL7alKnUpxrsfg8DWXWgQum2zlxMz53BDgu0ltncpGaM3
 35gw==
X-Gm-Message-State: AOAM530UbTECorpH/0NpGt6BQ0gvVyin5arv1GClUj3oU5uohF6MI/2f
 DSlcXgK3lRszg/5YEuJ9ozqUEw==
X-Google-Smtp-Source: ABdhPJyoPV9GbBiQHWhQ+NUhV8h+bdVsouwsR2elXDpRQXa9caQzVuFdidlzpg6QzGmTT5oyhUZ2yw==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr6387148qte.86.1623951881386; 
 Thu, 17 Jun 2021 10:44:41 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id h5sm2226208qkg.122.2021.06.17.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:44:41 -0700 (PDT)
Message-ID: <e0acc7f58dea1847c2838ffb0b06e8ec10358db8.camel@linaro.org>
Subject: Re: GICv3 for MTTCG
From: shashi.mallela@linaro.org
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Date: Thu, 17 Jun 2021 13:44:40 -0400
In-Reply-To: <d8acff2435364e019931b8d13296ad69@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
 <d8acff2435364e019931b8d13296ad69@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andrey,

The issue doesnt seem related to ITS patchset as the implementation has
no changes around MTTCG or vCPU configurations.

if this patchset were not applied(with only commit 3e9f48b),do you
still see the hang issue?

Thanks
Shashi


On Thu, 2021-06-17 at 16:43 +0000, Andrey Shinkevich wrote:
> Dear Shashi,
> 
> I have applied the version 4 of the series "GICv3 LPI and ITS
> feature 
> implementation" right after the commit 3e9f48b as before (because
> the 
> GCCv7.5 is unavailable in the YUM repository for CentOS-7.9).
> 
> The guest OS still hangs at its start when QEMU is configured with 4
> or 
> more vCPUs (with 1 to 3 vCPUs the guest starts and runs OK and the
> MTTCG 
> works properly):
> 
> Welcome to EulerOS 2.0 ... (Initramfs)!
> 
> …
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
> …
> 
> 
> The back trace of threads in QEMU looks like a dead lock in MTTCG, 
> doesn't it?
> 
> Thread 7 (Thread 0x7f476e489700 (LWP 24967)):
> 
> #0  0x00007f477c2bbd19 in syscall () at /lib64/libc.so.6
> 
> #1  0x000055747d41a270 in qemu_event_wait (val=<optimized out>, 
> f=<optimized out>) at /home/andy/git/qemu/include/qemu/futex.h:29
> 
> #2  0x000055747d41a270 in qemu_event_wait (ev=ev@entry=0x55747e051c28
>  
> <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:460
> 
> #3  0x000055747d444d78 in call_rcu_thread (opaque=opaque@entry=0x0)
> at 
> ../util/rcu.c:258
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #1  0x00007f47805c137c in g_main_context_iterate.isra.19 () at 
> /lib64/libglib-2.0.so.0
> 
> #2  0x00007f47805c16ca in g_main_loop_run () at /lib64/libglib-
> 2.0.so.0
> 
> #3  0x000055747d29b071 in iothread_run 
> (opaque=opaque@entry=0x55747f85f280) at ../iothread.c:80
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at 
> /lib64/libpthread.so.0
> 
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=0x55747f916670, 
> mutex=0x55747e04dc00 <qemu_global_mutex>, file=0x55747d5dbe5c 
> "../softmmu/cpus.c", line=417) at ../util/qemu-thread-posix.c:174
> 
> #2  0x000055747d20ae36 in qemu_wait_io_event 
> (cpu=cpu@entry=0x55747f8b7920) at ../softmmu/cpus.c:417
> 
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn 
> (arg=arg@entry=0x55747f8b7920) at ../accel/tcg/tcg-accel-ops-
> mttcg.c:98
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at 
> /lib64/libpthread.so.0
> 
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=0x55747f9897e0, 
> mutex=0x55747e04dc00 <qemu_global_mutex>, file=0x55747d5dbe5c 
> "../softmmu/cpus.c", line=417) at ../util/qemu-thread-posix.c:174
> 
> #2  0x000055747d20ae36 in qemu_wait_io_event 
> (cpu=cpu@entry=0x55747f924bc0) at ../softmmu/cpus.c:417
> 
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn 
> (arg=arg@entry=0x55747f924bc0) at ../accel/tcg/tcg-accel-ops-
> mttcg.c:98
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at 
> /lib64/libpthread.so.0
> 
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=0x55747f9f5b40, 
> mutex=0x55747e04dc00 <qemu_global_mutex>, file=0x55747d5dbe5c 
> "../softmmu/cpus.c", line=417) at ../util/qemu-thread-posix.c:174
> 
> #2  0x000055747d20ae36 in qemu_wait_io_event 
> (cpu=cpu@entry=0x55747f990ba0) at ../softmmu/cpus.c:417
> 
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn 
> (arg=arg@entry=0x55747f990ba0) at ../accel/tcg/tcg-accel-ops-
> mttcg.c:98
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at 
> /lib64/libpthread.so.0
> 
> ---Type <return> to continue, or q <return> to quit---
> 
> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=0x55747fa626c0, 
> mutex=0x55747e04dc00 <qemu_global_mutex>, file=0x55747d5dbe5c 
> "../softmmu/cpus.c", line=417) at ../util/qemu-thread-posix.c:174
> 
> #2  0x000055747d20ae36 in qemu_wait_io_event 
> (cpu=cpu@entry=0x55747f9fcf00) at ../softmmu/cpus.c:417
> 
> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn 
> (arg=arg@entry=0x55747f9fcf00) at ../accel/tcg/tcg-accel-ops-
> mttcg.c:98
> 
> #4  0x000055747d419406 in qemu_thread_start (args=<optimized out>)
> at 
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
> #1  0x000055747d431439 in qemu_poll_ns (__ss=0x0, 
> __timeout=0x7ffcc3188330, __nfds=<optimized out>, __fds=<optimized
> out>) 
> at /usr/include/bits/poll2.h:77
> 
> #2  0x000055747d431439 in qemu_poll_ns (fds=<optimized out>, 
> nfds=<optimized out>, timeout=timeout@entry=3792947) at 
> ../util/qemu-timer.c:348
> 
> #3  0x000055747d4466ce in main_loop_wait (timeout=<optimized out>)
> at 
> ../util/main-loop.c:249
> 
> #4  0x000055747d4466ce in main_loop_wait 
> (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:530
> 
> #5  0x000055747d2695c7 in qemu_main_loop () at
> ../softmmu/runstate.c:725
> 
> #6  0x000055747ccc1bde in main (argc=<optimized out>,
> argv=<optimized 
> out>, envp=<optimized out>) at ../softmmu/main.c:50
> 
> (gdb)
> 
> 
> I run QEMU with virt-manager as this:
> 
> qemu      7311     1 70 19:15 ?        00:00:05 
> /usr/local/bin/qemu-system-aarch64 -name 
> guest=EulerOS-2.8-Rich,debug-threads=on -S -object 
> secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-95-
> EulerOS-2.8-Rich/master-key.aes 
> -machine virt-6.1,accel=tcg,usb=off,dump-guest-core=off,gic-
> version=3 
> -cpu max -drive 
> file=/usr/share/AAVMF/AAVMF_CODE.fd,if=pflash,format=raw,unit=0,reado
> nly=on 
> -drive 
> file=/var/lib/libvirt/qemu/nvram/EulerOS-2.8-
> Rich_VARS.fd,if=pflash,format=raw,unit=1 
> -m 4096 -smp 4,sockets=4,cores=1,threads=1 -uuid 
> c95e0e92-011b-449a-8e3f-b5f0938aaaa7 -display none -no-user-config 
> -nodefaults -chardev socket,id=charmonitor,fd=26,server,nowait -mon 
> chardev=charmonitor,id=monitor,mode=control -rtc base=utc -no-
> shutdown 
> -boot strict=on -device 
> pcie-root-
> port,port=0x8,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x1
>  
> -device 
> pcie-root-port,port=0x9,chassis=2,id=pci.2,bus=pcie.0,addr=0x1.0x1 
> -device 
> pcie-root-port,port=0xa,chassis=3,id=pci.3,bus=pcie.0,addr=0x1.0x2 
> -device 
> pcie-root-port,port=0xb,chassis=4,id=pci.4,bus=pcie.0,addr=0x1.0x3 
> -device qemu-xhci,p2=8,p3=8,id=usb,bus=pci.2,addr=0x0 -device 
> virtio-scsi-pci,id=scsi0,bus=pci.3,addr=0x0 -drive 
> file=/var/lib/libvirt/images/EulerOS-2.8-
> Rich.qcow2,format=qcow2,if=none,id=drive-scsi0-0-0-0 
> -device 
> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-
> 0,id=scsi0-0-0-0,bootindex=1 
> -drive if=none,id=drive-scsi0-0-0-1,readonly=on -device 
> scsi-cd,bus=scsi0.0,channel=0,scsi-id=0,lun=1,drive=drive-scsi0-0-0-
> 1,id=scsi0-0-0-1 
> -netdev tap,fd=28,id=hostnet0 -device 
> virtio-net-
> pci,netdev=hostnet0,id=net0,mac=52:54:00:f9:e0:69,bus=pci.1,addr=0x0 
> -chardev pty,id=charserial0 -serial chardev:charserial0 -msg
> timestamp=on
> 
> The issue is reproducible and persists.
> 1. Do you think that applying the series results in the dead lock in 
> MTTCG? Or it may be other reason?
> 2. Which piece of QEMU source code should I investigate to locate the
> issue?
> 
> Best regards,
> Andrey Shinkevich
> 
> 
> On 5/13/21 7:45 PM, Shashi Mallela wrote:
> > Hi Andrey,
> > 
> > To clarify, the patch series
> > 
> >     
> > https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> >     "GICv3 LPI and ITS feature implementation"
> > 
> > is applicable for virt machine 6.1 onwards,i.e ITS TCG
> > functionality is 
> > not available for version 6.0 that is being tried
> > here.
> > 
> > Thanks
> > Shashi
> > 
> > On May 13 2021, at 12:35 pm, Andrey Shinkevich 
> > <andrey.shinkevich@huawei.com> wrote:
> > 
> >     Dear colleagues,
> > 
> >     Thank you all very much for your responses. Let me reply with
> > one
> >     message.
> > 
> >     I configured QEMU for AARCH64 guest:
> >     $ ./configure --target-list=aarch64-softmmu
> > 
> >     When I start QEMU with GICv3 on an x86 host:
> >     qemu-system-aarch64 -machine virt-6.0,accel=tcg,gic-version=3
> > 
> >     QEMU reports this error from hw/pci/msix.c:
> >     error_setg(errp, "MSI-X is not supported by interrupt
> > controller");
> > 
> >     Probably, the variable 'msi_nonbroken' would be initialized in
> >     hw/intc/arm_gicv3_its_common.c:
> >     gicv3_its_init_mmio(..)
> > 
> >     I guess that it works with KVM acceleration only rather than
> > with TCG.
> > 
> >     The error persists after applying the series:
> >     
> > https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> >     "GICv3 LPI and ITS feature implementation"
> >     (special thanks for referring me to that)
> > 
> >     Please, make me clear and advise ideas how that error can be
> > fixed?
> >     Should the MSI-X support be implemented with GICv3 extra?
> > 
> >     When successful, I would like to test QEMU for a maximum number
> > of cores
> >     to get the best MTTCG performance.
> >     Probably, we will get just some percentage of performance
> > enhancement
> >     with the BQL series applied, won't we? I will test it as well.
> > 
> >     Best regards,
> >     Andrey Shinkevich
> > 
> > 
> >     On 5/12/21 6:43 PM, Alex Bennée wrote:
> >      >
> >      > Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:
> >      >
> >      >> Dear colleagues,
> >      >>
> >      >> I am looking for ways to accelerate the MTTCG for ARM guest
> > on
> >     x86-64 host.
> >      >> The maximum number of CPUs for MTTCG that uses GICv2 is
> > limited
> >     by 8:
> >      >>
> >      >> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
> >      >>
> >      >> The version 3 of the Generic Interrupt Controller (GICv3)
> > is not
> >      >> supported in QEMU for some reason unknown to me. It would
> > allow to
> >      >> increase the limit of CPUs and accelerate the MTTCG
> > performance on a
> >      >> multiple core hypervisor.
> >      >
> >      > It is supported, you just need to select it.
> >      >
> >      >> I have got an idea to implement the Interrupt Translation
> >     Service (ITS)
> >      >> for using by MTTCG for ARM architecture.
> >      >
> >      > There is some work to support ITS under TCG already posted:
> >      >
> >      > Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature
> > implementation
> >      > Date: Thu, 29 Apr 2021 19:41:53 -0400
> >      > Message-Id: <
> > 20210429234201.125565-1-shashi.mallela@linaro.org>
> >      >
> >      > please do review and test.
> >      >
> >      >> Do you find that idea useful and feasible?
> >      >> If yes, how much time do you estimate for such a project to
> >     complete by
> >      >> one developer?
> >      >> If no, what are reasons for not implementing GICv3 for
> > MTTCG in
> >     QEMU?
> >      >
> >      > As far as MTTCG performance is concerned there is a degree
> > of
> >      > diminishing returns to be expected as the synchronisation
> > cost
> >     between
> >      > threads will eventually outweigh the gains of additional
> > threads.
> >      >
> >      > There are a number of parts that could improve this
> > performance. The
> >      > first would be picking up the BQL reduction series from your
> >     FutureWei
> >      > colleges who worked on the problem when they were Linaro
> > assignees:
> >      >
> >      > Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from
> >     cpu_handle_interrupt/exception path
> >      > Date: Wed, 19 Aug 2020 14:28:49 -0400
> >      > Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>
> >      >
> >      > There was also a longer series moving towards per-CPU locks:
> >      >
> >      > Subject: [PATCH v10 00/73] per-CPU locks
> >      > Date: Wed, 17 Jun 2020 17:01:18 -0400
> >      > Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>
> >      >
> >      > I believe the initial measurements showed that the BQL cost
> >     started to
> >      > edge up with GIC interactions. We did discuss approaches for
> > this
> >     and I
> >      > think one idea was use non-BQL locking for the GIC. You
> > would need to
> >      > revert:
> >      >
> >      > Subject: [PATCH-for-5.2] exec: Remove
> >     MemoryRegion::global_locking field
> >      > Date: Thu, 6 Aug 2020 17:07:26 +0200
> >      > Message-Id: <20200806150726.962-1-philmd@redhat.com>
> >      >
> >      > and then implement a more fine tuned locking in the GIC
> > emulation
> >      > itself. However I think the BQL and per-CPU locks are lower
> > hanging
> >      > fruit to tackle first.
> >      >
> >      >>
> >      >> Best regards,
> >      >> Andrey Shinkevich
> >      >
> >      >
> > 
> > Sent from Mailspring


