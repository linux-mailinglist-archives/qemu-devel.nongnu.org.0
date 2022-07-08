Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221656BE54
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:51:06 +0200 (CEST)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rC4-0000FN-Tn
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDO-0006Bq-6K
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:22 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDM-0002Y0-5W
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b2so16657171plx.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Z/3Dbr+/QrC8cn7TV42VKcjGJrg87Itb54NG8zLcNw=;
 b=p4hQzLPICnUpOLOSIrooAeEV0I8IJaC4V251azmGcCkHvDgFr7/cH8NBU/8NW1uo9U
 +nq2VtFp5QVd5IW5+tc9s/+EqW0XwSRTsAo1kj+VlV4ixGQ5aXTH8P0ZPQyLrcRZ5Sht
 R+d8zn6hTwXOXcgdG68c+6gsZ/jsczH2dkGHQJ+WmqBaeHMruVuGBRt40/LoIBl9JFdm
 xy+RLOW98ztWgNt95dbKm2kv2v2cHRrG8a4rIwRwbrIs9HFwoGjxi8PQt7pxEqFcyXvr
 8c1taC1xusBFFxSba6E4Yibj09WB7fLqIMdUI6f1/3iU2e0Nu9Xo9nqJu2BkwzXNNiWG
 MlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Z/3Dbr+/QrC8cn7TV42VKcjGJrg87Itb54NG8zLcNw=;
 b=fmLAKr2jq/2d9swLL1itcrOsMk+OFMMso89PuoZa9SU8XEILSjCnIFUEDiWCWWgToV
 IyQJ5AX/lARx/hzRHcu+KIEQr0rI68/LxA74KRf6/iVDGYSQ2gcPc+/7x0LB2Hm2hWP2
 ve92tXNC8C2+x5qAzPPgri0iaURDtH76bCfz4W282GYlYtZGLfQsQMDM9Xr31v9w5B8J
 z4HD0oxcv3WAc0tydieNZhS41qA3+90XPbe2Ygqqp1l05rKzS8KcFN6qGnnQdQnhlUNc
 xb/y4oct0kUNyNaUAeoYGDBONjXBYo/qv9FmuKKcnaDkqHt1HsI2cjdUDgkbtPYcWJE8
 Kgfw==
X-Gm-Message-State: AJIora/w0Y1iNSPTC0VXrytwaOpIyOBWsVmk1tnfunKmu/1Woam8V7L/
 WneweKkXPtlq3+86VigobuRE7TzdPMjFMG5h
X-Google-Smtp-Source: AGRyM1u3nTO35Y4Cm/A71XQJeZJzEQsiZYU9pdCtrrBOyebnnJgMldT/8tIiWRWyOQql7ENgrxQ6vw==
X-Received: by 2002:a17:903:228b:b0:16b:ee10:b91 with SMTP id
 b11-20020a170903228b00b0016bee100b91mr4445375plh.27.1657295299400; 
 Fri, 08 Jul 2022 08:48:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 24/29] Add --fulldump and --diffdup options
Date: Fri,  8 Jul 2022 21:16:55 +0530
Message-Id: <20220708154700.18682-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

These allow the inspection of the trace files.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/risu.c b/risu.c
index f613fa9..8d907d9 100644
--- a/risu.c
+++ b/risu.c
@@ -484,23 +484,101 @@ static int apprentice(void)
     }
 }
 
-static int ismaster;
+static int dump_trace(bool isfull)
+{
+    RisuResult res;
+    int tick = 0;
+
+    while (1) {
+        struct reginfo *this_ri;
+
+        this_ri = &ri[tick & 1];
+        res = recv_register_info(this_ri);
+
+        switch (res) {
+        case RES_OK:
+            switch (header.risu_op) {
+            case OP_COMPARE:
+            case OP_TESTEND:
+            case OP_SIGILL:
+                printf("%s: (pc %#lx)\n", op_name(header.risu_op),
+                       (unsigned long)header.pc);
+
+                if (isfull || tick == 0) {
+                    reginfo_dump(this_ri, stdout);
+                } else {
+                    struct reginfo *prev_ri = &ri[(tick - 1) & 1];
+
+                    if (reginfo_is_eq(prev_ri, this_ri)) {
+                        /*
+                         * ??? There should never be no change -- at minimum
+                         * PC should have advanced.  But for completeness...
+                         */
+                        printf("change detail: none\n");
+                    } else {
+                        printf("change detail (prev : next):\n");
+                        reginfo_dump_mismatch(prev_ri, this_ri, stdout);
+                    }
+                }
+                putchar('\n');
+                if (header.risu_op == OP_TESTEND) {
+                    return EXIT_SUCCESS;
+                }
+                tick++;
+                break;
+
+            case OP_COMPAREMEM:
+                /* TODO: Dump 8k of data? */
+                /* fall through */
+            default:
+                printf("%s\n", op_name(header.risu_op));
+                break;
+            }
+            break;
+
+        case RES_BAD_IO:
+            fprintf(stderr, "I/O error\n");
+            return EXIT_FAILURE;
+        case RES_BAD_MAGIC:
+            fprintf(stderr, "Unexpected magic number: %#08x\n", header.magic);
+            return EXIT_FAILURE;
+        case RES_BAD_SIZE:
+            fprintf(stderr, "Unexpected payload size: %u\n", header.size);
+            return EXIT_FAILURE;
+        case RES_BAD_OP:
+            fprintf(stderr, "Unexpected opcode: %d\n", header.risu_op);
+            return EXIT_FAILURE;
+        default:
+            fprintf(stderr, "Unexpected recv result %d\n", res);
+            return EXIT_FAILURE;
+        }
+    }
+}
+
+enum {
+    DO_APPRENTICE,
+    DO_MASTER,
+    DO_FULLDUMP,
+    DO_DIFFDUMP,
+};
+
+static int operation = DO_APPRENTICE;
 
 static void usage(void)
 {
     fprintf(stderr,
-            "Usage: risu [--master] [--host <ip>] [--port <port>] <image file>"
-            "\n\n");
-    fprintf(stderr,
-            "Run through the pattern file verifying each instruction\n");
-    fprintf(stderr, "between master and apprentice risu processes.\n\n");
-    fprintf(stderr, "Options:\n");
-    fprintf(stderr, "  --master          Be the master (server)\n");
-    fprintf(stderr, "  -t, --trace=FILE  Record/playback " TRACE_TYPE " trace file\n");
-    fprintf(stderr,
-            "  -h, --host=HOST   Specify master host machine (apprentice only)"
-            "\n");
-    fprintf(stderr,
+            "Usage: risu [--master|--fulldump|--diffdump]\n"
+            "            [--host <ip>] [--port <port>] <image file>\n"
+            "\n"
+            "Run through the pattern file verifying each instruction\n"
+            "between master and apprentice risu processes.\n"
+            "\n"
+            "Options:\n"
+            "  --master          Be the master (server)\n"
+            "  --fulldump        Dump each record\n"
+            "  --diffdump        Dump difference between each record\n"
+            "  -t, --trace=FILE  Record/playback " TRACE_TYPE " trace file\n"
+            "  -h, --host=HOST   Specify master host machine\n"
             "  -p, --port=PORT   Specify the port to connect to/listen on "
             "(default 9191)\n");
     if (arch_extra_help) {
@@ -512,7 +590,9 @@ static struct option * setup_options(char **short_opts)
 {
     static struct option default_longopts[] = {
         {"help", no_argument, 0, '?'},
-        {"master", no_argument, &ismaster, 1},
+        {"master", no_argument, &operation, DO_MASTER},
+        {"fulldump", no_argument, &operation, DO_FULLDUMP},
+        {"diffdump", no_argument, &operation, DO_DIFFDUMP},
         {"host", required_argument, 0, 'h'},
         {"port", required_argument, 0, 'p'},
         {"trace", required_argument, 0, 't'},
@@ -520,7 +600,7 @@ static struct option * setup_options(char **short_opts)
     };
     struct option *lopts = &default_longopts[0];
 
-    *short_opts = "h:p:t:";
+    *short_opts = "d:h:p:t:";
 
     if (arch_long_opts) {
         const size_t osize = sizeof(struct option);
@@ -551,6 +631,7 @@ int main(int argc, char **argv)
     char *trace_fn = NULL;
     struct option *longopts;
     char *shortopts;
+    bool ismaster;
 
     longopts = setup_options(&shortopts);
 
@@ -586,6 +667,8 @@ int main(int argc, char **argv)
         }
     }
 
+    ismaster = operation == DO_MASTER;
+
     if (trace) {
         if (strcmp(trace_fn, "-") == 0) {
             comm_fd = ismaster ? STDOUT_FILENO : STDIN_FILENO;
@@ -609,6 +692,10 @@ int main(int argc, char **argv)
         }
     }
 
+    if (operation == DO_FULLDUMP || operation == DO_DIFFDUMP) {
+        return dump_trace(operation == DO_FULLDUMP);
+    }
+
     imgfile = argv[optind];
     if (!imgfile) {
         fprintf(stderr, "Error: must specify image file name\n\n");
-- 
2.34.1


