Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4335935A376
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:33:56 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu4x-0004zz-An
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3F4BwYAcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1lUtxM-0005Kz-88
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:04 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:34723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3F4BwYAcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1lUtxI-0007SL-V0
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:03 -0400
Received: by mail-qt1-x849.google.com with SMTP id a16so3409922qtw.1
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1snVUJR5zUGgJx1EWwQp+r8nhg0Oy0nYhyUfSILVUtQ=;
 b=gGd0A+21VOj/w5/jt45tHLhQBWiH94s8XtlUHbVPHMepufOMhX25kpE7O8mhWRoRtW
 j//wnlWkFLemjePyG3Hmy/RVXOToMk6tuudIyL47xW4Mc36opT6HDSiEmoebLLTZhsZM
 YR5R+MGlZRTCUMiOPOTP4Jy6J5JetSlLbKfhp+U4atwFa+zgMTAKgGQnLp0FsuuUhR8h
 1ATzzMqh+zUna5aVihhr9/zpxCIybROltLWAupaDNUx8ESi54ZoY5/UtCN/lDS3GBhPA
 IiEj6ii7RFH2OpYdOWnUk1RueE5UL3xhQ5GDayU2XJcNcaQCBwPuRNb+98hJOVfnfpEk
 nmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1snVUJR5zUGgJx1EWwQp+r8nhg0Oy0nYhyUfSILVUtQ=;
 b=X4NVdTu3thM4m92hlv00YfGAXDAYuLSB2hZRzHWOtkn0cDsQow5sfF/KAukcPkT9/l
 UqxYYmHWm0rrhRuZXOrk7B31GGHOsPZMJeT3agA3uwwfdr2AZijDwmF3wNie6qPhVnKk
 LKITHjoDOfNI+FC0zcq87TjA0zhX7oL0L9mwFlmU8lUlqogzS6rwbqQGsIBel3ay0J8S
 48ubXLucgUJOtHZINuBw7+IfMDrMkZszLj4vRQg+3fZAUn0kNAEGYU/1GzbfW6sRKdh6
 AOc91Es0WLLiCdig7WSsnR2HH0AwN2S1hNetFguUWLlOIP1l04GAEcBOBkudOGiyIQ3g
 x1SQ==
X-Gm-Message-State: AOAM531Hh+PmGy0L1mNLN2YDa9wCyPd/8Qd/XGtuBxO6Qw71zxNkLIY/
 InZWd8m2Z7/4gdyysE9Uz4+rhf5fMXiu
X-Google-Smtp-Source: ABdhPJx1T2bF9WV5AGeqm1wOfVK2JtTJLwf5MsfY5z7EQ1i5+45zZ4ovhfLrqBFxTUbb3SMZj4bNfmPilHPT
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:ad4:4f07:: with SMTP id
 fb7mr12275856qvb.30.1617985559086; Fri, 09 Apr 2021 09:25:59 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:42 -0700
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Message-Id: <20210409162545.3705962-2-venture@google.com>
Mime-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 1/4] hw/i2c: name I2CNode list in I2CBus
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3F4BwYAcKCuIZIRXYVIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--venture.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
 
+typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+
 struct I2CBus {
     BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
+    I2CNodeList current_devs;
     uint8_t saved_address;
     bool broadcast;
 };
-- 
2.31.1.295.g9ea45b61b8-goog


