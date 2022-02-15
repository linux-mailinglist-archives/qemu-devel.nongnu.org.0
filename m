Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9A4B6852
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:59:30 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJucL-0001aV-Do
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCR-0004QE-Bv
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:43 -0500
Received: from [2a00:1450:4864:20::636] (port=39615
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCP-0008Su-2K
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:42 -0500
Received: by mail-ej1-x636.google.com with SMTP id p9so20021760ejd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRgJg5xfpuSAqjCPUPWulsWzAL4Etybls08rekRjgyc=;
 b=fZinXVP+NV/qUgE3PAsM0u1nLhqDmwwAuALQzMCFv4isQm5yzDxDaBeLYjnho9xjKT
 gily+qDbIy56aLjE2QnRQyhg5AOUW6+t8hlms9ch9zcuRlTEqw/x8DJpoM0ipqk0+fL6
 Ct1K12k1fhoYsRXxUHjwtAdW6wpMdhlL+ywMWrIczf1S6AmDriG0SzWORi9MlcCFTxXz
 buGn2y0gCs2I1Qw638jtauWExw/lPSwuhSALQyRcdgCs52kuhi2lQdJRC6nDe1EKe7E5
 Q0Fxf+VtArBp/WYSOuyQOzhU2cXTL72wJMdljYPO24d2kouz49RGHXpKKJ5eEZrtECNm
 RUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SRgJg5xfpuSAqjCPUPWulsWzAL4Etybls08rekRjgyc=;
 b=uwulXeRlrefgHelx3zyiYp7Cuent2723upSB7OYobO6R4hmus36TPQp/zS/bKT7t+0
 6lLxY2lIl5eBGhFkW7JxlxitmzRmHZ642KoGDNpuuL0g2uBolcFzdtsr0wrF69uEXS52
 sLzyZt3vDjYK3fN+VFal/9O/ODeLT4/0fJhsyaL8fJHSmZKomuLJAiZIWC4jyNK4WdHI
 NU89j55lJCkMsFEHt17fWBKhbjBwCCt/JheNR9a7GkYvO9ub0eDuDyt/MX4ip/w5Eqp7
 ICoo2m6nk8mjiTKlaPFGQ3MOREf3EcIerLM6lq9tT0y49HFkSYbf3Y89viGQ/gZWMsW7
 bZtw==
X-Gm-Message-State: AOAM530xewd+MR77bLdD0B5RH3ZjNAbJbPK3NCkrQX37n1bmySXs09Pc
 hYThtLJ4e7X8MtCEpjU8tsjRJSaYmRA=
X-Google-Smtp-Source: ABdhPJxPWnraBmWhFLBdbBu9uAY/HDrV0O40+pmjBQRvWPdWjU0uGtixSa0eIIqkouJDGhDws1vLbw==
X-Received: by 2002:a17:906:2ed0:: with SMTP id
 s16mr2167511eji.327.1644917559866; 
 Tue, 15 Feb 2022 01:32:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] meson: drop --with-win-sdk
Date: Tue, 15 Feb 2022 10:32:15 +0100
Message-Id: <20220215093223.110827-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's no longer used.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 29 -----------------------------
 meson.build |  5 -----
 2 files changed, 34 deletions(-)

diff --git a/configure b/configure
index 4c9f3f7cb4..20968ca7ac 100755
--- a/configure
+++ b/configure
@@ -317,7 +317,6 @@ pie=""
 trace_backends="log"
 trace_file="trace"
 vss_win32_sdk="$default_feature"
-win_sdk="no"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -959,12 +958,6 @@ for opt do
   ;;
   --without-vss-sdk) vss_win32_sdk="no"
   ;;
-  --with-win-sdk) win_sdk=""
-  ;;
-  --with-win-sdk=*) win_sdk="$optarg"
-  ;;
-  --without-win-sdk) win_sdk="no"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -2319,27 +2312,6 @@ EOF
   fi
 fi
 
-##########################################
-# lookup Windows platform SDK (if not specified)
-# The SDK is needed only to build .tlb (type library) file of guest agent
-# VSS provider from the source. It is usually unnecessary because the
-# pre-compiled .tlb file is included.
-
-if test "$mingw32" = "yes" && \
-        test "$guest_agent_with_vss" = "yes" ; then
-  if test -z "$win_sdk"; then
-    programfiles="$PROGRAMFILES"
-    test -n "$PROGRAMW6432" && programfiles="$PROGRAMW6432"
-    if test -n "$programfiles"; then
-      win_sdk=$(ls -d "$programfiles/Microsoft SDKs/Windows/v"* | tail -1) 2>/dev/null
-    else
-      feature_not_found "Windows SDK"
-    fi
-  elif test "$win_sdk" = "no"; then
-    win_sdk=""
-  fi
-fi
-
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
 guest_agent_ntddscsi="no"
@@ -2871,7 +2843,6 @@ if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
-    echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
     echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 6308225e3c..96d64ec28f 100644
--- a/meson.build
+++ b/meson.build
@@ -3409,11 +3409,6 @@ endif
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
-if targetos == 'windows'
-  if 'WIN_SDK' in config_host
-    summary_info += {'Windows SDK':   config_host['WIN_SDK']}
-  endif
-endif
 summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
-- 
2.34.1



