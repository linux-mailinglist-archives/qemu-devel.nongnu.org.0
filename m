Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B4408B12
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:29:52 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPl5q-0003kj-JC
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbI-0002zE-JC
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbH-00068y-3N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so14240811wrv.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYFvpsgHSuGUkE2kfQnK35cPCVzYcBdrTYC5ihd4kR8=;
 b=R7X5fkXMO+QUGeUzgGhGyXhCG4rIJIo+Ct1cPcCvVQgPnN6+r77kaw4IJfp9oXt8E4
 nInj/W6PKfr+Khi0PpNKbBra0z2PjlIbduvG6LtEvKgGjWNmQqka/hv3EZZ5pjDgPj7g
 3bYWzBdS7BRinCRXMcjq/ri+L9JlZCU26AyeAdu1ZPPAMu0wCLABp9bI7YS6tzqI/PPy
 t9Ih0TnkhFdhQSgAUiay8S0EeqMPyzp9jehNKcnI+i60vtbIgQ8TG3fOIdFIm1Sm06w2
 +3BRlNf4Fij9n+o9Op9GX/JeArK+x/mi08Ohu14VtiZ68TIBpnAHu3rvsUenuSkaiElO
 2cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YYFvpsgHSuGUkE2kfQnK35cPCVzYcBdrTYC5ihd4kR8=;
 b=506RTIYj04v+ae2zLeC//H21J441mRFWpXaOwGbu33c0E8b6L8ZjWEwTxDyfk/JMVp
 J7CXdSNLBLbvwdY5scGC7O29abuL6LbtYC26w+PIm69QFLF/FscHgw2iTmcZhDt9SLzA
 hXPRqb3IJI/agScburI2YISGyWNnFYoi53wY2Kwq4EoAg1kup+d3Ai8BFX2gCZ5AFM6C
 wgtQXFiJx1yVfcsU8dCLsSHHWCptIFaep3U24MGYNwBfzXlm5LdPrJYYAIhXFgE79Dxv
 KLRjeLKwxB15n5QlRUbUqAlUL7A5ORpCJOBkx29ncbHg8bA7fLTXODyYbXIMDHZ2l+pp
 7sQA==
X-Gm-Message-State: AOAM5322XTb13NpfE5wHi2vnzVr3bS5Q8nDSVx4PiOOVVy0H4UPjbkaC
 NQ0+HLFkgKrobNvBC9RZSe4Oc9mGgqk=
X-Google-Smtp-Source: ABdhPJzbKgerYGh5ys2B3mvZnwPrBdRrTSKhHA287fxc2y/AnEyZ2ZOenTwm7uT14IoLFLNRrEZ5ww==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr12006244wrw.174.1631534293852; 
 Mon, 13 Sep 2021 04:58:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] docs: link to archived Fedora code of conduct
Date: Mon, 13 Sep 2021 13:57:42 +0200
Message-Id: <20210913115742.533197-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora has switched to a different CoC.  QEMU's own code of conduct
is based on the previous version and cites it as a source.  Replace
the link with one to the Wayback Machine.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/code-of-conduct.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
index 277b5250d1..195444d1b4 100644
--- a/docs/devel/code-of-conduct.rst
+++ b/docs/devel/code-of-conduct.rst
@@ -55,6 +55,6 @@ Sources
 -------
 
 This document is based on the `Fedora Code of Conduct
-<https://fedoraproject.org/code-of-conduct>`__ and the
-`Contributor Covenant version 1.3.0
+<http://web.archive.org/web/20210429132536/https://docs.fedoraproject.org/en-US/project/code-of-conduct/>`__
+(as of April 2021) and the `Contributor Covenant version 1.3.0
 <https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
-- 
2.31.1


