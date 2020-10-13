Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF528C59F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 02:20:03 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS82s-0005HY-Kd
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 20:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kS7zA-0002Si-Hr; Mon, 12 Oct 2020 20:16:12 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:32768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kS7z8-0003NG-TM; Mon, 12 Oct 2020 20:16:12 -0400
Received: by mail-pf1-x441.google.com with SMTP id j18so2792002pfa.0;
 Mon, 12 Oct 2020 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FrTKTlG1EDZjcPSl/+JCmAi0vT/pVbtGMJNvgBv4AuU=;
 b=tY1BPi1jju2nEvVxJUN1LGMA3J/7rseZejcQiRQd3HPsQv7PEs6FLhTAWLunvoI2+a
 4/SDlc/r+9gIaE7rUHE0KXCGwut50vkRGPpyUMuANqKXTJ3fr27AW7iJlHL48pq1Vwr9
 yYXAG2SpCsNmrwdXo1SXHw9ebgyolQ31Q+d/LpFg5CDDD5P0G/LpMsef4yuIojLDwLmB
 FTVwKoD+SkLp8gZ6GHZlwnxhNBUYESC/WiB4EXs4mDDIx+eyNga5kzvtXN3leQjg8zU8
 RIrDcB09FYFU6dHg74F+0GHA989oQ80j20GgAMoQKHiga8FOpbF6jaJWrsAVMMSh9gK7
 jLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrTKTlG1EDZjcPSl/+JCmAi0vT/pVbtGMJNvgBv4AuU=;
 b=sxWBTOMQ+Js28rN+jf/cOlYn8+X4jCK6f5HC73YXIDtt16rG1fMuEr2K3fAlEv5zza
 NZK2GdATnoAyj/4izEsD8w14ukkGKfId1snUuc+t/i5urYyh2U/MyeTafwZuKaRXjpWo
 QA3GE6YsZWkV1x40zOZd3JHUDGuXW9+/YvghHuQmZaHrCTKbqut7piXAye/Q4+4Uow2b
 2djAPiIkTgKkH5VD5k2et1SuvJiuPQwD8bQZKABYEa0t0Mhs7SoUA2eDsCssYtG86fq5
 208XHBks7RgcWKhuV367RNUMVFNLPa90uHPx0gDA4Fjmgy38gHv7ettNPNDsbRaQ5Pg1
 fLyQ==
X-Gm-Message-State: AOAM532VDhDUcItZ55tTsqLcBpPGu+H+3fyqjB7rypkI0CK/fyCEWSi+
 oZ9+7mSwA9PlPu8yKqv1gR9yXQqNA1f7Lg==
X-Google-Smtp-Source: ABdhPJwhbFQORDR6WbChlaYB55Y1IKDWyYSLyzpFoFd9GNQn4bH84Xs3t9i0gx3TS0jXCH965uqPxg==
X-Received: by 2002:a63:25c3:: with SMTP id
 l186mr14898012pgl.229.1602548167242; 
 Mon, 12 Oct 2020 17:16:07 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id e5sm5902961pfj.99.2020.10.12.17.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 17:16:06 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] block: enable libnfs on msys2/mingw in cirrus.yml
Date: Tue, 13 Oct 2020 08:15:45 +0800
Message-Id: <20201013001545.1958-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201013001545.1958-1-luoyonggang@gmail.com>
References: <20201013001545.1958-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the begging libnfs are not enabled because of compiling error,
now it's fixed so enable it

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index f42ccb956a..2c6bf45e6d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -109,6 +109,7 @@ windows_msys2_task:
           mingw-w64-x86_64-cyrus-sasl \
           mingw-w64-x86_64-curl \
           mingw-w64-x86_64-gnutls \
+          mingw-w64-x86_64-libnfs \
           "
         bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND `
           https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz `
-- 
2.28.0.windows.1


