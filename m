Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F02B51F9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:08:41 +0100 (CET)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekno-0003B2-Bi
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekeR-00027c-TG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:59:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekeO-0002HE-Pl
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605556736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mp6AI4yjBA89AM3hbXlLeLe9qoOTDL/u/dSmckc7M1s=;
 b=WoUW5k2SUsJOvAvnannyoux9GKze6G+tucxs4f0x641oEonsHyO/uHKZxVTL5/ECegkJQ3
 RlAnDJJSwKcUsTj92Bg0BZsaInFL/QyPqPatVSKH7WKoKMV2IyMrW8UQJnpIWcPhhXJ5/Q
 kLSfypZBa5wEcqP/s6QfqYyhb5N6HkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-ZdQvrby3Nzu2vYYdbYm-pA-1; Mon, 16 Nov 2020 14:58:27 -0500
X-MC-Unique: ZdQvrby3Nzu2vYYdbYm-pA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C869186DD25
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:58:16 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA7119930
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:58:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc fixes for QEMU 5.2
Date: Mon, 16 Nov 2020 14:58:10 -0500
Message-Id: <20201116195815.48264-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-11-15' into staging (2020-11-16 17:00:36 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 1370d61ae3c9934861d2349349447605202f04e9:

  memory: Skip dirty tracking for un-migratable memory regions (2020-11-16 13:22:25 -0500)

----------------------------------------------------------------
Bug fixes

----------------------------------------------------------------
David Hildenbrand (1):
      util/vfio-helpers.c: Use ram_block_discard_disable() in qemu_vfio_open_pci()

Paolo Bonzini (2):
      scsi-disk: convert more errno values back to SCSI statuses
      target/i386: avoid theoretical leak on MCE injection

Tom Lendacky (1):
      kvm/i386: Set proper nested state format for SVM

Zenghui Yu (1):
      memory: Skip dirty tracking for un-migratable memory regions

 hw/scsi/scsi-disk.c  | 19 +++++++++++++++++++
 softmmu/memory.c     |  5 ++++-
 stubs/ram-block.c    |  6 ++++++
 target/i386/helper.c | 10 ++++------
 target/i386/kvm.c    | 10 ++++++----
 util/vfio-helpers.c  | 14 ++++++++++++++
 6 files changed, 53 insertions(+), 11 deletions(-)
-- 
2.26.2


