Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61A3E21D9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 04:47:59 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBptu-0005YA-D7
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 22:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBpsm-0004kJ-2p
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 22:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBpsk-0005bV-Ic
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 22:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628218005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9u/ANkfFIJkzQ/DZ0tBw8h9+KnOs6s4uY9Uux3Bk6I=;
 b=HwBL4IDQFhd9ct654S7K5jcQt9IKs52VPaR1hA+S3PrCW97cBpzGM6BjDJE4tVGxvrl6YT
 eTQYaFrnQjdxEw5wEQGpS/3ArkfU6gTXu9AYRlRXfw0Ex0UIFtun5rA8SOeGghrkpAIaMt
 lR0nbpRMddf2EuOb5zMa62hQjJDrt3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-cQYhgKKUOQyylGt9WMjljQ-1; Thu, 05 Aug 2021 22:46:42 -0400
X-MC-Unique: cQYhgKKUOQyylGt9WMjljQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEB6F1800D41;
 Fri,  6 Aug 2021 02:46:40 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 519595C1B4;
 Fri,  6 Aug 2021 02:46:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v2] s390-sclp-events-bus: Use
 OBJECT_DECLARE_SIMPLE_TYPE
Date: Thu,  5 Aug 2021 22:46:36 -0400
Message-Id: <20210806024636.446074-1-ehabkost@redhat.com>
In-Reply-To: <20210805193431.307761-5-ehabkost@redhat.com>
References: <20210805193431.307761-5-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a SCLPEventsBus struct type defined, but no QOM type
checkers are declared for the type.

Use OBJECT_DECLARE_SIMPLE_TYPE to declare the struct type and
have a SCLP_EVENT_BUS typecast wrapper defined.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* v1 was previously submitted as part of series:
  [PATCH for-6.2 0/6] qom: Fix broken OBJECT_CHECK usage
  at https://lore.kernel.org/qemu-devel/20210805193431.307761-5-ehabkost@redhat.com
* Fix typo (s/SCLP_EVENT_BUS/SCLP_EVENTS_BUS/)

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/s390x/event-facility.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index ed92ce510d9..4bfd0b194b4 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -328,6 +328,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
 /* qemu object creation and initialization functions */
 
 #define TYPE_SCLP_EVENTS_BUS "s390-sclp-events-bus"
+OBJECT_DECLARE_SIMPLE_TYPE(SCLPEventsBus, SCLP_EVENTS_BUS)
 
 static const TypeInfo sclp_events_bus_info = {
     .name = TYPE_SCLP_EVENTS_BUS,
-- 
2.31.1


