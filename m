Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6E4CF063
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 04:39:07 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4DC-0006ug-6q
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 22:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4By-0006Bj-6Q; Sun, 06 Mar 2022 22:37:50 -0500
Received: from [2607:f8b0:4864:20::532] (port=39723
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4Bw-0002r9-Oq; Sun, 06 Mar 2022 22:37:49 -0500
Received: by mail-pg1-x532.google.com with SMTP id 195so12487099pgc.6;
 Sun, 06 Mar 2022 19:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BonByL1O0I6JsVc0A6XJcivhDzcl3TUswE5YKBOOZpA=;
 b=jiuNYqccoDbmU9fyTWR+et6ZU16dHdanDFCrUaDdFnjilrZKUHnXksyuKM1uZ3q95w
 fSs6zSMkagiIJWyZAECILKMGL06jEXgKikXtma17JYx4LOugHQuzzqAfvhgeO9wLdICf
 0j+9onlfcF7852j2ZICqlifmt+tbenil/YKk2LA4QE9FOmOuWyKHLR5MlRl/GJ8Mhzum
 S67/1AhjkRpgTND1EPVUXqTGxNCoPUTmYl3qUJtXkUBi/kMiXiuQYE+mZxwk4Rp58mEK
 y/76TBgeiM+2W3PICAkUFBfHIiSPJWGqiZQc2VWihFoRzoSN8ix777tZDpDBDhSYAP7P
 ZMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BonByL1O0I6JsVc0A6XJcivhDzcl3TUswE5YKBOOZpA=;
 b=rSpQQobiTYMaY34JvWArY8YBl7gKwjvAc7EWOf+gJXwrSW7THnO2tgLLZgcK6WAUu9
 eSyRy2ri5q/fU6sLtMte2RpEhYx12hqSTt9XuMXtJV4B2BEr8+92ij8Nefw5nIoRWcHF
 xcu6cdWTozhsQwa37fduY1pXkcFITlfYveXpdcf0oIM4tSmJ0IBzwo/pIYxwL6OHPZH9
 RLUNSQ7lddmJF8u93tbfoZ9XpE7bXmLtFqb4xiT/qKPMz/BmrdmVSG7GaO018hMUVzps
 mTP7scCli06lky54WWJnx3quzxdlxy8OKGOTD8ItDMboBgC2rPu4grpTqsOLcTJLOk+f
 f2ag==
X-Gm-Message-State: AOAM532tnJmatvIaVhBUo/cuBHbMsanDkhAK+OYYfXQBG1wOrcBUJDrd
 6Gr5l6oc5ta6Rh8yzujIfwgeNgmXQ0M=
X-Google-Smtp-Source: ABdhPJwBIEciMEJYioVGkBrXwndOucuOxDB/N94QzQ6NkoGY0LxhQkQfkT5ks1aVYaN7Y1RdSmL3ug==
X-Received: by 2002:a62:78d7:0:b0:4f7:d87:9016 with SMTP id
 t206-20020a6278d7000000b004f70d879016mr324980pfc.73.1646624266364; 
 Sun, 06 Mar 2022 19:37:46 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9058:25bf:2793:c7c7])
 by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001bb82a67816sm10744194pjb.52.2022.03.06.19.37.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 19:37:45 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] checkpatch: Check .m, .build, .hx, .json and .plist
Date: Mon,  7 Mar 2022 12:37:33 +0900
Message-Id: <20220307033733.6953-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ddd8148d87e..bd666129d3f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
 my $P = $0;
 $P =~ s@.*/@@g;
 
-our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
+our $SrcFile = qr{\.(?:(h|c|m)(\.inc)?|cpp|s|S|pl|py|sh|build|hx|json|plist)$};
 
 my $V = '0.31';
 
-- 
2.32.0 (Apple Git-132)


