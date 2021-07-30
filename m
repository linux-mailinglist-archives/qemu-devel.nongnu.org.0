Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AC3DBA14
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:08:59 +0200 (CEST)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TC6-0006Ii-3m
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2n-00057C-AN
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2l-0006k7-QR
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so7291929wmd.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybpq7YGDaKRKyk0i8Mhsn/DdfCsTran5Fk9EVIFVKMg=;
 b=VvtcTMaHEz44TZfhKU0nxV0Xne1LGHWx/KtACI9jTs+eVycZbdLXs86srZgR1XRE5w
 oQBcRWklo1OmWtFr3IFHTZmn1TOFuzCHfSMfgr1YSx7Iq9ICvDlNr4Ezn7JZ4qvd0ELY
 k0Rsvmk2wpl0GhRB1NBF3rsAC4Jb7kbD0+97QW6zuoknXx0Yu0Hd/GW8tr8GISUG6BS9
 HEXqZbs8Yf+b03snWnhx2VRsFkXl5lAzwiJ3MxT2px28z+lkZ8i62q/XhINLBU3d9fT2
 EBLOFbh/BDXEydDN67g6gkuz5xODsZiJ3RGM2zgxWPLz/0KvWdLqAvlIohsWmnlWtgCE
 cajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybpq7YGDaKRKyk0i8Mhsn/DdfCsTran5Fk9EVIFVKMg=;
 b=e6Po2uWYKyqo8n8qMZk8Bvc6oycO1AilwA9UuSolM+eA8u8exrQqPYP3kqt7MsPVnp
 FhvtR2ehxGDa+njtV3obnpuOr3BzwQ25ST55u6LPDP7NrErkki2SY8Sh800jXGmXByCA
 CZiTpYPJqcOjDOtHOFKKQkL2whMf2lHXu64KqtTdvHPNL24Tr+TOKiacaFggPU5ZXN2S
 rsvDyZzxYSbZyeKunz2MZO6kVQfp4K6muXuROMw6LujF4Ih8NKYm+zHubDhdCG/1vwmP
 HLp7j3kQbUcMg6cOJelrK0LKLlhdztOgVdz+PgsUtNQfROqzl2hlWsMyuw4aqYrLr6lv
 apiA==
X-Gm-Message-State: AOAM533McsDctfwo6r515xxraH6yFahlyi9a6sPgxjtYwasbFZg0jcvI
 2Iv27f6iy9JC5ii/dAEBcbhSHge/8P0=
X-Google-Smtp-Source: ABdhPJw7ZRPg6y1I1pv06fhSYbIzrKakYdZ/vNe6ADf/4o1h7oTYixYUjsnGsuDAPhaJERvFC1DFhA==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr3184032wmj.4.1627653558255;
 Fri, 30 Jul 2021 06:59:18 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:17 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/13] docs/deprecated: deprecate passing plugin args
 through `arg=`
Date: Fri, 30 Jul 2021 15:58:17 +0200
Message-Id: <20210730135817.17816-14-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/system/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..7ae6f1f727 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,13 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing TCG plugins arguments through ``arg=`` is redundant is makes the
+command-line less readable, especially when the argument itself consist of a
+name and a value, e.g. ``-plugin plugin_name,arg="arg_name=arg_value"``.
+Therefore, the usage of ``arg`` is redundant.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.25.1


