Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C64375B5C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:04:23 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejIK-0002BP-9W
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBO-0005ON-Db
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBI-0005YN-Im
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=najyOKa4OMMiEhLX4pW0KgZbca/nbW78HPk/QQf4xDY=;
 b=b/BYlceF9DQnOoEBxq5MICU7Qf+aIk5PnBkRPGFnpzhGjX7ZdhtEgDzVjL+SxJ96YzCEwE
 /O18mrky5fYxS494FttImwAC707Fi7mvin1HuewwdAEKHGx5rDQ6kV70U/v8RDS7WyZzln
 XOA3AXL4AZKsQo/l/cR/nDPmNOlSoaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-A0v8fMiNO6iF-zEqlVqJdg-1; Thu, 06 May 2021 14:56:59 -0400
X-MC-Unique: A0v8fMiNO6iF-zEqlVqJdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53441922962;
 Thu,  6 May 2021 18:56:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0802119C46;
 Thu,  6 May 2021 18:56:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 03/12] virtiofsd: Add help for -o xattr-mapping
Date: Thu,  6 May 2021 19:56:32 +0100
Message-Id: <20210506185641.284821-4-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>

The option is not documented in help.

Add small help about the option.

Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
Message-Id: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 tools/virtiofsd/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 28243b51b2..5e98ed702b 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -172,6 +172,9 @@ void fuse_cmdline_help(void)
            "                               default: no_writeback\n"
            "    -o xattr|no_xattr          enable/disable xattr\n"
            "                               default: no_xattr\n"
+           "    -o xattrmap=<mapping>      Enable xattr mapping (enables xattr)\n"
+           "                               <mapping> is a string consists of a series of rules\n"
+           "                               e.g. -o xattrmap=:map::user.virtiofs.:\n"
            "    -o modcaps=CAPLIST         Modify the list of capabilities\n"
            "                               e.g. -o modcaps=+sys_admin:-chown\n"
            "    --rlimit-nofile=<num>      set maximum number of file descriptors\n"
-- 
2.31.1


