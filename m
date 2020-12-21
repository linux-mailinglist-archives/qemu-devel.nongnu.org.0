Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68F2DFD72
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:23:04 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN1b-00051V-99
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRI-0004uF-CX
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007ml-HX
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a6so10098190wmc.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33P+IG3zourtkiugP+gHrNcHn4CktLcQ1NmI5YOJd5Y=;
 b=SCC1JXxWjNBDJ4PyciQM/NqoEcDJlXKcnr/neWZ+ccE3k93munyzTA4C0gn2NguW4k
 26xhm8G+6PpU/ndwKko1cZT5/kMv0lO3tbB1qztjbzvgdYPCRxu8cpDLMa4JN3ZlMhga
 Ttk7mBBCwDVmNvuqL+MriLaV4Vyz4Rb2Spizpc5iL5w80O/+vjJRgJVcUA4RdW7okeVk
 FbqmIqjc5jGg0tR3dVmricPKumzt6CyO2+CWUSbbeQStRqMGo64T9Y8s+tcb9S6sNMSO
 herlIIcb9jml1GS1HpXMMFV4rBVxX71DTV25EHeLaQACRKT8st8RRKCo4+jabv1/U/aA
 8Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=33P+IG3zourtkiugP+gHrNcHn4CktLcQ1NmI5YOJd5Y=;
 b=qTFGAj80EyJK3QiyFGbfyVRC/I6NRx2ucmIm4L3q5I4dL/iE/WhhHz5Xaye9BjQAIH
 jGkp8M+r7iMighbE34WWQ9WPzjrOdyK8cPOMy2e/RvX0a5n+hdhUlGc/N1rJJsJD4EE1
 SCe+aX6MGY9npOVH/XfnTq8a+a7ZecF1dPsxpEMvLylG+u33xaC26RJGtZQ29PuIN9jt
 kVFVO+K9YJkB2wrhjWfPbSMhb9aO7/XnPGlRc7lg/zfyPmUkffrSU2CTd6+pggNO6D8/
 nh2R8ei5COVMUfNz+579FwNuk/OZG8BjwI/OKbYAlN0TSQIe7fI1zt7joaKgGubrTzJf
 UtXA==
X-Gm-Message-State: AOAM530lqVwT10flUD9NxMhEYy2HL1iEh66PkUBP1pVbGdTUgp44qKrv
 7FNW9+VZlDp/qpySBVObRKHfpz/gSyc=
X-Google-Smtp-Source: ABdhPJzjA/RBEKbJLVTob2Gn0O0CT/rIWdimLNwX28MwyzM5N4rXstmeJEWob47FzzY2poRRP7GfPQ==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr17292023wmg.152.1608561919508; 
 Mon, 21 Dec 2020 06:45:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/55] configure: accept --enable-slirp
Date: Mon, 21 Dec 2020 15:44:26 +0100
Message-Id: <20201221144447.26161-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson understands -Dslirp=enabled, so there is no reason not to
accept the configure option as well.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index d5d630c0ee..16b609a984 100755
--- a/configure
+++ b/configure
@@ -1082,6 +1082,8 @@ for opt do
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



