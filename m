Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AF42BB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:11:59 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaIo-0005JX-Ap
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEZ-0002AX-Jv
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:35 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEW-0005aL-RJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:35 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y12so7306675eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7plEq4p81FFj38cXa029iyAHNk4D+4Vmgv+BRxxENfI=;
 b=Ot0uYgLl1pCWlg5xhIvWrPYYw6WqxU8/YanNBAEP0qv/9L2vlRFjr9pHxcstkjWbvw
 Z5EddnQ7qx6KsqPFZw6I5H7P0LIcNtTwbYcgFmZAF+wZCBZ7fKpgzdq9IjDOYNIeyfh+
 9YcRmKrP2kF+OqbKwHtjD43gJwLDsyA3J/NoIG7SSvaKCgO621rZIutrgdsKs289ZMKY
 Foul4ZbNXpiXfU17c/9Qaile4ntPDP4ujtN1lKOLtkS1Gg35hnUQYGeuL9OFqI/5QU5T
 DcKxa3E5JVEjKukzj5DnMQ1G+501AQqagYbzhScJZ7cubVGgB+Rx2CTBsIUz9LTAjG8U
 ISQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7plEq4p81FFj38cXa029iyAHNk4D+4Vmgv+BRxxENfI=;
 b=miSpAKE186IDufBusuG77KB9hRQOvIykzeq0tmusws2P5afhlfKQ8x28Plfk73lk01
 cltpu9PUtCiMPedm6NfJ+cZKI4Smxohcb7pPlqtRv2gQLIpeWNIXJ6mFhkQ0KJfSkDgj
 G8SbrtnbQFenW3U7nTvTHLOO4o6c4ORfVpHFUMAMZkBzXwNSkITJVS0GLd6hftTA7uAU
 /gUOrXYhoQBdWMtygkOMj366HrqFBxhjukV5x92enm4KPRA4JSUzilN9rYB3OHE1t7lH
 SFsITQAYAt0MYuomPihqe2xtWRJKLJL0BkZWOdRszrQ29ef4o4FsHUkEN84S4pT1WeDd
 M59Q==
X-Gm-Message-State: AOAM532zvIFz91xwP7eK2gA0T85Zy+w7fPKXK2QohrZGpqwwZtsIf0n0
 MUzL2aHe507pUwMMdu/rG9v+XGLa8uA=
X-Google-Smtp-Source: ABdhPJyak+opCT8aGv/u8Zu1uGaY4baW+YNqSY8OP93IjIX73srjcDpOt3d4iMuwqCv7qHbD6zAfZQ==
X-Received: by 2002:aa7:c2da:: with SMTP id m26mr7732209edp.89.1634116050887; 
 Wed, 13 Oct 2021 02:07:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/40] MAINTAINERS: Add myself as reviewer of the 'Memory API'
Date: Wed, 13 Oct 2021 11:06:49 +0200
Message-Id: <20211013090728.309365-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Having developed interest with the Memory API,
volunteer to review the patches.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211007091949.319404-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f..32b668e92f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-- 
2.31.1



