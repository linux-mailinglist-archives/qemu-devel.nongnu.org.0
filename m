Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198A559594
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:43:19 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4euM-0001gX-CP
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efd-0006Nf-Ka
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efY-0005W5-Mk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v588GaBKDDpuCNEdCzM5sGhdQL3uUyd+/iy8ZROE6Hg=;
 b=DH1O2iF/z8lKIz6j0AYsBTkyu/T4fz8KmWBvrtFCx59e1wVLNCy6yIjFg2xbbOdDsnE/0n
 ml+/SuuqXXBUQNeTqD5g8++NKD/vA6Y7dPGK/Lwi89aIDUEaZhUAqSZHWFHC7gZ47BFuya
 y+TXkici9iVUNQ761uYeqqs3wrFGLVs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-Sfyc4RVYOJODdpZTB7udgw-1; Fri, 24 Jun 2022 04:27:59 -0400
X-MC-Unique: Sfyc4RVYOJODdpZTB7udgw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y5-20020a056402358500b0043592ac3961so1381519edc.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v588GaBKDDpuCNEdCzM5sGhdQL3uUyd+/iy8ZROE6Hg=;
 b=p6se4pJtXEH2CQnzDa820bvqE8Q0VMAxYZ3rwsjWU2KvzlRUJaBLycUy74984Kd51U
 m4LsjT4bdsZ9l6ahKnZCHHpnVgnaLvkf0MGfK3wDwDnevnC0vmGKHfNK9D1pJIh13wgH
 wG/TCIJ6/4Dv1T4wBACimsqJwHUXKA+oChj1lyzRYnHkIjl5JrobmplNpu8zZl0x7wnp
 QTyCYyIaiIdcB9z7RQEZ4zu63nZ0UAURABPHPpIJNxMCJpye0O09p13MzgX51r25rDik
 EutmqlWmo+xm7xfnq14OEsBSeETp5TpCS3et1nhQmxlBQN1qenoL4S4ZpiAVxXM0aC4F
 pmcg==
X-Gm-Message-State: AJIora/l519lmP7vrlyUgzTXPrcKp06LfLWZVmZMicuWOUTlmn3HpNRi
 z99Hn6eXGzGqkX5HoMi4Ro5dZQXZb07CeyV6jxbQzbz64kCdzWhCatf52SDjQgibMk40h+gkCas
 EmHXzj3H6psT83pgm1qu68y9jW/q1tV8zdnSviJmsX2YQIP+BqG0na2TH+bW5vMnODqg=
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id
 f11-20020a0564021e8b00b0041c59f62c26mr16055669edf.156.1656059277663; 
 Fri, 24 Jun 2022 01:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1too4n7VxDKdtitWHwjsQIZjO+zm63q56vOciwMH/5K0oemY3rW8lRipRSn9VaMWQ0nJfhZ1Q==
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id
 f11-20020a0564021e8b00b0041c59f62c26mr16055654edf.156.1656059277433; 
 Fri, 24 Jun 2022 01:27:57 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a056402169500b004357063bf60sm1414927edv.41.2022.06.24.01.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/14] meson.build: Require a recent version of libpng
Date: Fri, 24 Jun 2022 10:27:29 +0200
Message-Id: <20220624082730.246924-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
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

From: Thomas Huth <thuth@redhat.com>

According to https://gitlab.com/qemu-project/qemu/-/issues/1080#note_998088246
QEMU does not compile with older versions of libpng, so we should check
for a good version in meson.build. According to repology.org, our supported
host target operating systems ship these versions:

             Fedora 35: 1.6.37
     CentOS 8 (RHEL-8): 1.6.34
             Debian 11: 1.6.37
    OpenSUSE Leap 15.3: 1.6.34
      Ubuntu LTS 20.04: 1.6.37
         FreeBSD Ports: 1.6.37
         NetBSD pkgsrc: 1.6.37
         OpenBSD Ports: 1.6.37
              Homebrew: 1.6.37
           MSYS2 mingw: 1.6.37

So it seem reasonable to require at least libpng version 1.6.34 for
our builds.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1080
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220623174941.531196-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4b2a0b35cb..bf8cfcd5f9 100644
--- a/meson.build
+++ b/meson.build
@@ -1211,7 +1211,7 @@ if gtkx11.found()
 endif
 png = not_found
 if get_option('png').allowed() and have_system
-   png = dependency('libpng', required: get_option('png'),
+   png = dependency('libpng', version: '>=1.6.34', required: get_option('png'),
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 vnc = not_found
-- 
2.36.1



