Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A42DFD16
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:56:41 +0100 (CET)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMc4-0001Fq-59
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQp-0004ly-0C
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQm-0007gS-Ih
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c5so11285762wrp.6
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIQKgaD3xwYfhJ20ooJ1vtJyxvBvbBs9LrAtT9WqTcY=;
 b=AY6dyLG0PUx1RiEA6TtYBXTeXAX5QGA6PSZSfZMF+OY3azWz6JmuZyXqFHsJ5dzd0E
 SDfvoq/Cu/V7aQGiQf/gpfXpi2uCBAIR1woMJiPoh1WRCOhGh4gRQsk4EEURjN9uoKxM
 3CDstajpCcSRBZz8eWpxTRbvOYC0jrsoKhq/6qyGSIcEko514RwShvwA4kIdvu8vu33t
 ywgMFiPrv1IlFjPNwItBWFpHKPJF1F1xw/w5Mfy1E4oyLFqmRjy32lnvsGKQD/0hxeLs
 6cV6rapCIR6V3ljJ2lNS1NIrHce0HqqQZ6o7j1AilVFiYjD/gwdFtM3tV5n44SKNVQF9
 OsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oIQKgaD3xwYfhJ20ooJ1vtJyxvBvbBs9LrAtT9WqTcY=;
 b=udYtm9iHMFVHW2l1WraTjlmyCOYUY/+UqqaRdPZUIGbJ+vMJo/xW0K5FX/X8hLNHfh
 WfjRoGdBqUEGFFKC0azEYlHLO3zbkRoFaYVbYDhwXB863wkP5uYIxGmqyrTR85jb2oVo
 DI7erkRgfvwiEjRPtLE7qwhX5BVkuSfw7wPxqiU/QSaWuYjpiupyyOmTG6f83Pa7Azqb
 7W4RVKHeDjL5EGz0xpiajncA7hgz6ZML2j4yualq65je1yw0TTkH+ck0krvH6uYFZ/dY
 ldF8MyMZNRR7Rp4tuhB95R9791eqSvGH6+8RrZHG3M7QHmSsT/ntnuRF7OWsR+KswZ57
 7IQA==
X-Gm-Message-State: AOAM533+vd9HeN78iujeB09/dYomNvE48/gWrde0+WfS9XNkMMyY8qWN
 8hH9nyJB9AAAeJLKR+LWRoYf3A9raxw=
X-Google-Smtp-Source: ABdhPJwYdsC1jq4a189EsusuP8nWPDSdxiSSbYgZ5ZDV8mH9w7DDP1jSac4GVn0I+Th7pK89SSOIUA==
X-Received: by 2002:adf:c387:: with SMTP id p7mr18941460wrf.95.1608561899338; 
 Mon, 21 Dec 2020 06:44:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/55] configure: document --without-default-{features, devices}
Date: Mon, 21 Dec 2020 15:44:03 +0100
Message-Id: <20201221144447.26161-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index a5ee2d2a06..7ec4a11d1f 100755
--- a/configure
+++ b/configure
@@ -1719,6 +1719,10 @@ Advanced options (experts only):
   --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
   --with-pkgversion=VERS   use specified string as sub-version of the package
+  --without-default-features default all --enable-* options to "disabled"
+  --without-default-devices  do not include any device that is not needed to
+                           start the emulator (only use if you are including
+                           desired devices in default-configs/devices/)
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
-- 
2.29.2



