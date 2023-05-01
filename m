Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FF6F31F5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:29:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptUV0-0001QD-Rk; Mon, 01 May 2023 10:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ptUUu-0001Q0-VZ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:27:25 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ptUUq-0002tJ-BY
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:27:24 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 278178464
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:v63AUqvMMv30fUvXRtpVIMz8AefnVO1cMUV32f8akzHdYApBsoF/q
 tZmKW6BOq2KYmv9c41wOoq2oE0GvcfWz9E1QANv/i0xRXkR9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmPKgS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqU8xNtsHWJr9
 cY2cmk1YzCkvL/s5bikH7wEasQLdKEHPasas3BkiCjaVLMoGMGSBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6aOVsWawZ/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKyYIOKKoDUGa25mG68p
 XPM03/YXig0McKvkTuf1Smm3dX2yHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyTYC4UUTp8TiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7ZVoHVTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:Wkip2augtb8u5d9y+yRfbMYB7skDrNV00zEX/kB9WHVpmwKj5q
 STdZMgpGXJYVMqMk3I9urwXpVoLUmsl6KdgrNhRotKIjOWwVdARbsKheCSoAEIcxefygc379
 YGT0ERMqyUMXFKyezX2k2XKeoB/fWw2JyUpI7lvgpQpMJRB52ILT0VNu9WKCNLrXF9dOIE/V
 Oniat6mwY=
X-Talos-CUID: 9a23:9qw5PWH1hw35H8WbqmJDynMPBsMAckfzli7oLm+fMjszbbeKHAo=
X-Talos-MUID: 9a23:q2VqyggX6qqmssSkvwUDA8MpEMR56Yi1KRw0v5AYi5GFLwsrMWyntWHi
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 May 2023 10:20:04 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-751560e83d9so250443085a.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682950803; x=1685542803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BR5bWOKp63hSqbEw5xa87m7x4xt02H9cEngi2/B3usg=;
 b=M8vHVcz+qENENTTxW3wmvzlv22BfBXvNrig0F6ooQbLd8uLtCd6wAAxrjeluawxpnf
 besqcsRoniZkbA60o+bleNHSdgiMGvGrfBGMN2IOlrZkzfWlYPRaTBW34NTcTzqY5lPz
 E9+iENQ6P+Yv6MZa1kkYzMJ2AdQTUErdbOIuSYfnZpBvHSqbEQ+X8PHbXOkGx+fQAAhG
 egfNy7tM1QnL5a/GckxnG+pJiSUtObQ/zJ2DRcCfOROH2FCCzddz44qUapEI7aO5acdO
 9LVo6c1g3LiKaQayOalWlQIIcnISJWaBdBQtwz092ZI35e3oZxgslar0kdTLOlj0qUi8
 7UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682950803; x=1685542803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BR5bWOKp63hSqbEw5xa87m7x4xt02H9cEngi2/B3usg=;
 b=KiGZxaEoeQ4OSEXqByjqWsG39rK+cYaVPnOD5sPOmj6qwY9T+ShFjAVWRhEcc4PjOQ
 uo0GbH7XPrWJPbwwc9c7xxV/k/e7w+oaFOeP+rIjQAjXHFbEvlYPMrS2MsLOfCmyMb0o
 41Dbjwts+tpF7GTcKEgDF/JmgNyB3YWXx9Qdj08xWFTCTjOgKgXLGW5JOQ2zW1k0U3xv
 mKrz11K+wIoOAI2JyT6+scvKuGi3Q34E+IEgzjC8i91Grbhv5UP/WjnG/hvvEl6hPzBN
 cApYj1ltOebzVYRRo2Gm5VPACbPWdUxAXNWk+pT7mYO02p6t1jv4iLi6GeScWVsLAzpj
 9LLg==
X-Gm-Message-State: AC+VfDyI8BIv7mlbN1pmSp5qJ9RB23wvt8ye22L5RSI3vLnepEyrcSCd
 vAU7ZGnjU2iOD/pgDie1QzEsC7MtGOwsF1T6rY7uhKRahTXbgxcJcsBgY6QgXT8OZ2ns4pvjl5p
 DzRzSj7TQwqy5uT/EE0S5ahsdN4xmg4LLhLi25qZl
X-Received: by 2002:a05:622a:103:b0:3f1:feb1:ea04 with SMTP id
 u3-20020a05622a010300b003f1feb1ea04mr18505365qtw.15.1682950803244; 
 Mon, 01 May 2023 07:20:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5i1yp8AzIPfHW9C52DOZBHWaZ5zMDcP81KSP941CIjQBx9DDqfQ7193/1uqnmR1Tut0Ue+3Q==
X-Received: by 2002:a05:622a:103:b0:3f1:feb1:ea04 with SMTP id
 u3-20020a05622a010300b003f1feb1ea04mr18505332qtw.15.1682950803024; 
 Mon, 01 May 2023 07:20:03 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05620a28d000b0074e07afcc91sm8907379qkp.120.2023.05.01.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:20:02 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org (open list:Block I/O path)
Subject: [PATCH] async: avoid use-after-free on re-entrancy guard
Date: Mon,  1 May 2023 10:19:56 -0400
Message-Id: <20230501141956.3444868-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A BH callback can free the BH, causing a use-after-free in aio_bh_call.
Fix that by keeping a local copy of the re-entrancy guard pointer.

Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58513
Fixes: 9c86c97f12 ("async: Add an optional reentrancy guard to the BH API")
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 util/async.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/util/async.c b/util/async.c
index 9df7674b4e..055070ffbd 100644
--- a/util/async.c
+++ b/util/async.c
@@ -156,18 +156,20 @@ void aio_bh_call(QEMUBH *bh)
 {
     bool last_engaged_in_io = false;
 
-    if (bh->reentrancy_guard) {
-        last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
-        if (bh->reentrancy_guard->engaged_in_io) {
+    /* Make a copy of the guard-pointer as cb may free the bh */
+    MemReentrancyGuard *reentrancy_guard = bh->reentrancy_guard;
+    if (reentrancy_guard) {
+        last_engaged_in_io = reentrancy_guard->engaged_in_io;
+        if (reentrancy_guard->engaged_in_io) {
             trace_reentrant_aio(bh->ctx, bh->name);
         }
-        bh->reentrancy_guard->engaged_in_io = true;
+        reentrancy_guard->engaged_in_io = true;
     }
 
     bh->cb(bh->opaque);
 
-    if (bh->reentrancy_guard) {
-        bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
+    if (reentrancy_guard) {
+        reentrancy_guard->engaged_in_io = last_engaged_in_io;
     }
 }
 
-- 
2.39.0


