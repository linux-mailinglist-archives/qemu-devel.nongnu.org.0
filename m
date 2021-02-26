Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E787325EFC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:29:02 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYUf-0006KT-Go
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY85-0001na-9p
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY83-00049I-22
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id h98so7647501wrh.11
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrqK8m5bH0TYeFmkYwQErUjHLXqopQlqqp5xtPJzQyI=;
 b=rOYv8MrCBAz+vz14EQk0jDWqu39D/9qOs+1eIA/tYQFFMhgkC2jtiay7pLAPlh50Pr
 JfJ9m4bea3ph6tAfgxiBgNJZEfVqPAA8dzUvSnxYG/1UyA6EmPPHhcRlj7/fTtNEMm40
 u54RHupErzrtybO6a62/FifbUmwZzlZsgYEcpqwFpkhkC5HJ12Yi95nzMyfmIlasGNTb
 Q+sRS+z8iPY4GwLuaFWxpe9xCBzR0BMjBxkVR9jtuoM0lFPBt6hgxcVeCqhhO4oO9lEq
 9TK9Eqm961USLDxyLwjEVHAQ1cloTu6HqF3cNSdy6j9I1IRVV+BWCGSCBckGK5w0Pidd
 6Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rrqK8m5bH0TYeFmkYwQErUjHLXqopQlqqp5xtPJzQyI=;
 b=A6NTDC0RgxBYwQb4asH2MCPi8s0D5pPgMV06W5oiTvEXNkaGhTJizjc+R4yaA82l3U
 QnNjRFm4y+kbK7mRwTQ/F5ZG+ahgLuaW+oNDadyqjWw/t4zx/DTa8zil4Wh2BXEji0YB
 OIbS7+X8vXg2A25sDsOiPkcB8znr0V/4r+OYlTfsrXnQHoCE0nETuFvGsn661Ol5NONz
 J0INDUQGYTP7g3fs3xSr5awtZXSl8v9ARXLEskk1drbGWDL4cgwjJtwQwM6dPnKG6Jdd
 qMvsLqw4eC8pwJCY6SASvnAE7VRBxPbgRZWi9Li5fo0fFtlXokxoEOs5KIlptgKrX559
 NeKA==
X-Gm-Message-State: AOAM531Fxn8YDo0EIhsMv/1bhQTasuI/kadHFrl2359iYLBERHMd6bgA
 GrlEf3ke64NcwmAnlDYH7CHHiDNfkaY=
X-Google-Smtp-Source: ABdhPJyUdvyfznSinISbp++dNZvsH8Uw7nHNL72nq57ltGQYsYaDKqFTN1+7Yimz+nfb3JieNnAKEg==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr1779898wrs.44.1614326737646; 
 Fri, 26 Feb 2021 00:05:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] gdbstub: use preferred boolean option syntax
Date: Fri, 26 Feb 2021 09:05:12 +0100
Message-Id: <20210226080526.651705-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-2-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 759bb00bcf..3ee40479b6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3505,7 +3505,7 @@ int gdbserver_start(const char *device)
         if (strstart(device, "tcp:", NULL)) {
             /* enforce required TCP attributes */
             snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
-                     "%s,nowait,nodelay,server", device);
+                     "%s,wait=off,delay=off,server=on", device);
             device = gdbstub_device_name;
         }
 #ifndef _WIN32
-- 
2.29.2



