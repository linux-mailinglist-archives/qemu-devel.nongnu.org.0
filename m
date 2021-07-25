Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE73D4D5A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:26:20 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dD1-0003ae-MS
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBB-0000Js-4s
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB9-0003mB-NA
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id b6so8874981pji.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ImKU68gTkjOHyhd7vGGn5r6p+r+U80RWmIEnEGwVIY=;
 b=vMgNlOiOKKBtx4bfpaRzhXSs9+yydGdUv+8iPTQMHW1+nP/JIwwhbRcMparv6ASxer
 NQSgaHwEk2XITN0aAMhf9kbFn4TnvZh5L2k3ivUKJ7kvwzYjxIZ7bbseYxdfH734mF74
 S5bBvxMhFHa7klf4/N9fyRmh8ZRZ5hFUUx3lLAHss6ZfsCBIO1dK9TS11U/0ZbcIwceq
 Y0uKDWZshSHPZA5JkuqE8UtpHguqnPscupOGuISl/eLfvQO2858m7M+BEMIWBKhXk6oY
 tJEG2470bW9pk2vEaOu/kDj8jGvTQNcsPlACUGyPmtCbGoH1zlinPjQvKC+rx2whtnHJ
 FYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ImKU68gTkjOHyhd7vGGn5r6p+r+U80RWmIEnEGwVIY=;
 b=ch+FtmuUtEQQVYolXTbMfUUdh17B+tmFW7ufUjAfRrkEv8EPGe86p3kkXoxdo9hMPl
 ODx5YoSqk7dyCxZzicSr+8LQ2dMGexeQ7WcPHzWoYp513tfHeRHxOLwzZbiO8OoN+FPF
 9NOm+T7qlnTkoD9+QCKgiBEOO+3ro63612rIVcR9zwfWdu+zKTKmiXXDKPtS7IZeOA17
 tcHO75xOsx2YusZs72O3Qcq3/oshgqpSeSx7s2QmSsNE9whWr3t+rYTtGBxofWlOVheU
 Hz6PJoUlgX1MUary9jpDqPRoAzYAGsKejZgDiHlthVrqjW5p6/Knjb54suajiaBpfodw
 WspQ==
X-Gm-Message-State: AOAM533+3WunnDBb2N6Ee4DgENcUyDoMl9XAo/f9bosYhmdk9Ijs+wAb
 oicKyVz2tYRokyE0tQlYGfxrNCYY0vmzAA==
X-Google-Smtp-Source: ABdhPJwLyglhw82ryynTtiSac2RVDEoZGu9y+mat++sfr1y0tNWy9QK0YUou4KnWXBBl3Fd8RLiiiQ==
X-Received: by 2002:a17:902:f542:b029:12c:6f4:ad92 with SMTP id
 h2-20020a170902f542b029012c06f4ad92mr3928399plf.5.1627215862461; 
 Sun, 25 Jul 2021 05:24:22 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 3/9] util/selfmap: Discard mapping on error
Date: Sun, 25 Jul 2021 02:24:10 -1000
Message-Id: <20210725122416.1391332-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
util/selfmap.c:26:21: error: variable 'errors' set but not used \
    [-Werror,-Wunused-but-set-variable]

Quite right of course, but there's no reason not to check errors.

First, incrementing errors is incorrect, because qemu_strtoul
returns an errno not a count -- just or them together so that
we have a non-zero value at the end.

Second, if we have an error, do not add the struct to the list,
but free it instead.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/selfmap.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/util/selfmap.c b/util/selfmap.c
index 2ec99dfdda..2c14f019ce 100644
--- a/util/selfmap.c
+++ b/util/selfmap.c
@@ -23,29 +23,34 @@ GSList *read_self_maps(void)
             gchar **fields = g_strsplit(lines[i], " ", 6);
             if (g_strv_length(fields) > 4) {
                 MapInfo *e = g_new0(MapInfo, 1);
-                int errors;
+                int errors = 0;
                 const char *end;
 
-                errors  = qemu_strtoul(fields[0], &end, 16, &e->start);
-                errors += qemu_strtoul(end + 1, NULL, 16, &e->end);
+                errors |= qemu_strtoul(fields[0], &end, 16, &e->start);
+                errors |= qemu_strtoul(end + 1, NULL, 16, &e->end);
 
                 e->is_read  = fields[1][0] == 'r';
                 e->is_write = fields[1][1] == 'w';
                 e->is_exec  = fields[1][2] == 'x';
                 e->is_priv  = fields[1][3] == 'p';
 
-                errors += qemu_strtoul(fields[2], NULL, 16, &e->offset);
+                errors |= qemu_strtoul(fields[2], NULL, 16, &e->offset);
                 e->dev = g_strdup(fields[3]);
-                errors += qemu_strtou64(fields[4], NULL, 10, &e->inode);
+                errors |= qemu_strtou64(fields[4], NULL, 10, &e->inode);
 
-                /*
-                 * The last field may have leading spaces which we
-                 * need to strip.
-                 */
-                if (g_strv_length(fields) == 6) {
-                    e->path = g_strdup(g_strchug(fields[5]));
+                if (!errors) {
+                    /*
+                     * The last field may have leading spaces which we
+                     * need to strip.
+                     */
+                    if (g_strv_length(fields) == 6) {
+                        e->path = g_strdup(g_strchug(fields[5]));
+                    }
+                    map_info = g_slist_prepend(map_info, e);
+                } else {
+                    g_free(e->dev);
+                    g_free(e);
                 }
-                map_info = g_slist_prepend(map_info, e);
             }
 
             g_strfreev(fields);
-- 
2.25.1


