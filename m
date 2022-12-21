Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802246535F1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:12:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83QI-00018r-V3; Wed, 21 Dec 2022 13:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QG-00012J-Nh
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QF-0004LL-2n
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6VD/Q5Gt/FhilrcqjJqPVJfwNa0pUgpO9CIhbWE9GA=;
 b=DtW+u+l63cweIrsKrrk4LesZEw7T+5BvuB4CHgu2hTudJu4gEcA9M9tiNgRvtCFS7fUaz0
 JSXjZGNQcDmZCbmZW7KmOxwpu/VvZGDc3F0XarP0znLG8jDvOCsghRGN6U04q3zqN/XXLD
 Rl98BWRw5ZXXt3qD7JlGI5s2vjDm3Qk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-rsM8W-44OrW9-0jMLUUR-Q-1; Wed, 21 Dec 2022 13:02:28 -0500
X-MC-Unique: rsM8W-44OrW9-0jMLUUR-Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 r14-20020a05640251ce00b0047d67ab2019so2806444edd.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6VD/Q5Gt/FhilrcqjJqPVJfwNa0pUgpO9CIhbWE9GA=;
 b=VAXx4mvamtMQCSCCs9ex9bVNwggmdMY/hEdGwtW9d+bRc614sB1RTJDDSd/KOfK2KQ
 zl90VR6yWlqC5/LUZEKAW97UEWMBgnbuEVFJWylEwN+Xw3sjEREFbVh0w25ed2Jd9UKG
 8qcy1CbJUweKmJn/5MWpNClZaOgTuKv48+xHoyLPit9/3wnwqW+HH7QFLKw0zHa2cYH7
 0sLGhz7g0wp4ByV09p6FSsb4oyUcf2+7eAUOuNLo2dQGf9tsCn4g/QQQ5+6CkiwGEwFH
 x2o3CIRz6aIJpK70hG7EId7bvA3gbKRsoT+6PHir8nFjyAoXsfWSKVJnn3wDJQKZ4T3E
 0Lhw==
X-Gm-Message-State: AFqh2kpXO91ZKPsKl7eiU89YK6JyE3J3Jqwmldqo/rO89Oj+PaB5yoU8
 Y8wF9uKg5M64we8zHrvViDl+IFfzM86XkSmNvIsdEhTg7KQWd6uBVmIlmPWxDIaetvvLBLC+K3o
 jgxh6NGnjJKIthOV4cWMT0hkLCRdtc1NjgHKzcSBENkvWN6FAXQw+gFVMYkG8nkP0iJ8=
X-Received: by 2002:a17:906:369b:b0:7e2:c573:d2e9 with SMTP id
 a27-20020a170906369b00b007e2c573d2e9mr2203930ejc.48.1671645747211; 
 Wed, 21 Dec 2022 10:02:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsd3epJwkRTBHs1HELQ4NrCfcCj7Q3lygGA3V//43pv/wogL+rTEBV452yHiRRl/IJmOAKB7Q==
X-Received: by 2002:a17:906:369b:b0:7e2:c573:d2e9 with SMTP id
 a27-20020a170906369b00b007e2c573d2e9mr2203912ejc.48.1671645746956; 
 Wed, 21 Dec 2022 10:02:26 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm7246330edq.88.2022.12.21.10.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 16/24] meson: support meson 0.64 -Doptimization=plain
Date: Wed, 21 Dec 2022 19:01:33 +0100
Message-Id: <20221221180141.839616-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In Meson 0.64, the optimization built-in option now accepts the "plain" value,
which will not set any optimization flags.  While QEMU does not check the
contents of the option and therefore does not suffer any ill effect
from the new value, it uses get_option to print the optimization flags
in the summary.  Clean the code up to remove duplication, and check for
-Doptimization=plain at the same time.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index d61c7a82f112..dbd0b5563446 100644
--- a/meson.build
+++ b/meson.build
@@ -3752,18 +3752,16 @@ endif
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
-summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+option_cflags = (get_option('debug') ? ['-g'] : [])
+if get_option('optimization') != 'plain'
+  option_cflags += ['-O' + get_option('optimization')]
+endif
+summary_info += {'CFLAGS':            ' '.join(get_option('c_args') + option_cflags)}
 if link_language == 'cpp'
-  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args') + option_cflags)}
 endif
 if targetos == 'darwin'
-  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args') + option_cflags)}
 endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
-- 
2.38.1


