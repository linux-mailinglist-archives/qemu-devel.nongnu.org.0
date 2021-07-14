Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162273C820C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:50:12 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bWt-0003qk-1z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK7-0002GB-3H
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK4-0004Mt-CT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id k32so1152611wms.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+41tS5+PXOd6IqKhB/HyaZcXo5OjRtpQd20dhhM44jM=;
 b=Y+CpmRJan7+9oLS9lgFeLnK1Aj2zH9L+ZalPlc1SuZykvP7ipMN2ALwuY8I2izpvr5
 LY5SwkDVNB/GIdybDWftf8jqjemZtBIEsVmgY86MkQ6LdhVoPAOjHzgSqdES/AWpViyH
 0zwgQ6ztMa2sYbu1N9Bjmk6pTaphlmPagtD+dSgyAkjGz0XSnTEHgEpnLtgw5KBJrGh/
 Hg7+Jb43/ZyK6AwphEojDyI+hfJodq06Mp8UgtfTt1fe8OEoSMvJlCaMa5xGMsm7GFJ3
 1SZGfYq7fN3XWRE7vo/SnDyIbxHtGqQoSxhjbP6PyzNQjHriqZPWWKwlmZM6bu+dz5d2
 hcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+41tS5+PXOd6IqKhB/HyaZcXo5OjRtpQd20dhhM44jM=;
 b=dQWUSY7oG7f1tKP4pQE7t+BNBqW90aCm5YQ0lbEDP/emoCkeiCPQhjeQ7OZdEeKixg
 oCJfoYwRNaEORVNatH+LNX7c0BLVUmZezkfhzkEsJt0NB1OLv4vzyb00j56YJ+uC0V46
 LKrNEs1D/U/1s/WVgfG1uECzxmYWA6prbv6X5GceOvO34LsIRNJ1HySrD/AtVQtmF3lc
 SyXbLBECMy3jmiEpyJzbjYd1Q0aIHmc2/dmDZ2rRTYn268AgBa6g/ddYHzmuVDzhno7Z
 5ai8P7KwJIINOb1EfzN7oxIY+kExNCkdFjzu8u9jMa3MMePa12bzFH6bYFLEn+dFGCns
 1QHA==
X-Gm-Message-State: AOAM531rMz27LyNVipinntTid6rogKTP8lMaFJemBb0IZH4TAsVmijt5
 im2CpjvwnReiKvAUTYwnPGWOcQ==
X-Google-Smtp-Source: ABdhPJzL9/mMgcRPxkJrdyd7DsxzOK7yJNeK6Tw4CiDxiYmjWRqtbV3SjuCxQTWgfwFTiP7Cdtkn/g==
X-Received: by 2002:a1c:143:: with SMTP id 64mr10179298wmb.187.1626255414976; 
 Wed, 14 Jul 2021 02:36:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm1845813wrm.13.2021.07.14.02.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D116F1FF99;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/21] contrib/gitdm: add domain-map/group-map mappings for
 Samsung
Date: Wed, 14 Jul 2021 10:36:27 +0100
Message-Id: <20210714093638.21077-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minwoo is listed as a Samsung employee working on nvme so I'm assuming
the QEMU contributions are work based.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Klaus Jensen <k.jensen@samsung.com>
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
---
 contrib/gitdm/domain-map        | 1 +
 contrib/gitdm/group-map-samsung | 5 +++++
 gitdm.config                    | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 contrib/gitdm/group-map-samsung

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index efbbb15643..beeb24341e 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -26,6 +26,7 @@ proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
 rt-rk.com       RT-RK
+samsung.com     Samsung
 siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
diff --git a/contrib/gitdm/group-map-samsung b/contrib/gitdm/group-map-samsung
new file mode 100644
index 0000000000..e38c7eeeac
--- /dev/null
+++ b/contrib/gitdm/group-map-samsung
@@ -0,0 +1,5 @@
+#
+# Some Samsung contributors submit via another domain
+#
+
+minwoo.im.dev@gmail.com
diff --git a/gitdm.config b/gitdm.config
index a3542d2fc7..e7a744146e 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -36,6 +36,7 @@ GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-- 
2.20.1


