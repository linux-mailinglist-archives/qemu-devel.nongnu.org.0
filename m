Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598ED1BA00F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 11:39:13 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT0EK-0006NH-CB
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 05:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jT0Cy-0004ZN-1V
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jT0Cv-0008Fy-KL
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:37:47 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jT0Cv-0008Fb-86
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:37:45 -0400
Received: by mail-pj1-x1041.google.com with SMTP id a5so7304635pjh.2
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c10wxb4q0J6s5D/OfWrl3l7rc/a1C7ATc/5TPzmK3e8=;
 b=vAM+7KXPT3SW79VWhTQ4Jwy5eyloWML726rsxvHtp5aOz+BFNWYIolpvwEHp0tAS1w
 EM2O6kaal9QwpfNQw6uAGygn2liSsZa2lLcXWePx2mna58G7aSWl1yHiYw7f62Ill5l+
 EsAhfpD2ztd26ehDXBk0o8YO2CLUaan3n4TK2Imr/aSf9Oa8M714H119b4Kn4zYkz/3Q
 g5UW6LkINeYgUEfTs9vdE7nXD07gG4g1gC8DyGyd+wVxuNernno0zkhte0KvhA6s2uju
 uxYK+7Hv8spaDHmRxjXmPjDtyqOGxM4rED7epZyj7kY49+LWaJAJM/xO3a+meYbxc835
 L9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c10wxb4q0J6s5D/OfWrl3l7rc/a1C7ATc/5TPzmK3e8=;
 b=fArOmMiBstb/FN+neJQyd6uBCJy8OQE5H8M447SleMrxtFKHsQnoZt92B1TbR98AY+
 qenYB1/zmGa2yKVKGymU/8ZAKj1Z1IyPbC2zQqV2TLK6k1CvmPBBHI/yo4wbcLzESERF
 9/Bx2Dw7rBpQyvp+jq7zn+jVWvOriXqe6he1reA9oy5DS6T/Xgpus5aGjAOzyaI2ZKkO
 e4PW81pyaqROUfQh4CpWU5wZSoTAl7L/ucyi8/wUa89XbpHIyEQU/sANNV6qt7553Eso
 vLb8DyaFaPjLG/canJUUGc6TTPo2AuC5g8CV6GGm7F0K6a8AH39KmOLbNkwd5QzrJdaD
 ZaFw==
X-Gm-Message-State: AGi0PuZxcSJk8tGq8DDVaoR9qsKWALOo9ChtThlhpJ5Re3YQT/RxUduc
 Tj1Gk2/PL0aDq9qFtrwTav4=
X-Google-Smtp-Source: APiQypJBw9+z+Yk8E7CLQmNtWjvsg5EYLPippm1ZNPj/nSLUbUfc5bRXGacA3yXq7ZH4ktg97B+PBg==
X-Received: by 2002:a17:90a:aa0e:: with SMTP id
 k14mr15492021pjq.74.1587980263918; 
 Mon, 27 Apr 2020 02:37:43 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com.
 [34.92.144.28])
 by smtp.gmail.com with ESMTPSA id u9sm11333073pfn.197.2020.04.27.02.37.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 02:37:43 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH for-5.1 7/7] MAINTAINERS: Add myself as Loongson-3 maintainer
Date: Mon, 27 Apr 2020 17:33:15 +0800
Message-Id: <1587979995-17717-7-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1587979995-17717-1-git-send-email-chenhc@lemote.com>
References: <1587979995-17717-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa9a057..efe840b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1080,6 +1080,12 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
+Loongson-3
+M: Huacai Chen <chenhc@lemote.com>
+S: Maintained
+F: hw/mips/mips_loongson3.c
+F: hw/pci-host/ls7a.c
+
 Boston
 M: Paul Burton <pburton@wavecomp.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
-- 
2.7.0


