Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314C2B7B18
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:21:51 +0100 (CET)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKb0-0002Be-HP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ7-0000En-7g
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:53 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ5-0003fp-G3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:52 -0500
Received: by mail-ed1-x530.google.com with SMTP id cq7so1406870edb.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sozi0upRiyVBExDmaEq+t/3SL6q0pm2zo/zvd4ASBjU=;
 b=mmBBUaLdOsRevSGIL8Z+Bl6O7Rsb3ffrHEy9ZYZdQnUuiHmR+c05vnyEpOBGZ6dwur
 a5FTCq921/GJxu6z4Df+My3iYGPts7jW8Ooa2lln0zpyxdDl2EPk8TxEOHHxJnm1gZFD
 LMwDPg0St2u2R/XV0kZIFElFVBAyWsTtBIzdCkRgkpO2H0iyE2aJ5WjOpQkup6kimm4B
 jmbKjIeUFi9cP9u9j3ACEbrKKqsr9y6KpY9eN1mZcajHLga3pAdGGy0BIvqFptlrokeg
 XtvtmqI3/30S5h2bKg/3W0JYcypCp3IS64P6sgFZjTapJYvO05Pp6NNtBpqx2UFhJMBD
 Pj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sozi0upRiyVBExDmaEq+t/3SL6q0pm2zo/zvd4ASBjU=;
 b=k1yFbLKH4Y2JWLVF0bPTY8DAXCVl3gVuXwpvFbZbEioGXzn32Oj1Ulrd4Iz8P++vj+
 /Vp6kt5cm9m1pHQeElX1fNguHOirXi45y2aomQb9ZL7ljGJWc2D33a3ymM6FAPlODmob
 xt/oBtmz8Hz/WwpuU2K8oB5Q5tapAXkoAfhDdGOqAuXHi0eBGPHl3R8tkIm4K3uQWqJH
 TRv3tQR6mHZcFZEyQxY6NDswiqXv2eGFRszpsBWnR84JV/C2dVvtu+fyk/zdUfExsfRs
 LfYul10hY2NJdRmoD1zae14a34N8OIUF3XIJqGykYqUgcRXzIfEyHNTf4T7UJl+eyq6X
 jkcA==
X-Gm-Message-State: AOAM530FG8VR+QZqjzQ9OH6dN0GQWUOrA+bCXntpdnryETb0qMhiRhim
 58quKdIaRXW84XNeS2ibGi76chA9DaU=
X-Google-Smtp-Source: ABdhPJzIIhXbSGhSkYI0yxC1jy++ya8qJIMI1l+9w5HK1/5CSKQ91VWE33IJ31qGch/1hkY59hduew==
X-Received: by 2002:a05:6402:229a:: with SMTP id
 cw26mr26284777edb.271.1605694789918; 
 Wed, 18 Nov 2020 02:19:49 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] buildsys: Help git-diff adding .gitattributes config file
Date: Wed, 18 Nov 2020 11:19:40 +0100
Message-Id: <20201118101940.132594-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
and 139c1837db7 ("meson: rename included C source files to .c.inc")
'git-diff --function-context' stopped displaying C function context
correctly.
We can help git-diff by providing attributes to the .[ch].inc path
names. See:
https://git-scm.com/docs/gitattributes#_generating_diff_text

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201014082209.3712625-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitattributes | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitattributes

diff --git a/.gitattributes b/.gitattributes
new file mode 100644
index 0000000000..3d2fe2ecda
--- /dev/null
+++ b/.gitattributes
@@ -0,0 +1,2 @@
+*.c.inc         diff=c
+*.h.inc         diff=c
-- 
2.28.0


