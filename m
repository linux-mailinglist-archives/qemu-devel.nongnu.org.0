Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975E6481C0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWi-0005F7-Et; Fri, 09 Dec 2022 06:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUt-0003yi-H5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUr-00010V-SL
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVEYVLy4bG6SIZTRvPZzmvu8H95iJMHf5269FMOz9mg=;
 b=iLZSTcOxdJfHiO8oQNEEVKzgDbg0q76n6KAmDJKOGrafMbSebZLqvOScLjEtEykEhVBdYQ
 LGAqvzgHqZOi/hQo4aaIj2q9bTiGb2iGEWVpfhcU3H1NPWkdLLMWTP0wEmuKD2a5w3SZ+n
 CQVUQyP3CnTq/p14Hk2qcAATbJOH5cQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-B_gPSA08OfO4XbprSlQLUw-1; Fri, 09 Dec 2022 06:24:51 -0500
X-MC-Unique: B_gPSA08OfO4XbprSlQLUw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i2-20020a05640242c200b0046c66305ebaso1196658edc.15
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVEYVLy4bG6SIZTRvPZzmvu8H95iJMHf5269FMOz9mg=;
 b=QBqq5yKSvOAVZ+ukiyRi75vI86cFngI4Aup8v4kaslZeQQglTk2qF+zLzlGTHv10HU
 Iy+vI3S5Ip+hRSOQ+U6JSk7J0E0+toSkugP//KQsHEHe5H/RJaFzyE9jveX31pH4bmFn
 k46adrKrIPnYgwPBI2cX86NSmi6jf1JaJueDJ1DjrPrc0TZ4Bcqrj8C6C23OMDCUbei5
 4rDZ9MIwotcEOXGzPScPlEQNdAOaJ+iJ3E5t/JtXJYGJOs4Nf7o+/iooh1K+YIZPEpH6
 KozaV8aifH+mIkNAZu/aWd8GGxJAcbhKn7eYhS/LNNLbZctEWPC/ch3dRnqzRy7fmY+B
 6TpA==
X-Gm-Message-State: ANoB5pmTmOtA3zpHjiz/Jbpm5/y5d1xAP1Z3NGGGdPvOsKRLIQkGorHS
 P8W+fkOW+goWpOdin4k3fmFJ7Dvw6QqKXP4wa0dJfBb/zr9EYEblNHNjDJf9l2yFLHK54rRCAoL
 QWLLWQQMDJ9c0gT+/xHKHVOFuvzrOAery0ewk/mp2Iq1lNxLtcFeOQeRHBsy1Qc8HDEk=
X-Received: by 2002:a17:907:a803:b0:78d:f454:3762 with SMTP id
 vo3-20020a170907a80300b0078df4543762mr5744399ejc.5.1670585090468; 
 Fri, 09 Dec 2022 03:24:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5+Du2YwT+/NBSnskd2weXegs+MOe7YHiGUM0qBeZg3H4Fq3RTegBlb8s+V83+Q15XzbU++9g==
X-Received: by 2002:a17:907:a803:b0:78d:f454:3762 with SMTP id
 vo3-20020a170907a80300b0078df4543762mr5744385ejc.5.1670585090248; 
 Fri, 09 Dec 2022 03:24:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a50fd0f000000b0046b4e0fae75sm515125eds.40.2022.12.09.03.24.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/30] configure: test all warnings
Date: Fri,  9 Dec 2022 12:23:53 +0100
Message-Id: <20221209112409.184703-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Some warnings are hardcoded in QEMU_CFLAGS and not tested.  There is
no particular reason to single out these five, as many more -W flags are
present on all the supported compilers.  For homogeneity when moving
the detection to meson, make them use the same warn_flags infrastructure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 113db838a16f..9c5393a25de7 100755
--- a/configure
+++ b/configure
@@ -378,8 +378,6 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 # 2s-complement style results. (Both clang and gcc agree that it
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
-QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 QEMU_LDFLAGS=
@@ -1161,6 +1159,11 @@ fi
 # just silently disable some features, so it's too error prone.
 
 warn_flags=
+add_to warn_flags -Wundef
+add_to warn_flags -Wwrite-strings
+add_to warn_flags -Wmissing-prototypes
+add_to warn_flags -Wstrict-prototypes
+add_to warn_flags -Wredundant-decls
 add_to warn_flags -Wold-style-declaration
 add_to warn_flags -Wold-style-definition
 add_to warn_flags -Wtype-limits
-- 
2.38.1


