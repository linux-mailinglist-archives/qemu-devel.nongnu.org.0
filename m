Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E313C160E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:33:19 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W1e-0004wT-Fo
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn4-0000q6-Dg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn2-0008HD-OW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id hr1so10294588ejc.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNGnJnD3QeRZyYdbo3TMoUQpP53buDDPXAAEcnsV4cs=;
 b=kJ/OdwC/U9EhE4Oc1loJ44wAFUdJZDIZBpC1VindBRob/HspoUgZnQwng5oOoXeu2k
 Ls4NV546UF9IdAulM7N6VqQsTCufqAOVvgwRQMyTRU+ijAoRE5V60lJgCTW/8yJ4fAjN
 W3p2jmMNQTlepfIIZdzDKVSoAHSDA0WBbNb2yDvUzvdheytCgLGK+FaqBoAbfwuNX874
 B+QkaLgOx5hU8Z3OZUTzzwbhiaowhFG5aBo3v1zgRCTr5etrd82S1mgAzQ5IpcYkKKsb
 skxnmLBm8ULFlWinOfZa7jh1uKLosi0Ze9FMNIhxwMhUjjqXia0dQE5XJJld4fhBcyb3
 rpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nNGnJnD3QeRZyYdbo3TMoUQpP53buDDPXAAEcnsV4cs=;
 b=SH9e+izCrBPPpy5kk1oQSFi1NkdckHF3bZgEvO61lLs+lUiW3vf3L9aCOXEWZbrsVC
 JsRFvjJHcbhVy2A+uHcn8hkjOlDYRBp3L/bwu8AV/KmFkgNGEFKYmmkmwgO29M1bQoxF
 d1BkZnlGFKd5oLCzBRn4rER9DItL/DzQoSgI8suSUZsLZf5JqKjk95LnsBD7Lapq6h2B
 OX6BvIypwTMxtOBv0cCoxlubHOQzfeaMS0OW4VmtMnDcFECX8b+wVv3MnIl2JJA9W7E6
 x1ZC6RaIMW8I+7Nuj6ea7y647xmSZmzt81K0aP/8Kf8txxLy5JWujXO/3G8mf4hJm4ry
 1k2g==
X-Gm-Message-State: AOAM533eUkf2fS4AuMVz7opxzVWypivnlPo7LOuowI9tgJ1mMe9fbzMG
 9V83NnP8sGrZ0/whBQeqrodxgpQWJpM=
X-Google-Smtp-Source: ABdhPJw9NcSvCGMdvPnmlFJ4RctzKye1Q+XynxK0+gpcG/enSua6nMyMxMnuWfwr5hpCtMc2J8eiwg==
X-Received: by 2002:a17:906:1344:: with SMTP id
 x4mr31838480ejb.44.1625757491226; 
 Thu, 08 Jul 2021 08:18:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/48] accel: add qtest module annotations
Date: Thu,  8 Jul 2021 17:17:30 +0200
Message-Id: <20210708151748.408754-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add module annotations for qtest so autoloading works.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-27-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/qtest/qtest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index edb29f6fa4..7e6b8110d5 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -45,6 +45,7 @@ static const TypeInfo qtest_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = qtest_accel_class_init,
 };
+module_obj(TYPE_QTEST_ACCEL);
 
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
@@ -61,6 +62,7 @@ static const TypeInfo qtest_accel_ops_type = {
     .class_init = qtest_accel_ops_class_init,
     .abstract = true,
 };
+module_obj(ACCEL_OPS_NAME("qtest"));
 
 static void qtest_type_init(void)
 {
-- 
2.31.1



