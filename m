Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEC42DF33
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:33:20 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3fT-0006Tr-6C
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c3-0003Kl-JA
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c0-0000VV-Kb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id w14so26389836edv.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgfNB2Fsj8uFWhaG5Y5cwfJz/jOZOBmzfZCOPa/OCdA=;
 b=A5g4kO4dBv5ip0CV/Gw4hneogSPbZmSyfuDWBai2SS4hzWYtqu5oTW9lIb1fRFI1Cz
 k3J9ky1KKahrra+IiCyDRD1ZMjzmTh3EWG/u1Dwl8xI1GzGTtzeqe8y4tZzEPxXust6B
 Y3aKzGZQUySnWl4fNTB04ehTgXgPIlMZFKLqrT/YltiiHejpnNHVZ3pfWAJkAIIdj3Qr
 JlNyXNNYx6pJuH+thaITuy02xnLT/MUvk+Jtotu2SzvdJ1HD/v025PUd8C7HCKEJDLca
 jG/xvIJ3XuuiED8/RmKzic8cygg7JNpPf8stkRR/xpkfbPC2D5LJMPr1Zm2GjjlVODq3
 8Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dgfNB2Fsj8uFWhaG5Y5cwfJz/jOZOBmzfZCOPa/OCdA=;
 b=ciYeTP7jTLpOd1/yj/1a0sldtuEL0kOW1kkFdW1mAWGepoU3zmAbYzO0PCf2Ml73EI
 Zst4wKhewUoMbqVjPBjL3eUbxyrOu9eQLjLuDW6g5GAFFM772+eAaL+UoBd32jocfXV1
 c9V5L9+QftUsQwgD+iVKjZCnLNnFSbzxCyw7/uGN8aAuPK1C2nmSte0P1Sr08dACEUDI
 ElIGp/sePuNYGxmihXFwv5ZtcZsZtlInlhGARuuF0f2tBU24lwkOHHL0/9eMDAS+UsKu
 +a0RXm4LKbAXbTQaP2rPuPGLmOzoenWrG+x8LUNiKIRiUQbFNtsh77S3mytY/AoAovTC
 YuGA==
X-Gm-Message-State: AOAM530AtNotb8mEnUN7WRlQRkbvNdwtqdEjJg6wJE9dIcQWzUgi0Ftc
 Y7cfZZceUBNyxdRIVXcch2Dmhwh5FWU=
X-Google-Smtp-Source: ABdhPJwAC7xKpjW9uXMYw78sR+1f5aMuwGLlTacYdXsjKhUDeXeKq9iJRmKSfbYXAw2k6ACUh4EG0A==
X-Received: by 2002:a17:906:a1da:: with SMTP id
 bx26mr4918085ejb.558.1634228981693; 
 Thu, 14 Oct 2021 09:29:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] configure: remove --oss-lib
Date: Thu, 14 Oct 2021 18:29:13 +0200
Message-Id: <20211014162938.430211-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS is a kernel API, so the option should not be needed.  The library
is used on NetBSD, where OSS is emulated, so keep the variable.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211007130630.632028-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index e2750810e2..c280c0e4b5 100755
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
@@ -1817,7 +1815,6 @@ Advanced options (experts only):
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
-  --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-- 
2.31.1



