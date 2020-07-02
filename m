Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFE212B72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:45:14 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3Gr-0005pB-Ig
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AR-0003u3-DD; Thu, 02 Jul 2020 13:38:35 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AO-0007Fy-0k; Thu, 02 Jul 2020 13:38:33 -0400
Received: by mail-ej1-x642.google.com with SMTP id l12so30696224ejn.10;
 Thu, 02 Jul 2020 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNmiqtIARIvtYdLd1badA4yDSJvLXn9cgd4xpxOhhEg=;
 b=k1IwIpG/wfYkwBuH8CaC04pqI0EYSadR5f4cF3SGqB9t+57K+Tn6YgZjcNSyOVvWv4
 5JA+5OO+sqwLLeLAaIpTrbPf41CEdcznOtpLwaFRSS3ez8VjQqjZTDo5op/NW7Qbcbrf
 0ItZ9LNAWrKwL27ZJsqqmjdOJEIsTKMDb5vHIOTHL9VEltx75s3hFAEVWIniY6Y0O10M
 CD6IBvChcK5/qRPuqZXSuFrAlZg0RrS/B4RhCodxFVqoEFvHBWN18/E0z4oJRC3WhXOo
 rdpJSKBXVpPVoxZnKY1HXHiweWvfd9X9ymBuNkfkqkRGZEe4A3fOHrvXHi2rh6OTbc8U
 938g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WNmiqtIARIvtYdLd1badA4yDSJvLXn9cgd4xpxOhhEg=;
 b=joSiJ3vzjMKD9jTXkQ8dTZ4Na5+SUYwr604q+tyqUCXaRvn30b7DCbfo8mdQJ+U+zt
 OXam+hXaePcZ3CT4R32pp0j0ivlLlHiibnZcrYqhVT2mU4VJKDOownJr630Q8U9HbCFR
 a9rYj155diFhR+D0DKJL2sYzmRH2Y09zhB8rbaxAJzoi3KMj6W8ZJIwqa1u9MLzgEC8R
 CmqYr6dUFzPefaHCDPEOXfnaOmGorVc3omrwSCtKnzslNCakJPXpqUOxLzn5gxxS17Ba
 uA2pWR7XtxpBU62TzKfyIiXPhDrI0OFfmz3ejKQn9pOQZ7uTVaH2LY70HTJFMca1DhyJ
 GnAw==
X-Gm-Message-State: AOAM5300FBtGW/mcjiwoQZqzEFdGxHJKqp2AMna1/vr+UBYYbD4XPQfT
 wCgPAhb1q58/zkUxaBFFDvtezUtStnI=
X-Google-Smtp-Source: ABdhPJwTlnfvaXphszEPeNvJdtAI4LkrRNfcalTXqGvBDbzIP6zAd4zk3zDRoelfbZPJw6imjML+zg==
X-Received: by 2002:a17:907:426c:: with SMTP id
 nx20mr28107530ejb.548.1593711509960; 
 Thu, 02 Jul 2020 10:38:29 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/19] .mailmap: Display Hiroyuki Obinata name correctly
Date: Thu,  2 Jul 2020 19:38:07 +0200
Message-Id: <20200702173818.14651-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly display Hiroyuki Obinata name in the following commit:

 $ git log --author=hiroyuki.obinata@gmail.com --oneline
 f480f6e8c5 remove unnecessary ifdef TARGET_RISCV64

Cc: Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index ce0d62b60d..4e9e54368d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -98,6 +98,7 @@ Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Guang Wang <wang.guang55@zte.com.cn>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
 Hervé Poussineau <hpoussin@reactos.org>
+Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
 Jakub Jermář <jakub@jermar.eu>
 Jakub Jermář <jakub.jermar@kernkonzept.com>
 Jean-Christophe Dubois <jcd@tribudubois.net>
-- 
2.21.3


