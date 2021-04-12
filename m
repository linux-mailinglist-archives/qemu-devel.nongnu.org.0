Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEE35D16F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:48:39 +0200 (CEST)
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2Y2-0000nb-MF
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZaN0YAcKCog7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1lW2VE-0007Qc-IS
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:44 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZaN0YAcKCog7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1lW2VD-0006Xy-5o
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:44 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id u128so13637968ybf.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=nv+8xvdz3LSmpwi61uacfMflzrGYkLHq1FKAJV3U2w4=;
 b=AMwECp1yhFnpg5jsW+SOF8SvVvkraZtEFL4sYtd+oNEI4rPtJIYIBE5SvJLY2WlkAz
 n9V9dHxQ1hUWiaXW9MZFTMvzLDj8WbU9gPTVtBnridJ5qrtAblA8h2gocZTuLAVyOWMx
 x8ngCO7i97o4KZGCgwlQFtEeskURKjmrxwKQJ4ptAMsW3J2ZwEnrUJnCT6BeeUfa25AC
 ilgMj3Q/Yzy9YQuFzxUNn0k4o1m88rCEq5Y0/6ymHHv5Ro21vQ4XR+JytJvUM4H0byn5
 kWAbUww9Xt6wjrakWsFtmGZkKh6O7XL+gOOmU1+qFVQw7QBX2VnX9cCdbzf0Z4nl5KWn
 KPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=nv+8xvdz3LSmpwi61uacfMflzrGYkLHq1FKAJV3U2w4=;
 b=I+vZY2b/mwWCGEb9uloq9+JXR1G/g9322pblbk67BMPTU+vIRIJJ77l60Xz+gliEeG
 7/RijVDlCi14QZK9K1hROOT6qlfgIvyhZEQTa4MH4292kkLMrc4E5ODYSbbzviMJvaqV
 XehN0KG6HEdAEMZjO6cxhtWLCDhs2TI/VYSzlifS8ob5Svv7EoDP4z29qwI2YhQ7vN6q
 +cuIaJyWbvB1G+GLS19y9DyzhF4yrwh2C94RwJyng0y7Ypa1uanepw0wBogPNvh8ksFC
 korVVrwot7z8HymeJBuQSrZdG7QQrI8w6SYFxyGXiG/8S2mmBqt2+k/NbglFApnd9uhL
 vRww==
X-Gm-Message-State: AOAM531yeBSLRkhb4GRApdJ+45H+d//5BFkFHmIXs2wUzymxmGavD4IR
 6RUbB3KariHlWYyJVcZGO/EKeVG0f9Fw
X-Google-Smtp-Source: ABdhPJyZoaQQ5NKkz66pNhpt6JUsN2Mxs1nvMAolE09kWNb7Te0R4wwK1aBr+sayCxCxcPPDxOfDgcSq4Ke0
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:a5b:788:: with SMTP id
 b8mr37441653ybq.66.1618256741246; 
 Mon, 12 Apr 2021 12:45:41 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:19 -0700
In-Reply-To: <20210412194522.664594-1-venture@google.com>
Message-Id: <20210412194522.664594-2-venture@google.com>
Mime-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 1/4] hw/i2c: name I2CNode list in I2CBus
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3ZaN0YAcKCog7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To enable passing the current_devs field as a parameter, we need to use
a named struct type.

Tested: BMC firmware with i2c devices booted to userspace.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 277dd9f2d6..1f7c268c86 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -58,9 +58,11 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
=20
+typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+
 struct I2CBus {
     BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
+    I2CNodeList current_devs;
     uint8_t saved_address;
     bool broadcast;
 };
--=20
2.31.1.295.g9ea45b61b8-goog


