Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124674C5329
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 02:56:51 +0100 (CET)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmKH-00015E-MF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 20:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNmIe-0000Ou-9d
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:55:08 -0500
Received: from [2607:f8b0:4864:20::636] (port=34305
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNmIc-00043F-Qa
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:55:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id ay5so3389699plb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFOAZuIlL1arqH9J0yDRuOKWrMkMqQUV8n3LI+yVXsE=;
 b=qYFr3hH2AxcOlUGzaQc/UnkK2FdwlMoMnrpVtHo36Hsio5DXReR1mqqSobpiJTCnSO
 kCMO32xSdgUoJmRteRwaODlbJ0QrrqElrdXqph2+7+H81V2PNFudaeEcu3DUxXioI7Y+
 mwoM1lLqZ08G07qGVi5ZrwnZgd+Q8TeFLwmB3zghmdNdDDzloItQrrGdiGxylQhizHN/
 Gnb3pOtjTp7NED00WDtgzY4tPHZFdyvDgq8c96H7zJ6q96KGwnPgn18VwloRjEFyA4EU
 RLJJamLdFBaaBjljPUT2flzmxHTh7qZVPnr+TwKUchZR3HMjZwmjonX7WWYVa0AjclC9
 zLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFOAZuIlL1arqH9J0yDRuOKWrMkMqQUV8n3LI+yVXsE=;
 b=wjVMyxdFBoxOwHhFMUUOboJIGP5j9an/qdUrbdXPdSDjs/zuQZMbXsSWKQao02+UF7
 MCH7QNaJ2VZpMTIJxKmT1zh2xe5KMCi/GnSMZFF5He28p6wTIRLoroXb9lTpPTuu5Iff
 6KKOJmRcnXM3/96LkZkKNNpLVz9iqW7ZGzi6NBwmZOCzU0cU4ZlDClx7W6Wh0vUQn+Tk
 E24YG3y+8U2lUdsfHdxqGDuwniSuJxtmZLq//luPdtj+MkBuF4lL2MQ6UuIpZpEGU5yM
 2NMXQBjE3iTFXkp0ei3Sqkjgsv1maYSw7YzEfhf0EhGRN1ojOCRQ+MVGnbD4tL6MYL3Q
 rnBw==
X-Gm-Message-State: AOAM532A4gQVM+HaGdWWvJbjNrEkezDZO0ukRwm2V3qLtTx5axIdAG97
 mMPdlvQ1E/fLJBfiJZCaYD1EhcekgCZ38w==
X-Google-Smtp-Source: ABdhPJzXfM6qGgJk1aluyT/kEt+Q/2XVpWvLmXuNcHCv7Jo8cdxNMWl+qkE+J6INgkAdEsbyMW3fag==
X-Received: by 2002:a17:90a:ab89:b0:1bc:71a7:f93a with SMTP id
 n9-20020a17090aab8900b001bc71a7f93amr5879234pjq.111.1645840505196; 
 Fri, 25 Feb 2022 17:55:05 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 r10-20020a635d0a000000b0035d81dd2a09sm3874667pgb.81.2022.02.25.17.55.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:55:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/tci: Use tcg_out_ldst in tcg_out_st
Date: Fri, 25 Feb 2022 15:55:02 -1000
Message-Id: <20220226015502.534801-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The tcg_out_ldst helper will handle out-of-range offsets.
We haven't actually encountered any, since we haven't run
across the assert within tcg_out_op_rrs, but an out-of-range
offset would not be impossible in future.

Fixes: 65089889183 ("tcg/tci: Change encoding to uint32_t units")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 0cb16aaa81..9ff1fa0832 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -790,14 +790,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
-    stack_bounds_check(base, offset);
     switch (type) {
     case TCG_TYPE_I32:
-        tcg_out_op_rrs(s, INDEX_op_st_i32, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_st_i32, val, base, offset);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case TCG_TYPE_I64:
-        tcg_out_op_rrs(s, INDEX_op_st_i64, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_st_i64, val, base, offset);
         break;
 #endif
     default:
-- 
2.25.1


