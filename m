Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BA1C8A3C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 14:15:23 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWfQw-0005CR-Hb
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 08:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNR-0000pB-Hm
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:11:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNQ-0001IW-R9
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588853503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7CZXWmOlzkPDw3ChgdIHxPbxxhNLd9Vo76+h31WmPg=;
 b=D4Zm97/y+Pu2OPnk9/6+iXQy7JCQrhudAZMuVBoKTTjBmz56asXzfe/CFFaSs/l32Zbebs
 nMaq3+N2TdNMRx9OSgJSwUBzE567uFH5qgFDoC/tZYj3DUkSaOgHpyMrWWNJPQAlcKcqXx
 8nbPQ8I/TzX30F3kfaSu/HDHTvPL1Eo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-fS2J4axrNo2BfxXlY4vfWA-1; Thu, 07 May 2020 08:11:42 -0400
X-MC-Unique: fS2J4axrNo2BfxXlY4vfWA-1
Received: by mail-wm1-f69.google.com with SMTP id n127so2416320wme.4
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZ2/ambaHE8VhJjgmhxpgBUMEyLaxhrdquoTUVQ9dy0=;
 b=VzsIYPHbElrLEmSvDgribxFhfxR4u81DGv7ndXwYzTwzr9PfJEMZOQ8qwWWKQrcDSf
 Tg8Eh7w5Tvjcik0P07M0pAUXbpEJ2w2vJeuGsv/hDq+itt3jjQVshPhACbYqrQw2ooSA
 l4j9HUK9GnCx5zHDVjRjGt3VpKDVXyCueOAXMM+Lmrv3Ht9V6ufn55eQDjHOef4dxPv4
 MrMA4kinujCQnKgmboD19Bq+ZHGkO57VArs+C/NL1+TtQPxAtZGoW2QdMG/d6pjGp835
 d7b+c/6R0sb4OHP0DKsSidgYUTeCRqdgJlZ6J4ugvY3fqiwGflxNLcqjmxD6G5oxHg6F
 Jn0A==
X-Gm-Message-State: AGi0PuY2gUGvsUju+aSPWbNBdv14HVHTejym4t3NsqmQRhYlZ6SSUfJR
 +lp5dwdK/oOIojYfxu6Af06uiahNEBDXxUPiZ285ZQExYZ8V2j4S6uXfIarVmoiRmxS9KC420Lx
 Le9/TeRSrC+HvxsA=
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr10632098wmg.110.1588853500612; 
 Thu, 07 May 2020 05:11:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJSF8oG7QplyhjKGqHJMPP5ZsxjW4dc6j+pQ8T/c3dghHLieQonfoBK/OTVoWgUUdzHmJHBzg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr10632084wmg.110.1588853500427; 
 Thu, 07 May 2020 05:11:40 -0700 (PDT)
Received: from x1w.redhat.com (248.red-88-21-203.staticip.rima-tde.net.
 [88.21.203.248])
 by smtp.gmail.com with ESMTPSA id q2sm2372018wrm.42.2020.05.07.05.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 05:11:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] block/block-copy: Simplify block_copy_do_copy()
Date: Thu,  7 May 2020 14:11:29 +0200
Message-Id: <20200507121129.29760-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
References: <20200507121129.29760-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_copy_do_copy() is static, only used in block_copy_task_entry
with the error_is_read argument set. No need to check for it,
simplify.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block/block-copy.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 83e16c89d9..e8455b817a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -343,9 +343,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
             trace_block_copy_write_zeroes_fail(s, offset, ret);
-            if (error_is_read) {
-                *error_is_read =3D false;
-            }
+            *error_is_read =3D false;
         }
         return ret;
     }
@@ -393,9 +391,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
     ret =3D bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
     if (ret < 0) {
         trace_block_copy_read_fail(s, offset, ret);
-        if (error_is_read) {
-            *error_is_read =3D true;
-        }
+        *error_is_read =3D true;
         goto out;
     }
=20
@@ -403,9 +399,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopySta=
te *s,
                          s->write_flags);
     if (ret < 0) {
         trace_block_copy_write_fail(s, offset, ret);
-        if (error_is_read) {
-            *error_is_read =3D false;
-        }
+        *error_is_read =3D false;
         goto out;
     }
=20
--=20
2.21.3


