Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E3467394
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 09:57:15 +0100 (CET)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4NV-0008M3-S3
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 03:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4MO-0006qu-4p
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4ML-0006d1-Oi
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638521761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SIyqLb58VL/uc9DW3UdddMbuwXUW56ZFl4zJQNeS+Y=;
 b=XHD1XN7seXowXylhYZMkR6iz432TvAHkOMKh1MAAM+Ge3upl3QIJylNbyyNjS2G8U4b8yr
 gHcAoeMv9PYEmFqo0O0MP7om8bvfeYkyZ7AvWkvf8Nb2bE3twDXgS8mtXwwuFxIisQK1q3
 6wTq+Fu76jarz+9IwSU+Bsqr8OxdXG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-K3f01Fh4NsyHLet6-aJG7w-1; Fri, 03 Dec 2021 03:55:59 -0500
X-MC-Unique: K3f01Fh4NsyHLet6-aJG7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E12E80EF8C
 for <qemu-devel@nongnu.org>; Fri,  3 Dec 2021 08:55:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A86C75DF21;
 Fri,  3 Dec 2021 08:55:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC1021800395; Fri,  3 Dec 2021 09:55:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] seabios: update submodule to 1.15.0
Date: Fri,  3 Dec 2021 09:55:51 +0100
Message-Id: <20211203085552.347186-2-kraxel@redhat.com>
In-Reply-To: <20211203085552.347186-1-kraxel@redhat.com>
References: <20211203085552.347186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update seabios to the final release.  No code changes
compared to the snapshot merged a few weeks ago.

shortlog 64f37cc530f1..rel-1.15.0
---------------------------------

Kevin O'Connor (1):
      docs: Note v1.15.0 release

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index 64f37cc530f1..2dd4b9b3f840 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit 64f37cc530f144e53c190c9e8209a51b58fd5c43
+Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c
-- 
2.33.1


