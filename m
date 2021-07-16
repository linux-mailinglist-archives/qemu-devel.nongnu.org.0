Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AF3CB3CE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:09:53 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Iuu-0000zT-4B
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpY-0007Yl-1w
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpW-0005P8-M5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso6573576wme.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQ4eoAhFvF5WLmzSkOUBXUWpS6dwt1gpkEIzciIqlv0=;
 b=GzO6Z+mKwv8Q7n0/GPrPVD4J3L0YK8PFvSs/gsjnlEDRAP9yVjJXdaJlzQfsvgkSVM
 v7dukz2J6Z903xn4df79U5JLnzZdkNjot5zR20VlmfbMEZzVgvGJfEPyU8A1bm14BFQx
 dmu93HTBy2W73lbEFJfkMHMS98IGGNXpKW1xdv2QXW7p2+dOPmBwDYCeHf91Tf2iZCin
 HLREGWID/sroEL6Df+9bOwwb4dnEE3vbtuAWdEMfEQ31zjwPsCTHFC1eHyJTlZZx6pR2
 3uXGdLEaWciHDJmBBQDnMUCb2vWKBQ3IIeQw7IX+mVppxFz4E6k6ZLdu0cKPJC+69YJQ
 0SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQ4eoAhFvF5WLmzSkOUBXUWpS6dwt1gpkEIzciIqlv0=;
 b=CYPTbMPAgkI71ZGVGep/7hPrrtfUau0dkmg2+0mi0yXdwm9iDCtXbggi2iyR9NkVV4
 J5iFUmT0hJMs1o9yZN91zha7J9hmcbIiFgR+dRaChyfy4hEam6TpJqWlwMvTTGUroNT9
 Oq+ELPSjJvI6/Pg1gFsQYyCUYYFpkg0iqcYlz8aNorp41PvH+WJQrfqhcZgdCJM872tj
 af09bbXDLr8yvfs9Tt/9Khc/WnmrtREp0A3XgILKySsw5tILJOBWDc3DLjLAIE6LsZ5d
 kh6KcaGaIDOM7X5Hase5Y99XYlbNPonuWpVXXnJ7mfNtoRN56QX+M2jyLkuakDT1EyGA
 Etzw==
X-Gm-Message-State: AOAM530AP6shw3Fyp37Wef+HQGpPldJ6kWjj15KJiW7CLHlbtNsNVeEK
 TXCcdqiDKZkmUeAwiHwoCrIiszYwuvfhtw==
X-Google-Smtp-Source: ABdhPJyTrjanosCqlPGlKoaAoeimkuvDariCCUwT1rqFiyr763n90S3Cy7AwFzVmmwJLBk1iEKfG4g==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr9128986wml.116.1626422657285; 
 Fri, 16 Jul 2021 01:04:17 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] docs/deprecated: deprecate passing plugin args through
 `arg=`
Date: Fri, 16 Jul 2021 10:03:45 +0200
Message-Id: <20210716080345.136784-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/system/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..aaf0ee5777 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing arguments through ``arg=`` is redundant is makes the command-line less
+readable, especially when the argument itself consist of a name and a value,
+e.g. ``arg="arg_name=arg_value"``. Therefore, the usage of ``arg`` is redundant.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.25.1


