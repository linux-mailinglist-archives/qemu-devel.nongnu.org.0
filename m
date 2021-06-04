Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F339BBA0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:19:37 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBbk-000231-3S
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa3-0007lT-QU
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:51 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa1-0008Cq-U6
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:51 -0400
Received: by mail-ed1-x533.google.com with SMTP id g18so9577193edq.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30H6EZ5kQGfDrBEivXYyfToH/2evvFXzUpDHKqwzBIc=;
 b=pFJZsmJK39IxG5BCCBbrV9Tl0HkJNDIIEWBLyTdjID5cK6XM9WWgS/SCIuBr2UOLxY
 z0StAj0Tc9e0QoUSOGQpuW/xMlzYX1VnJySy3xkfNKJdUljD5kztWnU9NbURDIlCkh2A
 ES99etBjSoykoHtucKf/X/BK2zTEG66aHtrn26O/uuhRCc5QN/2MoQegaJVlhuy5U9Ln
 DtBmAs29rpdlU+ZwhiiqupFbAX9+wwNFhXkriSeqvJ4vkFLvAYINcHnSkfqX6e5n9Kzy
 R5IaqHwJUiD+UcEX9XvPvLlFxY2gy3SsBGFpNBTBZxy6+UnziorPXwD0i9Dfcl+NCotd
 0E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=30H6EZ5kQGfDrBEivXYyfToH/2evvFXzUpDHKqwzBIc=;
 b=myNorhprsKT44tCycW+9G/Zs+IjGSCHUtN6TLnsv8jvW6HdLwcdEvb7yYgTz6hwMGt
 rYlFnjDjlVJbp9DbmVLERSGM8x0qjZ4DPbTNuUvgQvZHlM9Kwiury+akjtf0aDVuYnvI
 24yOJbgZEgT25/pkCTu5ienrLzwsX4VMD431vdA+aQCzGMs1qCtqZfT2zZ8hvCwlaVeJ
 /oGjA1ppk9/BNd/SQdfPfAzPjkUQY/OPhv63ekCXiYwwhLSIdeKIz8/QJszMLWGymRNE
 XMTKUKOwa2hCscpV22pxq06oMkm0IZyaG1PY+UfWBOW3wTFJOybQdp8VN4w0HF9yHHbW
 KvIQ==
X-Gm-Message-State: AOAM530NcO3azPybVjrdi24y7kHzc5ISg/PhVDLp5bH2mWzVHe2LBQO7
 so7mhL+2YxC9hXSBbbEzyw8VTwKKrwpxLA==
X-Google-Smtp-Source: ABdhPJxVK20az+TmbcUsGEvM9WVI27Jv3PLztTdVOsNCdACIphl6VZNQHz8p+sD855nE9gvmQLx3yA==
X-Received: by 2002:a05:6402:368:: with SMTP id
 s8mr5284921edw.129.1622819867235; 
 Fri, 04 Jun 2021 08:17:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.46 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Misc bugfix patches for 2021-06-04
Date: Fri,  4 Jun 2021 17:17:32 +0200
Message-Id: <20210604151745.310318-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 5a95f5ce3cd5842cc8f61a91ecd4fb4e8d10104f:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-fpu-20210603' into staging (2021-06-04 10:04:11 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 49e987695a1873a769a823604f9065aa88e00c55:

  vl: plug -object back into -readconfig (2021-06-04 13:50:04 +0200)

----------------------------------------------------------------
* OpenBSD cleanup (Brad)
* fixes for the i386 accel/cpu refactoring (Claudio)
* unmap test for emulated SCSI (Kit)
* fix for iscsi module (myself)
* fix for -readconfig of objects (myself)
* fixes for x86 16-bit task switching (myself)
* fix for x86 MOV from/to CR8 (Richard)

----------------------------------------------------------------
Brad Smith (1):
      oslib-posix: Remove OpenBSD workaround for fcntl("/dev/null", F_SETFL, O_NONBLOCK) failure

Claudio Fontana (2):
      i386: reorder call to cpu_exec_realizefn
      i386: run accel_cpu_instance_init as post_init

Kit Westneat (1):
      tests/qtest/virtio-scsi-test: add unmap large LBA with 4k blocks test

Paolo Bonzini (8):
      meson: allow optional dependencies for block modules
      iscsi: link libm into the module
      target/i386: tcg: fix segment register offsets for 16-bit TSS
      target/i386: tcg: fix loading of registers from 16-bit TSS
      target/i386: tcg: fix switching from 16-bit to 32-bit tasks or vice versa
      qemu-config: parse configuration files to a QDict
      vl: plumb keyval-based options into -readconfig
      vl: plug -object back into -readconfig

Richard Henderson (1):
      target/i386: Fix decode of cr8

 block/meson.build              |  18 +++----
 include/block/qdict.h          |   2 -
 include/qapi/qmp/qdict.h       |   3 ++
 include/qemu/config-file.h     |   7 ++-
 meson.build                    |   4 +-
 softmmu/vl.c                   | 105 +++++++++++++++++++++++++++++------------
 target/i386/cpu.c              |  89 ++++++++++++++++++++++------------
 target/i386/kvm/kvm-cpu.c      |  12 ++++-
 target/i386/tcg/seg_helper.c   |  31 ++++++------
 target/i386/tcg/translate.c    |   1 +
 tests/qtest/virtio-scsi-test.c |  51 ++++++++++++++++++++
 util/oslib-posix.c             |  11 -----
 util/qemu-config.c             |  98 ++++++++++++++++++++++++++------------
 13 files changed, 298 insertions(+), 134 deletions(-)
-- 
2.31.1


