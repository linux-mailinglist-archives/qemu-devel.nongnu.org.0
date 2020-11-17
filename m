Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FC2B5C86
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:03:12 +0100 (CET)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexpP-0001Zi-TI
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkc-0003rq-81
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexka-0003aF-FC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=dx4iQ6/bvUhKAcvhxvQSYfXw8/ZRkSe6hKQOd1gdGeo=;
 b=HPkWX6K71Ux9Ij+4mxAixX9FtpTjlhnsiLXk0JpDvBWih/3RcxsHBYDNve26t+ZKaFtV7T
 Uu2O4a79q1n7Lh3WfzH7YjSsj/aVPntW14/dioqaf6Ocibc2313AuI76N3cERmcFcn0LyH
 VpKiwN52ndLAGw8ox8lC/mDbe9Nlt2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-r2Lm7YtsPaKNjx5cJ1zB9w-1; Tue, 17 Nov 2020 04:58:08 -0500
X-MC-Unique: r2Lm7YtsPaKNjx5cJ1zB9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1146D241;
 Tue, 17 Nov 2020 09:58:07 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF89B76646;
 Tue, 17 Nov 2020 09:58:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/12] max111x: put it into the 'misc' category
Date: Tue, 17 Nov 2020 10:57:48 +0100
Message-Id: <20201117095748.122371-13-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Gan Qixin <ganqixin@huawei.com>

The category of the max111x device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201112125824.763182-5-ganqixin@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/max111x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index 7e6723f343..eae0f9b598 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -185,6 +185,7 @@ static void max111x_class_init(ObjectClass *klass, void *data)
     k->transfer = max111x_transfer;
     dc->reset = max111x_reset;
     dc->vmsd = &vmstate_max111x;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo max111x_info = {
-- 
2.18.4


