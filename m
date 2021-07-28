Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D783D8ECB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:17:33 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jRE-0005xe-L2
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8jPJ-00053K-Ku
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8jPH-0000Ey-JY
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627478130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eytt8wpueaH2Q7oy2Czv7UhE6LBzGWesAiIhPQqkuCo=;
 b=ev9qtpopDOwSPGoFqWaNiwv3JzM6OsYMC9tGHKremwftV1VP1xu7kPPvKJz5IJqJ2zf36a
 cJlePz6j/Bhx0AbynEILTymZexswKqn6O2BbUR2W9V2zi03UNHrb6xmpReEzwCGOhguwAg
 KRUQwmPpKGbeUs/deFZpW8pG69U8GaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-AQzAkHL_NCuPekketFn8Dg-1; Wed, 28 Jul 2021 09:15:26 -0400
X-MC-Unique: AQzAkHL_NCuPekketFn8Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCC7E192FDA3;
 Wed, 28 Jul 2021 13:15:25 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-43.ams2.redhat.com
 [10.36.113.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF0AC6060F;
 Wed, 28 Jul 2021 13:15:16 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: add Stefano Garzarella as io_uring reviewer
Date: Wed, 28 Jul 2021 15:15:15 +0200
Message-Id: <20210728131515.131045-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been working with io_uring for a while so I'd like to help
with reviews.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42ac45c3e5..1776d0950b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3257,6 +3257,7 @@ Linux io_uring
 M: Aarushi Mehta <mehta.aaru20@gmail.com>
 M: Julia Suvorova <jusual@redhat.com>
 M: Stefan Hajnoczi <stefanha@redhat.com>
+R: Stefano Garzarella <sgarzare@redhat.com>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/io_uring.c
-- 
2.31.1


