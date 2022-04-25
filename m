Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8550E3AE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:50:57 +0200 (CEST)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj03E-0002vk-9s
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgr-0006e8-Ml
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:52 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgp-0004pp-85
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so1324267pjq.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MD+TlSLDLHY/kSu2Q8HsMnto1MgxQkrIjJ5UvAZq3eQ=;
 b=GErlpZe44nq39km9zcAD9LtPCWaNJ4/ntka10jdJ1iTfjdpyDY9+1N8mOw+52pZf61
 A6uk6gPUSy+mu6tjKP25mvJDY2aLwITv1S5xFPiY2bf+TAIGqm5i2OTuHs150snkmuP+
 nGOyGMBRkz7NKrAPUwGggQDip3P7PeGElSJVcMr4wGWduBzgsT0BCYEm5OHu8WGByMah
 HXTfsn3XEqIB104nGOLpf9VyjXShjjOIPHBV99ahwY9tNN4em1ss7xBuGtwBoPLtURe7
 jhKwjf3CzE00N7LSOSGsbwXTEFta9k/PaG8wwWCx9vq116qFQ+FZUZsgALWsIp7FsHjr
 eLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MD+TlSLDLHY/kSu2Q8HsMnto1MgxQkrIjJ5UvAZq3eQ=;
 b=h4tKRnLPDNikaxk+8VnKPmorR2XmKsfbpZ+H29RVy/dXoztWxTuWzBvg9ZTtRGTLui
 2vDwPxd1c0IqBCME6uOD1325W9C5I0xakq4+/jQMBhPkhWMf9CclXmvkewDwTa+wt0yH
 0H3o1ETJAH+M8Z26aI968HWL22N0/8mu1hJDPGC3hkcn2wuCWN6RZTBXYfHalh2fX8C/
 cVJKxAmtvpkVzWdCyCiUvsRqDz+m0dt/PByzedEBJTwPYHbPBy7l1HmG862AE/IsoWRX
 9c1jLs2TfFofCF4Iq1VLuYDeHm26FA18eVdjoGLQ/z+4W7sLJdvfYPptVPzEfOL6R9h5
 AASA==
X-Gm-Message-State: AOAM530kf2znEC0vW46mLBo+dFpsDzkj3QaBQ0J4+/k1nXCBrHy6Utew
 889m6wEhijnkP+F8M+hmyLHotfarNrs=
X-Google-Smtp-Source: ABdhPJyCrCXkfbOtCmPVZoqh9j8OTDRv0lihKhnECWo5xXCSyhxr3VjAKrfCsSxymUzmU+hWoUKsLw==
X-Received: by 2002:a17:903:1246:b0:155:c376:e5a0 with SMTP id
 u6-20020a170903124600b00155c376e5a0mr17637946plh.167.1650896866046; 
 Mon, 25 Apr 2022 07:27:46 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/9p: win32: Translate Windows error number to Linux
 value
Date: Mon, 25 Apr 2022 22:27:05 +0800
Message-Id: <20220425142705.2099270-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Some of Windows error numbers have different value from Linux ones.
For example, ENOTEMPTY is defined to 39 in Linux, but is defined to
41 in Windows. So deleting a directory from a Linux guest on top
of QEMU from a Windows host complains:

  # rmdir tmp
  rmdir: 'tmp': Unknown error 41

This commit provides error number traslation from Windows to Linux.
It can make Linux guest OS happy with the error number when running
on top of QEMU from a Windows host.

This has a side effet that it requires all guest OSes' 9pfs drivers
to use the same errno.

It looks like macOS has different errno too so using 9p in a Linux
on top of QEMU from a macOS host may also fail in the above case.
I suspect we only tested 9p from a macOS guest on top of QEMU from
a macOS host, so this issue was not exposed.

I am not aware of Windows's native support for 9pfs so I think using
the Linux errnor as the standard is probably okay, but I am open for
suggestions.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.h            |  4 ++++
 hw/9pfs/9p-util-win32.c | 38 ++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c            |  7 +++++++
 3 files changed, 49 insertions(+)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 87e8eac840..db2013d549 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -490,6 +490,10 @@ void pdu_free(V9fsPDU *pdu);
 void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
 void v9fs_reset(V9fsState *s);
 
+#ifdef CONFIG_WIN32
+int errno_translate_win32(int errno_win32);
+#endif
+
 struct V9fsTransport {
     ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
                                 va_list ap);
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index d9b35e7425..c4f90c6503 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -20,6 +20,11 @@
 #define V9FS_MAGIC 0x53465039 /* string "9PFS" */
 #endif
 
+struct translate_map {
+    int output;     /* Linux error number */
+    int input;      /* Windows error number */
+};
+
 static int build_ads_name(char *namebuf, size_t namebuflen,
                           const char *dirname, const char *filename,
                           const char *ads_name)
@@ -301,3 +306,36 @@ int qemu_statfs(const char *fs_root, struct statfs *stbuf)
 
     return 0;
 }
+
+int errno_translate_win32(int errno_win32)
+    {
+    unsigned int i;
+
+    /*
+     * The translation table only contains values which could be returned
+     * as a result of a filesystem operation, i.e. network/socket related
+     * errno values need not be considered for translation.
+     */
+    static struct translate_map errno_map[] = {
+        /* Linux errno          Windows errno   */
+        { L_EDEADLK,            EDEADLK         },
+        { L_ENAMETOOLONG,       ENAMETOOLONG    },
+        { L_ENOLCK,             ENOLCK          },
+        { L_ENOSYS,             ENOSYS          },
+        { L_ENOTEMPTY,          ENOTEMPTY       },
+        { L_EILSEQ,             EILSEQ          },
+        { L_ELOOP,              ELOOP           },
+    };
+
+    /* scan errno_win32 table for a matching Linux errno value */
+
+    for (i = 0; i < sizeof(errno_map) / sizeof(errno_map[0]); i++) {
+        if (errno_win32 == errno_map[i].input) {
+            return errno_map[i].output;
+        }
+    }
+
+    /* no translation necessary */
+
+    return errno_win32;
+    }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a04889c1d6..0a9c0a509e 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1062,6 +1062,13 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu, ssize_t len)
             id = P9_RERROR;
         }
 
+#ifdef CONFIG_WIN32
+        /*
+         * Some Windows errnos have different value from Linux,
+         * and they need to be translated to the Linux value.
+         */
+        err = errno_translate_win32(err);
+#endif
         ret = pdu_marshal(pdu, len, "d", err);
         if (ret < 0) {
             goto out_notify;
-- 
2.25.1


