Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C633D955A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:36:29 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oPs-0005yL-BN
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLg-0005s3-EN
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLc-00071g-5v
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GOsnR71xU/ipduH9SwW57bhghl3rOr7bsqqOyAE+J/Q=;
 b=h85NfR2gxuLkLj+co/P7p5d5OC94SR9C4UKr6guSz86Pxvo9k88ooQLu9D4RNhSYV0M8S7
 WtfVjLBCKeAcujmr+ShmAbTO5ZhIgjeJjYeTEItkyvEL+bQS1IPeu92SD326ig5rtpMMEJ
 iZEWAZyKul5e/y+r8HZKhMfZhG740T4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-6wXHjiGoNxa7fYbhJad6Qg-1; Wed, 28 Jul 2021 14:31:56 -0400
X-MC-Unique: 6wXHjiGoNxa7fYbhJad6Qg-1
Received: by mail-qt1-f200.google.com with SMTP id
 z16-20020ac87cb00000b029025bf786be09so1459797qtv.20
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKOXgAVmSMM3lfFp0ibOImNLxrhF4Iv1AO1Mtuh9XpY=;
 b=gjnVjTJgSekiWMQ9qdciRYx5NsP/P/F7s4gAyT2NR5Mm1D4/Rwud2NoM980C0pEFx1
 YN4ljs783JFvF1gpYm/yrvfsf8eGzHr1Y7vumJqRzCYBU9Ku2jhznsDNzbzghbsNRWBY
 UQKPMXanubPPXMTw4wcsYQ14/t0T6X0p0iJ3Fbw+JlPNRiVluRhSgyHf6eKsHE/am2U/
 l6KCuyx6tn+1F7IPZW7+ixW3xM2hYs584dlPs/Eq9H1eOKPfTPB+3YGLtN+nt1trddyQ
 TrLw7VLxLl+dbCpgZ0Mk6v772R7szHM2YOxetZxVXbNL0KDJmd/YNZ1E5KNOpM8yXr44
 DazA==
X-Gm-Message-State: AOAM533ql+RhkyxYpG4wIFomuqANeHGtzjZXnIrJn2fjOfSmuCxkMhoH
 aoBiRw0UOTyOw0D0dqVHnqicjY+Yjn8cFZEAqWic6qb/bTSsFcIANJpV7ufWLKSkyypcsj/Uuwo
 7bE/A4T0rNV80tqf3riLGb47RyVtw7T5yce6w0Dr7BXZqTaQjUNev2sI/OqVpnnDa
X-Received: by 2002:ac8:c0d:: with SMTP id k13mr839683qti.11.1627497115894;
 Wed, 28 Jul 2021 11:31:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJwyjSL/t5n1ZW+C+nAIksNCScE98y/hVB73sDRzq8K/SrNtNPOxCYDOJjVZy773jYeHy6kA==
X-Received: by 2002:ac8:c0d:: with SMTP id k13mr839654qti.11.1627497115574;
 Wed, 28 Jul 2021 11:31:55 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:31:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] memory: Sanity checks memory transaction when
 releasing BQL
Date: Wed, 28 Jul 2021 14:31:43 -0400
Message-Id: <20210728183151.195139-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v3 of the series. And, I think this is 6.2 material.=0D
=0D
v2 changelog:=0D
- Init qemu_work_item directly in do_run_on_cpu() [David]=0D
- Rename memory_region_transaction_{push|pop} to *_depth_{inc|dec} [David]=
=0D
- Changing wording of s/helpless/useless/ [David]=0D
- Squashed v2 patch 7 into patch 8 [David]=0D
- Collected r-bs=0D
=0D
It was actually got forgotten for months until it was used to identify anot=
her=0D
potential issue of bql usage here (besides it could still be helpful when=
=0D
debugging a previous kvm dirty ring issue in that series):=0D
=0D
https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@C=
H0PR02MB7898.namprd02.prod.outlook.com/=0D
=0D
So I figured maybe it's still worth to have it, hence a repost.=0D
=0D
There're some changes against v1:=0D
=0D
  - patch "cpus: Introduce qemu_cond_timedwait_iothread()" is dropped becau=
se=0D
    it's introduced in another commit already (b0c3cf9407e64).=0D
=0D
  - two more patches to move do_run_on_cpu() into softmmu/ to fix a linux-u=
ser=0D
    compliation issue.=0D
=0D
Please review, thanks.=0D
=0D
=3D=3D=3D Original Cover letter =3D=3D=3D=0D
=0D
This is a continuous work of previous discussion on memory transactions [1]=
.=0D
It should be helpful to fail QEMU far earlier if there's misuse of BQL agai=
nst=0D
the QEMU memory model.=0D
=0D
One example is run_on_cpu() during memory commit.  That'll work previously,=
 but=0D
it'll fail with very strange errors (like KVM ioctl failure due to memslot=
=0D
already existed, and it's not guaranteed to trigger constantly).  Now it'll=
=0D
directly fail when run_on_cpu() is called.=0D
=0D
Please have a look, thanks.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03205.html=0D
=0D
Peter Xu (8):=0D
  cpus: Export queue work related fields to cpu.h=0D
  cpus: Move do_run_on_cpu into softmmu/cpus.c=0D
  memory: Introduce memory_region_transaction_depth_{inc|dec}()=0D
  memory: Don't do topology update in memory finalize()=0D
  cpus: Use qemu_cond_wait_iothread() where proper=0D
  cpus: Remove the mutex parameter from do_run_on_cpu()=0D
  memory: Assert on no ongoing memory transaction before release BQL=0D
  memory: Delay the transaction pop() until commit completed=0D
=0D
 cpus-common.c                  | 36 ++---------------------=0D
 include/exec/memory-internal.h |  1 +=0D
 include/hw/core/cpu.h          | 22 ++++++--------=0D
 softmmu/cpus.c                 | 39 ++++++++++++++++++++++---=0D
 softmmu/memory.c               | 53 ++++++++++++++++++++++++++++++----=0D
 5 files changed, 94 insertions(+), 57 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


