Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B325542A793
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:45:55 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJ2Q-0000R0-Q2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1maIxe-0001dg-MW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1maIxb-0002vR-NI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634049653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GXbVhXLo3rHAtzyqZDbreXyKEx5t4EY5obRa5XgC7I=;
 b=fGT1O81sIncOjZL9c8dWOSjq5rvTSbQjnTOBUCTUjQLvXZVIFnUsQ1TTohGj66p8OKZKgc
 TSWt1yvQWhxrLDfhtv+Wwv4Ec9FTWsQFIxS9y/xMuqkuodVtO4m+3z1e1LCtXUE1JKg2C7
 zR1hk22cT+b9QoHrkjTkzyHxtd+w+vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-Q4d5JBD7M1OseoyOlbOpuw-1; Tue, 12 Oct 2021 10:40:50 -0400
X-MC-Unique: Q4d5JBD7M1OseoyOlbOpuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CDF4BD52D;
 Tue, 12 Oct 2021 14:40:49 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D0E35C25A;
 Tue, 12 Oct 2021 14:40:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/3] s390x/kvm: step down as maintainer
Date: Tue, 12 Oct 2021 16:40:39 +0200
Message-Id: <20211012144040.360887-3-cohuck@redhat.com>
In-Reply-To: <20211012144040.360887-1-cohuck@redhat.com>
References: <20211012144040.360887-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm no longer involved with KVM/s390 on the kernel side, and I don't
have enough resources to work on the s390 KVM cpus support, so I'll
step down.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14d131294156..234fcaa23344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -393,7 +393,6 @@ F: target/ppc/kvm.c
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Cornelia Huck <cohuck@redhat.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
 F: target/s390x/kvm/
@@ -408,7 +407,6 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
-T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
-- 
2.31.1


