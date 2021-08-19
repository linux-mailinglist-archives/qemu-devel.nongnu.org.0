Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B13F1B9F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:31:08 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj4V-00085W-5g
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj1A-0002TY-S3
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj18-0003dE-Su
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629383257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tJFUZV0HYOoBrQde2uSQFwBIu08Ozl1W1lap6Ce8CL0=;
 b=T2JghMzEJ4aFq3/7LKlVIGitOog1f33A7p9qBD0amgVWgszYEKqFrK2MPklHXMExnJQ3vV
 6m0+tODkRn9jdZzut7BWFhpGO4V9VwziCQ4yxspwUzHe8zqd8CDCj553w2tUIW6n5Bzh2C
 MtPIiOyL0CkqttccuheSC/VGe2yNqII=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-UMqdsZ2iNdKS8Fy1r61dtg-1; Thu, 19 Aug 2021 10:27:34 -0400
X-MC-Unique: UMqdsZ2iNdKS8Fy1r61dtg-1
Received: by mail-wr1-f71.google.com with SMTP id
 z2-20020adff1c20000b0290154f60e3d2aso1753154wro.23
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJFUZV0HYOoBrQde2uSQFwBIu08Ozl1W1lap6Ce8CL0=;
 b=E8/3ZuHZfCXWSNp77+SQxqvfNK1cqkbAxYuWM22j38O12vIb63rL8HrY8DahZWRz4p
 slSYwfMXPyWjC7qW4Aql7+MI8RZlcNgM09aeJ22jp3bUoQ0qiEbnbP3W5kwDwMS3qEa7
 LVruBdJv2nZELzBeGe6cOz4/VYUcUWt7NMyCjdM8RPK9z/kDlX5DvgXU7POMs71w1beg
 na1rlN9WI5BtXFHHukbyj+3gHLxfebDUB0/UZLsMpgCvhTUuFynBWqYNDRb2hz/tPET+
 pnvlJOIy9+ZKM8Fq9I5euqSWspRj2WkbcNXgdgxGHDeuTINGKN/elaNRdifx6bUQD4JR
 Cb8Q==
X-Gm-Message-State: AOAM531rgrN7Qku0rRaVg1S71nQDy7UZF6Q3xz/rKIW/f87jMIyMsHCN
 m+HMCSkHVSz/8G+aZXN2/pnZu6s11A/zIi39I+ptJUwyvZJYkLa+eLs0UjiSnFzeL0bqEZyQcpR
 zL1ujL8w+S4aM4ALxgmj3fIRygZx69WOlAl3XWIPCNx/YiuVZIvxF3HTKV1ha0pG4
X-Received: by 2002:adf:d085:: with SMTP id y5mr4305306wrh.209.1629383253477; 
 Thu, 19 Aug 2021 07:27:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKd9eo0TZXUBdRJK94uQ7E0gAgVLbM+f2UmYpa7EWyArZDym3WTKktV7hob3zR9t2hXI9P6w==
X-Received: by 2002:adf:d085:: with SMTP id y5mr4305263wrh.209.1629383253126; 
 Thu, 19 Aug 2021 07:27:33 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e17sm3079334wru.7.2021.08.19.07.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:27:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qdev: Complete qdev_init_gpio_out() documentation
Date: Thu, 19 Aug 2021 16:27:31 +0200
Message-Id: <20210819142731.2827912-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_init_gpio_out() states it "creates an array of anonymous
output GPIO lines" but doesn't document how this array is
released. Add a note that it is automatically free'd in qdev
instance_finalize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1..555d4e444a5 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -597,6 +597,10 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
  *
  * See qdev_connect_gpio_out() for how code that uses such a device
  * can connect to one of its output GPIO lines.
+ *
+ * There is no need to release the @pins allocated array because it
+ * will be automatically released when @dev calls its instance_finalize()
+ * handler.
  */
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
 /**
-- 
2.31.1


