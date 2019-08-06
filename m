Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFE82C5E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 09:12:08 +0200 (CEST)
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hutdf-0006rL-7L
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 03:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hutck-0005sa-Q6
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hutcj-0002FY-Vy
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hutcj-0002Eq-Ll
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id z1so86737371wru.13
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E89RPyrTZ7V/lbqpII0Gj6RHA4yZJOS7SOwQUORCcvQ=;
 b=ubBWT2iYrhYpXp1KnkMLhRAh4sRnNH9ekjvGanspQ/XtfGygD8w+G/AH85aqlkHHSh
 l+wjaq5ErRYhLa5Z5mBTXlTHRbNVNJwSBJOT3zOP4RJPzyktf21Klfe2zrueItntHbgn
 C5Xs1SV/WnIl71UpSsCv9JoFBgeovXUeMdjD4dQsfn4ytBUSrIm02YPpnXz6WAcgNKNV
 FGjByMpq1PwRxRta0TbiH2Zh8Pl3scOGBIzQgqzOynmxXmCHTtlSe8lcAQJrS3CDwJmJ
 ZcSnKXL4E1ng42dLAfMy/6m2mwoNcOcsHV/KfundoaS7GBmuZhmaRpXFHZVLYmkxLTJ5
 cevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=E89RPyrTZ7V/lbqpII0Gj6RHA4yZJOS7SOwQUORCcvQ=;
 b=Q8a9QQLMwVXL6bh7hfPtuyqKdnxP6puJgyHWuvsVOZaTwU32ou+ikpouGgg8ChUE7V
 ML38RLquj4pIBxzjAlp3UnbZQrBlIORF+nFOP5KDZyZUwhlvsIaNFY/nMna565QG8EcS
 FK+sjVE0Iu4Yks2n0L48OsxoB1SCRbZ83uh06TIAS7Kj6sMXE+HP4e5IML7+Uk99+o8o
 tyQJHMe1QqdIEsap04Wwe8fV5PHdjuZXWxlxq2/PtrnoxASRVBThvfQagMlT8HaUcMuZ
 1v+8YLoM2bhZAGEXqz1nbxtYHVCN7Uds7WP3yFWMQcWyHe993jyKS8QC1P+3v7dxvb5v
 22og==
X-Gm-Message-State: APjAAAVuSf1rG/dRaAMluy1qe4Yh2JAcfPDvW8zx3hCT7H8sqcgL6IF7
 JFFJLGySFUsUlLOhmB86ZWD+pmxF
X-Google-Smtp-Source: APXvYqxaxxSBAMqrbMOBj9i1Yj49uh2E+PjVd3w+h1Y3hJirHiDL3SMT2UNELmEJq62cSQyV6DQt2Q==
X-Received: by 2002:adf:c613:: with SMTP id n19mr2720383wrg.109.1565075468221; 
 Tue, 06 Aug 2019 00:11:08 -0700 (PDT)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id z6sm74944037wrw.2.2019.08.06.00.11.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 00:11:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 09:11:03 +0200
Message-Id: <1565075466-14943-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 0/3] modules: cleanup and test
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve coverage for modules: add a test that asks QEMU to check that
no symbols are missing from any of the modules.

Markus, is using qtest ok or should it use an x- qmp command instead?

Paolo

Marc-André Lureau (3):
  module: use g_hash_table_add()
  module: return success on module load
  tests: add module loading test

 include/qemu/module.h  |  2 +-
 qtest.c                |  9 +++++++
 tests/Makefile.include |  1 +
 tests/libqtest.c       |  6 +++++
 tests/libqtest.h       |  2 ++
 tests/modules-test.c   | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++
 util/module.c          | 17 ++++++++----
 7 files changed, 102 insertions(+), 6 deletions(-)
 create mode 100644 tests/modules-test.c

-- 
1.8.3.1


