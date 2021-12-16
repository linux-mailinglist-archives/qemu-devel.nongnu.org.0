Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FD476E17
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:48:36 +0100 (CET)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnNL-0007CK-ML
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJu-0004LZ-BC
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJr-0001Kq-UR
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+heNAJzBYcQqUJv+wZFkrIwF3MqprZmh+dNG1wNntR4=;
 b=Tj5TVtEJOkZooSTWmN6xIilbQPuo/Awvsrc+HoRzjbQjVYTtP3eznmA4jymk+/MFO2X/xt
 3/Z/10BXerVpvvNikfqgogqc5pwST0GJsGJIsunuKrAbqSzJXrg+jGkPZkAG6+OySB62jK
 3aPd0Da0h+1MchH2kgQreizzoof+qcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-oSabtK-yMzCTPtT9xRQY-g-1; Thu, 16 Dec 2021 04:44:54 -0500
X-MC-Unique: oSabtK-yMzCTPtT9xRQY-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C810A81EE60;
 Thu, 16 Dec 2021 09:44:52 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0839710A403A;
 Thu, 16 Dec 2021 09:44:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] MAINTAINERS: update email address of Christian Borntraeger
Date: Thu, 16 Dec 2021 10:44:41 +0100
Message-Id: <20211216094447.58496-3-thuth@redhat.com>
In-Reply-To: <20211216094447.58496-1-thuth@redhat.com>
References: <20211216094447.58496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@linux.ibm.com>

My borntraeger@de.ibm.com email is just a forwarder to the
linux.ibm.com address. Let us remove the extra hop to avoid
a potential source of errors.

While at it, add the relevant email addresses to mailmap.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Message-Id: <20211126102449.287524-1-borntraeger@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 8beb2f95ae..c45d1c5301 100644
--- a/.mailmap
+++ b/.mailmap
@@ -50,6 +50,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..0644ba2b4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -393,7 +393,7 @@ F: target/ppc/kvm.c
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: target/s390x/kvm/
 F: target/s390x/ioinst.[ch]
@@ -1527,7 +1527,7 @@ S390 Machines
 -------------
 S390 Virtio-ccw
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: hw/char/sclp*.[hc]
 F: hw/char/terminal3270.c
@@ -1541,7 +1541,7 @@ T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 S390-ccw boot
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Supported
 F: hw/s390x/ipl.*
-- 
2.27.0


