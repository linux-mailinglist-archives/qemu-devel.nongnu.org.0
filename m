Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0E2DD8A8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:49:18 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyKz-0007qv-7n
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyII-0006DG-TG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIG-0001tW-2r
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zxagwghG2OO5hz6aC694yKcP6ueBprlbbtC3JRzfjyM=;
 b=ckTGM2V8BU0NqgGc5AR5uYGEI4DYojOxATZwOt35CBGLwB+zamyvA6hfbZl7tQUmkq8A0r
 ddqsr1prXu9CCwnnGlS+HO1+9PflcPabIx+pj9ibt36vxOYXmlLaHS6ZNd2/8UajVPxDrq
 DHax0CbPgDZhMN8HD8x11LBeMdGHwDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-rrAJ7JiDPDmM0Q_nxZ0hbQ-1; Thu, 17 Dec 2020 13:46:23 -0500
X-MC-Unique: rrAJ7JiDPDmM0Q_nxZ0hbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF06E107ACF8;
 Thu, 17 Dec 2020 18:46:21 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71DBB60BE5;
 Thu, 17 Dec 2020 18:46:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/17] x86 queue, 2020-12-17
Date: Thu, 17 Dec 2020 13:46:03 -0500
Message-Id: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that this is using my new gitlab.com repository URL, which=0D
was updated on commit f953c100693d ("MAINTAINERS: Update my git=0D
repository URLs").=0D
=0D
The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2020-12-15 21:24:31 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to 9fb75013d864489a91ba05e6009ed79c250d4064:=0D
=0D
  cpu: Remove unnecessary noop methods (2020-12-16 15:50:33 -0500)=0D
=0D
----------------------------------------------------------------=0D
x86 queue, 2020-12-17=0D
=0D
Features:=0D
* AVX512_FP16 feature (Cathy Zhang)=0D
=0D
Cleanups:=0D
* accel code cleanup (Claudio Fontana)=0D
* hyperv initialization cleanup (Vitaly Kuznetsov)=0D
=0D
----------------------------------------------------------------=0D
=0D
Cathy Zhang (1):=0D
  x86/cpu: Add AVX512_FP16 cpu feature=0D
=0D
Claudio Fontana (8):=0D
  i386: move kvm accel files into kvm/=0D
  i386: move whpx accel files into whpx/=0D
  i386: move hax accel files into hax/=0D
  i386: hvf: remove stale MAINTAINERS entry for old hvf stubs=0D
  i386: move TCG accel files into tcg/=0D
  i386: move cpu dump out of helper.c into cpu-dump.c=0D
  i386: move TCG cpu class initialization to tcg/=0D
  i386: tcg: remove inline from cpu_load_eflags=0D
=0D
Eduardo Habkost (4):=0D
  tcg: cpu_exec_{enter,exit} helpers=0D
  tcg: make CPUClass.cpu_exec_* optional=0D
  tcg: Make CPUClass.debug_excp_handler optional=0D
  cpu: Remove unnecessary noop methods=0D
=0D
Vitaly Kuznetsov (4):=0D
  i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()=0D
  i386: move hyperv_interface_id initialization to x86_cpu_realizefn()=0D
  i386: move hyperv_version_id initialization to x86_cpu_realizefn()=0D
  i386: move hyperv_limits initialization to x86_cpu_realizefn()=0D
=0D
 hw/core/cpu.c                              |  13 -=0D
 target/i386/cpu.h                          |  97 +---=0D
 target/i386/{ =3D> hax}/hax-cpus.h           |   0=0D
 target/i386/{ =3D> hax}/hax-i386.h           |   6 +-=0D
 target/i386/{ =3D> hax}/hax-interface.h      |   0=0D
 target/i386/{ =3D> hax}/hax-posix.h          |   0=0D
 target/i386/{ =3D> hax}/hax-windows.h        |   0=0D
 target/i386/{ =3D> kvm}/hyperv-proto.h       |   0=0D
 target/i386/{ =3D> kvm}/hyperv.h             |   0=0D
 target/i386/{ =3D> kvm}/kvm_i386.h           |   0=0D
 target/i386/kvm/trace.h                    |   1 +=0D
 target/i386/{ =3D> tcg}/cc_helper_template.h |   0=0D
 target/i386/tcg/helper-tcg.h               |  95 ++++=0D
 target/i386/tcg/tcg-cpu.h                  |  15 +=0D
 target/i386/{ =3D> whpx}/whp-dispatch.h      |   0=0D
 target/i386/{ =3D> whpx}/whpx-cpus.h         |   0=0D
 MAINTAINERS                                |  11 +-=0D
 accel/tcg/cpu-exec.c                       |  34 +-=0D
 hw/i386/fw_cfg.c                           |   2 +-=0D
 hw/i386/intel_iommu.c                      |   2 +-=0D
 hw/i386/kvm/apic.c                         |   2 +-=0D
 hw/i386/kvm/clock.c                        |   2 +-=0D
 hw/i386/microvm.c                          |   2 +-=0D
 hw/i386/pc.c                               |   2 +-=0D
 hw/i386/x86.c                              |   2 +-=0D
 meson.build                                |   1 +=0D
 target/i386/cpu-dump.c                     | 537 ++++++++++++++++++++=0D
 target/i386/cpu.c                          |  75 ++-=0D
 target/i386/{ =3D> hax}/hax-all.c            |   0=0D
 target/i386/{ =3D> hax}/hax-cpus.c           |   0=0D
 target/i386/{ =3D> hax}/hax-mem.c            |   0=0D
 target/i386/{ =3D> hax}/hax-posix.c          |   0=0D
 target/i386/{ =3D> hax}/hax-windows.c        |   0=0D
 target/i386/hax/meson.build                |   7 +=0D
 target/i386/helper.c                       | 539 +--------------------=0D
 target/i386/{ =3D> kvm}/hyperv-stub.c        |   0=0D
 target/i386/{ =3D> kvm}/hyperv.c             |   0=0D
 target/i386/{ =3D> kvm}/kvm-stub.c           |   0=0D
 target/i386/{ =3D> kvm}/kvm.c                |  70 ++-=0D
 target/i386/kvm/meson.build                |   3 +=0D
 target/i386/kvm/trace-events               |   7 +=0D
 target/i386/machine.c                      |   4 +-=0D
 target/i386/meson.build                    |  33 +-=0D
 target/i386/{ =3D> tcg}/bpt_helper.c         |   1 +=0D
 target/i386/{ =3D> tcg}/cc_helper.c          |   1 +=0D
 target/i386/{ =3D> tcg}/excp_helper.c        |   1 +=0D
 target/i386/{ =3D> tcg}/fpu_helper.c         |  39 +-=0D
 target/i386/{ =3D> tcg}/int_helper.c         |   1 +=0D
 target/i386/{ =3D> tcg}/mem_helper.c         |   1 +=0D
 target/i386/tcg/meson.build                |  14 +=0D
 target/i386/{ =3D> tcg}/misc_helper.c        |  14 +=0D
 target/i386/{ =3D> tcg}/mpx_helper.c         |   1 +=0D
 target/i386/{ =3D> tcg}/seg_helper.c         |   1 +=0D
 target/i386/{ =3D> tcg}/smm_helper.c         |   2 +=0D
 target/i386/{ =3D> tcg}/svm_helper.c         |   1 +=0D
 target/i386/tcg/tcg-cpu.c                  |  71 +++=0D
 target/i386/{ =3D> tcg}/tcg-stub.c           |   0=0D
 target/i386/{ =3D> tcg}/translate.c          |   1 +=0D
 target/i386/trace-events                   |   6 -=0D
 target/i386/whpx/meson.build               |   5 +=0D
 target/i386/{ =3D> whpx}/whpx-all.c          |   0=0D
 target/i386/{ =3D> whpx}/whpx-apic.c         |   0=0D
 target/i386/{ =3D> whpx}/whpx-cpus.c         |   0=0D
 63 files changed, 956 insertions(+), 766 deletions(-)=0D
 rename target/i386/{ =3D> hax}/hax-cpus.h (100%)=0D
 rename target/i386/{ =3D> hax}/hax-i386.h (95%)=0D
 rename target/i386/{ =3D> hax}/hax-interface.h (100%)=0D
 rename target/i386/{ =3D> hax}/hax-posix.h (100%)=0D
 rename target/i386/{ =3D> hax}/hax-windows.h (100%)=0D
 rename target/i386/{ =3D> kvm}/hyperv-proto.h (100%)=0D
 rename target/i386/{ =3D> kvm}/hyperv.h (100%)=0D
 rename target/i386/{ =3D> kvm}/kvm_i386.h (100%)=0D
 create mode 100644 target/i386/kvm/trace.h=0D
 rename target/i386/{ =3D> tcg}/cc_helper_template.h (100%)=0D
 create mode 100644 target/i386/tcg/helper-tcg.h=0D
 create mode 100644 target/i386/tcg/tcg-cpu.h=0D
 rename target/i386/{ =3D> whpx}/whp-dispatch.h (100%)=0D
 rename target/i386/{ =3D> whpx}/whpx-cpus.h (100%)=0D
 create mode 100644 target/i386/cpu-dump.c=0D
 rename target/i386/{ =3D> hax}/hax-all.c (100%)=0D
 rename target/i386/{ =3D> hax}/hax-cpus.c (100%)=0D
 rename target/i386/{ =3D> hax}/hax-mem.c (100%)=0D
 rename target/i386/{ =3D> hax}/hax-posix.c (100%)=0D
 rename target/i386/{ =3D> hax}/hax-windows.c (100%)=0D
 create mode 100644 target/i386/hax/meson.build=0D
 rename target/i386/{ =3D> kvm}/hyperv-stub.c (100%)=0D
 rename target/i386/{ =3D> kvm}/hyperv.c (100%)=0D
 rename target/i386/{ =3D> kvm}/kvm-stub.c (100%)=0D
 rename target/i386/{ =3D> kvm}/kvm.c (98%)=0D
 create mode 100644 target/i386/kvm/meson.build=0D
 create mode 100644 target/i386/kvm/trace-events=0D
 rename target/i386/{ =3D> tcg}/bpt_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/cc_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/excp_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/fpu_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/int_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/mem_helper.c (99%)=0D
 create mode 100644 target/i386/tcg/meson.build=0D
 rename target/i386/{ =3D> tcg}/misc_helper.c (97%)=0D
 rename target/i386/{ =3D> tcg}/mpx_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/seg_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/smm_helper.c (99%)=0D
 rename target/i386/{ =3D> tcg}/svm_helper.c (99%)=0D
 create mode 100644 target/i386/tcg/tcg-cpu.c=0D
 rename target/i386/{ =3D> tcg}/tcg-stub.c (100%)=0D
 rename target/i386/{ =3D> tcg}/translate.c (99%)=0D
 create mode 100644 target/i386/whpx/meson.build=0D
 rename target/i386/{ =3D> whpx}/whpx-all.c (100%)=0D
 rename target/i386/{ =3D> whpx}/whpx-apic.c (100%)=0D
 rename target/i386/{ =3D> whpx}/whpx-cpus.c (100%)=0D
=0D
--=20=0D
2.28.0=0D
=0D


