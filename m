Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30336A234
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:48:47 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLSY-0007KR-6D
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKip-00063U-00
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:31 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiV-0004MB-7r
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:30 -0400
Received: by mail-il1-x129.google.com with SMTP id l19so2612938ilk.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaNNaJI8YED5C6FCGe65g3uSHjcaTw5V2nEzlMwd5gQ=;
 b=wduaOpeCby0zTkaqrGv4miXNlg+bNQ7a7uMGIjGzBS4dXPLbvG2bJRBORzcbPukkH6
 SvU2XLdVdUVbFTc33msHGWpg9oPG/H55oFbSpAwfnzS98vtJkr/goM5Tdmc14SdRR35K
 3ZmUQkKaHW3IgGyB+NKX4XWg8v7d4+WcOr5hahQuZClPGPCsyvzG+HKrz4mRdpdAMcQi
 6Td9HP8HlMiiYQj5yzCQbjn2gwYivMVLm8ZsggO7QegFnBdc1KKJqpZOi9dHaByVgslU
 y8XxGmJoFYObppK8M88YX5sY1E3FrPPk3RwMkjdDlN87laSXdx5oSlmwKQQBiBTv2NZF
 W71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaNNaJI8YED5C6FCGe65g3uSHjcaTw5V2nEzlMwd5gQ=;
 b=KMkKnCiBAeMHgp+7AtRYOK3wAE2X/ytYPSk6CYMAWggagkJuxPD62j1CzdE0eZXgwV
 McXpHBXGtm78rkRAo/KWyZGeodSsGv8oF5gHgBcyydNU8cSo8AjpN+Th+IwpokFoEV4B
 LfyoX03upAAvq5Tcw/w1nWMc8YiSk7fpDXg6m4U9T2R7tAuAQzcW1iUQJyyxXRATLBNC
 qBvDDR7eULahrk9fs54g6lbmcByNM27xZHK9KA9W8um0ZWOk+SGSqWcRW+7v0vosj9ga
 ayXWLw/q9x/5t6GGXhyb1rns+vKC79IPmAWJ4BG4uJLyGK5TIvqv8kBzagsZj1ClumYb
 D1NQ==
X-Gm-Message-State: AOAM530Hl3MxmByuHvl5Rf6qQNeF/FOzuCjj3bXBU3TJWJTGkW5grDj2
 sbYrrfhtE4kFGDs2uFRDLfeqCxOwBc9OFjQU
X-Google-Smtp-Source: ABdhPJzc5yB2vTZosjIy9N3UwwIUb8vsGtEwRDWiMTXjeGZL5GALbZ1AvkbUwDe28TEeeOOOcaLtQw==
X-Received: by 2002:a05:6e02:1809:: with SMTP id
 a9mr7192869ilv.184.1619280066683; 
 Sat, 24 Apr 2021 09:01:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:06 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/48] bsd-user: put back a break; that had gone missing...
Date: Sat, 24 Apr 2021 10:00:16 -0600
Message-Id: <20210424160016.15200-49-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 1851311acd..d5c3168a6d 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -209,6 +209,7 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
 #else
     case CTLTYPE_LONG:
         *(uint64_t *)holdp = tswap64(*(long *)holdp);
+        break;
     case CTLTYPE_ULONG:
         *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
         break;
-- 
2.22.1


