Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4A433258
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:35:43 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclX5-0003aB-3k
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQw-0003oL-1p
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQt-0005es-Gu
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6bgCjM/jjhzUDRxCYXfTyAuYvgeEaSR5110O+DvhtuQ=;
 b=Lnw/nl27edZnI8NITDTQNGV2WT0uavCO+UqkLhI1kJu8MnL7FPeNtUI0fEXWvYJyVQeVqI
 oM/6tnIkthDATQLAvNYPI0TX1ykWQvBxj2wu1lMIIfbTDIw8N9/hDxQoFaMegwCgJBgBJH
 I16iPeDiZFl3O0UtmGFU8FHMas1EuVA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-z5lR-3pGOx27mcN8X2Qlhg-1; Tue, 19 Oct 2021 05:29:12 -0400
X-MC-Unique: z5lR-3pGOx27mcN8X2Qlhg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so9896792wrb.14
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0aW9VyCLKEoMSqu5uIRzlKzCaG37wvozhZA4Whm5tQ=;
 b=y5b4H5VbZtMv3GWS1HOSzYVwn7hFAHW1EIx2Y0mxgFH1Qpw/i6CjZMiosgLCq6waKw
 uPZ7KjTaU9ErpkAX1xA0Za+1WYFi7XSaO98EKtppxmktOoI8B6Yp+EeJ3fu504i4idNi
 OgPbZT0xiwpCqJOxbPW7dSBDbR8esJcerjv7JqIVGlXYIiRs2ZrNYRXK1157KicA/V55
 g1oNdfdyx/7ymi5a25AZ3HgCWInAVE3jmANWSJusfLn3J1H0pexRQYWnaIFPJrhEAwZ8
 eDHmYB+TAct7SOMRv28vvcAzM+SouOB4QNEWBkTiP85bNRxjkaVerg7PoBBJwQJQxKZ5
 1gjw==
X-Gm-Message-State: AOAM532uv1xtttKuM2PRqwosGHIJ9GoiPARx4Q1iH/c7GTjWkbc3QSdi
 lC2LpBM29KdTV71C0x48+JLgXQVDdLsmDTNKcBk8rp4Nra+aLHx9Q6qabSHYAVqHaxopv7DEDub
 hCldndxW0/YlfG2GqgM+CptHTXAamsYAxYc5TzxlRVIJzkm5SEfCJpczJjSAyjC/uPnk=
X-Received: by 2002:a7b:c010:: with SMTP id c16mr4899530wmb.141.1634635750621; 
 Tue, 19 Oct 2021 02:29:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWn5QclMQbMH6DqckxEJf8dfUxAtQMurllc1jBvT7f8xWnVN7KfYn0tZoYyLZAgpbttGQXsQ==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr4899496wmb.141.1634635750350; 
 Tue, 19 Oct 2021 02:29:10 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id 10sm2010650wme.27.2021.10.19.02.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Migration.next patches
Date: Tue, 19 Oct 2021 11:29:00 +0200
Message-Id: <20211019092907.5255-1-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 362534a643b4a34bcb223996538ce9de5cdab946=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-20211018-=
pull-request' into staging (2021-10-18 12:17:24 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration.next-pull-request=
=0D
=0D
for you to fetch changes up to 911965ace9386e35ca022a65bb45a32fd421af3e:=0D
=0D
  migration/rdma: advise prefetch write for ODP region (2021-10-19 08:39:04=
 +0200)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request (3rd try)=0D
=0D
Hi=0D
=0D
This should fix all the freebsd problems.=0D
=0D
Please apply,=0D
=0D
----------------------------------------------------------------=0D
=0D
David Hildenbrand (1):=0D
  migration/ram: Don't passs RAMState to=0D
    migration_clear_memory_region_dirty_bitmap_*()=0D
=0D
Li Zhijian (4):=0D
  migration: allow multifd for socket protocol only=0D
  migration: allow enabling mutilfd for specific protocol only=0D
  migration/rdma: Try to register On-Demand Paging memory region=0D
  migration/rdma: advise prefetch write for ODP region=0D
=0D
Lukas Straub (2):=0D
  multifd: Implement yank for multifd send side=0D
  multifd: Unconditionally unregister yank function=0D
=0D
 meson.build            |   6 +++=0D
 migration/multifd.h    |   4 ++=0D
 migration/migration.c  |  12 +++++=0D
 migration/multifd.c    |  35 ++++++++++---=0D
 migration/ram.c        |  13 ++---=0D
 migration/rdma.c       | 113 ++++++++++++++++++++++++++++++++++-------=0D
 migration/trace-events |   2 +=0D
 7 files changed, 151 insertions(+), 34 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


