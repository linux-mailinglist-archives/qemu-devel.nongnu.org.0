Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F835A154
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:41:37 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsKG-0005mT-M1
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHq-00047u-Pj
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHl-0005tc-DL
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617979140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYWLUB2E8GDzKYa0c9L/kvr8wHOnSzE7AF83PnEM5g0=;
 b=M7q/P8irYe2kQcu52i39E9VzvGqDFUQQwwe9aNW33+imuoos0IQ6NLJvGOUIlmSwvnCHjW
 oj74EwGnChDX2wzK+gQwWYWN4l3NWZD7YMhiURswFnAeM1WARb1hwQ49gfU8yeCJcBNTod
 JzgCVwv4gGCUNpO9qThp/wM/9y+HAxk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-wedYxePeNcOoFyJgnJexAw-1; Fri, 09 Apr 2021 10:38:58 -0400
X-MC-Unique: wedYxePeNcOoFyJgnJexAw-1
Received: by mail-oi1-f199.google.com with SMTP id t14so1384712oic.18
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYWLUB2E8GDzKYa0c9L/kvr8wHOnSzE7AF83PnEM5g0=;
 b=pd3R3pLevV8IzEMD/aQ+Pvci5z6OE0IMifyNckUc6G5grggNFQnQWN7Q6O1AjdEjbB
 PrrNVPhsX+cCxEj1HtSTDBZiVtx+Y7UDjyQtN/h/0x/mpnYZAyF/QznBkqFp3XT4QaA7
 /kVKIn4QTSLYq8Eh635rD1YOGNYmCEMvGLaFz0Ud1/c46C0XCtNp49pCsBoA1rBMq6F1
 0xv0FuGGflDwhft8wjb1EXwvJJlNtQVF8rZ5X2IbX6acfk66EuhDumSr5kbp/uYhk7nd
 gVb1Fq06a4sRescbDaOsFaENwNnF5/cfEcFxTMNLhhbESaoPOc3m712ebLNFegImBt+Z
 dcKw==
X-Gm-Message-State: AOAM530vKWV2eV1LK31uBmW6sikPlqJYLiquwQy60LJrZRvkW2k721ru
 fttQfRFM9H63tCMQfwXQr8RDSEBnANCZXA8WGBe26/8jglPRiXPL7PrXY+x9lRNtq8r2KTGtXIz
 iATeu5MlKrE3voIk=
X-Received: by 2002:aca:b2c4:: with SMTP id
 b187mr10231754oif.149.1617979138019; 
 Fri, 09 Apr 2021 07:38:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqMJlBvjTiakGw1nrd6AD2m7XHt68xYB5ys8P1PSRyqwlEulai3EJaCgWo1FeSL+Ty/2dCkg==
X-Received: by 2002:aca:b2c4:: with SMTP id
 b187mr10231737oif.149.1617979137746; 
 Fri, 09 Apr 2021 07:38:57 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id e18sm647053otf.2.2021.04.09.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 07:38:57 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/2] block/rbd: Add an escape-aware strchr helper
Date: Fri,  9 Apr 2021 09:38:54 -0500
Message-Id: <20210409143854.138177-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409143854.138177-1-ckuehl@redhat.com>
References: <20210409143854.138177-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the parser needs to further split a token it has collected
from the token input stream. Right now, it does a cursory check to see
if the relevant characters appear in the token to determine if it should
break it down further.

However, qemu_rbd_next_tok() will escape characters as it removes tokens
from the token stream and plain strchr() won't. This can make the
initial strchr() check slightly misleading since it implies
qemu_rbd_next_tok() will find the token and split on it, except the
reality is that qemu_rbd_next_tok() will pass over it if it is escaped.

Use a custom strchr to avoid mixing escaped and unescaped string
operations.

Reported-by: Han Han <hhan@redhat.com>
Fixes: https://bugzilla.redhat.com/1873913
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
  v2 -> v3:
    * Update qemu_rbd_strchr to only skip if there's a delimiter AND the
      next character is not the NUL terminator

 block/rbd.c                | 20 ++++++++++++++++++--
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  3 +++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 9071a00e3f..291e3f09e1 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
     return src;
 }
 
+static char *qemu_rbd_strchr(char *src, char delim)
+{
+    char *p;
+
+    for (p = src; *p; ++p) {
+        if (*p == delim) {
+            return p;
+        }
+        if (*p == '\\' && p[1] != '\0') {
+            ++p;
+        }
+    }
+
+    return NULL;
+}
+
 static void qemu_rbd_unescape(char *src)
 {
     char *p;
@@ -171,7 +187,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
     qemu_rbd_unescape(found_str);
     qdict_put_str(options, "pool", found_str);
 
-    if (strchr(p, '@')) {
+    if (qemu_rbd_strchr(p, '@')) {
         image_name = qemu_rbd_next_tok(p, '@', &p);
 
         found_str = qemu_rbd_next_tok(p, ':', &p);
@@ -181,7 +197,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
         image_name = qemu_rbd_next_tok(p, ':', &p);
     }
     /* Check for namespace in the image_name */
-    if (strchr(image_name, '/')) {
+    if (qemu_rbd_strchr(image_name, '/')) {
         found_str = qemu_rbd_next_tok(image_name, '/', &image_name);
         qemu_rbd_unescape(found_str);
         qdict_put_str(options, "namespace", found_str);
diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
index 0f66d0ca36..8e6c6447c1 100755
--- a/tests/qemu-iotests/231
+++ b/tests/qemu-iotests/231
@@ -55,6 +55,10 @@ _filter_conf()
 $QEMU_IMG info "json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=${BOGUS_CONF}'}" 2>&1 | _filter_conf
 $QEMU_IMG info "json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'${BOGUS_CONF}'}" 2>&1 | _filter_conf
 
+# Regression test: the qemu-img invocation is expected to fail, but it should
+# not seg fault the parser.
+$QEMU_IMG create "rbd:rbd/aa\/bb:conf=${BOGUS_CONF}" 1M 2>&1 | _filter_conf
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
index 747dd221bb..a785a6e859 100644
--- a/tests/qemu-iotests/231.out
+++ b/tests/qemu-iotests/231.out
@@ -4,4 +4,7 @@ unable to get monitor info from DNS SRV with service name: ceph-mon
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
 unable to get monitor info from DNS SRV with service name: ceph-mon
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
+Formatting 'rbd:rbd/aa\/bb:conf=BOGUS_CONF', fmt=raw size=1048576
+unable to get monitor info from DNS SRV with service name: ceph-mon
+qemu-img: rbd:rbd/aa\/bb:conf=BOGUS_CONF: error connecting: No such file or directory
 *** done
-- 
2.30.2


