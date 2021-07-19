Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCE3CE060
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:58:04 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ved-0007Il-BF
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5Vcs-00058q-87
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5Vcp-0001YP-0o
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626710169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gj6N5oo0hAXP7x36/frJKzpPUzlvDR2jxzqqnshjrlE=;
 b=VAmFwxQ1TyRcF66PwgKEJhltU8t1nF448R2R1Fmcw4qsIM4YtYxgzgQDpU5bvHsoAY/6N9
 Ecd9Vg4f9Nscvof0Y3Xt/Rg3k6pDLtHEMy6vgfZydRvgm60vSNUSLAHk8CLaPzhnCDOX1O
 M1PtxF53644A/RzYiiw0FyujIhyNa0s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-z6O3DNoUMzWnyfEIBzZmjg-1; Mon, 19 Jul 2021 11:56:08 -0400
X-MC-Unique: z6O3DNoUMzWnyfEIBzZmjg-1
Received: by mail-qt1-f198.google.com with SMTP id
 t6-20020ac80dc60000b029024e988e8277so9632509qti.23
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gj6N5oo0hAXP7x36/frJKzpPUzlvDR2jxzqqnshjrlE=;
 b=GCcm9HnPzJqTN7uQ6OCuW5SXlWZ/fPBS3g3pM9Ryu1uNMCo+u7Ag5yiYe9G7l2sjCU
 EzrfRGBTlXJXYTBuA+yXGIEmrRKUWGEdD2H7wknZ47BhWn0Xf8VHZUCelKVywZWv/DXj
 262IARX+bbQHgWnked2ItXlcQ07UfdsBfSklxTZbl9xQmoxTSaF5PA+lx4LJw9c6LGD8
 AAF9tOyLhQvh1wDvnPus8bVw91fUIsGhH3NAdnqjtpHo+OqrVts9RGXvzYOwcUFJ2fI+
 zXKtEcvzCFMtPX4aSw3LlFLMjR6YY9mZ8WvrdkDkHknD/0k8/YMaBrWli70chml2ZqvS
 +IkQ==
X-Gm-Message-State: AOAM533Nx18ooloQXbftVezYTMwjraa8ZuRFCzr6D6apyMilt5XfJjDz
 lYjjqa5u3ejf37Xb70Vklf9Wna78r+fQrPu2BEZaYLB39oNu9nfStQNGAJpU4wK5nyQpGupfPCY
 XgVZsUFIy5tmoF2k=
X-Received: by 2002:a37:af45:: with SMTP id y66mr14766458qke.466.1626710166508; 
 Mon, 19 Jul 2021 08:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDuh58hPwnmTcZnB+4UEhZy8tar4oublIoBjxF7Vxo+iV7VnFAz54PdSy4RiLUP6ZFGwQbjw==
X-Received: by 2002:a37:af45:: with SMTP id y66mr14766432qke.466.1626710166272; 
 Mon, 19 Jul 2021 08:56:06 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s19sm3327008qtx.5.2021.07.19.08.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:56:05 -0700 (PDT)
Date: Mon, 19 Jul 2021 11:56:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: Question on memory commit during MR finalize()
Message-ID: <YPWglNqZFegBRZjM@t490s>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Levon <john.levon@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Thanos,

On Mon, Jul 19, 2021 at 02:38:52PM +0000, Thanos Makatos wrote:
> I can trivially trigger an assertion with a build where I merged the recent vfio-user patches (https://patchew.org/QEMU/cover.1626675354.git.elena.ufimtseva@oracle.com/) to master and then merging the result into your xzpeter/memory-sanity branch, I've pushed the branch here: https://github.com/tmakatos/qemu/tree/memory-sanity. I explain the repro steps below in case you want to take a look:
> 
> Build as follows:
> 
> ./configure --prefix=/opt/qemu-xzpeter --target-list=x86_64-softmmu --enable-kvm  --enable-debug --enable-multiprocess && make -j `nproc` && make install
> 
> Then build and run the GPIO sample from libvfio-user (https://github.com/nutanix/libvfio-user):
> 
> libvfio-user/build/dbg/samples/gpio-pci-idio-16 -v /var/run/vfio-user.sock
> 
> And then run QEMU as follows:
> 
> gdb --args /opt/qemu-xzpeter/bin/qemu-system-x86_64 -cpu host -enable-kvm -smp 4 -m 2G -object memory-backend-file,id=mem0,size=2G,mem-path=/dev/hugepages,share=on,prealloc=yes -numa node,memdev=mem0 -kernel bionic-server-cloudimg-amd64-vmlinuz-generic -initrd bionic-server-cloudimg-amd64-initrd-generic -append 'console=ttyS0 root=/dev/sda1 single' -hda bionic-server-cloudimg-amd64-0.raw -nic user,model=virtio-net-pci -machine pc-q35-3.1 -device vfio-user-pci,socket=/var/run/vfio-user.sock -nographic
> 
> I immediately get the following stack trace:
> 
> Thread 5 "qemu-system-x86" received signal SIGUSR1, User defined signal 1.

This is SIGUSR1.  QEMU uses it for general vcpu ipis.

> [Switching to Thread 0x7fffe6e82700 (LWP 151973)]
> __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> 103     ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S: No such file or directory.
> (gdb) bt
> #0  0x00007ffff655d29c in __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> #1  0x00007ffff6558642 in __pthread_mutex_cond_lock (mutex=mutex@entry=0x5555568bb280 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x00007ffff6559ef8 in __pthread_cond_wait_common (abstime=0x0, mutex=0x5555568bb280 <qemu_global_mutex>, cond=0x555556cecc30) at pthread_cond_wait.c:645
> #3  0x00007ffff6559ef8 in __pthread_cond_wait (cond=0x555556cecc30, mutex=0x5555568bb280 <qemu_global_mutex>) at pthread_cond_wait.c:655
> #4  0x000055555604f717 in qemu_cond_wait_impl (cond=0x555556cecc30, mutex=0x5555568bb280 <qemu_global_mutex>, file=0x5555561ca869 "../softmmu/cpus.c", line=514) at ../util/qemu-thread-posix.c:194
> #5  0x0000555555d28a4a in qemu_cond_wait_iothread (cond=0x555556cecc30) at ../softmmu/cpus.c:514
> #6  0x0000555555d28781 in qemu_wait_io_event (cpu=0x555556ce02c0) at ../softmmu/cpus.c:425
> #7  0x0000555555e5da75 in kvm_vcpu_thread_fn (arg=0x555556ce02c0) at ../accel/kvm/kvm-accel-ops.c:54
> #8  0x000055555604feed in qemu_thread_start (args=0x555556cecc70) at ../util/qemu-thread-posix.c:541
> #9  0x00007ffff6553fa3 in start_thread (arg=<optimized out>) at pthread_create.c:486
> #10 0x00007ffff64824cf in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Would you please add below to your ~/.gdbinit script?

  handle SIGUSR1 nostop noprint

Or just run without gdb and wait it to crash with SIGABRT.

Thanks,

-- 
Peter Xu


