Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD13C8223
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:54:18 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bar-0005nJ-1Z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKj-0003Fb-TY
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKe-0004kw-MD
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a13so2355788wrf.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+41tS5+PXOd6IqKhB/HyaZcXo5OjRtpQd20dhhM44jM=;
 b=ri0qV83YrkLVOrWYXv6IdeUJhtYke3juG1+3NGg3x9rZDWC1obrFNBjNHInH/seCK8
 nSxQCC657sZXVe/juOLEQl14OxLSlf+uk37MvcDZWiqkHncwAu+eoGYhnKXh90B+MNqs
 GdCz2pHeRKl1j2yks86MQZn+1nn/h9r8XGURgye+o9TYDxkkYNL/jhK3Q/4VGpghV1a8
 2ojOL+bMxN5q0azlpkHC3zjXTuoWT9khreTIgOq0jx9l6l8O7WrUWJRIANhkszK7vvZU
 VIXczRD9ho4Prife6ekfR899Dx8CFSYwuAXqXQa5/5vpRXyGAi0qJTpJs/lbfqRBaPyX
 lWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+41tS5+PXOd6IqKhB/HyaZcXo5OjRtpQd20dhhM44jM=;
 b=c2gvMYwrmFwj3MNtX/hvrqG7+u22IeXnhYK0V/+CcisFkonD9W3vJ6fWxyDf9Zqx7K
 XtGczqER6wPQkFY+AFOOjAKMLgWsU+yHqzaRgTv6uTqWmvJK7gOBlisdGvLECb0UdOpT
 tESD/jHT+/D4gSbv4yqcHij+KG/XmjkCLgTyUg1D6FTPSm5N5/1QmA+YzzfaIbWosomr
 yLDLhgDkRJF1MDDPj7bD+K8JqbSFBR7LodRf4toRx28Aitr9P0upcOjMQbtnbJBhcFRa
 8RcuEH3+94FIn67Pyhs6nh0uEpMtc7o5u3zsNovgg7FAAQhfstGymYbzNGEk2atTy4t3
 GyRg==
X-Gm-Message-State: AOAM532Wq84Wie0cL1ZjbIg0ZUGtCkoE9zCVHeQlE1rms/UyZxqrEizt
 OlKFCpW6YLfW4etGD3d8FOgDcQ==
X-Google-Smtp-Source: ABdhPJxxI+L2YcR4VBEfiS3752z2nbf0aX5zpZlegWQ7PUpcRZxGifEExkyx+r90hIYCjhtAmQKtLQ==
X-Received: by 2002:a05:6000:136a:: with SMTP id
 q10mr11782503wrz.25.1626255451388; 
 Wed, 14 Jul 2021 02:37:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w9sm1573674wmc.19.2021.07.14.02.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E4031FFA9;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/21] contrib/gitdm: add domain-map/group-map mappings for
 Samsung
Date: Wed, 14 Jul 2021 10:37:08 +0100
Message-Id: <20210714093719.21429-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


