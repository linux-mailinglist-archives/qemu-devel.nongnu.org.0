Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7E257568
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 10:30:56 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCfDL-0004zD-Dj
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 04:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCfAs-0001PX-Hp
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCfAo-0005pd-Uy
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598862496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZ5NCeGJm4EmgeA3oDH7PFBVHCkQ2/Sa67CewjIBd08=;
 b=GWgLHWxExssq1oHDcMyyhXtFgJsqZrrJ9rmB9IWhKp1OvPn3JECJ/G8vpTy6OopvMRgp4s
 c8yKWmy4th0g49IqU0NosZmWjwFnplOIJoeO74iKiKsz9m/Zxo8kT9nXy12K44/6WrdmQd
 gfgtKjTIl5YGmiMoRj1j1yqODZ5oCsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-GJs7O13DO36ee8kHUqYZUw-1; Mon, 31 Aug 2020 04:28:14 -0400
X-MC-Unique: GJs7O13DO36ee8kHUqYZUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D808015DB
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 08:28:13 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D9115D9D3;
 Mon, 31 Aug 2020 08:28:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/9] vhost-vdpa: remove the default devname
Date: Mon, 31 Aug 2020 16:27:29 +0800
Message-Id: <20200831082737.10983-2-jasowang@redhat.com>
In-Reply-To: <20200831082737.10983-1-jasowang@redhat.com>
References: <20200831082737.10983-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code doesn't have a default vhostdev, so remove the default
description in net.json.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 qapi/net.json | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qapi/net.json b/qapi/net.json
index ddb113e5e5..a2a94fad3e 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -438,7 +438,6 @@
 # specifications with a vendor specific control path.
 #
 # @vhostdev: path of vhost-vdpa device
-#            (default:'/dev/vhost-vdpa-0')
 #
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
-- 
2.20.1


