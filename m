Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5F41AFF8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:22:38 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD48-00078e-BY
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaL-0006gp-Ki
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaK-0001YZ-6B
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:49 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y35so31712255ede.3
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/zfYQqCX/9aRSWbJScPUII4oC13AO6Qw74gztGZOQI=;
 b=WvgEThNK65lL+570QaI+5vJXRYVcGXFwM3UrPpF5E3/ZvChecpPX1easMqZbUCfZPG
 YGiexAorse1MTgroDVbm/jdayD47Eq0qlYE/OuBXJ7/HPWolzzMVX8mQJUuYp2wExAHp
 NiYuY6cTpdzUYgH0mmfxA5ZSs9QXWfwJo6/CNBaooBW78TxB8tgUAaHkaET1XZyHkGnR
 kwqM4+bjQoBMdBUGae9uQXXVwxwE6IOqKaAn4a8VWGhA/gPGhziEUp6J/65YxkO7Q4J4
 p8InhxHIwSr+Yifi65uJTHc0UOJaCoRuqqqzBT/xk7X6CQMVEI+NTBSfykgR7PbzGDRf
 5OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R/zfYQqCX/9aRSWbJScPUII4oC13AO6Qw74gztGZOQI=;
 b=6cC/7rt4jOCZ6cIBABuBeSDogwDbmk3ptuQ9MfX32BjXufHw5kkBbe6tIZB54m4+X0
 t7JHxEnqteoplSu29DRTupRsXGlPId5mOpW9EEzk2R8r5FC/80NBXaQGwmGErkvXE9O4
 ni11o5+4Kbd80LDojjbBz4Rx4JleZtdowTXmtokBRenjtlmxlVQaI5gmuju4/1F5B1/t
 z2gTD5QYk/iE4h80587xcvYcDeZYPQRe91kO5BsPbXJmhPSMSLLv5FK3WeKd09IRaAoA
 F+lAVPhs+xNo3Iyg/epByWIzaBK85jLs46Pa/1gT3iw7R1LFNkoKerA53Z5Q+MK1e4zX
 HT/g==
X-Gm-Message-State: AOAM531mYRfcjqLHjF+swhMq+X4LOGU9SmzHNsJR4Xr5BbKQyoPZ1i5l
 HIwlFM7mIZOwEMuReWUeUaDhHYN4+SA=
X-Google-Smtp-Source: ABdhPJw1/yHl+G0vuFt0i5GQc07xt3G/6hk922PBHa7moadkpsiUPwnwjFmYqTiYkcmTEf6oRiUC5w==
X-Received: by 2002:a17:906:12d4:: with SMTP id
 l20mr6065582ejb.43.1632833503947; 
 Tue, 28 Sep 2021 05:51:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] meson_options.txt: Switch the default value for the vnc
 option to 'auto'
Date: Tue, 28 Sep 2021 14:51:16 +0200
Message-Id: <20210928125116.183620-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

There is no reason why VNC should always be enabled and not be set to
the default value. We already switched the setting in the "configure"
script in commit 3a6a1256d4 ("configure: Allow vnc to get disabled with
--without-default-features"), so let's do that in meson_options.txt now,
too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903081358.956267-3-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..2c89e79e8b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
-option('vnc', type : 'feature', value : 'enabled',
+option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-- 
2.31.1


