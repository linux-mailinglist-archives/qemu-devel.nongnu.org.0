Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC154A82D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:32:58 +0200 (CEST)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yEb-00040Q-5d
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2F-0003nQ-A3
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:11 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2D-0001qG-Py
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:11 -0400
Received: by mail-il1-x12b.google.com with SMTP id h18so5744925ilj.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMytXGUn22yDNlAtdSy95841H0sZIx/2Jw4ZsIHWhmc=;
 b=Aj1Dm1+luIwjri50wRxnVB/xZXdUHWjVJWaH7EkWNnC2BVk7jA/frd8TK4lLat37Q1
 BsZv/huXhQvB0nMmdpXCTpdUiB5GnEOMnd0tdd8xDvzwNaw0uOMHHldsSjlADRBweU+9
 BW4xaFrJh3/wZPb6vBvgg0V/QrNlpG4c+t5rv3At98xccdb6CQGouTLFdjtkSP/RtYLr
 HCX5odHejE8+LJ6onUw17GigU1ytwyunrMOkYUvUXcynKqmLN9mUjE/yNm1B7lYlwDsB
 PnziYCZ8HzdEJKTFt8kPUAvPk8AuDIRfcdqLot8NDwATyeMKnDv4iYI5H4HFKNYBbyR7
 ebVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMytXGUn22yDNlAtdSy95841H0sZIx/2Jw4ZsIHWhmc=;
 b=OhfksUWxK/9jsCfwPQDLWCeoHdqSQZ8h63XzbTmwakGljawUNdUN96wInEiBTEmfH3
 tl+V4nE7vVT4bG9XxOli9emDXyep0IaQN2bqZEwzbaq6Dm/b27BtHlSaOFLrnNsxUKD3
 Ng2GEgwjLV61zFh5FlNFqtvfmk8ofJkCfdbtL2U6NNj/bjGK/y3VncB6iE3HmMUU64cY
 J1fWK1fmoQlICt44XdtdOyiYF0DAXsx6WIC9rVFgwIwmMbJNMFKJMQyhJk/Hl5/JuMyc
 tiDOfGY2Oc9iznnrPg0coHeZg11S+GiDqHhnEgegsgf3rtLxerIUqoyXonTkXGHMIsaz
 BHeg==
X-Gm-Message-State: AJIora/+CvaTdP+FQEDwjplswsz8rZQD1/FvU4olT5MZQOxnCeiyjXCB
 mORcmi4Fg2z9+cfmdCB3VXIlMZPm94K1tg==
X-Google-Smtp-Source: AGRyM1uPkZtHwBrBtgKoRroICLm/WILBsUYwqLtwSgcS5XYUPhADuKBs+Ul7hViTMMowgtdiLoUBXA==
X-Received: by 2002:a92:c54a:0:b0:2d3:b2ac:eb with SMTP id
 a10-20020a92c54a000000b002d3b2ac00ebmr1773510ilj.323.1655180408630; 
 Mon, 13 Jun 2022 21:20:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 11/11] bsd-user: Implement acct and sync
Date: Mon, 13 Jun 2022 22:20:10 -0600
Message-Id: <20220614042010.40327-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 23 +++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index fda36894605..b2dca586129 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -526,4 +526,27 @@ static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
     return get_errno(ftruncate(arg1, target_arg64(arg2, arg3)));
 }
 
+/* acct(2) */
+static abi_long do_bsd_acct(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    if (arg1 == 0) {
+        ret = get_errno(acct(NULL));
+    } else {
+        LOCK_PATH(p, arg1);
+        ret = get_errno(acct(path(p)));
+        UNLOCK_PATH(p, arg1);
+    }
+    return ret;
+}
+
+/* sync(2) */
+static abi_long do_bsd_sync(void)
+{
+    sync();
+    return 0;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 3c8f6cad0e8..2623caf8007 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -365,6 +365,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_ftruncate(cpu_env, arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_acct: /* acct(2) */
+        ret = do_bsd_acct(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_sync: /* sync(2) */
+        ret = do_bsd_sync();
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


