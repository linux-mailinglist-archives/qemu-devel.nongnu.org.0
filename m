Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0F37BD88
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:58:16 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoRL-0000JK-G4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoPH-000691-NU
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoPG-0004Sm-6o
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620824165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW4v8ujhk2YL650fydsXQYORVHhFLYhaTKVkpRR4S0Q=;
 b=Y7GV1tPrldThzYu4EsxSzELA7PGnVl7GtUKQCnAIjB66tjKxye3dqhitN+ww3CkTVOdB69
 wriFsqY7aY+gQfTHUHGCd1GLlYuUJX92q6DuQdRybAcFweCzSTT1zrkJhKE8DHqxzo1ypD
 kWEmAcQQV+WOVHOjhg90xMIq62U6QQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-lzbxFgemNvqaulyhL3va9g-1; Wed, 12 May 2021 08:56:02 -0400
X-MC-Unique: lzbxFgemNvqaulyhL3va9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15D38018AD
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:56:01 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEBE1100EBAF;
 Wed, 12 May 2021 12:55:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtiofs_submounts.py: Do not generate ssh key
Date: Wed, 12 May 2021 14:55:43 +0200
Message-Id: <20210512125544.9536-3-mreitz@redhat.com>
In-Reply-To: <20210512125544.9536-1-mreitz@redhat.com>
References: <20210512125544.9536-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since c0c5a7f18e623b8f6eb, avocado_qemu provides an ssh key by default.
There is no need to generate one in the virtiofs_submounts test.
(In fact, it currently is harmful, because e8197c6e0c56aff83 made
LinuxTest expect ssh_pubkey to be a file path and not the file content,
but virtiofs_submounts provides the latter.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 46fa65392a..22fe14b661 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -220,7 +220,7 @@ def live_cleanup(self):
         self.run(('bash', self.get_data('cleanup.sh'), scratch_dir))
 
     @skipUnless(*has_cmds(('sudo -n', ('sudo', '-n', 'true')),
-                          'ssh-keygen', 'bash', 'losetup', 'mkfs.xfs', 'mount'))
+                          'bash', 'losetup', 'mkfs.xfs', 'mount'))
     def setUp(self):
         vmlinuz = self.params.get('vmlinuz')
         if vmlinuz is None:
@@ -242,13 +242,7 @@ def setUp(self):
 
         self.seed = self.params.get('seed')
 
-        self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
-
-        self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', self.ssh_key))
-
-        pubkey = open(self.ssh_key + '.pub').read()
-
-        super(VirtiofsSubmountsTest, self).setUp(pubkey)
+        super(VirtiofsSubmountsTest, self).setUp()
 
         if len(vmlinuz) > 0:
             self.vm.add_args('-kernel', vmlinuz,
-- 
2.31.1


