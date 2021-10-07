Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220714253C7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:12:29 +0200 (CEST)
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTCG-00033P-31
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6n-0002VO-5c
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:49 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6Y-0006rB-OI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:48 -0400
Received: by mail-ed1-x535.google.com with SMTP id v18so22957769edc.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlayNTJNr8js8hz3DL48sPeNKKh14xHKjjrOf+SQ96U=;
 b=XFhzkkUlqDY1HAyCtNZJm5pg4A5W72J1mYsF4dOaeP0BshtdmJ4yPu8O/x2N3kBtPp
 8jFcypbAWRwsx8u63eBOQsiQXKZpB2kZYKcAL8VjIOESxc4TtHaGyrOkOFRSjwo3G2sB
 GEgBKP3OkjESRpiDwImTDs7XhNFGdu9XbRagx9SMHt4ICxcr1cIiy/BDb7tjeCvY3RMj
 +If552w9LdseU7h4yh09q06wt4oQnmcTnDj/ZEPK5uFHZgOhMJr4vfRwTiIT7wCtjJRC
 RS/tgg/xTrOz15QAsu2fPEdAFEe1vTkL4Vk57cGrGGO2x1ijZFo5fwhptPH0+7qM89iS
 KtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OlayNTJNr8js8hz3DL48sPeNKKh14xHKjjrOf+SQ96U=;
 b=RmUn88I11HAWye9PGJFNyrW7wCWH7uUp08kiSGuD8piuslKQeEX9BP2HSvCIQTQQp8
 xTiQqu2Tz4zdd9auOru9PTOVNtpPd8LtQsmuBeguZGNejhaU2U0KLIjKC6d4hKJs6+ax
 yaCXObiHCXibmH4mmmNk6AbtDPJx8xnZgEAVrAby/ihr+vqhLdtUVPQuo71BARBt6Qeu
 iBbswiM621PsLOuiwwc9Ys6v6ibAw31TDQyJJ9Ai8ojWdl/9t0zNRw8ac4e7++iyZIYD
 mOk6QU+mvsv5IdHsuT5WCmEtZQHBzOo8R0iwoB1JiATHbEpWcQFa7W1/z11wFzZC4SyH
 Iwcg==
X-Gm-Message-State: AOAM531VZrW4pDWrp68DmDp6TQBQ7Ddwn56L9ByEPPvrKF3ccCuP6ZID
 BL9sx2UExgDbWaLRKx9EFXAIyuXaQ50=
X-Google-Smtp-Source: ABdhPJx+UTeaR+NU+OPy7XaTPRA8V9LXK7zqQw2U8EQoJZtCBKJMvQDMqksRMeM1JgLEbfqWlSohxQ==
X-Received: by 2002:a50:d802:: with SMTP id o2mr5998046edj.331.1633611993152; 
 Thu, 07 Oct 2021 06:06:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ca4sm10167543ejb.1.2021.10.07.06.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:06:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] configure: remove --oss-lib
Date: Thu,  7 Oct 2021 15:06:07 +0200
Message-Id: <20211007130630.632028-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS is a kernel API, so the option should not be needed.  The library
is used on NetBSD, where OSS is emulated, so keep the variable.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 877bf3d76a..ab6bc0c994 100755
--- a/configure
+++ b/configure
@@ -1007,8 +1007,6 @@ for opt do
   ;;
   --enable-gettext) gettext="enabled"
   ;;
-  --oss-lib=*) oss_lib="$optarg"
-  ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
   ;;
   --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
@@ -1815,7 +1813,6 @@ Advanced options (experts only):
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
-  --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-- 
2.31.1



