Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008F41652D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:24:44 +0200 (CEST)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTOl-0005qV-4v
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTMX-00047h-VB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTMV-0007t7-O7
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632421341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g8re1ruWy+QjqjQ74nXFv68t7G6r7M3eXGULJVUK3Mk=;
 b=FpTic3lDcKhGL7fvjmWxOQfw3ZdKxbnbR+K1tJ6Vh/j/0cP7aQ8C7JfVXRwgEMLjsPfUnS
 /O6uuRcberlv9w1xOlxHDeq1K+9oXTcY1z0bET0/kb7HFxvHVgm9uQ7WU25qC7Eo+Gj5sn
 jNiwJpOQK5jCvD/H1CWkHwrjOzEa13Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-DneMXfB5M4eapyVi3zxqDw-1; Thu, 23 Sep 2021 14:22:20 -0400
X-MC-Unique: DneMXfB5M4eapyVi3zxqDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF401006AA4;
 Thu, 23 Sep 2021 18:22:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7DDD60936;
 Thu, 23 Sep 2021 18:22:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] docs/sphinx: change default `role` to "any"
Date: Thu, 23 Sep 2021 14:22:02 -0400
Message-Id: <20210923182204.4187601-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John Snow <jsnow@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rebased to not let the work done in removing erroneous references prior=0D
to 6.1 regress.=0D
=0D
John Snow (2):=0D
  docs: remove non-reference uses of single backticks=0D
  docs/sphinx: change default role to "any"=0D
=0D
 docs/conf.py                           |  5 +++++=0D
 docs/devel/fuzzing.rst                 |  9 +++++----=0D
 docs/devel/migration.rst               | 10 +++++-----=0D
 docs/devel/tcg-plugins.rst             |  2 +-=0D
 docs/interop/live-block-operations.rst |  2 +-=0D
 docs/system/guest-loader.rst           |  2 +-=0D
 qapi/block-core.json                   |  4 ++--=0D
 include/qemu/module.h                  |  6 +++---=0D
 qemu-options.hx                        |  4 ++--=0D
 9 files changed, 25 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


