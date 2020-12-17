Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4C2DCDE3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:54:04 +0100 (CET)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpp2x-0007d6-Qp
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozF-00049f-MG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:13 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozD-00070T-O8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id dk8so27801440edb.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1UWB/KbKVBfapzCvrRRtEQyA2vOZPGrms88j7Z9G7LA=;
 b=qnIpSxHs6n6nh0Zk24EP8Ib/NUvCEc332qV8vXq0EiBV4ZgC9K/z7im5p5LhnuEr8/
 fAlrnIb9DzJuX1bP5t98RwWgJ9xHfihgglbtUiSBPx6dhOR8oxCeEdP+EgESuGXFKAoK
 o5OhCYej9Yox5rcZX51yNqLGhBDaiMjxLAACAd0Pqfl6nRqqSGY+emNcDP0O9+Npj1w8
 TdPRD9Tiyo4p+1hd3+5IviWD1WR7bTTfFv3Iprr/pb3XeX+KyZ4x0s6ZQRfREe5m0iBd
 f/hywn2jXmtQog0bnQkkUp0SDd2F/+bcaDWZ6MmcEY6kS29tQ1ZdCcKryPGXqLqNYCMJ
 kfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1UWB/KbKVBfapzCvrRRtEQyA2vOZPGrms88j7Z9G7LA=;
 b=C8K4GrO1+D4NJp7lhc+lQO8K1WxlywTHhdVD50J8k4Q+pmiVnZZoWAMSydC3CeEGo8
 zl3vCha92UccMoE8slBJ0rU9gqThJPF4izIK8wMSnueugpMZ6q9FNBb7g9JlHSVMQiZv
 48PDKW8v4D6x4RrhvlBMpZNzuoevkhp7o03akpWonVEMPipONbnPJQOjVGCXG5wWufyN
 8VZFQd20UdG83G+RivEOA4KQczZB7NZFGWScJGVf4uGybnj0wXEq+wnw9egTCWOxdVuH
 X/Rf+0pCQXbDp+AWwsS2MHLgVoKmjgyKhaLuIWi8UwR0T1VWBb853IeyoO6C1Ff+/pkp
 QyTA==
X-Gm-Message-State: AOAM53281G1A3VhP/6Lz9jyqp0gKn789aFg63s5Ww9cbT2ZVbkeSFJ/i
 6kjMIDiAcT4FvNrNLX+fPFwvwFTEGCI=
X-Google-Smtp-Source: ABdhPJykutOwnk6GqAzZaAFB+ADpEmZSm4uAwj6qA0xfBrsU7Uvb5Wq85FFoA35foI4PIqcYpyU2Og==
X-Received: by 2002:a05:6402:352:: with SMTP id
 r18mr36550511edw.373.1608195010113; 
 Thu, 17 Dec 2020 00:50:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd12sm22949542edb.6.2020.12.17.00.50.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:50:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] configure: accept --enable-slirp
Date: Thu, 17 Dec 2020 09:50:04 +0100
Message-Id: <20201217085005.10644-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217085005.10644-1-pbonzini@redhat.com>
References: <20201217085005.10644-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson understands -Dslirp=enabled, so there is no reason not to
accept the configure option as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 18af8207d9..568818e72d 100755
--- a/configure
+++ b/configure
@@ -1083,6 +1083,8 @@ for opt do
   ;;
   --disable-slirp) slirp="disabled"
   ;;
+  --enable-slirp) slirp="enabled"
+  ;;
   --enable-slirp=git) slirp="internal"
   ;;
   --enable-slirp=system) slirp="system"
-- 
2.29.2



