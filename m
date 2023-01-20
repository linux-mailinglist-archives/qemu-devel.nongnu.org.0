Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2C674B57
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 05:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIjMD-0005iV-B2; Thu, 19 Jan 2023 23:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1pIjM7-0005h7-G2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 23:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1pIjM5-0005WS-4N
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 23:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674190218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=QCQ/rJ9OcUhFGJfEZRwZPT6ketogptymaLeWaE9tJ3Y=;
 b=V3bYoWmMd99RF/wp1eimQsxV/F5nnSrCAArn/PYgXhwe76MsmcUK2uC0XJChtyJFqWsFax
 7S+9zoIs4YqB6mUK5+vQ1m1zemtFTlNHwGVwGXRhKKJ5wt4X3jC5f1TuM9txw3PLnbA2Hr
 g2rfUoqZh46WkVVCyb/mtvRkAncGzlw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-1motH31IPoihUWJxAXRf3A-1; Thu, 19 Jan 2023 23:48:50 -0500
X-MC-Unique: 1motH31IPoihUWJxAXRf3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16BAD1C0512B;
 Fri, 20 Jan 2023 04:48:50 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2AF840C6EC4;
 Fri, 20 Jan 2023 04:48:49 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
 id 002204099C362; Thu, 19 Jan 2023 22:15:17 -0300 (-03)
Message-ID: <20230120011412.530500343@redhat.com>
User-Agent: quilt/0.67
Date: Thu, 19 Jan 2023 22:11:17 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH 1/2] linux-headers: sync KVM_CLOCK_CORRECT_TSC_SHIFT flag
References: <20230120011116.134437211@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sync new KVM_CLOCK_CORRECT_TSC_SHIFT from upstream Linux headers.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

Index: qemu/linux-headers/linux/kvm.h
===================================================================
--- qemu.orig/linux-headers/linux/kvm.h
+++ qemu/linux-headers/linux/kvm.h
@@ -1300,6 +1300,9 @@ struct kvm_irqfd {
 #define KVM_CLOCK_TSC_STABLE		2
 #define KVM_CLOCK_REALTIME		(1 << 2)
 #define KVM_CLOCK_HOST_TSC		(1 << 3)
+/* whether tsc_shift as seen by the guest matches guest visible TSC */
+/* This is true since commit 78db6a5037965429c04d708281f35a6e5562d31b */
+#define KVM_CLOCK_CORRECT_TSC_SHIFT	(1 << 4)
 
 struct kvm_clock_data {
 	__u64 clock;



