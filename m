Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE853D172A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:37:53 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6I2S-0006f7-72
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz2-0000fU-Ed
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hyz-00050S-Bb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ld/X+GWOFoCCo8M76lX3XVb/nCJ7Rg1zcmDRcQ9Ug/Y=;
 b=eqUCdI24lcytoqdPmMo3FGU1fh2x5hsBEzpI2y+FEpTgvleRbl+EJLAhz5L+teoqo21E0R
 5dCjQxh0BIrbGZ9FoiasQ9fhM/qGJvkD5EbCGWGAtRl1S0HhXctB6uDEvzPIFH0Aq28er9
 YMqGBKm0E1Xa0+dNzVTkp+3P5CuPlUg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-IK2f8tbSPXuYhDtYG1oZBg-1; Wed, 21 Jul 2021 15:34:14 -0400
X-MC-Unique: IK2f8tbSPXuYhDtYG1oZBg-1
Received: by mail-qv1-f69.google.com with SMTP id
 p6-20020a05621415c6b02902f61b4b012eso2255428qvz.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdM3kDMt+GgHynIzQo/disXO9OfKQ+SY7OsEEV/gXuM=;
 b=rSu8RE98CxbgsjLRLbQbG+D6VHTErwh/hwSlFYQtFusmG0e6yTziQzTpmsgRpGUacT
 V/yq9WFoYFlAI8laY+FcB7s+/IYSguSqWVIS3V4eKGnTY1LILgEH91qwgcD/asm+NJMa
 nXn9+ILfzKsrYOWtuliqBPfvX3LOVBkJrfO31dyzX2VOmm0AbpX4qOgwsd6yvjAokzjN
 QNYKkaBGFMvrHqHoiVQYaNm+g3uVMUg+zgiqcKG2+rpCi20njQLYz231EutJ/PXEAuzf
 Ir034egHVot/1shwb37xbGvdTn3y2XjtptTXmGQMmsgaJM29d+u2zVBGFr7KTqdgB8Ax
 EExg==
X-Gm-Message-State: AOAM530w9+sAQyzlTf5zildBwSvlZeDy+hx/1gEXzNWKDP7Fy3aj4uu1
 1FqeyOLZ/G4803VBUZ1tWbNV0k2+xb0OIn+GJOokHHyCiABpijuprJoPcHDnljU5mW3T6yl9vIh
 NOTmKLjz81ZMnU03SU6uOFs18MMgnq6HhDAq+BIq95ukQgimHBwx9S6s3lx6/Jwbk
X-Received: by 2002:ac8:764e:: with SMTP id i14mr33092067qtr.247.1626896053462; 
 Wed, 21 Jul 2021 12:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6wUuYDCy+9m1HHLy5qxpZtmLeUG9XZgKP9AHz7gXYxF+15bhiR18IFO56PBlOyAH1lKxr4g==
X-Received: by 2002:ac8:764e:: with SMTP id i14mr33092043qtr.247.1626896053104; 
 Wed, 21 Jul 2021 12:34:13 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 8sm10755867qkb.105.2021.07.21.12.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:34:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] migrations: Fix potential rare race of migration-test
 after yank
Date: Wed, 21 Jul 2021 15:34:04 -0400
Message-Id: <20210721193409.910462-1-peterx@redhat.com>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 migration/channel.c           | 15 ++-----------=0D
 migration/migration.c         | 41 +++++++++++++++++++++++++++-------=0D
 migration/migration.h         | 15 ++++++++++---=0D
 migration/multifd.c           |  8 ++-----=0D
 migration/qemu-file-channel.c | 11 ++-------=0D
 migration/qemu-file.c         | 17 +++++++++++++-=0D
 migration/qemu-file.h         |  4 +++-=0D
 migration/ram.c               |  3 ++-=0D
 migration/savevm.c            | 11 +++++++--=0D
 migration/yank_functions.c    | 42 +++++++++++++++++++++++++++++++++++=0D
 migration/yank_functions.h    |  3 +++=0D
 11 files changed, 126 insertions(+), 44 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


