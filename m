Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5C32B9D0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:24:26 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWAb-0006UJ-F3
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8i-0004S8-Ni
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8g-0000KS-Ic
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c2RVdSAhN19HCcvNMcEKCSeQlJ0pBYd+9LH4EI/CKB0=;
 b=JaRwa39MfemudpofpVZoUtEzWJe5YQbBio0bPmEjqgIUoS9qTqZvY+fPQ7fDlSY3H4CAQN
 kn51fAchHBKFg8el2uayAj1QB2HD4hu4D6DTqMZ7smtYbWvmCi9eje13/jDOhXUmCF6xu7
 FYj6Bt3RT0DRPIs+cr65O95N2BOSZpg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-C2gPXK33NlCE1y-N69HXJA-1; Wed, 03 Mar 2021 13:22:24 -0500
X-MC-Unique: C2gPXK33NlCE1y-N69HXJA-1
Received: by mail-wr1-f70.google.com with SMTP id h30so13180585wrh.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pU0d9Mw8PQdbgfBbP+KMCl6F0o1+MOAeJgm+3OD11Xs=;
 b=Gt3IaA7DpjHILrooPF2Tq+YADIS8Pn3rvvrl1voTjlw+qYH4ic3TRm11Mw2FUOzej3
 79m8auo5EmIPYlQHZ1cr7pjFBmhHFbavGqsPK8o9OC3LItq4ztq/dueKId3DHJQbDfb2
 +LRPLQQjiqtQ/CYg6vbBbpfog92PLF1OD3J1dM3bVTd7+46KowZ6lziWJWn0zLOizOsr
 Co4VPlm0dGhVkL/jBx2ceL2Opmdua8SHi4nyAnfAqiZflgyFhcvqLr4EyBuXWQ1yP/F4
 OOE0POeIL5DjREeroGXA7wrrLBp4Loa1TFufU9lwtNFSKXVAj7I0Tg8NrguHXznSK0Rt
 sTww==
X-Gm-Message-State: AOAM533EunWYhsA6dsQCzaYy33zet3hNQDAGLDkSnvmp/oX43aisFAPG
 oq/vKyGtbtHdAf5DXFR119MTfl5DWqnvhf9ArfemotMB+NpIOaGNtXj9QFSa+ZS7xGigVNnSQid
 IuXPjvf/NirUVdAhbkBX9j+IxF85UcPmtIwprrUZv5VtT0kU+2WLBtQm97Uah9scW
X-Received: by 2002:a5d:430a:: with SMTP id h10mr19981wrq.162.1614795742576;
 Wed, 03 Mar 2021 10:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUTywIC+KwxYJXuUyDhzg8Nuj7gHjGLk6CPjSdHmohYvyP+QZLu8kIXtLnUufcrNeJRgTWfQ==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr19929wrq.162.1614795742181;
 Wed, 03 Mar 2021 10:22:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm35148487wra.66.2021.03.03.10.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
Date: Wed,  3 Mar 2021 19:22:00 +0100
Message-Id: <20210303182219.1631042-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series introduces the 'AccelvCPUState' which is forward=0D
declared opaque in "cpu.h", then each accelerator define it.=0D
=0D
The opaque CPUState::accel_vcpu pointer is shared by all=0D
accelerators (not a problem because there can be at most=0D
one accelerator per vCPU).=0D
=0D
Series is organized as:=0D
- preliminary trivial cleanups=0D
- introduce AccelvCPUState=0D
- move WHPX fields (build-tested)=0D
- move HAX fields (not tested)=0D
- move KVM fields (build-tested)=0D
- move HVF fields (not tested)=0D
=0D
For now vcpu_dirty is still shared in CPUState.=0D
=0D
Sending as RFC to see if it is worthwhile.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (19):=0D
  target/i386/hvf: Use boolean value for vcpu_dirty=0D
  target/s390x/kvm: Simplify debug code=0D
  target/s390x/kvm: Reduce deref by declaring 'struct kvm_run' on stack=0D
  cpu: Croup accelerator-specific fields altogether=0D
  cpu: Introduce AccelvCPUState opaque structure=0D
  accel/whpx: Add typedef for 'struct whpx_vcpu'=0D
  accel/whpx: Rename struct whpx_vcpu -> AccelvCPUState=0D
  accel/whpx: Use 'accel_vcpu' generic pointer=0D
  accel/hax: Add typedef for 'struct hax_vcpu_state'=0D
  accel/hax: Use 'accel_vcpu' generic pointer=0D
  accel/kvm: Introduce kvm_vcpu_state() helper=0D
  accel/kvm: Use kvm_vcpu_state() when possible=0D
  accel/kvm: Declare and allocate AccelvCPUState struct=0D
  accel/kvm: Move the 'kvm_fd' field to AccelvCPUState=0D
  accel/kvm: Move the 'kvm_state' field to AccelvCPUState=0D
  accel/kvm: Move the 'kvm_run' field to AccelvCPUState=0D
  accel/hvf: Reduce deref by declaring 'hv_vcpuid_t hvf_fd' on stack=0D
  accel/hvf: Declare and allocate AccelvCPUState struct=0D
  accel/hvf: Move the 'hvf_fd' field to AccelvCPUState=0D
=0D
 include/hw/core/cpu.h         |  17 +--=0D
 include/sysemu/kvm.h          |   2 +=0D
 include/sysemu/kvm_int.h      |   9 ++=0D
 target/i386/hax/hax-i386.h    |  10 +-=0D
 target/i386/hvf/hvf-i386.h    |   4 +=0D
 target/i386/hvf/vmx.h         |  28 +++--=0D
 accel/kvm/kvm-all.c           |  44 ++++---=0D
 hw/s390x/pv.c                 |   3 +-=0D
 target/arm/kvm.c              |   2 +-=0D
 target/arm/kvm64.c            |  12 +-=0D
 target/i386/cpu.c             |   4 +-=0D
 target/i386/hax/hax-all.c     |  22 ++--=0D
 target/i386/hax/hax-posix.c   |   4 +-=0D
 target/i386/hax/hax-windows.c |   4 +-=0D
 target/i386/hvf/hvf.c         | 118 +++++++++---------=0D
 target/i386/hvf/x86.c         |  28 ++---=0D
 target/i386/hvf/x86_descr.c   |  32 +++--=0D
 target/i386/hvf/x86_emu.c     |  62 +++++-----=0D
 target/i386/hvf/x86_mmu.c     |   4 +-=0D
 target/i386/hvf/x86_task.c    |  14 ++-=0D
 target/i386/hvf/x86hvf.c      | 227 +++++++++++++++++-----------------=0D
 target/i386/kvm/kvm.c         |  36 +++---=0D
 target/i386/whpx/whpx-all.c   |  34 ++---=0D
 target/ppc/kvm.c              |  16 +--=0D
 target/s390x/kvm.c            | 148 +++++++++++-----------=0D
 25 files changed, 466 insertions(+), 418 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


