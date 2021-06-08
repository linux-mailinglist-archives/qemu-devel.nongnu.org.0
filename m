Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD23A041D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:27:17 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhNc-00057p-Br
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqhM9-0003ek-Ez
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqhM6-0005WF-Ep
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623180341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SVbPVxrQMv9UwHIR32/OWDARg9VjrHygtXC1UTY9g0g=;
 b=HYHa3ISrwp1HqI+A12AIHvIZ18z3gSyQnLYJCW3qV3+xE07JAsOpobG6BH+2rC4bb7aZ6f
 fOaW+qFATLnHMiLiwF/CCGP+KgYGqRKl53STxq2mxKThozWjHSpDjZyJ4f+gYv5cEdLWmq
 wvrlw6t805EhR4nxX3MkTteydvAlXuI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-gp62FE_QMAW3-ltxNCvFVQ-1; Tue, 08 Jun 2021 15:25:40 -0400
X-MC-Unique: gp62FE_QMAW3-ltxNCvFVQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 a29-20020a544e1d0000b02901eef9e4a58cso8821696oiy.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVbPVxrQMv9UwHIR32/OWDARg9VjrHygtXC1UTY9g0g=;
 b=VxZu+5wpVXaOzhHWnERLRHfGuKOuOOUF7dGGSk6nZOdAxxmqViuFUuelLkcN5sLiG0
 e6T5npTEeYgIje8myeHbxDqtNuL3xJpOQ/v1IwXbKreppwahGsuazalRD6avNB31FtOT
 1gQ1l9Cq+fgYLYteyd7udRrebMgx/i9zWxjRK3tLk9CYN1BUGWU1IuAOqRQWd5P5JTVf
 7SgvoCCnX/5Sl8B211pt7JuCb1iNffc/LdvdackIAv3y2hftG7zkGJY+3PyOvtJSL6FW
 moe//DrcCvxloqteilkhWrrX9WiipSblcSJIeTmXxIpZnl1P8dmBXEnRMRakTP562tYZ
 gVPQ==
X-Gm-Message-State: AOAM5339C4ZrAZYXOntuXUldwhxf5ZhNlSN6MpWDXgXkcNAcFDAMo4Si
 80EkvlGTlwdMrDSap2j6yJvytOgRDS89iDEa04mmWmVuqcHCeIdmSB3eXKIK9I82KZOJYM2WPjm
 gKCoHJ5cHOs3+rU0z2nO0zOikL+FEtxycxhRQUFEGKYHLBW0c47mmYdJPJQnxwIeg
X-Received: by 2002:aca:d805:: with SMTP id p5mr3925498oig.60.1623180339713;
 Tue, 08 Jun 2021 12:25:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCWBVoO0PbRiOUN3ifIpBWSg/jLLOLG5WMFEyOn3dGp5rmUW07neZXIlS5KFwLyJZM2RsMxQ==
X-Received: by 2002:aca:d805:: with SMTP id p5mr3925477oig.60.1623180339435;
 Tue, 08 Jun 2021 12:25:39 -0700 (PDT)
Received: from redhat.redhat.com (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id f7sm2996893oot.36.2021.06.08.12.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:25:38 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
Date: Tue,  8 Jun 2021 14:25:37 -0500
Message-Id: <20210608192537.103584-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It may not be appropriate for me to take over as a maintainer at this time,
but I would consider myself familiar with AMD SEV and what this code is
meant to be doing as part of a VMM for launching SEV-protected guests.

To that end, I would be happy to volunteer as a reviewer for SEV-related
changes so that I am CC'd on them and can help share the review burden with
whoever does maintain this code.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
Note: because there's no maintainer entry, when running
./scripts/get_maintainers.pl on target/i386/sev.c, my name and the qemu
mailing list is the only thing that shows up... it doesn't even show
previous committers (as it would before applying this patch). Which is
probably not great considering I do not make pull requests to QEMU.

Is the way forward to get someone to sign up as a maintainer before
applying a patch like this?

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..3eb7ce8fc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2938,6 +2938,10 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+AMD Secure Encrypted Virtualization
+R: Connor Kuehl <ckuehl@redhat.com>
+F: target/i386/sev.c
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.31.1


