Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6B3F281A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 10:06:46 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGzY5-000843-8a
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 04:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGzWA-0007LA-PU
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:04:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGzW8-0006zQ-Sa
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:04:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id k8so12914589wrn.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NqPoMavS56gEhlIoCXgj6Zh31e0NONL9dFb58Dt5V0=;
 b=X4bnuMr14dZNCrSxuu0ZcmbVP4iwxJCuQg6B6Tr4NayQguvv71M7Dpoa7ZPZp91qfS
 jjqtu6ij+r94hh6DsYW+v2hGgI+CGNYtI92J1GcLeDcBs6h6PlHcGRO3QfLPsjRiFwbr
 GCoz6RLhfRhZjFqovVKwEcJZVtNhyXC+K3x5vq/l11PBn9XmdXbqZTJortbboH7iKAXZ
 ZZ2msuGPbqZAhkwdwilA/QRmT20MgS29gYtKE069s/ZOIE2IoiUQOADh5pUJdikCp4N2
 qOpWuODO++tKVc8DKMFCdaQc7PcZG71zANOqFKW9CwKXznGyNBHuTKFEIhTq4YBGsATG
 WQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/NqPoMavS56gEhlIoCXgj6Zh31e0NONL9dFb58Dt5V0=;
 b=bZjXnbS9UgcUWDa3WSKZrCvNUlZIWMZN0dvlgPCtIVb1euZtkSj/3PbtU0vpq18Xne
 mk/KWL+FI1Fh4a8aBbliLd9vR42Y5mdYThP9sLckLxQewBI6KbUT3MaA5fJMgbXySvdN
 WAvYnjp5VPjnCJyagmSm6r/ienPWsEUt4m05NhU27I2UnuUBHgylzGUdGtwyzIr3+1Xj
 mhE1s0UuZQJ0i8jizSWziWPbxWdnDsQtpBA92F5/gaUK4X2doVan50Mn5ZIPTlYCp0mS
 xaMZ/8aTDjMYNjZjYepBSZc+EHR1O28sNwq7b1mKQNep+cXqSDNIfb6+1WKsDpSurlWN
 +b6g==
X-Gm-Message-State: AOAM530l9OpyzZRw+0BFZz14fgd5000pX4g6MuFwSC4nSaBnGGKi2Rvf
 KMf+bUaX0em7xWNgH1Flqp4uzYa+CA4=
X-Google-Smtp-Source: ABdhPJx4f6SZaKonS4TO09py2C14Mwg5SP7g812ry22ift9AcCKxDCT9DMKlAq80CtS3kK+MZIcjzA==
X-Received: by 2002:adf:e551:: with SMTP id z17mr8673577wrm.40.1629446680414; 
 Fri, 20 Aug 2021 01:04:40 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n188sm8634507wmn.48.2021.08.20.01.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 01:04:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] .mailmap: Fix more contributor entries
Date: Fri, 20 Aug 2021 10:04:37 +0200
Message-Id: <20210820080437.2972139-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Guoyi Tu <tu.guoyi@h3c.com>, Lichang Zhao <zhaolichang@huawei.com>,
 Hyman Huang <huangy81@chinatelecom.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bibo Mao <maobibo@loongson.cn>, Alex Chen <alex.chen@huawei.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Haibin Zhang <haibinzhang@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These authors have some incorrect author email field.
For each of them, there is one commit with the replaced
entry.

Cc: Alex Chen <alex.chen@huawei.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: Guoyi Tu <tu.guoyi@h3c.com>
Cc: Haibin Zhang <haibinzhang@tencent.com>
Cc: Hyman Huang <huangy81@chinatelecom.cn>
Cc: Lichang Zhao <zhaolichang@huawei.com>
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
If you are Cc'ed and agree with this change, please reply with a
"Reviewed-by: Name <email>" line. I'll wait 2 weeks and consider
no reply as a disagreement and will remove your entry from this
patch.
---
 .mailmap | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.mailmap b/.mailmap
index f029d1c21fe..11b259e7d07 100644
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
@@ -76,6 +77,7 @@ Benjamin MARSILI <mlspirat42@gmail.com>
 Benoît Canet <benoit.canet@gmail.com>
 Benoît Canet <benoit.canet@irqsave.net>
 Benoît Canet <benoit.canet@nodalink.com>
+Bibo Mao <maobibo@loongson.cn>
 Boqun Feng <boqun.feng@gmail.com>
 Boqun Feng <boqun.feng@intel.com>
 Brad Smith <brad@comstyle.com>
@@ -99,9 +101,12 @@ Gautham R. Shenoy <ego@in.ibm.com>
 Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Gonglei (Arei) <arei.gonglei@huawei.com>
 Guang Wang <wang.guang55@zte.com.cn>
+Guoyi Tu <tu.guoyi@h3c.com>
+Haibin Zhang <haibinzhang@tencent.com>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
 Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
 Hervé Poussineau <hpoussin@reactos.org>
+Hyman Huang <huangy81@chinatelecom.cn>
 Jakub Jermář <jakub@jermar.eu>
 Jakub Jermář <jakub.jermar@kernkonzept.com>
 Jean-Christophe Dubois <jcd@tribudubois.net>
@@ -113,6 +118,7 @@ Jun Li <junmuzi@gmail.com>
 Laurent Vivier <Laurent@lvivier.info>
 Leandro Lupori <leandro.lupori@gmail.com>
 Li Guang <lig.fnst@cn.fujitsu.com>
+Lichang Zhao <zhaolichang@huawei.com>
 Liming Wang <walimisdev@gmail.com>
 linzhecheng <linzc@zju.edu.cn>
 Liran Schour <lirans@il.ibm.com>
@@ -171,6 +177,7 @@ Xiong Zhang <xiong.y.zhang@intel.com>
 Yin Yin <yin.yin@cs2c.com.cn>
 Yu-Chen Lin <npes87184@gmail.com>
 Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>
+Yuanjun Gong <ruc_gongyuanjun@163.com>
 YunQiang Su <syq@debian.org>
 YunQiang Su <ysu@wavecomp.com>
 Yuri Pudgorodskiy <yur@virtuozzo.com>
-- 
2.31.1


