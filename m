Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4574041C0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:26:10 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6xF-0008Mv-2m
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sV-00089T-CY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sS-00035h-SG
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j1jkBDfrokHKQKoDNuT1x0UKxyqYOGBFYU13ViaHTo=;
 b=Fx3nK6aiId+EhkAPAy8QS0GBolzeCzh2xvMPG6f7aQrhShjKYCZdroQd/DNLyUFLK56Djp
 Gd5/XciW1uABWMQPkhw6rHSd/rocHwVKjN0Fb3yLqWWPDPoYCAXcPdt1598gkRGOk5GDRH
 vypZj2qYL1L6WRwZ5Y1lMoCBIRlu3IM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-xcXpg_UnP76GWSSiV579tA-1; Wed, 08 Sep 2021 19:21:11 -0400
X-MC-Unique: xcXpg_UnP76GWSSiV579tA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n17-20020a7bc5d1000000b002f8ca8bacdeso37201wmk.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/j1jkBDfrokHKQKoDNuT1x0UKxyqYOGBFYU13ViaHTo=;
 b=jp7PMyIg3ldWMQe36lOrDha4SX3gtPtnU5fF7hkVRA9sH6sX2pZ801BF3BsaK+5PwK
 xmQpZcm1B9p46EKnl2zqWNHCbzUQ4yJ3TPU4wqziTz5hRS+bKoIZe9TqJ6JIZwI1Q8Sz
 dsdU9I6xyoKHa55Zf1TBGiG1k0/IcH/7lWt5BZQAcxhcqWvFJSjlV5Ef9Iu83ElQHpxC
 X6ITorxb3KkNUdT7wQWRzT6syQ1V1fhqkWvZsyOtbMqfIwc3xePXYlzfrFnumErLS/Jm
 Wv8cDTKg7P1OKVOaiDWmcn4NFhEK27G3F7hgUvKbBBUI3Gm+7xwNW0aMw447fzNpAP0N
 p5cA==
X-Gm-Message-State: AOAM530XxgNPP+/YGJlGoywWyXcM4Kt+AjVASkoKOx19/BnMT68cmM72
 zO6c8C2g2bHeraYXMQPN7iA92xyrVmV7JLCzy6hFy7PBRDKWi2eyh31Jd/u+iLl/wr1ccek65FV
 qyaPG95TqKH4EgfdcHT41wiNDFUp1zT+Nt4OzWZZjcSUwT9gbSjZFwR3e4c39RJBD
X-Received: by 2002:a1c:f709:: with SMTP id v9mr5800245wmh.124.1631143269960; 
 Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsU5M2MRY44dKoBP/lcBIPQuM1MTJ8pmbiG93tEMNWtoFxyRNm7Nzd/6gGAEAcV0FSbIvT1A==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr5800221wmh.124.1631143269808; 
 Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e2sm29478wra.40.2021.09.08.16.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/10] hw/net: Mark Tulip device as unsafe
Date: Thu,  9 Sep 2021 01:20:23 +0200
Message-Id: <20210908232024.2399215-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/tulip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index ca69f7ea5e1..eaad3266212 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -1025,6 +1025,7 @@ static void tulip_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, tulip_properties);
     dc->reset = tulip_qdev_reset;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo tulip_info = {
-- 
2.31.1


