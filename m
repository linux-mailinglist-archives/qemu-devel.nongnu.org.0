Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852685BD41F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:52:29 +0200 (CEST)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKwW-00051Y-J8
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfi-0002vE-Gj
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfg-0002zd-Uf
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDFZcwFMH4xdJ9FVOKoS6hEuuWGsFS559glx7wMdOzE=;
 b=Ne7/BraGqsFY/YfrfCNbD4GOkVqcBwz5OVGAsXuihroi2Bu/fk6//HA47rXB5IDlV6FHkz
 lWemJ0hixsyuUcka6+fzPOZcGm2xawiiXyfn6p6g5yBvXMIENR4rkkzVCV5NrL08PNUZjz
 LjW5ZHj2UTf/Ywv7d/HygkMAardrq2E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-y62iqrc9NO2xvP94InED2A-1; Mon, 19 Sep 2022 13:35:02 -0400
X-MC-Unique: y62iqrc9NO2xvP94InED2A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d25-20020adf9b99000000b0022adb03aee6so49166wrc.6
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MDFZcwFMH4xdJ9FVOKoS6hEuuWGsFS559glx7wMdOzE=;
 b=mPtcbX0kE/Ht9AM+WVNY4tmnFVCGAZ0v7mW9IsI+MOYf21Aaft5/5Q46oZCeLs5/Ji
 NVHt6H4MymTIeDgupH1grgszrM+YJzDgm/niJUepaiWjkoIT7vXCUHx0IoeZmuKhUxwT
 PpJIIS3cxaMXRX4H8Cb9W8Y05i5A399aGI1DsXX1ZRwMpOZHyUkXRzgb+DtJ+hGqUODw
 aokS1j+YbVOPvB/nqxA/g30lngwjL62MxfNYIWBl0RQISFxSiAfVfojefX8UQAMcUWKv
 B3RRuZcAwN5qiTZx5jPGu5OLJ53RMPTashUbsmMLL696nJfXw05Y2VM2Sh4ADrS0pQu+
 MWMA==
X-Gm-Message-State: ACrzQf0zrS5t51cU5Cpc6T0RHMwYc2pfZnmegkYMj9CrLu+beK53NB1M
 bB2CkYdRWsTJl/Rm6gjSyeK8NgAcVjevasMnMVeZj7XYZrpaE/TvpJU5/j2mAErsohHFO9Wwesr
 5sn1Sb0B+ILmqypFeM406I0AAHVPo0e3w+LWp3zDnOZDRziDnJj9oRFZ7tnKzvxAlgW4=
X-Received: by 2002:a05:6000:1846:b0:22b:66d:12bd with SMTP id
 c6-20020a056000184600b0022b066d12bdmr2483106wri.572.1663608901550; 
 Mon, 19 Sep 2022 10:35:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+8q6wYJlnwN0IhV5b8epb69GWZmLyNxnUNqpJRRTFGUhibIeIkARNUJvHPSBkuRCUEryYrA==
X-Received: by 2002:a05:6000:1846:b0:22b:66d:12bd with SMTP id
 c6-20020a056000184600b0022b066d12bdmr2483083wri.572.1663608901109; 
 Mon, 19 Sep 2022 10:35:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a5d4f09000000b0022ae96d7d3asm10434014wru.0.2022.09.19.10.35.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] coverity: add new RISC-V component
Date: Mon, 19 Sep 2022 19:34:33 +0200
Message-Id: <20220919173449.5864-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 3aad9cdfaf..fc1608932e 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -146,3 +146,6 @@ tests
 
 loongarch
   ~ (/qemu)?((/include)?/hw/(loongarch/.*|.*/loongarch.*)|/target/loongarch/.*)
+
+riscv
+  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
-- 
2.37.2


