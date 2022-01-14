Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F148EB1D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:55:35 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8N3G-0006CG-Mg
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0V-00030B-AJ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0T-0000KJ-Tn
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9h1zxhQ3qJZcXdlgkol0HUHu71QzW/pKx4ap24WsX0=;
 b=DDvfsgQqEkL4zkH/LE6/ysgMfV+lMI+isgb8hLVa6lXZDgDtU/OmEIQ4HDftS4x1kfs6aZ
 ZelALmg5ICC3Ry7yGf5al5bBRmxCwqtUbjc8U3BZyFFvwA0AcRmf2TKO4VW/mEE1zR1AXv
 tlwuQ2VytbuZcV5ZVZs2zn6C0UVDfgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-DVlhpARaOwyNAkPqvchr0A-1; Fri, 14 Jan 2022 08:52:38 -0500
X-MC-Unique: DVlhpARaOwyNAkPqvchr0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693EC760C1;
 Fri, 14 Jan 2022 13:52:37 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CAC4105B20E;
 Fri, 14 Jan 2022 13:52:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/16] docs: Correct 'vhost-user-blk' spelling
Date: Fri, 14 Jan 2022 14:52:15 +0100
Message-Id: <20220114135226.185407-6-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220107105420.395011-2-f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 3e5a9dc032..9b0eaba6e5 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -201,7 +201,7 @@ Export raw image file ``disk.img`` over NBD UNIX domain socket ``nbd.sock``::
       --nbd-server addr.type=unix,addr.path=nbd.sock \
       --export type=nbd,id=export,node-name=disk,writable=on
 
-Export a qcow2 image file ``disk.qcow2`` as a vhosts-user-blk device over UNIX
+Export a qcow2 image file ``disk.qcow2`` as a vhost-user-blk device over UNIX
 domain socket ``vhost-user-blk.sock``::
 
   $ qemu-storage-daemon \
-- 
2.31.1


