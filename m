Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F30528BCB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:19:57 +0200 (CEST)
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeNw-00082M-8g
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5X-0002x7-A8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5V-0003R9-Rz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=S9V0vS5AkmOxJF8XrrSmH2yJh2FIvwPmB7GN+15ci0gVIGCv64QC7tQnehM9EGvwQkASE6
 0in9jp+ghnyYFTVAp4u955Mbwhm3EE1KMX6qSkB7X1WAEYVaKdT0Zhu2jc85aW0EjtC2T/
 6/8wk9WY10rf3OV3OQX9ZnzPz8ZUdxQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-7EY51dY6O_yfrbB_P6eepQ-1; Mon, 16 May 2022 11:56:48 -0400
X-MC-Unique: 7EY51dY6O_yfrbB_P6eepQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 n7-20020a05640206c700b0042aaeb9d702so2473553edy.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=p9zmpXrsbJa+nM9XgFQfaAHix67o3sPD8rgPHGkymn4aK7icp0+F2OjAIYcIOr2RX1
 Gq6WmjL82a4Z5KqEg4aFWBbdS6mI5th6W5N3polgMzmyspHok/QmmsNbMOlKXUxpPtcz
 J7HYpPNWqHfXSt7/EV3FEu9SdOwDuwOJiNVYIxa4dKQBh124MQdP/I77MUbM5TpAPrXl
 WmWG/ULFNqmMGAJsHMWWSoLAWNSJkE2CK47nTWWTKppOH6KTge5NYxzflYZNjfQqL6qO
 Zk59lJdreqAES2DF8lwNjdRVpMmtfWWHRJNt32lR8Sp+6IuHQcdMghkr7aQ+TY4HDY05
 So3A==
X-Gm-Message-State: AOAM530E4/RldMA55HQ6+/BGPVHWdG7FgoHpP92oZ3WyoUKUOks51MXM
 DscPrvs7nFXGBpzeP73v+UiY/0E2Y5FoYMbr6z6FNHR/ydmG4GBP8igVY/tVuUFlB+0yhdZlONn
 sddsMI7c+0b/NLxNEUVs9gKMzewe+T1MVWLzebEtfLalNZWaDJqylGdISdzGR/bz6T8I=
X-Received: by 2002:a50:fd11:0:b0:42a:b6af:6e13 with SMTP id
 i17-20020a50fd11000000b0042ab6af6e13mr3991213eds.221.1652716606803; 
 Mon, 16 May 2022 08:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZ6HrRPbzCBnHSJPPO3nun5fkGOIW8M30HFKOiyCYgM469AbUkolXt+Fa+DwvuM6OM6Gddg==
X-Received: by 2002:a50:fd11:0:b0:42a:b6af:6e13 with SMTP id
 i17-20020a50fd11000000b0042ab6af6e13mr3991190eds.221.1652716606562; 
 Mon, 16 May 2022 08:56:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ia21-20020a170907a07500b006f3ef214dd4sm49659ejc.58.2022.05.16.08.56.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] configure: remove duplicate help messages
Date: Mon, 16 May 2022 17:56:03 +0200
Message-Id: <20220516155603.1234712-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

These messages are already emitted by scripts/meson-parse-buildoptions.sh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index dda25f05bf..0cc8c876f7 100755
--- a/configure
+++ b/configure
@@ -1043,10 +1043,6 @@ Advanced options (experts only):
   --enable-tsan            enable thread sanitizer
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
-  --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
-  --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
-  --with-trace-file=NAME   Full PATH,NAME of file to store traces
-                           Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-- 
2.36.0


