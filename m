Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03604E325E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:44:25 +0100 (CET)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPpA-0006t2-Aq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:44:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmi-00050A-Ki
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmf-0006JO-TP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647898901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCTcHVbYb1YfYF08FZ/Qz/RAMPM8ZaRDECqKU9dIBJI=;
 b=dSDhR6A7ftQbJttFBkgJjjpCOlh90PQ5LrFI6XL2YL8n522O4ALo1uL0419pvAAE5NeFV5
 yxqI/fDlygbBVEmH6L2MAh75BVRhgTE8VcvkjhHfhDERUAC7pp9aTUsjk1lHVAI7GOCngW
 b03zvkifPAj0fPC2BRnCwidfj7eTxD8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-AxEU3sliNfKzuPGicOQr1Q-1; Mon, 21 Mar 2022 17:41:40 -0400
X-MC-Unique: AxEU3sliNfKzuPGicOQr1Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 976681C0906F;
 Mon, 21 Mar 2022 21:41:38 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304B044198E;
 Mon, 21 Mar 2022 21:41:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] docs: Consistent typography for options of qemu-nbd
Date: Mon, 21 Mar 2022 16:41:33 -0500
Message-Id: <20220321214134.597006-3-eblake@redhat.com>
In-Reply-To: <20220321214134.597006-1-eblake@redhat.com>
References: <20220321214134.597006-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefer the :option:`--name` form when cross-referencing other options
from the qemu-nbd documentation.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220314203818.3681277-2-eblake@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/tools/qemu-nbd.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 2b8c90c35498..4c950f61998e 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -27,7 +27,7 @@ Options
 .. program:: qemu-nbd

 *filename* is a disk image filename, or a set of block
-driver options if ``--image-opts`` is specified.
+driver options if :option:`--image-opts` is specified.

 *dev* is an NBD device.

@@ -165,9 +165,9 @@ driver options if ``--image-opts`` is specified.
 .. option:: --tls-creds=ID

   Enable mandatory TLS encryption for the server by setting the ID
-  of the TLS credentials object previously created with the --object
-  option; or provide the credentials needed for connecting as a client
-  in list mode.
+  of the TLS credentials object previously created with the
+  :option:`--object` option; or provide the credentials needed for
+  connecting as a client in list mode.

 .. option:: --tls-hostname=hostname

@@ -176,11 +176,11 @@ driver options if ``--image-opts`` is specified.
   against information in the server provided certificate. Sometimes
   it might be required to override the hostname used to perform this
   check. For example, if the NBD client is using a tunnel from localhost
-  to connect to the remote server, the `--tls-hostname` option should
+  to connect to the remote server, the :option:`--tls-hostname` option should
   be used to set the officially expected hostname of the remote NBD
   server. This can also be used if accessing NBD over a UNIX socket
   where there is no inherent hostname available. This is only permitted
-  when acting as a NBD client with the `--list` option.
+  when acting as a NBD client with the :option:`--list` option.

 .. option:: --fork

-- 
2.35.1


