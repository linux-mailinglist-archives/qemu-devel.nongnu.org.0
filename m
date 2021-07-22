Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B233D2BC3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:12:41 +0200 (CEST)
Received: from localhost ([::1]:52408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dBY-0000Zm-Nu
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cy9-0004oV-El
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cy7-00062s-H0
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hx2mXeKQ6E/4z040ajBS/8Ig1IgI6Yno3fM2r+OEuD0=;
 b=iIL1B0zsnTqyqHrYAyKISJPuStH3J+qhuRnJxgeMsjpJV3WTui3BuCXe7YTzHEM4eB28Dl
 pTId47Z3P4gcQRFszSdT+1WUpIwUhW+S33ZaPAM1uFoz8kqcRvnRXQRZLuOhpz7BPzOufy
 vPxK0FjIXQ5BdJXv+KXtP01kDRQJXyQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-vw6_oznyOxCzUDesCPbmIQ-1; Thu, 22 Jul 2021 13:58:46 -0400
X-MC-Unique: vw6_oznyOxCzUDesCPbmIQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 y16-20020a05620a0e10b02903b8f9d28c19so4642897qkm.23
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MO+Q2MKuLn9g+yRDrkzDplKGeHqoejQt2uoXNCI7OcM=;
 b=bR26eahA5sZMWD51EZbb170wyhsFv7d7ILxABp+U4eSFSAa3x+iVX0kdu011kza5Kf
 PGrnOQkcqqGDpxXcGDyKszDTF1kWJ5bKct7ayb6A6xQkc5f9xiNjaW7SVT52l2H6GnRQ
 sQSR6K2s6o/kgJ9XayQd7OxizLAYkBJPMqHrUHB7f7Wkka4XLq8M5jPXJpJDKmJQIik+
 1tHcKyVS3arxx8CtXUGcGCdt4o2EJUQb5SW7Gl1PxZtF7k5ijhwtzLkaIxW4uZN3pgdy
 /525J2k0jPF5fqL1k/u5QuLbxAonanqwXU2UE4o9Zt3236YzYgU/bPRzbQzFYxFbVyXU
 86Rg==
X-Gm-Message-State: AOAM5309kIiDpFOhyT7Jj0SbzhcuNHN6WHtUaLOYl0z3LgoGi1jhcG2I
 b/Lgl2iL/Z0FBdTTuW+vCgkt8dYyzJIEWPiaOhri50HYtuEDpCVTV+7rGa6VkKUK7gk1rkf9dFN
 Ep8HIFoYZt09FflqyoOddYQ7cMgwZ8RRpdOvk1AAUuthfK1mmwGYenMzl0p/Z5Q9l
X-Received: by 2002:a37:a217:: with SMTP id l23mr842082qke.137.1626976725028; 
 Thu, 22 Jul 2021 10:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxZ9jbu+siOpKYDzUd8XltkhlVZ0wpef8xlP1V3hlxeC3FFYxb3ibih0FAveQZdDXEin0Y4w==
X-Received: by 2002:a37:a217:: with SMTP id l23mr842042qke.137.1626976724695; 
 Thu, 22 Jul 2021 10:58:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j20sm10418018qtq.14.2021.07.22.10.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:58:44 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] migrations: Fix potential rare race of migration-test
 after yank
Date: Thu, 22 Jul 2021 13:58:36 -0400
Message-Id: <20210722175841.938739-1-peterx@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:=0D
- Use WITH_QEMU_LOCK_GUARD() for patch 2 [Eric]=0D
  (potentially I can also replace other existing uses of qemu_file_lock int=
o=0D
   WITH_QEMU_LOCK_GUARD, but I decided to took Dave's r-b first and leave t=
hat=0D
   for later)=0D
- Added r-bs for Dave on patch 2/4=0D
- Add a comment in patch 5 to explain why it's safe to unregister yank with=
out=0D
  qemu_file_lock, in postcopy_pause() [Dave]=0D
=0D
v2:=0D
- Pick r-b for Dave on patch 1/3=0D
- Move migration_file_get_ioc() from patch 5 to patch 4, meanwhile rename i=
t to=0D
  qemu_file_get_ioc(). [Dave]=0D
- Patch 2 "migration: Shutdown src in await_return_path_close_on_source()" =
is=0D
  replaced by patch "migration: Make from_dst_file accesses thread-safe" [D=
ave]=0D
=0D
Patch 1 fixes a possible race that migration thread can accidentally skip=
=0D
join() of rp_thread even if the return thread is enabled.  Patch 1 is suspe=
cted=0D
to also be the root cause of the recent hard-to-reproduce migration-test=0D
failure here reported by PMM:=0D
=0D
https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/=0D
=0D
I didn't reproduce it myself; but after co-debugged with Dave it's suspecte=
d=0D
that the race of rp_thread could be the cause.  It's not exposed before bec=
ause=0D
yank is soo strict on releasing instances, while we're not that strict befo=
re,=0D
and didn't join() on rp_thread wasn't so dangerous after all when migration=
=0D
succeeded before.=0D
=0D
Patch 2 fixes another theoretical race on accessing from_dst_file spotted b=
y=0D
Dave.  I don't think there's known issues with it, but may still worth fixi=
ng.=0D
=0D
Patch 3 should be a cleanup on yank that I think would be nice to have.=0D
=0D
Patch 4-5 are further cleanups to remove the ref=3D=3D1 check in channel_cl=
ose(),=0D
finally, as I always thought that's a bit hackish.  So I used explicit=0D
unregister of the yank function at necessary places to replace that ref=3D=
=3D1 one.=0D
=0D
I still think having patch 3-5 altogether would be great, however I think p=
atch=0D
1 should still be the most important to be reviewed.  Also it would be grea=
t to=0D
know whether patch 1 could fix the known yank crash.=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (5):=0D
  migration: Fix missing join() of rp_thread=0D
  migration: Make from_dst_file accesses thread-safe=0D
  migration: Introduce migration_ioc_[un]register_yank()=0D
  migration: Teach QEMUFile to be QIOChannel-aware=0D
  migration: Move the yank unregister of channel_close out=0D
=0D
 migration/channel.c           | 15 ++-------=0D
 migration/migration.c         | 57 +++++++++++++++++++++++++++--------=0D
 migration/migration.h         | 15 +++++++--=0D
 migration/multifd.c           |  8 ++---=0D
 migration/qemu-file-channel.c | 11 ++-----=0D
 migration/qemu-file.c         | 17 ++++++++++-=0D
 migration/qemu-file.h         |  4 ++-=0D
 migration/ram.c               |  3 +-=0D
 migration/savevm.c            | 11 +++++--=0D
 migration/yank_functions.c    | 42 ++++++++++++++++++++++++++=0D
 migration/yank_functions.h    |  3 ++=0D
 11 files changed, 138 insertions(+), 48 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


