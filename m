Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C347C02A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:55:21 +0100 (CET)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzefn-0002FW-QB
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzedl-0000N5-LP
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzedg-0003RQ-Jw
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640091187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bk4Xoq902nbapJbMo8eBIwtCY0j3xEuj0njjpxQt/Gc=;
 b=P+h7oNR9g7RQqSfolgHR3vg/1r0pW2NUZftVlk8bX8bjbRz31Jdq9HaCa2tJV4ZojT5M3H
 Cdcr1j1/N337fkTZa20KtiiVuRYDUNZGAQE5tZPMzx0t9jFnOmyPDDHEWpjlko8VJdMs6j
 gI/aWDB6L1ghmUZnhP+Baw/nLhag65k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-KzprrcN5MZqZnN6D8r30BA-1; Tue, 21 Dec 2021 07:53:06 -0500
X-MC-Unique: KzprrcN5MZqZnN6D8r30BA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F6CF10151EA
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:53:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2126AB81;
 Tue, 21 Dec 2021 12:52:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] migration: misc cleanups
Date: Tue, 21 Dec 2021 13:52:29 +0100
Message-Id: <20211221125235.67414-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
Changes since v1:=0D
- Add reviewed tags for reviewed patches=0D
- Change comment about last_stage (philmd)=0D
- Change cast to 1ULL for ram_release_page()=0D
- remove TARGET_PAGE_MASK mask.  It was used only for compression,=0D
  and offset should be page aligned already=0D
=0D
Please, review.=0D
=0D
Thanks, Juan.=0D
=0D
[v1]=0D
This series do several cleanups:=0D
- Dave found that I was using "%d" for unsigned, fix all uses.=0D
- We pass last_stage left and right, but we only use it in two places=0D
  Just move it to RAMState.=0D
- do_compress_page() used a goto when not needed.=0D
- ram_release_pages() was always used with one page=0D
- And put it when we detect zero pages, instead of everywhere we have find =
a zero page.=0D
=0D
Please, review.=0D
=0D
Juan Quintela (6):=0D
  migration: All this fields are unsigned=0D
  migration: We only need last_stage in two places=0D
  migration: ram_release_pages() always receive 1 page as argument=0D
  migration: Remove masking for compression=0D
  migration: simplify do_compress_ram_page=0D
  migration: Move ram_release_pages() call to save_zero_page_to_file()=0D
=0D
 migration/multifd-zlib.c | 20 +++++------=0D
 migration/multifd-zstd.c | 24 +++++++-------=0D
 migration/multifd.c      | 16 ++++-----=0D
 migration/ram.c          | 71 +++++++++++++++++-----------------------=0D
 migration/trace-events   | 26 +++++++--------=0D
 5 files changed, 73 insertions(+), 84 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


