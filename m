Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767923E1CDE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:38:50 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjCb-0000Ms-Ep
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8m-00022E-8f
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8j-0001u7-O6
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFfPWbuQ04DCDBgWcX/wyYTA50V/YfSNe7Vo6iVBBHI=;
 b=SVF7yr4XswA5WE0t3cSD0/7BO5NEbQiTa8DFnaNZhNhmH0nZWM1IXnoDjUvSZ7WV7sUJkS
 7Dyk9jWThq7bz8oARPQcQz2A7lqohv7hoban4V0E+ZLG5Rq+KFA3W01d+GedAM9/dkk+s9
 USHD+cmsuy0HZYyj06STi7knNyA9VV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-cCEkF7WaMymn-6Yn7cEQkQ-1; Thu, 05 Aug 2021 15:34:47 -0400
X-MC-Unique: cCEkF7WaMymn-6Yn7cEQkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFC81006716;
 Thu,  5 Aug 2021 19:34:46 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 108745B826;
 Thu,  5 Aug 2021 19:34:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 3/6] s390-sclp-events-bus: Set instance_size
Date: Thu,  5 Aug 2021 15:34:28 -0400
Message-Id: <20210805193431.307761-4-ehabkost@redhat.com>
In-Reply-To: <20210805193431.307761-1-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a SCLPEventsBus struct defined, but the struct is not
used at the TypeInfo definition.  This works today but will break
silently if anybody adds a new field to SCLPEventsBus.

Set instance_size properly to avoid problems in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/s390x/event-facility.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index ed92ce510d9..0a65e16cdd9 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -332,6 +332,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
 static const TypeInfo sclp_events_bus_info = {
     .name = TYPE_SCLP_EVENTS_BUS,
     .parent = TYPE_BUS,
+    .instance_size = sizeof(SCLPEventsBus),
 };
 
 static void command_handler(SCLPEventFacility *ef, SCCB *sccb, uint64_t code)
-- 
2.31.1


