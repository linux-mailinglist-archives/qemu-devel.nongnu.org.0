Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F644331EC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:13:01 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclB6-0004Zh-Rx
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2s-00018N-ER
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2p-0007gd-Ar
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX4we9rVGSwSP4Q6Da9FYxWUAFu6VceQ1S4FfWRjNLY=;
 b=QIDPTRaNHOqCVnuGzdIBSToR+zSbI7nZXBz9sJ92nA7/flPXrOmEugYEWmOU1oixVy1CwU
 IbCGBSw1HQCc9BkfJdlCt6tHYVb9NUYswWxfEywd28jz2BaJyJ6SG9a6IWVWWxIZGatMg9
 jAIXV75ELNXyOucoarERciNrlj0Qxco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-93k5-areNm2qKQzvjl8BeA-1; Tue, 19 Oct 2021 05:04:21 -0400
X-MC-Unique: 93k5-areNm2qKQzvjl8BeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5AC18125C4;
 Tue, 19 Oct 2021 09:04:20 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8841E7092E;
 Tue, 19 Oct 2021 09:04:17 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] docs/devel: Update the rST index file
Date: Tue, 19 Oct 2021 11:03:44 +0200
Message-Id: <20211019090344.3054300-7-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the entries for contributing-related rSTified wiki docs.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/index.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3e..f7bec644f3 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -45,3 +45,8 @@ modifying QEMU's source code.
    vfio-migration
    qapi-code-gen
    writing-qmp-commands
+   trivial-patches
+   spell-check
+   key-signing-party
+   submitting-a-pull-request
+   submitting-a-patch
-- 
2.31.1


