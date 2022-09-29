Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CD5EFBE4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:24:23 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxGp-0000Z0-05
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwRB-0003vz-M6
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQy-00037W-GQ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BzQ2W/6tj3VXgm+BZMFM6kvKXkcy8XGIKo0gkp2srZM=;
 b=PKWvoSURPLOw59QwNmfiYH79h9NYW/UeHdyWNlDTlNYfdGavPY84C3UW6Uk2+/69vojNKG
 8VbJFkgXnglSPdf9dAZ4PNi61QQVqDAczGPcY6aXmCP3gv39gxVwPavdPBM5/4X/k9e+3r
 OhYjc5ZqY//TVmi+qSvTwwcBU8wHFO4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-12A-_kpwN-WGSAKmembeHA-1; Thu, 29 Sep 2022 12:30:46 -0400
X-MC-Unique: 12A-_kpwN-WGSAKmembeHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so1642294edc.13
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BzQ2W/6tj3VXgm+BZMFM6kvKXkcy8XGIKo0gkp2srZM=;
 b=JFf7yTR7d29NEk7D8boSfqDzo+CHDB680IRMe4340X4LTSnJwB13T+cZY/3zxTMchX
 n95NpMLYtzAxlRR8FxcJvZhbIgTsQKnLENuOe2KytpxCpUkWrUb+A3szx5D+5Ytt3m/2
 a+tRd5Gh+29qblcmVYf0FJfSnBtAORk/9Wb1nFMARc9h/6gzYyTahiqZwEktwJH7/dLt
 pBZ8N39Q5D/sDtBz2YHWBtYH0Ortku1V2Fyxv7LG1SfhGqU+vvnsWPli2PCaFM8O/h/j
 1DS3E1y7lM/PyN1MN0aHMwKfV0rwGYk+QMYPA3U73C3rE+Cx3mkWC6w3qnUNj4uWlzWO
 oDzA==
X-Gm-Message-State: ACrzQf0vopzEv0d0h4LVCITPm5uL38D9oWmos6Ry9GMGwDLc3QhE3iYC
 V9wzGc5rYSv8dEsEnhcEqByl1LKnQN6sT7U6tnnAepwzXzCoR4FJ58ciDf9ync75VdHO+t1K3wa
 ZHgJQQf6DaUY3bRSsUA29xMHRbO4pRJlKQSanGGSDmPMpXpzElxxkWA+/euys4h9xLz8=
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id
 mm24-20020a170906cc5800b0076fc119acb5mr3278141ejb.651.1664469045213; 
 Thu, 29 Sep 2022 09:30:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+4L4bzKoMXCrx+bUUP/E2Q7qRHPNqm/y0WyMh1cE0CkF2ta0X8aGwjdBw3OHVsmIwVIKmdA==
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id
 mm24-20020a170906cc5800b0076fc119acb5mr3278122ejb.651.1664469044890; 
 Thu, 29 Sep 2022 09:30:44 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 6-20020a508e06000000b004574f4326b8sm5895607edw.30.2022.09.29.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/14] meson: multiple names can be passed to dependency()
Date: Thu, 29 Sep 2022 18:30:10 +0200
Message-Id: <20220929163014.16950-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is new in Meson 0.60.0.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 8c1139a82b..48533ace7b 100644
--- a/meson.build
+++ b/meson.build
@@ -825,14 +825,10 @@ if have_system and get_option('curses').allowed()
     }'''
 
   curses_dep_list = targetos == 'windows' ? ['ncurses', 'ncursesw'] : ['ncursesw']
-  foreach curses_dep : curses_dep_list
-    if not curses.found()
-      curses = dependency(curses_dep,
-                          required: false,
-                          method: 'pkg-config',
-                          kwargs: static_kwargs)
-    endif
-  endforeach
+  curses = dependency(curses_dep_list,
+                      required: false,
+                      method: 'pkg-config',
+                      kwargs: static_kwargs)
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
   curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
-- 
2.37.3


