Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE213F6CC0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:51:16 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIh8D-00058T-KF
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6J-0001ib-UB; Tue, 24 Aug 2021 20:49:08 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6I-00070u-ED; Tue, 24 Aug 2021 20:49:07 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id f7so12795074qvt.8;
 Tue, 24 Aug 2021 17:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qeMLTSi39amyjZHiwN3uxS/ebc+t/GAWOPBEMdDY/r0=;
 b=darMlOGLg0r+UATfy7wIYY5vRxKkqOGpGPNUcV0EuKfCOMzQzxlwZ3Hhthyk7hXdj3
 SJqkYtOGLZ7a0+t8QmBeD6SfQk5dU2YFGRzTWjm7DhBX8/tTFfnJVZpqsHIGM+qjsKN9
 NfHz7/ACB62hccK+yYckf8Fp6Z+Z13LX6ExtkVfN2nQgs0qeWD4Zp+H5E3lhgeoVQvgM
 TfS3faUa8s0ePO27XSROvvti0+Q9FWuVtNRQ4Wmcg6YPSL3JryDZjFH0fVc5SmdBtqzE
 kUMgZTMiSUShKbI+x4WxNLeGGTsH2DNtoAbogNQny5NJsygDuADtb7p+DiMNV9Cz5UB2
 Q/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qeMLTSi39amyjZHiwN3uxS/ebc+t/GAWOPBEMdDY/r0=;
 b=CHuGMCHJRe9lc1a3mmRFBpQLG90PPZaIexeTMpY20sku6wykDwKjhgtC5BIJDatCd3
 meYz760UpOsqum1ByfS+VHqi72dkm019LNWw8Fftke+NzHl1GGIYtIEWfcleC4MqgBAm
 15Ye7Izha5cPbvu/zSCEZRmLpShGj1wDWoNLARHqHmXO34+U1dbhHJNcnIPhXR1p+bWM
 5b81VVhlcoQf8QE8gG6BpaUKrcJLhHrRU7psT+Jj39V0fvwwnKz76PxNVPvHCcjG+IVL
 jmC4+LlRuMAK+Zl0bQXW6MQK8dlNq09WxhqtGOc3Ion7F1aJ2PaMcw/wbeLWV5HpE7Du
 OzFQ==
X-Gm-Message-State: AOAM533dTd/8BPoUFykOMi0Mpa5/vYMzFBRosWWMe1zPBWr4npv77c1F
 K1hsSYSneSc36XrpPYcFQk1bVBgffXA=
X-Google-Smtp-Source: ABdhPJyZX7FUEkijx3Gztwpv4y6FTPhHul4TyJhYoAg6ypZ6TfwOgTRfUzVmXcqveRukLvC6ivHOSg==
X-Received: by 2002:a05:6214:892:: with SMTP id
 cz18mr41737933qvb.60.1629852545126; 
 Tue, 24 Aug 2021 17:49:05 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters doc
Date: Tue, 24 Aug 2021 21:48:32 -0300
Message-Id: <20210825004835.472919-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify that @device is optional and that 'path' is the device
path from QOM.

This change follows Markus' suggestion verbatim, provided in full
context here:

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/qdev.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..0e9cb2ae88 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -108,9 +108,9 @@
 # At this point, it's safe to reuse the specified device ID. Device removal can
 # be initiated by the guest or by HMP/QMP commands.
 #
-# @device: device name
+# @device: the device's ID if it has one
 #
-# @path: device path
+# @path: the device's QOM path
 #
 # Since: 1.5
 #
-- 
2.31.1


