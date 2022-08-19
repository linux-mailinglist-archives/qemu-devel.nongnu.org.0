Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB95998AC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:26:28 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyGp-0003MR-1k
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOy3m-0004wJ-Jk
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOy3g-00020N-94
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660900371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4EMgKHQ0Xu+FUWhiEB9pMZWl3Cv1rgpBp876B0qD/Bo=;
 b=cbjqrFy96wQSrP3ti7YQGgV7WBaf5OhBYi0uT/WWYEKQdnwXIwxAshGqsfgBEwih/37YMa
 vvIb7JZInFOMUB+Spk174bB1ylhEpu52kRtJIlT48XUsN3mvKZVykIot3jLiw6JFzfLV7p
 HVx/mLaLomor+ZZTy+sDQJaG89Gk7ig=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-AhmgIYhNOImqmddCuB1MxQ-1; Fri, 19 Aug 2022 05:12:49 -0400
X-MC-Unique: AhmgIYhNOImqmddCuB1MxQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so2485065edd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=4EMgKHQ0Xu+FUWhiEB9pMZWl3Cv1rgpBp876B0qD/Bo=;
 b=FardZ5qlYCl9DGIgA+ZQvjF3xxxm6r44Se16MOfSdxqZ9z/4RMqhsMUmqvRQRo0O2L
 J9S8zM/3rNDLM1I9lzet2CskiFXwkXvB2DSKMC1lUasVo0nU5gtuYU3ea6Gsb8qJidPJ
 /aZEkW0HuvWpNpAzf5A9AaCe0gS0t9mrIh9AjCJhv5mOke9NNz7fIrrZNtDMrP2EC3Ln
 YkrVYbvXrscQ0LN/YKJU9YDfwM72fflibrgYkYNtjh2Hu+jzYk5fjbd8uig/63GULRYm
 /WKG/ny3SIiCayI462STINUoDGkoUW/4toawjQb7cvUDXqyAfVWjwc2M14Pr9nH/vKBy
 Yzaw==
X-Gm-Message-State: ACgBeo2yyQgQ4bx394rfPEkYE7ML2SB8eYvyBIy3HNeCmVP7KoQwS01h
 e33uh4kX+y6wUKodlLc3o/oUtBvc9PDf01Olcvk29IGW9JkNgda0UpCZ+smduGUowqulfM+qDpU
 /fOEyxfsxST0eBghDlWfDrwJVbyrM2iEiRc3EnJKw16vZLJefwc6NFqJwdXl4huLCYR0=
X-Received: by 2002:aa7:d508:0:b0:445:dd73:4f6f with SMTP id
 y8-20020aa7d508000000b00445dd734f6fmr5305820edq.231.1660900368285; 
 Fri, 19 Aug 2022 02:12:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR68O/b+1VlAH5q/XtRy91RbRU5NLh/FwoMxermco4bJRUuY+k4KlOvXAN+PeM2GXMtaerXixQ==
X-Received: by 2002:aa7:d508:0:b0:445:dd73:4f6f with SMTP id
 y8-20020aa7d508000000b00445dd734f6fmr5305799edq.231.1660900367870; 
 Fri, 19 Aug 2022 02:12:47 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 h23-20020a50ed97000000b00445b5874249sm2707625edr.62.2022.08.19.02.12.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:12:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] query-stats-schemas crash fix for QEMU 7.1
Date: Fri, 19 Aug 2022 11:12:45 +0200
Message-Id: <20220819091246.178546-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:

  Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to a9197ad2101cfc885cc316af299f49ba89039e54:

  kvm: fix segfault with query-stats-schemas and -M none (2022-08-18 14:08:24 +0200)

----------------------------------------------------------------
Fix SIGSEGV with query-stats-schema.

This allows management tools to query the statistics schemas without
worrying that some versions of QEMU will crash.

----------------------------------------------------------------
Paolo Bonzini (1):
      kvm: fix segfault with query-stats-schemas and -M none

 accel/kvm/kvm-all.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
-- 
2.37.1


