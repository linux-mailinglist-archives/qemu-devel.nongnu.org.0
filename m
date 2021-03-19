Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B834341FDF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:42:47 +0100 (CET)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGKs-0006pT-7T
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHk-0005Jf-Gk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHg-0004o5-LV
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NluLGvW8zCpuv1gj0odoyxh2KQT5xpwkxHS0QKRCSwM=;
 b=EGE+4tQ/g7v6/BzTqCx5X7TKFAN6w0G+xBKLy8QMrX4HreIfQ/pNVuDdgJzf3/3LlCyoGu
 lDETfAuAsBExyiYd5Kk7EjGRiFzL+4j/5wYxI1uUQfo/rl2bk+VoXftea/P8lsgV87yAxW
 +RPqbxBi3RjQNzf0F+D1sk+11usF9io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-9y2DI5KdPtmvjpzOvk4bOw-1; Fri, 19 Mar 2021 10:39:26 -0400
X-MC-Unique: 9y2DI5KdPtmvjpzOvk4bOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182B788EF03
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 14:39:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAEB160C04
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 14:39:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] qom: use qemu_printf to print help for user-creatable
 objects
Date: Fri, 19 Mar 2021 10:39:17 -0400
Message-Id: <20210319143924.2173798-2-pbonzini@redhat.com>
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
References: <20210319143924.2173798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we have added help support for object_add, the help is
printed on stdout.  Switch to qemu_printf so that it goes to
the monitor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object_interfaces.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 7661270b98..11ad2e2078 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -13,6 +13,7 @@
 #include "qemu/option.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
+#include "qemu/qemu-print.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
-- 
2.26.2



