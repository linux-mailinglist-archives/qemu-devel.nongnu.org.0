Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FE3979CE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:12:41 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8sa-0004Qc-7x
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qK-0001q0-BQ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qI-0005UL-IW
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/SoKRzVlUqIIseRB+7ApiBMJ/QRCft/+yfc8Ca1y5EU=;
 b=XXgjEn/NZao5q4lwxm9nRzesFI7PmtSho80ylCrdaP5jW+l1uc3kD9LW2RoEbggLR3Ppda
 wPPxtsz9Gwl6ANXzaO3waPrRZapZTjwccsdvffgUvZ0dxxfj10cwD1Phx++ACUq9DBCAIn
 yW2NS7GuOVzkOqs4bbxHO31Sladc9X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-IOkl-cCbM9uKNesdEoOi7w-1; Tue, 01 Jun 2021 14:10:16 -0400
X-MC-Unique: IOkl-cCbM9uKNesdEoOi7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD971009467;
 Tue,  1 Jun 2021 18:10:15 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18773E2D4;
 Tue,  1 Jun 2021 18:10:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/24] x86 queue, 2021-06-01
Date: Tue,  1 Jun 2021 14:09:50 -0400
Message-Id: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-reque=
st' into staging (2021-05-30 20:10:30 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to d47b85502b92fe8015d38904cde54eb4d3364326:=0D
=0D
  sev: add missing firmware error conditions (2021-06-01 09:32:48 -0400)=0D
=0D
----------------------------------------------------------------=0D
x86 queue, 2021-06-01=0D
=0D
Features:=0D
* Add CPU model versions supporting 'xsaves' (Vitaly Kuznetsov)=0D
* Support AVX512 ZMM regs dump (Robert Hoo)=0D
=0D
Bug fixes:=0D
* Use better matching family/model/stepping for generic CPUs=0D
  (Daniel P. Berrang=C3=A9)=0D
=0D
Cleanups:=0D
* Hyper-V feature initialization cleanup (Vitaly Kuznetsov)=0D
* SEV firmware error list touchups (Connor Kuehl)=0D
* Constify CPUCaches and X86CPUDefinition (Philippe Mathieu-Daud=C3=A9)=0D
* Document when features can be added to kvm_default_props=0D
  (Eduardo Habkost)=0D
=0D
----------------------------------------------------------------=0D
=0D
Brijesh Singh (1):=0D
  target/i386/sev: add support to query the attestation report=0D
=0D
Connor Kuehl (2):=0D
  sev: use explicit indices for mapping firmware error codes to strings=0D
  sev: add missing firmware error conditions=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  i386: use better matching family/model/stepping for 'qemu64' CPU=0D
  i386: use better matching family/model/stepping for 'max' CPU=0D
=0D
Eduardo Habkost (1):=0D
  i386: Document when features can be added to kvm_default_props=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/i386/cpu: Constify CPUCaches=0D
  target/i386/cpu: Constify X86CPUDefinition=0D
=0D
Robert Hoo (1):=0D
  i386/cpu_dump: support AVX512 ZMM regs dump=0D
=0D
Vitaly Kuznetsov (15):=0D
  target/i386: Add CPU model versions supporting 'xsaves'=0D
  i386: keep hyperv_vendor string up-to-date=0D
  i386: invert hyperv_spinlock_attempts setting logic with=0D
    hv_passthrough=0D
  i386: always fill Hyper-V CPUID feature leaves from X86CPU data=0D
  i386: stop using env->features[] for filling Hyper-V CPUIDs=0D
  i386: introduce hyperv_feature_supported()=0D
  i386: introduce hv_cpuid_get_host()=0D
  i386: drop FEAT_HYPERV feature leaves=0D
  i386: introduce hv_cpuid_cache=0D
  i386: split hyperv_handle_properties() into=0D
    hyperv_expand_features()/hyperv_fill_cpuids()=0D
  i386: move eVMCS enablement to hyperv_init_vcpu()=0D
  i386: switch hyperv_expand_features() to using error_setg()=0D
  i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size=0D
  i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one=0D
  i386: use global kvm_state in hyperv_enabled() check=0D
=0D
 linux-headers/linux/kvm.h |   8 +=0D
 target/i386/cpu.h         |   6 +-=0D
 target/i386/sev_i386.h    |   2 +=0D
 hw/i386/pc.c              |   6 +-=0D
 qapi/misc-target.json     |  38 +++=0D
 target/i386/cpu-dump.c    |  63 +++--=0D
 target/i386/cpu-sysemu.c  |   2 +-=0D
 target/i386/cpu.c         | 290 +++++++++-------------=0D
 target/i386/kvm/kvm-cpu.c |   5 +=0D
 target/i386/kvm/kvm.c     | 510 +++++++++++++++++++++-----------------=0D
 target/i386/monitor.c     |   6 +=0D
 target/i386/sev-stub.c    |   7 +=0D
 target/i386/sev.c         | 115 +++++++--=0D
 target/i386/trace-events  |   1 +=0D
 14 files changed, 614 insertions(+), 445 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


