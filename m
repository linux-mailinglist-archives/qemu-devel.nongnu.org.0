Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44793C7468
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:23:50 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LCH-0003oP-MQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7s-0003e1-U6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7r-0006si-8K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IKVqomoT0+BX/LOE4TAY66OOA7ax5nwI7YQz3iP8naI=;
 b=ZjhUxBxJE2LIECtA/0fhHy3CkqZ/VpDkw+FNZZNQsBgh10fDHhgOQOszKAsAxRGPmRFzVM
 fPOC3kdXfhR9cCVTWvuVX7qE/H09vos2DN+oXg/2m6zI9xjXRTaubU8ZuvWG3sEVIyn1Oh
 lPAlCnu3+1ScRaLJnbPJOHAbdy+jjn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-F77P_d2pPHCDuI2aVeBIcg-1; Tue, 13 Jul 2021 12:19:11 -0400
X-MC-Unique: F77P_d2pPHCDuI2aVeBIcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82F680006E;
 Tue, 13 Jul 2021 16:19:09 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6518B60C05;
 Tue, 13 Jul 2021 16:19:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/11] x86 queue, 2021-07-13
Date: Tue, 13 Jul 2021 12:09:46 -0400
Message-Id: <20210713160957.3269017-1-ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for submitting this so late.  I had to deal with build=0D
issues caused by other patches (now removed from the queue).=0D
=0D
The following changes since commit eca73713358f7abb18f15c026ff4267b51746992=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210712' into st=
aging (2021-07-12 21:22:27 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to 294aa0437b7f6a3e94653ef661310ef621859c87:=0D
=0D
  numa: Parse initiator=3D attribute before cpus=3D attribute (2021-07-13 0=
9:21:01 -0400)=0D
=0D
----------------------------------------------------------------=0D
x86 queue, 2021-07-13=0D
=0D
Bug fixes:=0D
* numa: Parse initiator=3D attribute before cpus=3D attribute=0D
  (Michal Privoznik)=0D
* Fix CPUID level for AMD (Zhenwei Pi)=0D
* Suppress CPUID leaves not defined by the CPU vendor=0D
  (Michael Roth)=0D
=0D
Cleanup:=0D
* Hyper-V feature handling cleanup (Vitaly Kuznetsov)=0D
=0D
----------------------------------------------------------------=0D
=0D
Michael Roth (1):=0D
  target/i386: suppress CPUID leaves not defined by the CPU vendor=0D
=0D
Michal Privoznik (2):=0D
  numa: Report expected initiator=0D
  numa: Parse initiator=3D attribute before cpus=3D attribute=0D
=0D
Vitaly Kuznetsov (7):=0D
  i386: clarify 'hv-passthrough' behavior=0D
  i386: hardcode supported eVMCS version to '1'=0D
  i386: make hyperv_expand_features() return bool=0D
  i386: expand Hyper-V features during CPU feature expansion time=0D
  i386: kill off hv_cpuid_check_and_set()=0D
  i386: HV_HYPERCALL_AVAILABLE privilege bit is always needed=0D
  i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS privileges=0D
=0D
Zhenwei Pi (1):=0D
  target/i386: Fix cpuid level for AMD=0D
=0D
 hw/core/machine.c              |   3 +-=0D
 hw/core/numa.c                 |  45 ++++----=0D
 target/i386/cpu.h              |   3 +=0D
 target/i386/kvm/hyperv-proto.h |   6 ++=0D
 target/i386/kvm/kvm_i386.h     |   1 +=0D
 docs/hyperv.txt                |   9 +-=0D
 hw/i386/pc.c                   |   1 +=0D
 target/i386/cpu.c              |  21 +++-=0D
 target/i386/kvm/kvm-stub.c     |   5 +=0D
 target/i386/kvm/kvm.c          | 189 ++++++++++++++++++---------------=0D
 10 files changed, 172 insertions(+), 111 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


