Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067A3A882C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:59:00 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDKz-0006IZ-KM
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHk-0001xY-AE
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHe-0004F8-5F
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623779729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S4AEE5qOVbSCUlvNUCYkh7HwGQmu70V0gAgDaxqW4NI=;
 b=HKMERQeY6uVd1A0mMeNeN3cPq47d5jxivw+/dkWd2wje+OxnYEi/NaCh7JhS7lz5OKRUli
 HAJXJ5vfRWrc2cfEE9cIKigpfz1wLJqXplN86oFtDfGq2BwBKUqS05qT6vbNNuM7cGdjhJ
 RCFcKA8CIfmXApog57bre1eI7imSCK8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-ufuL2hNhNGm7GsvA3Yasgw-1; Tue, 15 Jun 2021 13:55:26 -0400
X-MC-Unique: ufuL2hNhNGm7GsvA3Yasgw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d12-20020ac8668c0000b0290246e35b30f8so9834998qtp.21
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9F8B9pi2FHIS0B3jaBUG9w8AZV5SIpn+1v6oQQ2hZF4=;
 b=Gp79ulH7UxdRcJ2wJcJWre59cPIHiHURsGRCn8FCmc9pjrrYZ9Omxi29YQv4bYxi/G
 A0L7YIhS+RAec+ZqpOZNG8k1HmtSkuDP8S+QnJ7eR+0ANIIR9MnHW7cqtTdcw27yXJje
 NeQ7sxZ0suF4BMTkUnFZSIwijOVBlIdygRoE9vL6o/X2SqAiOoRptRcK6k+7AWaDtdu9
 udl6nvlDzB/t3YVXOwL3eaadJJAEwLGm0dJvEuo3OPismNEFTyxtuTPT3xJhwRmdvho4
 MGBchieAHQL2TTaph0AW8X+cwY0HTEO72TTvrlGi9eudAEdD1XL8LsuO9xi1Iz9Zinwm
 z3Fw==
X-Gm-Message-State: AOAM531vuON9+Qh6Q2kNzmamldbFQooyY1sJvY2/vsxbPBQtBV0P1urn
 AkbKA/w8tXqT1GGWB1sqSSBwpMZJCGdEZJ0z0/VXy+VfP6FiyUvmHMZOz2R5hGNVmCNLgBZRFjH
 RNb1A/UsfROKISYlhUAWVdcJxfZHAGYaMbsEcAVFsf5X16jGLk0EnW0M5Yxo5dJ31
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr819431qta.149.1623779725147; 
 Tue, 15 Jun 2021 10:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLJ1KQffWz+qgVxnw+8ocer5FSP0Q89z/uETDMZcHNZRGIJLPJcZaTNOU/Jj95JM6eemhZ5g==
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr819401qta.149.1623779724857; 
 Tue, 15 Jun 2021 10:55:24 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d81sm12908578qke.32.2021.06.15.10.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:55:24 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] tests: migration-test: Fix agressive test skip,
 add dirty ring test
Date: Tue, 15 Jun 2021 13:55:21 -0400
Message-Id: <20210615175523.439830-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210609014355.217110-1-peterx@redhat.com>=0D
=0D
v2:=0D
- patch 2: detect dirty ring only for __linux__ [Dave]=0D
- Add r-b for Dave on both patches=0D
=0D
Patch 1 is a fix for migration test not really running on new kernels.  The=
=0D
problem is uffd check now will constantly fail after upstream commit=0D
37cd0575b8510159 - that means any host kernel newer than 5.11.=0D
=0D
Patch 1 makes it slightly better by only skipping the two postcopy tests th=
at=0D
needs uffd on these kernels.  When we want to run the full test, we can do:=
=0D
=0D
  $ sudo QTEST_QEMU_BINARY=3D./qemu-system-x86_64 ./tests/qtest/migration-t=
est=0D
=0D
Then the uffd check will pass, and postcopy tests will be run.=0D
=0D
Patch 2 of this series adds the dirty ring test that just got merged into q=
emu.=0D
It needs the other patch "[PATCH] KVM: Fix dirty ring mmap incorrect size d=
ue=0D
to renaming accident", and that's majorly why we need the "Based-on" tag.=
=0D
=0D
Not sure what's the easiest way for the series as it'll depend on the other=
 kvm=0D
patch.  Perhaps if I can try to get ack from Dave so Paolo could queue it t=
oo=0D
along with the kvm fix (for either the whole series or patch 2 only)?  I'll=
=0D
leave that to maintainers to decide..=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (2):=0D
  tests: migration-test: Still run the rest even if uffd missing=0D
  tests: migration-test: Add dirty ring test=0D
=0D
 tests/qtest/migration-test.c | 69 +++++++++++++++++++++++++++++++-----=0D
 1 file changed, 60 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


