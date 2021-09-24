Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2718416EA4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:14:21 +0200 (CEST)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThHg-0008NN-Lk
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAe-00065N-PX
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAY-0003yD-7V
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lf+dwWntK8Cwv6LA2A15j5eQ0oA722s1ysJP3KMCRqQ=;
 b=hW+w8kvLdjQeeNikag6wYzev5Mwsn/LgV7P96RHQNj70GR7IvK8QGAR+qS5SIiCfGb0pi2
 Upj+aI7q9FU5CAFDqNNqKLrO2oHjgDbatUoGmPWRmGAECxCI7KtAmmUbEKa3biQqX3gZmT
 Otn+XIO7dtHGG9OvY4jkts0EFfFrCjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-8VelKijeN6alARTpTe5D8w-1; Fri, 24 Sep 2021 05:06:54 -0400
X-MC-Unique: 8VelKijeN6alARTpTe5D8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6294C814254;
 Fri, 24 Sep 2021 09:06:53 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 843435D9DC;
 Fri, 24 Sep 2021 09:06:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Date: Fri, 24 Sep 2021 11:04:27 +0200
Message-Id: <20210924090427.9218-12-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to switch both from QemuOpts to the keyval parser in the future,
which results in some incompatibilities, mainly around list handling.
Mark the non-JSON version of both as unstable syntax so that management
tools switch to JSON and we can later make the change without breaking
things.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/about/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3c2be84d80..42f6a478fb 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -160,6 +160,17 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
+change incompatibly between QEMU versions (e.g. because you are using the QEMU
+command line as a machine interface in scripts rather than interactively), use
+JSON syntax for these options instead.
+
+There is no intention to remove support for non-JSON syntax entirely, but
+future versions may change the way to spell some options.
+
 
 Plugin argument passing through ``arg=<string>`` (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-- 
2.31.1


