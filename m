Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFD334220
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:53:01 +0100 (CET)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK18u-0002ov-Ji
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK15a-0000SW-UZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:36 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK15Y-0005yi-Jy
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f12so23865027wrx.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/RZ/M7shooMjkE9CRzMtzLxM+t2OqVi9DBHUjQ220g=;
 b=dwiK9BtUkpcClxbf+DUhefn2bNzVRqfgWCcs6KUge21heHNPJ1Ah1uaRU+i8Zc0XSi
 YNs6OETXRG5AkHaXkpPwO9z+RqieSuuPeo1Tj3wzMTY8vPhFFbcNkBwI8njZiU9xtbpm
 OOeVPDcjvcWmZPlf4ig/+C1V1Tj9ukZWS1c0cpRFvRfMxDZLkSRJ4r89JFFiqd9TOygM
 YuDlWMeeO0wfKuUkQzyRLpXNAQAArNkyPXw3MhlY3zXSHhyTQ9rjl+1O8siSLDPwXFlP
 RQDDUqPkqvz9TKwOaQ/YpzbOpjBH44lfzQPreANLAHDYeHwZdhxoeKy+HwrKqFONJein
 rGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7/RZ/M7shooMjkE9CRzMtzLxM+t2OqVi9DBHUjQ220g=;
 b=Q9VlmeTGHYVHPcrpocwNA4ELHiqCLKSl5v4o7hBKUc+Xf+7XtXoZ0+vzm3+PsvfClf
 lINfuj7zyhllGy3r4FuMLBD2hoJ6IFhli0Sw4mPrxsg1OKUYbLSRipPluDkzTmPpwobZ
 0Z2kr3AqAXe2MUihz093iapjZnonc3vX8rLbkzwUCSsFIHzIe3Sy8qxRFJ59MqX3+k60
 x3DtCEVHoFuGIoZINSQvkX1/OftO5JrFQref5tpEgH3UTwF30+Lb5z1Jm9au9poZ6K/d
 F17EgmgrIbdr1vEmBU4ykyzp2Jik1AV+RBWf3uCH1FTpDxbtixEomOYPjsodIqOTDUrs
 uwoQ==
X-Gm-Message-State: AOAM532HWPK3ygMPb18WiVdBRrSicx7Q6I755OuJz4KoxxCRxsdj48R1
 sN29l/Lx23zFuASqJmBt3cFslaN/FLo=
X-Google-Smtp-Source: ABdhPJy9t2V6CAaK3k+3+LtasHnAl1St91vlez4AkshTjSvIs97toizlKPUV38vGJyJqZXGF390BwQ==
X-Received: by 2002:adf:edc3:: with SMTP id v3mr4040861wro.79.1615391369452;
 Wed, 10 Mar 2021 07:49:29 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c128sm15645497wme.3.2021.03.10.07.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 07:49:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: remove '-usbdevice u2f-key'
Date: Wed, 10 Mar 2021 16:49:28 +0100
Message-Id: <20210310154928.268502-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: thuth@redhat.com, armbru@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It never worked.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
	Could/should be squashed in Thomas's patch.

Based-on: <20210309165035.967853-1-thuth@redhat.com>
---
 hw/usb/u2f.c    | 1 -
 qemu-options.hx | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/usb/u2f.c b/hw/usb/u2f.c
index bc09191f06..56001249a4 100644
--- a/hw/usb/u2f.c
+++ b/hw/usb/u2f.c
@@ -346,7 +346,6 @@ static const TypeInfo u2f_key_info = {
 static void u2f_key_register_types(void)
 {
     type_register_static(&u2f_key_info);
-    usb_legacy_register(TYPE_U2F_KEY, "u2f-key", NULL);
 }
 
 type_init(u2f_key_register_types)
diff --git a/qemu-options.hx b/qemu-options.hx
index cef8c2da57..fdecee758a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1759,9 +1759,6 @@ SRST
         position without having to grab the mouse. Also overrides the
         PS/2 mouse emulation when activated.
 
-    ``u2f-key``
-        U2F (Universal Second Factor) key.
-
     ``wacom-tablet``
         Wacom PenPartner USB tablet.
 
-- 
2.29.2


