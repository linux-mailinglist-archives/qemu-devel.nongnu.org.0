Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54E414E54
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:46:40 +0200 (CEST)
Received: from localhost ([::1]:48648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5OJ-0001As-8d
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4z5-0007sB-SF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yp-0000fS-K1
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632327618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=syblMItG5jazewKKjg6dap80Kv4FRsXhbQxwP6Jqjy0=;
 b=gecbnSyjaF4u0WSIujzzdU0D0l7IFDeppalB3W+byF9kFs1fvDwcYsjjcJ+SOodMdt5+G6
 xzyVxdmVHCrkYhFupCN/a6Hujre/XM0aweWANOIUPdgVBwmTD3iHfOOszHrT/lqQuaR9eX
 YsXLV5TqpLmruvsS3kmFGukpMBIfqGo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-hb7PgO78MFK51i9RpPZM3Q-1; Wed, 22 Sep 2021 12:20:13 -0400
X-MC-Unique: hb7PgO78MFK51i9RpPZM3Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 7-20020ac85907000000b002a5391eff67so10207310qty.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=syblMItG5jazewKKjg6dap80Kv4FRsXhbQxwP6Jqjy0=;
 b=S6x88Jq/dARIEzMUGL2Fih4HKDvYBxS7OIcfyqH/72rS1Xp3C6iuTICPeeIiEG5ckN
 0g3itnv7b0KTkHYbP64LujEBrrX9JLNw0ayL+Ae1yQnIM/QV2amjRWiFC9wviOUGZAlv
 GEfwlrOeP0aZRB0YYQXLI+MJjkHq3d2H6Aw1zeF+coyracY3tXS8euG2SUTQwDANwvde
 jYR1qRf9+b45lZGMZELfsgeKl6kOCIeWW2XK6KNeYGVaaKy68BvI/jCwMVrzdG86Oxwi
 NW9D7cGzSqiFrOwuBEBQOoH7oSHCTysEc1K0dt5XSd6H+AIOcr7NXztOz2tEixGDObBA
 zbhQ==
X-Gm-Message-State: AOAM533vqKwbsGp4lo/1FqgkuYU58haMrWYzHnOUpHlBzYDT3eFOnDi3
 ETE1rj8PyRlL0w2AxRYRSrQwNOTB8mQv3+O5SSWyrAG9axn33guC/o1L+KLc0FByz1JggpJjMT+
 FgS0i9dp2D1F8z5rKDxH7ZCn2LWJoNYXrhTieEujz+tiC3sVE2mVFTTPdLfUWkPkm
X-Received: by 2002:ac8:4f0c:: with SMTP id b12mr88258qte.134.1632327612217;
 Wed, 22 Sep 2021 09:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyd1RbvkMBfC2mydSRl2MfEMKfpxBg0VJWxvxZtItKjDmI13EPGyy7wLBfzD5oRAuJUIVTgQ==
X-Received: by 2002:ac8:4f0c:: with SMTP id b12mr88232qte.134.1632327611897;
 Wed, 22 Sep 2021 09:20:11 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id z186sm2094811qke.59.2021.09.22.09.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:20:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] dump-guest-memory: Add blocker for migration
Date: Wed, 22 Sep 2021 12:20:06 -0400
Message-Id: <20210922162009.125622-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
- Patch 3: in qmp_dump_guest_memory(), keeps the RUN_STATE_INMIGRATE check
  [Marc-Andre]

v2:
- One more patch: "migration: Make migration blocker work for snapshots too"
- Move register of migration blocker to be before dump_init [Marc-Andre]
- Collected r-bs

Both dump-guest-memory and live migration have vm state cached internally.
Allowing them to happen together means the vm state can be messed up.  Simply
block live migration for dump-guest-memory.

One trivial thing to mention is we should still allow dump-guest-memory even if
-only-migratable is specified, because that flag should majorly be used to
guarantee not adding devices that will block migration by accident.  Dump guest
memory is not like that - it'll only block for the seconds when it's dumping.

Thanks,

Peter Xu (3):
  migration: Make migration blocker work for snapshots too
  migration: Add migrate_add_blocker_internal()
  dump-guest-memory: Block live migration

 dump/dump.c                 | 19 +++++++++++++++++++
 include/migration/blocker.h | 16 ++++++++++++++++
 migration/migration.c       | 24 +++++++++++++++---------
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.31.1


