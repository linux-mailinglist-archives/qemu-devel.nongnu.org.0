Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC124D3D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:24:45 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95A4-0007Gt-Vm
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ep-0003xf-0i
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ee-0001y5-8R
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmlTWuWsCC4qZSMlvzbdZMCjbV8OenGvv7ZAgqxHkEs=;
 b=cGyFmLh/OAffeL3LxxP7GvdI10NQPxn0s9iX8YEXGc0f5sUNoHiOTVqI16cetlK4ZdRPAG
 v3h96zVcwLXspDYeRiKW3lkYOBv+gZWtvzuM8ECdr67N8nQFJKBBU0Q1YiU6WfUpOybz7K
 s/ljENOorHr2w40l8nH9sUYQtS0AY60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-EY2pWhwFPVCEiQpMKO8eOA-1; Fri, 21 Aug 2020 06:25:20 -0400
X-MC-Unique: EY2pWhwFPVCEiQpMKO8eOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E99F801AF1
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08297AEC5
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 136/152] configure: place compatibility symlinks in target
 directories
Date: Fri, 21 Aug 2020 06:23:13 -0400
Message-Id: <20200821102329.29777-137-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 9f8fd03650..7398a2cc0c 100755
--- a/configure
+++ b/configure
@@ -8215,6 +8215,9 @@ fi
 if test "$target_user_only" = "yes" ; then
   echo "CONFIG_USER_ONLY=y" >> $config_target_mak
   echo "CONFIG_QEMU_INTERP_PREFIX=\"$interp_prefix1\"" >> $config_target_mak
+  symlink "../qemu-$target_name" "$target_dir/qemu-$target_name"
+else
+  symlink "../qemu-system-$target_name" "$target_dir/qemu-system-$target_name"
 fi
 if test "$target_linux_user" = "yes" ; then
   echo "CONFIG_LINUX_USER=y" >> $config_target_mak
-- 
2.26.2



