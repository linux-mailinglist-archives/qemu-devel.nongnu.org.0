Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5E24415E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:41:28 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6LuZ-0002ih-UT
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgX-0005Ub-S0
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgW-0002uC-2p
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597357615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIOMBMi0tzlZjzWpv72aiqFoQ7suptpvp1EY8qzudnA=;
 b=fkxmMIFt2Fw3QaCQS1QykRJNpMN9ONRNHyAWE3wr4ZywRwQwgbt/a4YuxBVLQH+Du1brdP
 dJbAaeyC6j5KcfxXuTSzjF++o2IRqthHO0TAJGdcHp+GbTuDkwTo/1sGycsf09BmuwfavD
 k9oSEGsErQSs6Ugc6Q9Xwh/bexDN/bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-SNOR25skMIaGQHjbkRz3rg-1; Thu, 13 Aug 2020 18:26:53 -0400
X-MC-Unique: SNOR25skMIaGQHjbkRz3rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7731E85B66C
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:26:52 +0000 (UTC)
Received: from localhost (ovpn-117-153.rdu2.redhat.com [10.10.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DEEE5D759;
 Thu, 13 Aug 2020 22:26:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/41] can_emu: Delete macros for non-existing typedef
Date: Thu, 13 Aug 2020 18:26:06 -0400
Message-Id: <20200813222625.243136-23-ehabkost@redhat.com>
In-Reply-To: <20200813222625.243136-1-ehabkost@redhat.com>
References: <20200813222625.243136-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 18:26:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CanBusClass doesn't exist.  This will break when we automatically
convert the code to use OBJECT_DEFINE_TYPE().  Delete the macros
that reference the non-existing typedef.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/net/can_emu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/net/can_emu.h b/include/net/can_emu.h
index fce9770928..7e90fd8a45 100644
--- a/include/net/can_emu.h
+++ b/include/net/can_emu.h
@@ -100,10 +100,6 @@ struct CanBusClientState {
 };
 
 #define TYPE_CAN_BUS "can-bus"
-#define CAN_BUS_CLASS(klass) \
-     OBJECT_CLASS_CHECK(CanBusClass, (klass), TYPE_CAN_BUS)
-#define CAN_BUS_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(CanBusClass, (obj), TYPE_CAN_BUS)
 #define CAN_BUS(obj) \
      OBJECT_CHECK(CanBusState, (obj), TYPE_CAN_BUS)
 
-- 
2.26.2


