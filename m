Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB624898E7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:56:13 +0100 (CET)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uDc-0005Yh-Ok
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4X-0002eX-67
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:49 -0500
Received: from [2a00:1450:4864:20::333] (port=53196
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4U-0003rg-DS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id v123so8662820wme.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h7v7BWOEfKoZiYr8Hh6a43++Ncv/zq2SQHbPDqAbuuo=;
 b=KGWIdpnVClUarX3/r3wOU4UxkgFeJ2PowybESEW96qg/LqTzEK4B2j5rj/gKE8HGCc
 hwKXW7jNzs7N+exU1KY/hsVWjFY264do5D0YduL6fy95vXTkPyVYv6f7JpQdyXimgpXu
 oMnk8rQk/HHrmuoAhR0Rn12b2RL2eiWn6f2Y17QD19DXMwOMBXdH6l8rkSEQ8IJ+tPnx
 t+f1YczvPB/DdfbkcBVMJaP/yuX6qfqmTHoz/dqG+E90go2jeTIgBOVujAo8tZ5mDUHM
 M9XnKwEc++Jql/08Ud9xYzGORF/zN2tXgu2JTjycBTyWC+5SES5JumvU8v7VX+u1ZYD3
 QUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h7v7BWOEfKoZiYr8Hh6a43++Ncv/zq2SQHbPDqAbuuo=;
 b=1Y1wgHawQcj7XgQIWYWiYgVy27xSkfMqAiW0dwmHqcA7TaHIaAqOfA5urTMRjRyCxo
 L6WCtr3oxs2rXstLVV0wC6jbnqAbVrGhNmsFC706V7wzBVXdsXzXZxY6qpzK3Sl+J+gT
 CW++r0XeELCyvu/64R1FJUd6HOwDvJN5hirek86H8VCIrOuZZjBAqc9WQcJMd/dKfbB3
 6tIDzUh/JKWsdhQ4oEypseTKF41CEl/2JWPEmu7lETke5rmwOfMp5vjaVcnq1DSssufE
 IaT2X2lIS5w6NvkepHNSjWwTBQp+LHo9qSSKP20vglzR767kdZF/HyEwjTl9q9AktCLs
 v1DA==
X-Gm-Message-State: AOAM532abwOQcTY8rSpLcWnLfV49ynNeIdse6xQa+/EYQHCUKsdYJIu1
 o/mD6e9xoMbunwL/KIonG1zvt1mVTJlcGw==
X-Google-Smtp-Source: ABdhPJyhlwIQED34bejA9Akz/3c2W1BfKecrrygoSH91jwRDS5GMyiGnpHkg9yJd4H3d1RVaSVDDRA==
X-Received: by 2002:a05:600c:4fca:: with SMTP id
 o10mr21718887wmq.58.1641818804951; 
 Mon, 10 Jan 2022 04:46:44 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id s8sm8013667wra.9.2022.01.10.04.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 04:46:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Mon, 10 Jan 2022 13:46:37 +0100
Message-Id: <20220110124638.610145-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110124638.610145-1-f4bug@amsat.org>
References: <20220110124638.610145-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fdf..aff87d272ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3491,6 +3491,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.33.1


