Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8933A427
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 11:26:57 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLNxY-0002ho-C4
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 06:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lLNvN-0002AK-Di
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 06:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lLNvH-0005dG-Cv
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 06:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615717473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1S5qyAaBTB4tA0B6cf0duMAOlwX3Avq/qRHi3FUJCf0=;
 b=Z1vmoJOy/SY/939gNm41znnKzHA72rp2L95XEhoXH9kfXoWhAzs7GuQ//TKqg9RBGZAVNt
 SOmsUI+8YVLSDdSehGc5P25dZKLo5z/nNVArrwUbgdG7q9ZOIZj1cd4IAYHNU6FGhBsqZy
 k5MAx6ZfmUcZE/7/856tmtNXmTpyq4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-FRbXqRNPNmWj1mCaEEjzFA-1; Sun, 14 Mar 2021 06:24:31 -0400
X-MC-Unique: FRbXqRNPNmWj1mCaEEjzFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA7A363A1;
 Sun, 14 Mar 2021 10:24:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA0051312;
 Sun, 14 Mar 2021 10:24:21 +0000 (UTC)
Date: Sun, 14 Mar 2021 11:24:18 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: qemu crashes on changing display resolution within guest
Message-ID: <20210314102418.o34lhrp33v5hhzeb@kamzik.brq.redhat.com>
References: <20210312233949.3681b75d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312233949.3681b75d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 11:39:49PM +0100, Igor Mammedov wrote:
> happens on current master,
> 
> to reproduce start
> ./x86_64-softmmu/qemu-system-x86_64 -enable-kvm -m 1g -M pc -vnc localhost:0 \
>      -snapshot -cdrom Fedora-Workstation-Live-x86_64-33-1.2.iso
> 
> connect to guest using 'Remote Desktop', wait till it boots to graphical desktop
> then try to change resolution to 800x600
> 
> QEMU will crash in a second or 2 with:
> qemu-system-x86_64: ../qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
> 
> 
> offending commit:
> 
> commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb (HEAD, refs/bisect/bad)
> Author: Keqian Zhu <zhukeqian1@huawei.com>
> Date:   Thu Dec 17 09:49:41 2020 +0800
> 
>     accel: kvm: Add aligment assert for kvm_log_clear_one_slot
> 
> PS:
> same happens when using spice client
> 
>

Yup, this is an already reported, disappointing regression. As Paolo says,
a revert is on the way. It's extra disappointing because it actually isn't
that hard to reproduce. A kvm-unit-tests migration test reproduces it
(see below). I guess we should improve our QEMU CI to also run
kvm-unit-tests for accel=kvm related changes on all architectures that
support KVM (or at least x86_64 and aarch64).

Thanks,
drew

$ tests/its-migration 
BUILD_HEAD=5f8efadf
run_migration timeout -k 1s --foreground 90s ../build/q/qemu-system-aarch64 -nodefaults -machine virt,gic-version=host,accel=kvm -cpu host -device virtio-serial-device -device virtconsole,chardev=ctd -chardev testdev,id=ctd -device pci-testdev -display none -serial stdio -kernel /tmp/tmp.kbJOUcS86v -smp 48 -machine gic-version=3 -append its-migration # -initrd /tmp/tmp.vN8JxnjX7h
qemu-system-aarch64: -chardev socket,id=mon1,path=/tmp/mig-helper-qmp1.2e6Up9BrWK,server,nowait: warning: short-form boolean option 'server' deprecated
Please use server=on instead
qemu-system-aarch64: -chardev socket,id=mon1,path=/tmp/mig-helper-qmp1.2e6Up9BrWK,server,nowait: warning: short-form boolean option 'nowait' deprecated
Please use wait=off instead
qemu-system-aarch64: -chardev socket,id=mon2,path=/tmp/mig-helper-qmp2.HcqdylHwvn,server,nowait: warning: short-form boolean option 'server' deprecated
Please use server=on instead
qemu-system-aarch64: -chardev socket,id=mon2,path=/tmp/mig-helper-qmp2.HcqdylHwvn,server,nowait: warning: short-form boolean option 'nowait' deprecated
Please use wait=off instead
ITS: MAPD devid=2 size = 0x8 itt=0x40bc0000 valid=1
ITS: MAPD devid=7 size = 0x8 itt=0x40bd0000 valid=1
MAPC col_id=3 target_addr = 0x30000 valid=1
MAPC col_id=2 target_addr = 0x20000 valid=1
INVALL col_id=2
INVALL col_id=3
MAPTI dev_id=2 event_id=20 -> phys_id=8195, col_id=3
MAPTI dev_id=7 event_id=255 -> phys_id=8196, col_id=2
Now migrate the VM, then press a key to continue...
qemu-system-aarch64: ../../qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
qemu-system-aarch64: Not a migration stream
qemu-system-aarch64: load of migration failed: Invalid argument
Ncat: Connection reset by peer.
timeout: the monitored command dumped core
/tmp/tmp.M1473gQVZ0: line 126: 1545037 Aborted                 timeout -k 1s --foreground 90s ../build/q/qemu-system-aarch64 -nodefaults -machine virt,gic-version=host,accel=kvm -cpu host -device virtio-serial-device -device virtconsole,chardev=ctd -chardev testdev,id=ctd -device pci-testdev -display none -serial stdio -kernel /tmp/tmp.kbJOUcS86v -smp 48 -machine gic-version=3 -append its-migration -initrd /tmp/tmp.vN8JxnjX7h -chardev socket,id=mon1,path=/tmp/mig-helper-qmp1.2e6Up9BrWK,server,nowait -mon chardev=mon1,mode=control
Ncat: Connection refused.
Ncat: Connection refused.
^Ctests/its-migration: line 1: 1545202 Terminated              summary=$(eval $cmdline 2> >(RUNTIME_log_stderr $testname)                              > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))


