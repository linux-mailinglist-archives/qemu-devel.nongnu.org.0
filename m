Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3556BE4B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:41:14 +0200 (CEST)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9r2X-0005vV-RG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD6-0005xM-Fe
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:04 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD4-0002Ws-Lz
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:04 -0400
Received: by mail-pl1-x634.google.com with SMTP id l12so11314275plk.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGqem9bZjG2DPsS841S7DVBWN/tLpAM4ih8tuyrEJjA=;
 b=U3jCDad59bvy9857Am6RQ1xs4MTmW8+/AIKxX7dWQ0SQBiV+T4yzaca3DbYxXoeF5g
 wgsKvBUNxqTF7yKC/DswQna4ILw4zPjViYaRtdxgn0m2RFFs/Lr1DdhC6dXsZ8v+t/L8
 CF6mzkDBnXB8nMJ/Bkr9vxNcKP7NYPmxkdBcNaePcPGxG4fFVHJv361kzKQk991tXj5B
 5zUdQFum1X+awyoZVE0u7UEUuy6d1ixR4UDN0+FGjVbpD1C1Csau8w3T68fGZHNC/rtB
 9k8BFCPOiW8QxDk6OSRP0UFUxdQMJkA4R7DRaYjHUqbYgqWpnCeQm9TXeEf2Rl1bmkaP
 2Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGqem9bZjG2DPsS841S7DVBWN/tLpAM4ih8tuyrEJjA=;
 b=jN8rlTA5ucu0mULKHI8jve5Mo87cszvirenGaI87mpptqpIrSsTVOdIgzgpu5vfKQB
 aSKvplJEIWK2VQBNY865BhRs+1fUfLGXHg9mp9OU4U1tRV6GlnJMa8nJkchtKAT3WNj0
 BFJye9/S4N9A44BwO91/wCP6Ar8At9jINKF0su/J4tzblJZwXisSnGq6YoNSK90kQF7J
 LLcu1xAnGhJiNRjLELJdF9GdYrT/MiwggNictmGUDpr3PPYyPWMCGTmawjppWgETq2Qt
 4LmpZge56QQugLSrIoRbwB5tLjMwO+P9hW79Xd5SnHquRYgmzNKyR0ync9zIxK/vY8bi
 eENw==
X-Gm-Message-State: AJIora8S8Mfn4lbUq2lGpkqfVa0KPs/V+LSfWuOqZEf+jnkZGuHgm5ch
 Am5FV/WKtcP9Ydg0iA3LsHfyoZXJSSrm4zXX
X-Google-Smtp-Source: AGRyM1v6r94R44ez11SQsZBeuooNwUqBjtlSWrABB7R9jjM9GH9zs2Hp/Ew/Bs1PzSou/UpInki0jw==
X-Received: by 2002:a17:902:d510:b0:16c:3cd:db78 with SMTP id
 b16-20020a170902d51000b0016c03cddb78mr4309535plg.17.1657295279790; 
 Fri, 08 Jul 2022 08:47:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 17/29] Add magic and size to the trace header
Date: Fri,  8 Jul 2022 21:16:48 +0530
Message-Id: <20220708154700.18682-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sanity check that we're not getting out of sync with
the trace stream.  This will be especially bad with
the change in size of the sve save data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h |  10 +++-
 risu.c | 162 ++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 136 insertions(+), 36 deletions(-)

diff --git a/risu.h b/risu.h
index dd9fda5..bfcf0af 100644
--- a/risu.h
+++ b/risu.h
@@ -55,7 +55,11 @@ typedef enum {
     RES_END,
     RES_MISMATCH_REG,
     RES_MISMATCH_MEM,
+    RES_MISMATCH_OP,
     RES_BAD_IO,
+    RES_BAD_MAGIC,
+    RES_BAD_SIZE,
+    RES_BAD_OP,
 } RisuResult;
 
 /* The memory block should be this long */
@@ -69,10 +73,14 @@ typedef enum {
 struct reginfo;
 
 typedef struct {
-   uintptr_t pc;
+   uint32_t magic;
+   uint32_t size;
    uint32_t risu_op;
+   uintptr_t pc;
 } trace_header_t;
 
+#define RISU_MAGIC  (('R' << 24) | ('I' << 16) | ('S' << 8) | 'U')
+
 /* Socket related routines */
 int master_connect(int port);
 int apprentice_connect(const char *hostname, int port);
diff --git a/risu.c b/risu.c
index 80bc3b1..a248db1 100644
--- a/risu.c
+++ b/risu.c
@@ -111,32 +111,54 @@ static RisuResult send_register_info(void *uc)
     uint64_t paramreg;
     RisuResult res;
     RisuOp op;
+    void *extra;
 
     reginfo_init(&ri[MASTER], uc);
     op = get_risuop(&ri[MASTER]);
 
     /* Write a header with PC/op to keep in sync */
+    header.magic = RISU_MAGIC;
     header.pc = get_pc(&ri[MASTER]);
     header.risu_op = op;
+
+    switch (op) {
+    case OP_TESTEND:
+    case OP_COMPARE:
+    case OP_SIGILL:
+        header.size = reginfo_size();
+        extra = &ri[MASTER];
+        break;
+    case OP_COMPAREMEM:
+        header.size = MEMBLOCKLEN;
+        extra = memblock;
+        break;
+    case OP_SETMEMBLOCK:
+    case OP_GETMEMBLOCK:
+        header.size = 0;
+        extra = NULL;
+        break;
+    default:
+        abort();
+    }
+
     res = write_buffer(&header, sizeof(header));
     if (res != RES_OK) {
         return res;
     }
+    if (extra) {
+        res = write_buffer(extra, header.size);
+        if (res != RES_OK) {
+            return res;
+        }
+    }
 
     switch (op) {
     case OP_COMPARE:
-    case OP_TESTEND:
     case OP_SIGILL:
-        /*
-         * Do a simple register compare on (a) explicit request
-         * (b) end of test (c) a non-risuop UNDEF
-         */
-        res = write_buffer(&ri[MASTER], reginfo_size());
-        /* For OP_TEST_END, force exit. */
-        if (res == RES_OK && op == OP_TESTEND) {
-            res = RES_END;
-        }
+    case OP_COMPAREMEM:
         break;
+    case OP_TESTEND:
+        return RES_END;
     case OP_SETMEMBLOCK:
         paramreg = get_reginfo_paramreg(&ri[MASTER]);
         memblock = (void *)(uintptr_t)paramreg;
@@ -145,12 +167,10 @@ static RisuResult send_register_info(void *uc)
         paramreg = get_reginfo_paramreg(&ri[MASTER]);
         set_ucontext_paramreg(uc, paramreg + (uintptr_t)memblock);
         break;
-    case OP_COMPAREMEM:
-        return write_buffer(memblock, MEMBLOCKLEN);
     default:
         abort();
     }
-    return res;
+    return RES_OK;
 }
 
 static void master_sigill(int sig, siginfo_t *si, void *uc)
@@ -175,22 +195,35 @@ static RisuResult recv_register_info(struct reginfo *ri)
         return res;
     }
 
-    /* send OK for the header */
-    respond(RES_OK);
+    if (header.magic != RISU_MAGIC) {
+        /* If the magic number is wrong, we can't trust the rest. */
+        return RES_BAD_MAGIC;
+    }
 
     switch (header.risu_op) {
     case OP_COMPARE:
     case OP_TESTEND:
     case OP_SIGILL:
-        return read_buffer(ri, reginfo_size());
+        /* If we can't store the data, report invalid size. */
+        if (header.size > sizeof(*ri)) {
+            return RES_BAD_SIZE;
+        }
+        respond(RES_OK);
+        return read_buffer(ri, header.size);
+
     case OP_COMPAREMEM:
+        if (header.size != MEMBLOCKLEN) {
+            return RES_BAD_SIZE;
+        }
+        respond(RES_OK);
         return read_buffer(other_memblock, MEMBLOCKLEN);
+
     case OP_SETMEMBLOCK:
     case OP_GETMEMBLOCK:
-        return RES_OK;
+        return header.size == 0 ? RES_OK : RES_BAD_SIZE;
+
     default:
-        /* TODO: Create a better error message. */
-        return RES_BAD_IO;
+        return RES_BAD_OP;
     }
 }
 
@@ -204,48 +237,71 @@ static RisuResult recv_and_compare_register_info(void *uc)
 
     res = recv_register_info(&ri[MASTER]);
     if (res != RES_OK) {
-        /* I/O error.  Tell master to exit. */
-        respond(RES_END);
-        return res;
+        goto done;
     }
 
     op = get_risuop(&ri[APPRENTICE]);
-    if (header.risu_op != op) {
-        /* We are out of sync.  Tell master to exit. */
-        respond(RES_END);
-        return RES_BAD_IO;
-    }
 
     switch (op) {
     case OP_COMPARE:
     case OP_TESTEND:
     case OP_SIGILL:
-        if (!reginfo_is_eq(&ri[MASTER], &ri[APPRENTICE])) {
+        /*
+         * If we have nothing to compare against, report an op mismatch.
+         * Otherwise allow the compare to continue, and assume that
+         * something in the reginfo will be different.
+         */
+        if (header.risu_op != OP_COMPARE &&
+            header.risu_op != OP_TESTEND &&
+            header.risu_op != OP_SIGILL) {
+            res = RES_MISMATCH_OP;
+        } else if (!reginfo_is_eq(&ri[MASTER], &ri[APPRENTICE])) {
             /* register mismatch */
             res = RES_MISMATCH_REG;
+        } else if (op != header.risu_op) {
+            /* The reginfo matched.  We should have matched op. */
+            res = RES_MISMATCH_OP;
         } else if (op == OP_TESTEND) {
             res = RES_END;
         }
-        respond(res == RES_OK ? RES_OK : RES_END);
         break;
+
     case OP_SETMEMBLOCK:
+        if (op != header.risu_op) {
+            res = RES_MISMATCH_OP;
+            break;
+        }
         paramreg = get_reginfo_paramreg(&ri[APPRENTICE]);
         memblock = (void *)(uintptr_t)paramreg;
         break;
+
     case OP_GETMEMBLOCK:
+        if (op != header.risu_op) {
+            res = RES_MISMATCH_OP;
+            break;
+        }
         paramreg = get_reginfo_paramreg(&ri[APPRENTICE]);
         set_ucontext_paramreg(uc, paramreg + (uintptr_t)memblock);
         break;
+
     case OP_COMPAREMEM:
+        if (op != header.risu_op) {
+            res = RES_MISMATCH_OP;
+            break;
+        }
         if (memcmp(memblock, other_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
             res = RES_MISMATCH_MEM;
         }
-        respond(res == RES_OK ? RES_OK : RES_END);
         break;
+
     default:
         abort();
     }
+
+ done:
+    /* On error, tell master to exit. */
+    respond(res == RES_OK ? RES_OK : RES_END);
     return res;
 }
 
@@ -346,6 +402,25 @@ static int master(void)
     }
 }
 
+static const char *op_name(RisuOp op)
+{
+    switch (op) {
+    case OP_SIGILL:
+        return "SIGILL";
+    case OP_COMPARE:
+        return "COMPARE";
+    case OP_TESTEND:
+        return "TESTEND";
+    case OP_SETMEMBLOCK:
+        return "SETMEMBLOCK";
+    case OP_GETMEMBLOCK:
+        return "GETMEMBLOCK";
+    case OP_COMPAREMEM:
+        return "COMPAREMEM";
+    }
+    abort();
+}
+
 static int apprentice(void)
 {
     RisuResult res = sigsetjmp(jmpbuf, 1);
@@ -364,7 +439,7 @@ static int apprentice(void)
         return EXIT_SUCCESS;
 
     case RES_MISMATCH_REG:
-        fprintf(stderr, "mismatch reg after %zd checkpoints\n", signal_count);
+        fprintf(stderr, "Mismatch reg after %zd checkpoints\n", signal_count);
         fprintf(stderr, "master reginfo:\n");
         reginfo_dump(&ri[MASTER], stderr);
         fprintf(stderr, "apprentice reginfo:\n");
@@ -373,15 +448,32 @@ static int apprentice(void)
         return EXIT_FAILURE;
 
     case RES_MISMATCH_MEM:
-        fprintf(stderr, "mismatch mem after %zd checkpoints\n", signal_count);
+        fprintf(stderr, "Mismatch mem after %zd checkpoints\n", signal_count);
+        return EXIT_FAILURE;
+
+    case RES_MISMATCH_OP:
+        /* Out of sync, but both opcodes are known valid. */
+        fprintf(stderr, "Mismatch header after %zd checkpoints\n"
+                "mismatch detail (master : apprentice):\n"
+                "  opcode: %s vs %s\n",
+                signal_count, op_name(header.risu_op),
+                op_name(get_risuop(&ri[APPRENTICE])));
         return EXIT_FAILURE;
 
     case RES_BAD_IO:
-        fprintf(stderr, "i/o error after %zd checkpoints\n", signal_count);
+        fprintf(stderr, "I/O error\n");
+        return EXIT_FAILURE;
+    case RES_BAD_MAGIC:
+        fprintf(stderr, "Unexpected magic number: %#08x\n", header.magic);
+        return EXIT_FAILURE;
+    case RES_BAD_SIZE:
+        fprintf(stderr, "Unexpected payload size: %u\n", header.size);
+        return EXIT_FAILURE;
+    case RES_BAD_OP:
+        fprintf(stderr, "Unexpected opcode: %d\n", header.risu_op);
         return EXIT_FAILURE;
-
     default:
-        fprintf(stderr, "unexpected result %d\n", res);
+        fprintf(stderr, "Unexpected result %d\n", res);
         return EXIT_FAILURE;
     }
 }
-- 
2.34.1


