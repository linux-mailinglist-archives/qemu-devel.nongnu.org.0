Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F53C95CA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 04:01:16 +0200 (CEST)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3qgc-0006Wu-O2
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 22:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3qey-0005qN-M3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3qev-00018Q-34
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626314367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OtDrvGCeXqca3ZpnK1p3MYcXgUibsU+Utier6X+r6RA=;
 b=OiJpkVFwQtG0LJ5zGBY8Bkc65DQz3GkM9zRAwUqwNEsieH8k1sY9z+/fwTOq2b2olkcOos
 muO8CpBv1s/AUrwL4UCsaOuveqTOWxRW3tbgMkfSTbNFKRkdyJcMp8HF9fvpht9QMr7Ijc
 wu3XEuF+dFqo25NlPh8T5XndjgCPZRo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-uJimbiabO-WlPnUxK2kKTA-1; Wed, 14 Jul 2021 21:59:25 -0400
X-MC-Unique: uJimbiabO-WlPnUxK2kKTA-1
Received: by mail-ej1-f70.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so1500446eju.22
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 18:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=OtDrvGCeXqca3ZpnK1p3MYcXgUibsU+Utier6X+r6RA=;
 b=EIdg445IF1LHJd2jNMyOC5tqZ97iSNFSS8ubSw1dWLTRzKfI8JbOyKgKl9oZGARWvl
 yuL+x/9Bg39chOk7rFUBnfgSzZMckyOa8iDDKJF4qS80p0iGwENxlTVvUPe9Fpfh+bW8
 5XigF74P6L2Gk3Ux1uScXyLj0Hk6OM1vQQ4MQVi3G8lrSBALfvgyn9Z5pDLji2jbBSi+
 gIP0m4+dwfo41oge99CVWpULznsEcP+ejaDOsIlHqaoOWgsOq57M9YAe542vzG94qRVm
 fpdwYG1GDGWSc+B6Uezbz66qbY/vgW2aWSmtQPV9BO5WrFkX5972PcqOzEJbLiBnah/G
 VcJQ==
X-Gm-Message-State: AOAM530lvkk+5LAwkVpoING2CTORaRaO2JYI0Eqqpqaqu6NKoGY55bCr
 8TZDcA7ENRtbkz0B3SFRItH9AWCzYELsT1Ii1cJTGYMKK1SvyN8sFyEeAUx3ReFSKuIgSRa6175
 80h9PVL6Zmh9KHLN9eOhH2gdQSKRxy5k=
X-Received: by 2002:a50:ed89:: with SMTP id h9mr2258069edr.106.1626314364693; 
 Wed, 14 Jul 2021 18:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlYKw/1RFJwbqWgY5adfcqvJRWOJi2wR8hNtr8UBDElM12w6ZaSzfNEifcJfl6Bx1W1D6a9236JouYh4bkAXU=
X-Received: by 2002:a50:ed89:: with SMTP id h9mr2258037edr.106.1626314364516; 
 Wed, 14 Jul 2021 18:59:24 -0700 (PDT)
MIME-Version: 1.0
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 14 Jul 2021 21:59:13 -0400
Message-ID: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
Subject: tests/acceptance/multiprocess.py test failure
To: qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <dhildenb@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Willian Rampazzo <willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone,

The tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64
is currently failing (as of a9649a719a44894b81f38dc1c5c1888ee684acef).
Unfortunately CI was unable to catch this issue earlier, because tests
that require KVM are not yet running (but this should change soon).
The relevant part of the test logs is:

VM launch command: './qemu-system-x86_64 -display none -vga none
-chardev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815=
-monitor.sock
-mon chardev=3Dmon,mode=3Dcontrol -chardev
socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-cons=
ole.sock,server=3Don,wait=3Doff
-serial chardev:console -machine pc -accel kvm -cpu host -object
memory-backend-memfd,id=3Dsysmem-file,size=3D2G --numa
node,memdev=3Dsysmem-file -m 2048 -kernel
/home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db=
177736bb4/vmlinuz
-initrd /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9=
246dd8db177736bb4/initrd.img
-append printk.time=3D0 console=3DttyS0 rdinit=3D/bin/bash -device
x-pci-proxy-dev,id=3Dlsi1,fd=3D16'
>>> {'execute': 'qmp_capabilities'}

The test remains stuck here for as long as the test is allowed to run.
Because there's currently no timeout in the test, it can remain stuck
forever.  But, with a timeout, we end up getting:

Error launching VM
Command: './qemu-system-x86_64 -display none -vga none -chardev
socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-monitor.=
sock
-mon chardev=3Dmon,mode=3Dcontrol -chardev
socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_5g22rvrp/qemu-427815-cons=
ole.sock,server=3Don,wait=3Doff
-serial chardev:console -machine pc -accel kvm -cpu host -object
memory-backend-memfd,id=3Dsysmem-file,size=3D2G --numa
node,memdev=3Dsysmem-file -m 2048 -kernel
/home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9246dd8db=
177736bb4/vmlinuz
-initrd /home/cleber/avocado/data/cache/by_location/b4c64f15a75b083966d39d9=
246dd8db177736bb4/initrd.img
-append printk.time=3D0 console=3DttyS0 rdinit=3D/bin/bash -device
x-pci-proxy-dev,id=3Dlsi1,fd=3D16'
Output: "qemu-system-x86_64: ../../src/qemu/softmmu/physmem.c:2055:
qemu_ram_alloc_from_fd: Assertion `(ram_flags & ~(RAM_SHARED |
RAM_PMEM | RAM_NORESERVE)) =3D=3D 0' failed.\n"

I've bisected it to:

---

d5015b80134047013eeec10000df5ce2014ee114 is the first bad commit
commit d5015b80134047013eeec10000df5ce2014ee114
Author: David Hildenbrand <david@redhat.com>
Date:   Mon May 10 13:43:17 2021 +0200

    softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()

    Let's pass in ram flags just like we do with qemu_ram_alloc_from_file()=
,
    to clean up and prepare for more flags.

    Simplify the documentation of passed ram flags: Looking at our
    documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
    repetitive.

    Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
    Reviewed-by: Peter Xu <peterx@redhat.com>
    Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend
and machine core
    Signed-off-by: David Hildenbrand <david@redhat.com>
    Message-Id: <20210510114328.21835-5-david@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

 backends/hostmem-memfd.c | 7 ++++---
 hw/misc/ivshmem.c        | 5 ++---
 include/exec/memory.h    | 9 +++------
 include/exec/ram_addr.h  | 6 +-----
 softmmu/memory.c         | 7 +++----
 5 files changed, 13 insertions(+), 21 deletions(-)

---

To reproduce it:

1. configure --target-list=3Dx86_64-softmmu
2. meson compile
3. make check-venv
4. ./tests/venv/bin/avocado --show=3Dtest run --job-timeout=3D20s
tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64

It'd be helpful to know if anyone else is experiencing the same failure.

Thanks,
- Cleber.


