Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684096EFCF
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jul 2019 17:19:26 +0200 (CEST)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hor8u-0006oU-Ol
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 11:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hor8O-0005mv-EC
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hor8N-000848-Fe
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:18:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hor8N-00083F-93
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:18:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id v15so31296195wml.0
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WW02gQBRxKT7Sw/HkVE689NY0nvHbjG/H4EWAQJR7Gw=;
 b=WFtay8JvKaBEr168GvFSC9x9JqZaysrhgFwangjOL75TYrXdD22p1WlaGV9jkCel9P
 wOm6TrVltO8Xd365egoOtft3tpP+JeihEzDjR5mYjpSnxfw8vi1hYbEl8bEHCwTrN3oo
 Ly1xGjtD23l73ouERVtT4mSuqtAt35ySn2wGEaygS2XZJSgRr5cEdstboZLZ+KPbXkd/
 KFwFEe7PlRiQv9UkvvVlQkj095p0YyiIukrJgAMs7iAWv7fnJpNnf/86ZQXPZqIUqZ64
 Ovg864yBK2jONxQlg4GrF56kpWvSkx0/IDsuTi5nokkyzhkNil54XJGLDvr/Uyd8L6XW
 SPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WW02gQBRxKT7Sw/HkVE689NY0nvHbjG/H4EWAQJR7Gw=;
 b=KvHkiuqrLL61XPIDxmnG1H9yvsgpYO9wqUtIIzMF98PRUUKEA0dM6l/tYyrKwroI0B
 JuRI2l4ii+hSWzEjDVec9wByNxW/vQqzzRHE+3X25fpbeTPZtWl9j0nFQb803lv5Ejlq
 7a/UZQeRhayuHmeaTnmKJ6ZMMQpc9ut45F4GhebaeT2P3pBw1PzyiqX55AV8jFCZp91y
 5yt9HqMzv5Cb6qvb7v4kdzPR2wwHT9OrNwz54ETb5dEF1isuBWQ/z8GQS9hQ+cCL5sq/
 4bGJR5NUZqu5oi3cixbT7SNZxzkyH2P2/9gan4wG0euDkjdgeBjdWNcxQiIsMKp+Q2VN
 ku1g==
X-Gm-Message-State: APjAAAWMOUEYO18eUjwL2wgLrvWdc9Ow11Cz7Cw3FLRr24Bvtxr8NkE9
 sTsgBLu3ErOrRAsh2WCjwK1PbAyRvhE=
X-Google-Smtp-Source: APXvYqzRt0zQohoEvfaCRjPgMJgj+hyBOIcTR9MvBpABdXKRDjWlQY2TWKVafIOTodn2ydQcbM1tQA==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr52362004wmj.94.1563635928903; 
 Sat, 20 Jul 2019 08:18:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:8501:6b03:f18c:74f8])
 by smtp.gmail.com with ESMTPSA id 4sm77517291wro.78.2019.07.20.08.18.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 08:18:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 20 Jul 2019 17:18:34 +0200
Message-Id: <20190720151846.7450-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32c
Subject: [Qemu-devel] [PULL 00/12] Misc patches for QEMU 4.0-rc2
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

The following changes since commit e2b47666fe1544959c89bd3ed159e9e37cc9fc73:

  Merge remote-tracking branch 'remotes/berrange/tags/misc-next-pull-request' into staging (2019-07-19 14:29:13 +0100)

are available in the git repository at:


  git://github.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to d4b976c0a81dc625ccd05e2b3075f353170669d4:

  target/i386: sev: fix failed message typos (2019-07-19 23:45:28 +0200)

----------------------------------------------------------------
Mostly bugfixes, plus a patch to mark accelerator MemoryRegions in "info
mtree" that has been lingering for too long.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      hmp: Print if memory section is registered with an accelerator

Denis V. Lunev (1):
      i386: indicate that 'pconfig' feature was removed intentionally

Jiri Slaby (1):
      target/i386: sev: fix failed message typos

Liran Alon (1):
      target/i386: kvm: Demand nested migration kernel capabilities only when vCPU may have enabled VMX

Marc-André Lureau (1):
      build-sys: do no support modules on Windows

Nicholas Piggin (1):
      qmp: don't emit the RESET event on wakeup

Paolo Bonzini (2):
      target/i386: skip KVM_GET/SET_NESTED_STATE if VMX disabled, or for SVM
      virtio-scsi: remove unused argument to virtio_scsi_common_realize

Shin'ichiro Kawasaki (1):
      scsi-generic: Check sense key before request snooping and patching

Wei Yang (1):
      test-bitmap: add test for bitmap_set

Xie Yongji (2):
      vhost-scsi: Call virtio_scsi_common_unrealize() when device realize failed
      vhost-user-scsi: Call virtio_scsi_common_unrealize() when device realize failed

 accel/kvm/kvm-all.c             | 38 ++++++++++++++++++++++++++++
 configure                       |  7 +++++-
 hw/scsi/scsi-generic.c          | 28 ++++++++++++---------
 hw/scsi/vhost-scsi.c            |  6 +++--
 hw/scsi/vhost-user-scsi.c       | 16 ++++++++----
 hw/scsi/virtio-scsi.c           |  4 +--
 include/hw/virtio/virtio-scsi.h |  2 +-
 include/sysemu/accel.h          |  3 +++
 memory.c                        | 22 +++++++++++++++++
 target/i386/cpu.c               |  2 +-
 target/i386/cpu.h               | 22 +++++++++++++++++
 target/i386/kvm.c               | 42 +++++++++++--------------------
 target/i386/kvm_i386.h          |  1 +
 target/i386/machine.c           | 45 ++++++++++++++++-----------------
 target/i386/sev.c               |  4 +--
 tests/test-bitmap.c             | 55 +++++++++++++++++++++++++++++++++++++++++
 vl.c                            |  2 +-
 17 files changed, 220 insertions(+), 79 deletions(-)
-- 
1.8.3.1


