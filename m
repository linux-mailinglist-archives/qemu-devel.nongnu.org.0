Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7AE2CA6C4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:15:41 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7NU-0008BQ-DO
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7LR-0006ng-En
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7LQ-0001LC-1i
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606835611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBMWE92UpA/MREGGE/lR3Z6/ICPhJB9dxbylOkTivN8=;
 b=dEdhwoiGhkwv5q0qT8wFxh6u+FzVGLP0u3Lx9slzX6TrSzIm6ytqIPhek064Kq6WsS9l7C
 KLhRYx9sTdOqmXUK1rEifJVQao4dHDQhTlPPwdLEIWimyqLEDiJMESYuxukoq8icuiDhFJ
 Zm1rEbj9NsUrwNSEu4M5+138bBMgKOs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-z5NQSoVBNCGjQ-pk0dVbSw-1; Tue, 01 Dec 2020 10:13:29 -0500
X-MC-Unique: z5NQSoVBNCGjQ-pk0dVbSw-1
Received: by mail-wm1-f72.google.com with SMTP id a205so778569wme.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBMWE92UpA/MREGGE/lR3Z6/ICPhJB9dxbylOkTivN8=;
 b=HWwdd0VaQ9UaUpT+axI9KkFe+ieTwJYrFXFKU383s/2BD/Ac24FrZ7MnkS3IBwLlMy
 k7+6XuYB9Edw+b2QaMHciHIEE0zeurBgEVnSE8QCQVx+/1BJ9fWSHhZUcs2dL/1szrNC
 BooxMoILf6MsegXgZnnA6Z7RCluHz3tjWxVUhx28Wb2jVtorPCHkEih9G1fJW0fVrExL
 XDSsV2arLww3ilxqFXIfKHVKPsGf21BAqTesHancp2dsJnVQPZIoQwVlzESIheXMHJdL
 zO+W/N08vwTBnU0mGb2UzCgfOsdexfBnv52nES3AYLqW5IigWMfKgZvtJu9iRyeMtKvM
 DedA==
X-Gm-Message-State: AOAM530wGP5evQ/ERHz11Gf20afXvFM2gws+OnEcN6q4Lb6xEArXYBRB
 s+lrFVh4Ez/o15jJduiWGFW/4narT8lVEzXaSB1VVoCVICLfYBPJr6Al+k/zX1ELgNU4Z0Tx7BG
 427yhBGdqTLtW1gaTn/K1H5/8ZxWw4xcDBg9JSFPF0gwPCO/y4fEnEYKu4yTZoaNc
X-Received: by 2002:adf:eacb:: with SMTP id o11mr4426615wrn.208.1606835607629; 
 Tue, 01 Dec 2020 07:13:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKOXn8o2hegAhcCjBcpFFMTDbXDG9vUN/u4NeIjMJQeu1heThAalr7O09KkNISOWSQ+XQ95A==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr4426580wrn.208.1606835607407; 
 Tue, 01 Dec 2020 07:13:27 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o67sm212079wmo.31.2020.12.01.07.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 07:13:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/qtest/fuzz-test: Quit test_lp1878642 once done
Date: Tue,  1 Dec 2020 16:13:17 +0100
Message-Id: <20201201151319.2943325-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201151319.2943325-1-philmd@redhat.com>
References: <20201201151319.2943325-1-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed in fd250172842 ("qtest: add a reproducer for LP#1878642").

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


