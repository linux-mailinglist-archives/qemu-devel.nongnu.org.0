Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E143C183
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:34:40 +0200 (CEST)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfae7-00026x-LC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfacW-0001Et-9T; Wed, 27 Oct 2021 00:33:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfacU-0000Wk-B9; Wed, 27 Oct 2021 00:33:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id z14so1823080wrg.6;
 Tue, 26 Oct 2021 21:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gcDfBT+nVmjBS0zmnRzE+Z2orskNbR+Zt8uSm0u2edc=;
 b=Leo07byBoWZdw21BQUauJI0cR2ttdh+ftm/vUiSnYUTjHvoy6HCpcOJP+NPN3BivrE
 9hDlDig8aMwoDjR8k3rtmmCYBSgV9aZbNh+iLohAlnWd/MEcPsksWZ5h+YseIuZY2R2N
 OAqKlqf3S47VaTZy6NPIpHBmW+tGMHZ08SFSNI1MAHTkTa6/hHFVdLMdT8EGDBauiYQe
 SkikeBdI5T6AR08Kgmz5Cp37goYfjBz6bOnX/6ulB5I6y9WrK3xOfT493wjM1tduA+ci
 YFW6aYCVcHNk1mYBbcUhGobDE9U69p5nGUpO78d/3j/8AT5NDbhNoHdbhZmuJ4sGS4gd
 i0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gcDfBT+nVmjBS0zmnRzE+Z2orskNbR+Zt8uSm0u2edc=;
 b=lTBR6EhV2foJmjJyXyBUXULIblxsUNi5iYxSJw+SFeGaHNSxicfIK1rWnqVz+/uiea
 7e+TwjVF2EHNU/FRsWGuk0leT2YCzWYv6wm5KtWTcj3Kvg5RmYCFoS3ICX6lZ5jD7E8e
 10c0kchdoPP//eghfugUmHIw2YJwTzGZLUP8HnxsBnmHkG28kJkZ/Exz2dTWFZ+0ZIqZ
 MMFUFJh7WIw/5LgDEVIr6KjwAQUE+b+bfc0Cb9veKc1MmV35DRFpsE20R95CWZVxLgP+
 f7c02fM+qfuc+HCgLU+JVDz/aOYz0mnOGqGt6sIzaZLrPyGgctLUd3WjKNW7glh/NBhp
 I4/g==
X-Gm-Message-State: AOAM531UBb6aHqyH0cyI4AqXb+NHy/OIDsLZVWEvis8/Ts2j5tHo14UY
 lejIBwlyjLQWqjX9xjaoqwBvaRuIqgY=
X-Google-Smtp-Source: ABdhPJxfM04MajiCnxqMZK14OljkDnJJSTjAB/1B5ncmh5OdlNJJKeRnp6O2MbaMpUDXHQZH1BKUeA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr36901276wry.382.1635309176312; 
 Tue, 26 Oct 2021 21:32:56 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a134sm2454137wmd.9.2021.10.26.21.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:32:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] .mailmap: Fix more contributor entries
Date: Wed, 27 Oct 2021 06:32:54 +0200
Message-Id: <20211027043254.1248097-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Hyman Huang <huangy81@chinatelecom.cn>,
 Pan Nengyuan <pannengyuan@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex Chen <alex.chen@huawei.com>, Haibin Zhang <haibinzhang@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These authors have some incorrect author email field.

Acked-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Hyman Huang <huangy81@chinatelecom.cn>
Reviewed-by: Haibin Zhang <haibinzhang@tencent.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Patch fully reviewed/acked.
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index f029d1c21fe..8beb2f95ae2 100644
--- a/.mailmap
+++ b/.mailmap
@@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 # git author config, or had utf8/latin1 encoding issues.
 Aaron Lindsay <aaron@os.amperecomputing.com>
 Alexey Gerasimenko <x1917x@gmail.com>
+Alex Chen <alex.chen@huawei.com>
 Alex Ivanov <void@aleksoft.net>
 Andreas Färber <afaerber@suse.de>
 Bandan Das <bsd@redhat.com>
@@ -99,9 +100,11 @@ Gautham R. Shenoy <ego@in.ibm.com>
 Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Gonglei (Arei) <arei.gonglei@huawei.com>
 Guang Wang <wang.guang55@zte.com.cn>
+Haibin Zhang <haibinzhang@tencent.com>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
 Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
 Hervé Poussineau <hpoussin@reactos.org>
+Hyman Huang <huangy81@chinatelecom.cn>
 Jakub Jermář <jakub@jermar.eu>
 Jakub Jermář <jakub.jermar@kernkonzept.com>
 Jean-Christophe Dubois <jcd@tribudubois.net>
@@ -135,6 +138,7 @@ Nicholas Thomas <nick@bytemark.co.uk>
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
 Orit Wasserman <owasserm@redhat.com>
 Paolo Bonzini <pbonzini@redhat.com>
+Pan Nengyuan <pannengyuan@huawei.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
-- 
2.31.1


