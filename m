Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D141FC2A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:17:29 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWetM-0001Db-TL
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXg-0002po-07
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXe-00016N-JI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cOF84rCmS7WTO0HbW0oz9DUXo06vj+3GXepVVOD4Pg=;
 b=M/6JDvqkoQdDVXW2OzxyCwaqNJbJ0jTIoq7OBp0iwRMeeAzAfQCpqCJnDt74Oau12LVahh
 IFk3IO/bBSx3lpBdyNTqwVFq0/vZCLGk2IYLm8Fn38AnLrFZvUer1n3INtXNSI+kisoiQC
 +0gUKP0UtcZpU8Rau1h7rzNOpsSG+VY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-2ykmLJsWM1KwMuuDU5mvjA-1; Sat, 02 Oct 2021 08:55:00 -0400
X-MC-Unique: 2ykmLJsWM1KwMuuDU5mvjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h24-20020a7bc938000000b0030d400be5b5so3359073wml.0
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9cOF84rCmS7WTO0HbW0oz9DUXo06vj+3GXepVVOD4Pg=;
 b=QfmFCaiOJVDuUSdSHU7UlegDYmOGpLsjE45Tl1H8ilL0i1yz4D7D8fxW1sttxVc/7W
 QwcJcHKeMTaCB8N1sEE7EYP0Uu8Uam0ixjW0HzzwJY96JflCkShJBJ2k9eHp21frzaso
 jwmbEwdf47xeME9kSC06WsVEDJxiv26nJi5saKYftAic3/6tXghDG7fw6Hr4jUpBo2kN
 ZHlI3Ee1YmuJHjuEjqDubJOVNXha7Y3R5yaTFrZqoCVBNcCImp3zN5Xd8kpFZAU8SiBJ
 vgFGRuK8E6lC+5hhcoERPb8FDVuii70bZKTLXmWKVC6rGJDvXsaDWegDdC6+mnY20xPX
 XfWQ==
X-Gm-Message-State: AOAM530+fmm2ciovK417eYFdCkr9nSQNBuSJXPK2F6ZXR3ms+9Biwn7K
 i72qw/49m248QS4JVe8CHK1pFiJTMeu+Lv1hBx7/zYGWFFnM+isfRoi6hc2iFdWEf3JEnb3uDH5
 HhLD7ymOv3X74KBclNhv9Mt+xx3hRAoqrTqMIp2hXWUsiVEqz6Eo0UsSWoVOeRVhM
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr9217349wmq.97.1633179298732; 
 Sat, 02 Oct 2021 05:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEYfPco7QeJt1MbnGV0YAVEkNIsPSX2xggQ+cxCOIhC5Ja//3oCylj2OTXEwQB2mCra2x0Dg==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr9217325wmq.97.1633179298521; 
 Sat, 02 Oct 2021 05:54:58 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o3sm8574713wra.52.2021.10.02.05.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/22] MAINTAINERS: Cover AMD SEV files
Date: Sat,  2 Oct 2021 14:53:17 +0200
Message-Id: <20211002125317.3418648-23-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry to list SEV-related files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..733a5201e76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3038,6 +3038,13 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+AMD Secure Encrypted Virtualization (SEV)
+S: Orphan
+F: docs/amd-memory-encryption.txt
+F: target/i386/sev*
+F: target/i386/kvm/sev-stub.c
+F: include/sysemu/sev.h
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.31.1


