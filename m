Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0133236F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:57:15 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa38-0006VT-BE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZt1-0005QB-Pt
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZt0-0006qy-0H
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqFFFApbFxfEGeNnd+EkAogksWrv7sRgKXyVzogIdvc=;
 b=ecvtUJt+VCiJxzhbFQlcE9Uskky2w1EgK10shNgBJ0BvqqRDIBsIAzK8qFOtGfFtKleNEV
 bMpc0VrMlGL/ouwBK5sqMGQD6Q2fNB2t6ytNdgr46/mDE6fPHCec8ThBHAOhJ7eeSPd5Qu
 nJuSPLmssK5QexWFfdShQPL31bR/748=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-dv7kXhnwOkOP0TYjINfPAA-1; Tue, 09 Mar 2021 05:46:43 -0500
X-MC-Unique: dv7kXhnwOkOP0TYjINfPAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84255107465E
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 10:46:42 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 769CA60C04;
 Tue,  9 Mar 2021 10:46:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] scripts/ci/gitlab-pipeline-status: give more info when
 pipeline not found
Date: Tue,  9 Mar 2021 11:46:11 +0100
Message-Id: <20210309104617.714908-9-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

This includes both input parameters (project id and commit) in the
message so to make it easier to debug returned API calls.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210222193240.921250-4-crosa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/ci/gitlab-pipeline-status | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
index ad62ab3cfc..924db327ff 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -74,7 +74,9 @@ def get_pipeline_status(project_id, commit_sha1):
     # project + commit. If this assumption is false, we can add further
     # filters to the url, such as username, and order_by.
     if not json_response:
-        raise NoPipelineFound("No pipeline found")
+        msg = "No pipeline found for project %s and commit %s" % (project_id,
+                                                                  commit_sha1)
+        raise NoPipelineFound(msg)
     return json_response[0]
 
 
-- 
2.27.0


