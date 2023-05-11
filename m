Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAA6FEF73
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:55:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xI-0001IM-R2; Thu, 11 May 2023 05:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x6-0000w2-NL
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x4-0006lm-7j
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSNf7Opg+JwE6wW71Mc/2V8On4IgBIF4lQ+Uq3GYnm0=;
 b=Gd784D93mFz9j8EnxPZriiinjdI5N8NJWDcGTCnAzRkQ+FY1GPcsg4iPA4iekzRsYrWbRC
 0bFxop0d0xwxpr5KjCOFGMqGo5C76Abpes295DO12V9tMLM/wyBHGnNMMGkiLeyZp1TVJB
 Jt0pgDKuLhImE/tLUGQRdRGixt5VZ1E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-XUX0hQLqMHKXijNzWPZ3Fg-1; Thu, 11 May 2023 05:51:08 -0400
X-MC-Unique: XUX0hQLqMHKXijNzWPZ3Fg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-965c6f849b9so917750866b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798667; x=1686390667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSNf7Opg+JwE6wW71Mc/2V8On4IgBIF4lQ+Uq3GYnm0=;
 b=ifAHSX6wlfNIDNkMDQC0AtYn+nVp4aJ3Yet2bZpqG70DBCUJeZlGVnZYADgk3eOg8y
 cw3J4F6WVNiZm9wWGFCCh1gABS822aSzXcCp46oyw2QyP7zvwcFIxu+NZSXoLKlGR013
 kOSeZCM2a3OPHOTMeks5n0MjmS2bz48PxqXOs1DNWaEU/HAYaG3ArXDDryS1IiHAhH4Z
 6g/+Xj7tCxBP+jwV0LQoVLnaCOjZCGeNkpKLtC3wymCGo3qV/iO1hVyF8DVTfg4Fb77u
 NL8IrGSLqhwzTqmS40ZNoHZgMMSE40b0bUvDnSVpmikDzn3SyVw0CpfjNJ1NL5QO8/tO
 XLyQ==
X-Gm-Message-State: AC+VfDxAiHrCJRa5NH2vH4QfahcAoJ9+JtQhb6zpaVma8i7DOykoDziB
 U1C6fhkVjr4AUZPkAzOiJZs+3QJjl1Ual6cl172SS32xcjgg/BTsg9ksQQk1kGP95C6guEcGjRy
 /WhZiRjsR76+GCmT0Nsf+T0endtAdNsx7L6nIJDdWFuBhSZJcgBPiPip15Ima6kdRS2c3KYudZw
 U=
X-Received: by 2002:a17:907:9616:b0:94f:1a23:2f1b with SMTP id
 gb22-20020a170907961600b0094f1a232f1bmr19831553ejc.24.1683798666985; 
 Thu, 11 May 2023 02:51:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5kBHYwS5I4vlGt70EcDActepWIY5ldD+Yktvhq3z1EbjaK19wPJG4o7xGbfGOa46/JMVCrNQ==
X-Received: by 2002:a17:907:9616:b0:94f:1a23:2f1b with SMTP id
 gb22-20020a170907961600b0094f1a232f1bmr19831537ejc.24.1683798666689; 
 Thu, 11 May 2023 02:51:06 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y12-20020aa7c24c000000b0050bf7ad9d71sm2756982edo.10.2023.05.11.02.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 20/24] configure: do not rerun the tests with -Werror
Date: Thu, 11 May 2023 11:50:17 +0200
Message-Id: <20230511095021.1397802-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Tests run in configure are pretty trivial at this point, so
do not bother with the extra complication of running tests
both with and without -Werror.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 35 +----------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/configure b/configure
index 85f82a626964..e24a533b3af1 100755
--- a/configure
+++ b/configure
@@ -124,41 +124,8 @@ lines: ${BASH_LINENO[*]}"
   $compiler "$@" >> config.log 2>&1 || return $?
 }
 
-do_compiler_werror() {
-    # Run the compiler, capturing its output to the log. First argument
-    # is compiler binary to execute.
-    compiler="$1"
-    shift
-    if test -n "$BASH_VERSION"; then eval '
-        echo >>config.log "
-funcs: ${FUNCNAME[*]}
-lines: ${BASH_LINENO[*]}"
-    '; fi
-    echo $compiler "$@" >> config.log
-    $compiler "$@" >> config.log 2>&1 || return $?
-    # Test passed. If this is an --enable-werror build, rerun
-    # the test with -Werror and bail out if it fails. This
-    # makes warning-generating-errors in configure test code
-    # obvious to developers.
-    if test "$werror" != "yes"; then
-        return 0
-    fi
-    # Don't bother rerunning the compile if we were already using -Werror
-    case "$*" in
-        *-Werror*)
-           return 0
-        ;;
-    esac
-    echo $compiler -Werror "$@" >> config.log
-    $compiler -Werror "$@" >> config.log 2>&1 && return $?
-    error_exit "configure test passed without -Werror but failed with -Werror." \
-        "This is probably a bug in the configure script. The failing command" \
-        "will be at the bottom of config.log." \
-        "You can run configure with --disable-werror to bypass this check."
-}
-
 do_cc() {
-    do_compiler_werror "$cc" $CPU_CFLAGS "$@"
+    do_compiler "$cc" $CPU_CFLAGS "$@"
 }
 
 compile_object() {
-- 
2.40.1


