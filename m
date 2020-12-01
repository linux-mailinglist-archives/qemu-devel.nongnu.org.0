Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA92CAB80
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:12:25 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB4a-0005et-Re
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB2u-0004Gx-0w
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB2s-00019U-By
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w68SN0Vp+bNQuXrfvEy7wf2Qzh+5W/xWJwTKnBzFmBQ=;
 b=Gqg5qOL8pHlusLskcS56e+END5rYm2eHesY/OVTkkLX1lhELjECb04uroanAS13UebH7r1
 0p30xoRzdrSQ+oL5+/SohwKvIkVuNWpv04AV1oaiXue3ZO6lNRxnGkFK48tDjm6RyYd/hG
 rMfIb7KCx4FJLeMNtoG/B6BxKLe1ib0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-737LXkSkPpOcgscHm0pMzg-1; Tue, 01 Dec 2020 14:10:35 -0500
X-MC-Unique: 737LXkSkPpOcgscHm0pMzg-1
Received: by mail-wm1-f71.google.com with SMTP id h68so1320973wme.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w68SN0Vp+bNQuXrfvEy7wf2Qzh+5W/xWJwTKnBzFmBQ=;
 b=KEoTLRDD+drDBcDvIVL97o3e8bpLd4utq9MPzD1CnM2WXVS9XbtIhCY/bBikI46Xvy
 hVz36dcrB+MSzylcpTbVICsngvpjRc7UItotskluIJhx+W5fJdl5eYhiSptI2ea8k53b
 4xWHqjuJYSJJOZV1HwQVHBm7Yoy1MS9AKQHKCyKquvJt0ox56VvN177o17GeKxTB6tgf
 Sp8gbJFLuF7pMm962JosAVI6zH1COOQSEMbk049jwu7yVXgkrE0ekrAIqBFbXU9gFach
 JgG0MS8ltBt2s3wFibDhTSJeExAooMGWvW+jNg/Kc3JaEm/s6HH80rTnUREsHcC0vJFz
 lbtA==
X-Gm-Message-State: AOAM531wAi6IQFz6QHokMQ0l/FHzFRe9GZIP3JzaIO20gvPL1zBn2JR0
 rCijBPoq8IFj24sGmHk/qXVfrM7K8Dpd4f1DjFRhte+TC5qbA+dU5GImeEBK++izkhh+Y2xzr8N
 02pAvZDClIjsdfhskqghnmIdF/ByJ2Ay240CuZp9eicDOJ4li8alnvG65YHvc8cdI
X-Received: by 2002:adf:df8e:: with SMTP id z14mr5839924wrl.406.1606849834514; 
 Tue, 01 Dec 2020 11:10:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3iMHfFgwziKzD2zjWfuGvRt9Y4QxOFvGVGN8ZlxdU6xeGluloQfXdaWj7jRudSKXaHjLd0w==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr5839887wrl.406.1606849834241; 
 Tue, 01 Dec 2020 11:10:34 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id h15sm816446wrw.15.2020.12.01.11.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] tests/qtest/fuzz-test: Quit test_lp1878642 once done
Date: Tue,  1 Dec 2020 20:10:23 +0100
Message-Id: <20201201191026.4149955-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201191026.4149955-1-philmd@redhat.com>
References: <20201201191026.4149955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed in fd250172842 ("qtest: add a reproducer for LP#1878642").

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 9cb4c42bdea..87b72307a5b 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -45,6 +45,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_outl(s, 0xcf8, 0x8400f841);
     qtest_outl(s, 0xcfc, 0xebed205d);
     qtest_outl(s, 0x5d02, 0xebed205d);
+    qtest_quit(s);
 }
 
 int main(int argc, char **argv)
-- 
2.26.2


