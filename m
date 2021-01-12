Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546982F3764
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:41:44 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNfr-0000Gf-3N
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG2-0003Zp-BS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:03 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFy-0004rg-S9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:00 -0500
Received: by mail-ed1-x531.google.com with SMTP id c7so3165919edv.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7Ps1224Yv/L2Ymofo09xqu1zxw8Gq01q++8CkB6yJE=;
 b=P00fSZfqSDCMRmRb69ogaBZbVBbyoz5FehCafvnnxYGIrXkzSzmajZ+NQoy+aMhdp2
 +LLMqezIZtFgLBuIGEBir/YbNE2pmpXzV8qbm2BRMWStpSuR988DiMPMIGKS0Ou5WpHO
 aEaN7HWgVsMA7PBn6bi5mtqZKQGu9265vHCr4Y96cBuuBQj+DVotMDvmFuEo9QM8jtQg
 a84SEg77uk9G6LNXclgbF+w0LSPrvqLAeZUX5zHruvQpBtLl7T/HykpybNrguU/j+Jkw
 oC6+YDFYyW4PvLdshB2BSJ/pWsvGJIyjUqMTFWiDE9kixYEtYVXiyZqZ5U0MNVyjkr2Z
 gEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c7Ps1224Yv/L2Ymofo09xqu1zxw8Gq01q++8CkB6yJE=;
 b=dMDX8T6tVDcvJ4H6jSRQiHf/n6DPmjsB55RGPzRRbQK+sAJvsNTGJUcEPXqSiAQ2hV
 CfbY/zCqigaQnTm2QzRrWLoOyLU5C7b8kF8n0GSDufq4o45lit1qecBHC99xJ5XHybMf
 H7yI4fIfizOaJ2RFkn6oQOEf9dx+eL4GdZBO0YOUA54aS9pF+EbmQHFTWoula2hJqEhR
 Hji70Bx2Nw/3OnExJYfJ/5LTKfESEtHbUyQLh6RDlIB1TS9NPZ9KfXgC7uqz5H4MqRai
 aiUaA+f7JPqmF6r4I3NNdioJWKLeH90NOiIkIj3ALqdiVHLXVLPAWlDQOtOVZrGUt7K7
 ZnHQ==
X-Gm-Message-State: AOAM53036dEwMTZ/JPcC0PgvmcS2PurQkt936QgzXSI0AN/3uubZfgfL
 oxVXZEdpHNemtHi7h9KVk4z1cSa2Kk+igw==
X-Google-Smtp-Source: ABdhPJyLhG0i0JDSgp++5fjF9E2ju7roh7BosWSktFWIqHdf/2McBHgJvw1zDszH8mU1a2cLmMyqIA==
X-Received: by 2002:a05:6402:1a30:: with SMTP id
 be16mr151205edb.124.1610471697700; 
 Tue, 12 Jan 2021 09:14:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] maintainers: Add me as Windows Hosted Continuous
 Integration maintainer
Date: Tue, 12 Jan 2021 18:14:36 +0100
Message-Id: <20210112171450.791427-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210107101919.80-4-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..4d9df874a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3198,6 +3198,12 @@ S: Maintained
 F: .cirrus.yml
 W: https://cirrus-ci.com/github/qemu/qemu
 
+Windows Hosted Continuous Integration
+M: Yonggang Luo <luoyonggang@gmail.com>
+S: Maintained
+F: .cirrus.yml
+W: https://cirrus-ci.com/github/qemu/qemu
+
 GitLab Continuous Integration
 M: Thomas Huth <thuth@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
-- 
2.29.2



