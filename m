Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA45F3C53
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 07:06:27 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofa8P-0001QS-OP
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 01:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ofa37-0005yW-6l; Tue, 04 Oct 2022 01:00:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ofa33-0000wn-MI; Tue, 04 Oct 2022 01:00:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso17537660pjf.5; 
 Mon, 03 Oct 2022 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=sOAqF0GYqVKUnESar43TThzh6CDb3TPl8u+ZymalMIk=;
 b=oH9S//lDY9gdESTd4zwVEgVxzbUNiQm5C8JDpM62EqkjivtvRNmmFkSQjtNFgjy6gn
 Xj+bgmL1HOz7ygSL20sIAfao10HWG7y5EAIOMgcMEYLmJNEN7rlZhNhwnNBE2um/hFn6
 ElvAajZmhQ/7w6JNfeUbE8UZkPeukaz53VnNypaxNKacLD61VcFq/Z7cRyZNtsRidsNo
 Lcx9BWhsi6pst42EbBeBTaxoy6XSnYhyR7BtUf1bLdxjLB8IJQ+tNSfShhL/Dq1JDbZK
 HHIoAuYXuFEeOfGjsX6vpXYKWSa2rhM76u64LfKUuqTZ2eaLFvH5eDDOad55h41BNdFo
 KloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=sOAqF0GYqVKUnESar43TThzh6CDb3TPl8u+ZymalMIk=;
 b=IhTFkWVhAcpDrw9WkuTcPTFQa5GekLZ1iB6SCpb0it0jvBZPSp2gbf+bPFaB1o84Hg
 Syk1xvHaKUBmJct3WnWuHf+raV7CVGI8/L5U6KwZFmrYSJevinT5+39mqdj68M4baIe7
 yUGFo9Ff7CVZx/+dFX+BdgsuxUhz0T2kdhOHH5nPhTqzfQxVrXEbyH8lCOOqp4HI3P3F
 C8dutrfs+L3NZP52qXwsjNtX6JLZsXVR5bH5SjG2349Cq6Z8+fYvzdTDowr2gx/NSmDK
 7EUoLlEWzjJ6M2eOIj9sfegr+EBR5msJFj9BM18f5Ku+OE9VseAjz//0vP3MQDlvLHgy
 JN7w==
X-Gm-Message-State: ACrzQf1Nph2WzgmagtxGRobgHnxn0NXhGDeXqZ8pLsXdPvVs7RokVq/I
 tDTRVAW6vK/s8hf7c2dvxF8=
X-Google-Smtp-Source: AMsMyM7zySTAFRMUAXq+ApRZkYX8sd0+6dcubgvIPpQQ22tJtFHPMcj9kvCBYL8+kazNrs+x59ZEJA==
X-Received: by 2002:a17:902:ccd2:b0:178:29a3:df2c with SMTP id
 z18-20020a170902ccd200b0017829a3df2cmr25388474ple.77.1664859651346; 
 Mon, 03 Oct 2022 22:00:51 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa79f0e000000b00561dc6095eesm51941pfr.189.2022.10.03.22.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 22:00:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/nuvoton: Update URL for images
Date: Tue,  4 Oct 2022 15:30:42 +1030
Message-Id: <20221004050042.22681-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=no autolearn_force=no
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

openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
images can be found these days.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/nuvoton.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ef2792076aa8..c38df32bde07 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -82,9 +82,9 @@ Boot options
 
 The Nuvoton machines can boot from an OpenBMC firmware image, or directly into
 a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gsj`` and
-possibly others can be downloaded from the OpenPOWER jenkins :
+possibly others can be downloaded from the OpenBMC jenkins :
 
-   https://openpower.xyz/
+   https://jenkins.openbmc.org/
 
 The firmware image should be attached as an MTD drive. Example :
 
-- 
2.35.1


