Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FE4253F7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:25:05 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTOS-0007fv-IW
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8i-0005Zx-Tl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:49 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0007ru-UE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:48 -0400
Received: by mail-ed1-x536.google.com with SMTP id l7so23151300edq.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftmT9YotYt0hCdHUhKteZfUtoPMXpqMbKG54IoOz+SQ=;
 b=n9vICwEhCyLrh3GYYIJkRogBpAII4/bmNaAq3N3jXVOB77tDSYgxH/oVyMMb3AMem/
 ufpeb/l/dvP6DMTWcKPfSmMd8uDovEmjAyGqG2nbwxu4ebr+uyl0rXBGLqcGOc/4pq1Z
 dEUdbmQZMVruSulGW9oN9TL5v9ub+m2QKYWXIN1uQqlpt2qVBTsObFAORDAlFsbWDetr
 wo40JT0UfOfYAiBFrvx7po23/Mv7MajpXD97JvP9YG+khwQxi1HxUH+G138/MUZlOhdM
 uDCHPtoQr2g6bz4JLld5xEXkIEzrNyFKCyEamOneJVlkZ+eQOKeF+8kVSRsS5HaXE0tu
 /QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ftmT9YotYt0hCdHUhKteZfUtoPMXpqMbKG54IoOz+SQ=;
 b=wg9n9JXvEmZDsQKHBKTbG52afc/pQyk/WlPMXF+mYGkwdras424ecyPw66auHJ6ygw
 czFrPqSP3Jb9iEWCHRQTu2mGRhlnjx+b5al/1i4AoV++GuUIrvcFOU+d/gZrxQir1YG9
 xJXBjZRK35OMWMRDQKWZbNlGTuIgiVtdi+zUpf6x0NtD+egB9pJnq3cz/bgkaba+fQfm
 8V9DntENoIAhML5dmHC4tQZbEDvZtCoah1YvBv5Jn0m9jP/2wjvboUIhmpIiTDuKx0LD
 +d8XtFbALwnV10EQeo753fYX1Jebg2xXVQH+coikAZdgMWuATFU8UUmLzuuClBn2eYRQ
 6BSw==
X-Gm-Message-State: AOAM532AtV/IG7hJhDuuiGs9gJS/Jq2i2hjG58zQrJvKaVbV2UUf2nNQ
 YVUg1glUEOFyUJP79yrb6UVLKUuyJo0=
X-Google-Smtp-Source: ABdhPJwCpjY7HbWaxJLnLZoyu9dntJEkkWz0RdhkDR4idisKIrwmBv9jsWuZBSePO9HYYTGP7Jv1Fw==
X-Received: by 2002:a50:d948:: with SMTP id u8mr6294280edj.306.1633612120961; 
 Thu, 07 Oct 2021 06:08:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/24] configure: remove deprecated --{enable,
 disable}-git-update
Date: Thu,  7 Oct 2021 15:08:26 +0200
Message-Id: <20211007130829.632254-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The options were deprecated in 6.0.  That said, we do not really have a
formal deprecation cycle for build-time changes, since they do not affect
users.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/configure b/configure
index 33d330dcc9..d00ba0cbd2 100755
--- a/configure
+++ b/configure
@@ -1483,14 +1483,6 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update)
-      git_submodules_action="update"
-      echo "--enable-git-update deprecated, use --with-git-submodules=update"
-  ;;
-  --disable-git-update)
-      git_submodules_action="validate"
-      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
-  ;;
   --with-git-submodules=*)
       git_submodules_action="$optarg"
   ;;
-- 
2.31.1



