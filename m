Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83F1F3AC8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 14:40:44 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jidYZ-0007qJ-CI
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 08:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidIO-0003Xf-LI
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 08:24:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25947
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidII-0005S6-5l
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 08:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQGw1L8940XvyRfrxXfxAciE6HkcEZGPQkP01ci34JE=;
 b=DILhWrtS0M+YZ5TNPXqkgKEv7Vb6mM4VZQN6ZpaMXYrmRgXgaCdLfaCUcf2qK5BmJMTQmT
 eUK1WmaDt+SnJLYJzHGHuOPtCWxEOWcwcyDfhMeraBBqAjNIMZoFe+mjXLNb8jUCN+BLH6
 r3U7CwZQ8Bxkn0dKhK3qWAjwwu+SuJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-ZlJqcPvPP0eHMKtMH15joA-1; Tue, 09 Jun 2020 08:23:44 -0400
X-MC-Unique: ZlJqcPvPP0eHMKtMH15joA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AF2B1883607;
 Tue,  9 Jun 2020 12:23:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6982678FC5;
 Tue,  9 Jun 2020 12:23:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 084AC11384A9; Tue,  9 Jun 2020 14:23:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/24] macio: Delete unused "macio-gpio" devices
Date: Tue,  9 Jun 2020 14:23:25 +0200
Message-Id: <20200609122339.937862-11-armbru@redhat.com>
In-Reply-To: <20200609122339.937862-1-armbru@redhat.com>
References: <20200609122339.937862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These devices go with the "via-pmu" device, which is controlled by
property "has-pmu".  macio_newworld_init() creates it unconditionally,
because the property has not been set then.  macio_newworld_realize()
realizes it only when the property is true.  Works, although it can
leave an unrealized device hanging around in the QOM composition tree.
Affects machine mac99 with via=cuda (default).

Delete the unused device by making macio_newworld_realize() unparent
it.  Visible in "info qom-tree":

     /machine (mac99-machine)
       [...]
       /unattached (container)
         /device[9] (macio-newworld)
           [...]
           /escc-legacy-port[8] (qemu:memory-region)
           /escc-legacy-port[9] (qemu:memory-region)
           /escc-legacy[0] (qemu:memory-region)
    -      /gpio (macio-gpio)
    -        /gpio[0] (qemu:memory-region)
           /ide[0] (macio-ide)
             /ide.0 (IDE)
             /pmac-ide[0] (qemu:memory-region)

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 3779865ab2..b3dddf8be7 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -368,6 +368,8 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         memory_region_add_subregion(&s->bar, 0x16000,
                                     sysbus_mmio_get_region(sysbus_dev, 0));
     } else {
+        object_unparent(OBJECT(&ns->gpio));
+
         /* CUDA */
         object_initialize_child(OBJECT(s), "cuda", &s->cuda, sizeof(s->cuda),
                                 TYPE_CUDA, &error_abort, NULL);
-- 
2.26.2


