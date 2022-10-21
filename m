Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365A1607804
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:14:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrqr-0002NO-Ri
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:14:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrjL-0005Mm-Eu
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olris-00050f-2I
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olriq-00081A-1p
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UDuTYvdrpmDEJfojIy3nKV86Z6DbvaTStvI34d5OMJs=;
 b=glgYu72Ib4vb5uVZJznUc0PsrTFHrDdkY8btkTqbr1NRMmcSuf4Q7xkoOwAB9bN7OL9kwD
 q4FsDL+scW2l+P23gD3tQmVP99t6mvDZ5TyGZjXmNsjVXxGUDbPv20W0upK3B7Ne1BBJYj
 WOOFLFGCK2NQbnFwPcLins0hu9KWTMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-ta21XV1DMW-F5w6ynKFMSQ-1; Fri, 21 Oct 2022 09:05:54 -0400
X-MC-Unique: ta21XV1DMW-F5w6ynKFMSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2DF6886068;
 Fri, 21 Oct 2022 13:05:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E062166B2D;
 Fri, 21 Oct 2022 13:05:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 00/11] Dump patches
Date: Fri, 21 Oct 2022 17:05:38 +0400
Message-Id: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/dump-pull-request

for you to fetch changes up to c70f4916a9fc03d70a7d65f4ec59da6c07f1d560:

  dump/win_dump: limit number of processed PRCBs (2022-10-21 16:48:50 +0400)

----------------------------------------------------------------
dump queue

Hi

The "dump" queue, with:
- [PATCH v6/v7 00/10] dump: Add arch section and s390x PV dump
- [PATCH] dump/win_dump: limit number of processed PRCBs

----------------------------------------------------------------

Janosch Frank (10):
  dump: Use a buffer for ELF section data and headers
  dump: Write ELF section headers right after ELF header
  dump: Reorder struct DumpState
  dump: Reintroduce memory_offset and section_offset
  dump: Add architecture section and section string table support
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  include/elf.h: add s390x note types
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

Viktor Prutyanov (1):
  dump/win_dump: limit number of processed PRCBs

 include/elf.h                |   2 +
 include/hw/s390x/pv.h        |  19 +++
 include/sysemu/dump-arch.h   |   3 +
 include/sysemu/dump.h        |  26 +++-
 target/s390x/kvm/kvm_s390x.h |   1 +
 dump/dump.c                  | 288 +++++++++++++++++++++++++++--------
 dump/win_dump.c              |   7 +
 hw/s390x/pv.c                | 112 ++++++++++++++
 hw/s390x/s390-virtio-ccw.c   |   6 +
 target/s390x/arch_dump.c     | 262 +++++++++++++++++++++++++++----
 target/s390x/kvm/kvm.c       |   7 +
 11 files changed, 635 insertions(+), 98 deletions(-)

-- 
2.37.3


