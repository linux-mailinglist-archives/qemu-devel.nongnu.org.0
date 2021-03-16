Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05B33DAF2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:28:55 +0100 (CET)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDV0-0001vs-30
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9c-0003b0-Pb
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9Y-0005W1-O6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUc3U2+v+ntF20PVCrV0Xd4RgzqTmHtdtvM+eYUTR8U=;
 b=UWXSI61Df1gf5JwhXhp7pM1XFPqq80PUF7V4wU8iJt+nnAfam+z2ygB0rGYFoozMgaq9gC
 bMpoA9kLAEp6+ISXjASfkB+IA+AKWCYtJAPFlFUudt/QTPleDXF8tauI6a2FXVdbLh8N85
 QYOX80DOJai5O4L8448ohvaplOAFqAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-FNBsYFvVPiir-SzfQS2BAw-1; Tue, 16 Mar 2021 13:06:42 -0400
X-MC-Unique: FNBsYFvVPiir-SzfQS2BAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801CDCC622
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:06:40 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E9A960C13;
 Tue, 16 Mar 2021 17:06:37 +0000 (UTC)
Subject: [PULL 03/10] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:06:37 -0600
Message-ID: <161591439791.135549.11579288906244296598.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210202155611.998424-1-philmd@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b6ab3d25a751..5b74df54dccc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1809,6 +1809,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
+F: docs/igd-assign.txt
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>



