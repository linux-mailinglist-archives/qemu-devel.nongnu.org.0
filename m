Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F11AABBC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 17:23:56 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOjtL-0004Cu-Gv
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 11:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1jOjs0-0002rR-KO
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 11:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1jOjrz-00027O-Ev
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 11:22:32 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:41692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1jOjrz-00027C-AY
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 11:22:31 -0400
Received: by mail-ot1-x334.google.com with SMTP id f52so244837otf.8
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DFy+ChVYIUarTQAJg0/nyLApUHfl1jA+3AToMlPlGQ=;
 b=esMj1QFXQ1c53wZCBqddXQr0AfYAis/0opIy3beKC0jgPJrC9CjGSU46DjuX0vd14/
 dh1zjA9VAMLsLw84vsSQ0PKGWBp5qy9aZ2GYM5Bw2Qx2ZbYyh65UPM1MSuNTQlV6crfn
 VlhpVgqh78t/LFGAWPrXu0izHg7Y2jaKVyTgDKXl/CpDn6uia0upDUS+1/mo1XL+i9Zb
 zFF3EGyg7TaBQyQx0icp4X6Xg4ySbzqsVFyieewWzi4b0ePkyVC+TQKUFPipskQr0t59
 f5y+TZ+iKxzWxw2NdUMEsemraYbcvWzm3daPgICQF6Tx0m3rNkTq/JJ8krGoLX0+e1v/
 Eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3DFy+ChVYIUarTQAJg0/nyLApUHfl1jA+3AToMlPlGQ=;
 b=BCI82C6autNa2UlYNUqmMlqJUDxn7QP1SD0P/DTNgxivyqGSTIINNGLYs1J3yu+L3n
 eKIvuQ++X4umwxCZjtQBex1zwK9RufYsGnEiNvny3nFSN74+sREMfNu7A0kX4ZBtt23r
 TaNF3UJwqKWOmjISURVe0haXmGco5Qw2ivB2K9ttLClcuVbW6N9NgB6u+BmUedVFjiWR
 aVCcealNmH/Vaiwp3FVuXutfDkrKnm7jdFcQdJM8LsJEXDeMbT1VHG/IZXmf0MHZx0lO
 4tkzD3tqvn17Qs+3tCV61xNhUb/0PDMeV5t8HQMGPw3t3DT1QSuOrmvR1zLLhoXmBJ+F
 UO3Q==
X-Gm-Message-State: AGi0PuY7ZJ3n/c5z4pIPsRCw2HCDhtJ8cEkfVE3xINw2W3LGkh9PZXzO
 iJ4jpq9DFTfV32AtvKCiRW5CQZZcciA=
X-Google-Smtp-Source: APiQypLbq0RRfmQDty2km2+vB2cP7tOw8RwJ+DiygsdDJlOOmJaenj2/K4yqPqenE5f18TpNV3vRBw==
X-Received: by 2002:a9d:6414:: with SMTP id h20mr13638502otl.286.1586964150139; 
 Wed, 15 Apr 2020 08:22:30 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id d23sm6346720ote.70.2020.04.15.08.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 08:22:29 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 1/4] Revert "prevent crash when executing
 guest-file-read with large count"
Date: Wed, 15 Apr 2020 10:21:59 -0500
Message-Id: <20200415152202.14463-2-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415152202.14463-1-mdroth@linux.vnet.ibm.com>
References: <20200415152202.14463-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

As noted by Daniel Berrangé in [*], the fix from commit 807e2b6fce
which replaced malloc() by try_malloc() is not enough, the process
can still run out of memory a few line later:

 346     buf = g_try_malloc0(count + 1);
 347     if (!buf) {
 348         error_setg(errp,
 349                    "failed to allocate sufficient memory "
 350                    "to complete the requested service");
 351         return NULL;
 352     }
 353     is_ok = ReadFile(fh, buf, count, &read_count, NULL);
 354     if (!is_ok) {
 355         error_setg_win32(errp, GetLastError(), "failed to read file");
 356         slog("guest-file-read failed, handle %" PRId64, handle);
 357     } else {
 358         buf[read_count] = 0;
 359         read_data = g_new0(GuestFileRead, 1);
                         ^^^^^^

Instead we are going to put a low hard limit on 'count' in the next
commits. This reverts commit 807e2b6fce022707418bc8f61c069d91c613b3d2.

[*] https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg03471.html

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/commands-win32.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index b49920e201..46cea7d1d9 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -343,13 +343,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
     }
 
     fh = gfh->fh;
-    buf = g_try_malloc0(count + 1);
-    if (!buf) {
-        error_setg(errp,
-                   "failed to allocate sufficient memory "
-                   "to complete the requested service");
-        return NULL;
-    }
+    buf = g_malloc0(count + 1);
     is_ok = ReadFile(fh, buf, count, &read_count, NULL);
     if (!is_ok) {
         error_setg_win32(errp, GetLastError(), "failed to read file");
-- 
2.17.1


