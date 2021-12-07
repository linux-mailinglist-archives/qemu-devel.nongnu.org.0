Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F146BA6C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:52:16 +0100 (CET)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ15-00080G-RC
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzV-0005AI-4K
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzR-0004lV-Mm
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F3DMW5X+1kgwWjKbleb+xT+24zSWr0nX8BD43kokIFo=;
 b=BEh1Gku03OipcJCZpaHpUPAaDv4XaYkEqFXl4PC33g06oJBGpMzVp1UBoqcgbIfkHm10zd
 tNxhBfvKaRgoYqvXh9xwUOSF4MXiMfX6rlSzfU301yFqipP/XvX/48l6tk8qMYtehVyYjk
 MNvlIenDMUBhiMckubjp+dEyM5KclKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-71PDaW7YNGKwBNek5X0Oug-1; Tue, 07 Dec 2021 06:50:26 -0500
X-MC-Unique: 71PDaW7YNGKwBNek5X0Oug-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1251955wms.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3DMW5X+1kgwWjKbleb+xT+24zSWr0nX8BD43kokIFo=;
 b=ZqdQ109B0a4ucujW/X+WoCsADQMcQVeOcervBo+QVrKc8SY6Fg1md9B/91cRdnWlwm
 vf1/GAcr4DZ7TyUvcbV/QVTDK0dkr6+Rduo0ORsRsAdNM7Owz03jwysVKFudsqsl6Ek0
 unZmxL/142zs9tmDAVeCvN4k7h+r15PmeANKIK5hRFWi+I1M7WVNJWlv+K7gBQVIOFqh
 1axTM43iNHnsBxFEi/bigh4BessVzxTySp4rsOfvcrBdUY5gkbWo95cmiSzi+1ljQNkw
 p8IFCpv2FtVXI3XwHv1ysG1u02V6drR0bV+CXyhvpIvRC0/b8IJBy4qcE/8hGPNNTtEl
 ql5g==
X-Gm-Message-State: AOAM5304g/LX29dfFJFljbG1zD3cjbw32JdUFHt5uSlHun/gTDUPERlH
 qE3Hs2zcdv9TyF2hYnquzmGRsGzBN2D2el17+4IiLYrOSO+loPvzOX25GygLAiVBcGSB3u415tP
 0avxYWbPvrvx+Ks7N1Fl0II5v6gNY2ohT06N/ixWPqh4RRLUAdMhKk84xA+ouZY6F
X-Received: by 2002:a7b:c742:: with SMTP id w2mr6268559wmk.65.1638877824943;
 Tue, 07 Dec 2021 03:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/8VJNXpSJ/df4Wtd+rNxMM+dYwRTm84Xdvr8R8h1K2VwkvwUfHQ8Zel9XiyGcpng9Dy8XFw==
X-Received: by 2002:a7b:c742:: with SMTP id w2mr6268517wmk.65.1638877824611;
 Tue, 07 Dec 2021 03:50:24 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:24 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] migration: Postcopy cleanup on ram disgard
Date: Tue,  7 Dec 2021 19:50:09 +0800
Message-Id: <20211207115016.73195-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some queued patches for ram disgard cleanup, and some debug probes.

QEMU's ram disgard logic is probably a bit hard to predict because we send a
bunch of packets to notify the disgarded ranges rather than sending the bitmap.
The packets to send depending on the bitmap layout.

Initially I thought it could be a problem but in reality it's fine so far per
my initial measurement.  So I'm flushing the cleanup/trace patches out because
I think they're still helpful.

Please have a look, thanks.

Peter Xu (7):
  migration: Drop dead code of ram_debug_dump_bitmap()
  migration: Don't return for postcopy_chunk_hostpages()
  migration: Drop postcopy_chunk_hostpages()
  migration: Do chunk page in postcopy_each_ram_send_discard()
  migration: Drop return code for disgard ram process
  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN

 migration/migration.c  |   5 +-
 migration/ram.c        | 103 ++++++-----------------------------------
 migration/ram.h        |   4 +-
 migration/savevm.c     |   7 ++-
 migration/trace-events |   4 +-
 5 files changed, 23 insertions(+), 100 deletions(-)

-- 
2.32.0


