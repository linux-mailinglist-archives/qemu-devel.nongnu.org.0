Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1B320220
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:15:25 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFvg-0002OY-CL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KFQwYAMKCpk6C79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dje.bounces.google.com>)
 id 1lDFtt-0000W6-Vb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:34 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KFQwYAMKCpk6C79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dje.bounces.google.com>)
 id 1lDFtq-0005Px-L8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:33 -0500
Received: by mail-pl1-x649.google.com with SMTP id d11so3158898plh.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=GNZYVmjsi1V1RFhcAfwUeZofo6RR1U4j3UTI/LwsE84=;
 b=VVz/gxx3dMhrtEi46FKgSxwcS6EK9UWDh4ub3kV5lg8x4WLykjAz6KHFnfaXhXP+Ym
 csnjIyxBH2E60on27V9lWoIvqLzUv8mw2uBNYEmGjndq3TyRkyF/wQ8KB+NTBhiUQ1k1
 doL/nItMMAF7g/Qz+qLodB13cw/4fMTc0oZC/Sy0iujisU8oIdT3p9k9YF/mlAKmKg1U
 bYUEnBNiaQBR72iF3fHWF9Dvp4fID9jY2r10b5n4g5oxAJTiRA9OQywhbUOI8bM+vLbi
 z9Y5a2Csk5NdhCRV5qiz35livNtxPiytoZhQXeugD4ndQuRfaZF7lloHe4tY1BLStPJd
 Q8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GNZYVmjsi1V1RFhcAfwUeZofo6RR1U4j3UTI/LwsE84=;
 b=BBvT24Qgreg66nUEWY9Wp60/STpH76P8cSbrzD+6MbZr2qKWxz0hOyTX6cJVrjW6QX
 55AQTvpisR9mdm2j8gjY+5x7yLRRBE7sdGIrxGcIKZJ0JMf8NbpdM1fATw/xcODsVrLm
 qXoaa+vYvJcCtfgVRqNbn2PiSp/6brE/g46oGW6xWKUcey1balxyFzIELSgsjG2Mslm3
 YTn9VQeq8WZQ6QT7O84LaTW9i6zeuGX8RKZ7DpYf5j91/t8s1kmY1NkNKOjVu357oDDE
 ruQHeipsnd6u6R3hzcQ5yzfknFb+S6HNh8OIGi6lTrfCwr9zqc0RbMM71SvolsTtm3Xy
 TOBA==
X-Gm-Message-State: AOAM532nfXVbIY2vNs6+vLs3jAgl09UwEpoSEk7jc+n8FBJjbqwtfgmW
 J/f97gg5PDlKOd4rKbfGEWjNabvh1Q2Fdu0Sx5k3JdABcp2/BZM3FqTKD7Nuc7PXTkpo7cG28Q8
 uSN53zNjZD43mmjqRVqex4/he4O7YhgRFfXwXTcEa2y83Q/9+EuMV
X-Google-Smtp-Source: ABdhPJywp6pm741wQLZ7h233qeSeZU/cmGPT+HEE0r4UDisF6Sjl5sZTFouFeKD7nIkzF74CEqG+W5U=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a17:90a:1992:: with SMTP id
 18mr12009373pji.47.1613780008124; Fri, 19 Feb 2021 16:13:28 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:18 -0800
In-Reply-To: <20210220001322.1311139-1-dje@google.com>
Message-Id: <20210220001322.1311139-2-dje@google.com>
Mime-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 1/5] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3KFQwYAMKCpk6C79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dje.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v4:
NOTE TO REVIEWERS: I need some hand-holding to know what The Right
way to submit this particular patch is.

- no change

Changes from v3:
- pick up latest libslirp patch to reject ipv6 addr-any for guest address
  - libslirp currently only provides a stateless DHCPv6 server, which means
    it can't know in advance what the guest's IP address is, and thus
    cannot do the "addr-any -> guest ip address" translation that is done
    for ipv4

Changes from v2:
- this patch is new in v3, split out from v2

 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..26ae658a83 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
-- 
2.30.0.617.g56c4b15f3c-goog


