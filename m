Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C16B0AB7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 15:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuWe-0004oJ-7u; Wed, 08 Mar 2023 09:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZuWc-0004nl-8c
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZuWa-0000rg-Cd
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678284730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6fO6MVK29AuWuIyP7LgX8WA5d3QGCHIKNJpV0DZ2PVA=;
 b=JZ3WPPo+HF0wuCEVxX4o5um/0F8YM1v6/q+7rNK/dO8+/6X+U5V3QzDLocDySOy6mNojN/
 gxyb6V70buJPOC8xFyplznwWSXMvHkoRRcHhvdkU22CB3rYjQ6uO3XaOueRqDVpt66jiLQ
 rP6XQFJ0qK07bkaQcA+NM8vewTZisT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-nzocinOMOTWXkNKZf7UK-Q-1; Wed, 08 Mar 2023 09:12:09 -0500
X-MC-Unique: nzocinOMOTWXkNKZf7UK-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBD997C140
 for <qemu-devel@nongnu.org>; Wed,  8 Mar 2023 14:12:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 507CF492B07;
 Wed,  8 Mar 2023 14:12:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH] Add a blog post about the upcoming KVM Forum 2023
Date: Wed,  8 Mar 2023 15:12:04 +0100
Message-Id: <20230308141204.718786-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Based on the announcement e-mail that Paolo sent to the qemu-devel
mailing list two days ago - let's spread the word via the blog, too!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 _posts/2023-03-08-kvm-forum-cfp.md | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 _posts/2023-03-08-kvm-forum-cfp.md

diff --git a/_posts/2023-03-08-kvm-forum-cfp.md b/_posts/2023-03-08-kvm-forum-cfp.md
new file mode 100644
index 0000000..8daf934
--- /dev/null
+++ b/_posts/2023-03-08-kvm-forum-cfp.md
@@ -0,0 +1,62 @@
+---
+layout: post
+title:  "KVM Forum 2023: Call for presentations"
+date:   2023-03-08 13:45:00 +0100
+categories: [presentations, conferences]
+---
+
+[KVM Forum](https://kvm-forum.qemu.org/2023/) is an annual event that presents
+a rare opportunity for KVM and QEMU developers and users to discuss the state
+of Linux irtualization technology and plan for the challenges ahead. Sessions
+include updates on the state of the KVM virtualization stack, planning for the
+future, and many opportunities for attendees to collaborate.
+
+This year's event will be held in Brno, Czech Republic on June 14-15, 2023.
+It will be in-person only and will be held right before the
+[DevConf.CZ](https://www.devconf.info/cz/) open source community conference.
+
+June 14 will be at least partly dedicated to a hackathon or "day of BoFs".
+This will provide time for people to get together and discuss strategic
+decisions, as well as other topics that are best solved within smaller groups.
+
+## Call for presentations
+
+We encourage you to submit presentations via the
+[KVM Forum CfP page](https://kvm-forum.qemu.org/2023/cfp).
+ Suggested topics include:
+
+* Scalability and Optimization
+* Hardening and security
+* Confidential computing
+* Testing
+* KVM and the Linux Kernel:
+  * New Features and Ports
+  * Device Passthrough: VFIO, mdev, vDPA
+  * Network Virtualization
+  * Virtio and vhost
+* Virtual Machine Monitors and Management:
+  * VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
+  * Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon
+  * QEMU without KVM: Hypervisor.framework and other hypervisors
+  * Managing KVM: Libvirt, KubeVirt, Kata Containers
+* Emulation:
+  * New Devices, Boards and Architectures
+  * CPU Emulation and Binary Translation
+
+The deadline for submitting presentations is April 2, 2023 - 11:59 PM PDT.
+Accepted speakers will be notified on April 17, 2023.
+
+## Attending KVM Forum
+
+Admission to KVM Forum and DevConf.CZ is free. However,
+[registration](https://kvm-forum.qemu.org/2023/register/) is required and the
+number of attendees is limited by the space available at the venue.
+
+The DevConf.CZ program will feature technical talks on a variety of topics,
+including cloud and virtualization infrastructure—so make sure to register
+for DevConf.CZ as well if you would like to attend.
+
+Both conferences are committed to fostering an open and welcoming environment
+for everybody. Participants are expected to abide by the
+[Devconf.cz code of conduct](https://www.devconf.info/coc/)
+and [media policy](https://www.devconf.info/media-policy/).
-- 
2.31.1


