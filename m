Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D861D26A572
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 14:44:59 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIAKQ-0006Fc-Sg
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 08:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9r6-0001Db-Ez; Tue, 15 Sep 2020 08:14:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9r4-0008Fb-Le; Tue, 15 Sep 2020 08:14:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s65so1917946pgb.0;
 Tue, 15 Sep 2020 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rY6yNgCy25oDmt+nU7EZEt8FaOeANESnxbsMxWp5WF0=;
 b=b0q9q0DyvBaiAJzZat5zEJ6o9CIjzb0/Z/ACPCtPIZcjX4uStpz1XxM4HWMjfD4YP4
 HI84HfJBYtbALEMOFGyh4Zo10XMtu8ZIgDwvlGHc2QprcD6HB32skdGo+87EbZmHj4kj
 35qJZcxcfC740XuG72xS2L43MU1lOrX7TNdv6XnyCy3mVyNRlgw7HaVDOQnjMpmgXw31
 JIWbeX/OvJEA08RpUNWNAmsVhq8O8lITMAq+2Jm/JprAD+XcsQJSLaD0vVK0j/8/7IYy
 rCSsSJi3BY30jp+KDY51DzgUsCwsa4XWQCCjKBMj98QjTitFIVdVqJT6uaFUm2GdZH4c
 zPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rY6yNgCy25oDmt+nU7EZEt8FaOeANESnxbsMxWp5WF0=;
 b=SUr9sk71OkVVL5gY4RxBfDmWshWcPUyuvXcslWpmBqhyBhAhBaQoLObZ4Y4kzNEq6m
 P5WGb8YiIJr/BySfWFJsI1DbLx98O1OyTJX5XWqRr/jG2ABIZ2/rcIkAmd3JLDKb9l87
 STlE9lRjtmhhQ/V4bzd3TdawxK8i+KTNCHeezQBjAiVhGF9JZ8vDTS1CgKPa00M52bG2
 dNwQhyse2RPAxDMWgKXcu47hHtrPlMD9vSzQZ41Jh5O+gtRLkK/kCdWfcRjwRE72Kj70
 QsY47iyTGKDcDddqZQ7Ve4Na7IYep5koyM7m6L5djXd9Xt8rEYbgBZsXPehN5YRheAcD
 wDCg==
X-Gm-Message-State: AOAM530cIXyrZWhCNkJ3ZbPT7Q5I3hOw6muQAnVEWfAqdl6B1aZ9SPnF
 1XA0n2rnrAxg/B7fqyX2xQw1qpEvpAG5IcHPdTI=
X-Google-Smtp-Source: ABdhPJwWOaPx4+19DtbCxJUMqbg0owjQT5P5Z0NAUYxLnRi478kj5Aobj4fJXAqlvC2vaPgivJ50GA==
X-Received: by 2002:a62:1c0f:0:b029:13e:d13d:a05e with SMTP id
 c15-20020a621c0f0000b029013ed13da05emr17423937pfc.36.1600172076333; 
 Tue, 15 Sep 2020 05:14:36 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 k28sm13683061pfh.196.2020.09.15.05.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:14:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 13/26] meson: remove empty else and duplicated gio deps
Date: Tue, 15 Sep 2020 20:13:05 +0800
Message-Id: <20200915121318.247-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200915121318.247-1-luoyonggang@gmail.com>
References: <20200915121318.247-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meson.build b/meson.build
index 690723b470..23cb1b8742 100644
--- a/meson.build
+++ b/meson.build
@@ -317,7 +317,6 @@ opengl = not_found
 if 'CONFIG_OPENGL' in config_host
   opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
                               link_args: config_host['OPENGL_LIBS'].split())
-else
 endif
 gtk = not_found
 if 'CONFIG_GTK' in config_host
@@ -344,11 +343,6 @@ if 'CONFIG_ICONV' in config_host
   iconv = declare_dependency(compile_args: config_host['ICONV_CFLAGS'].split(),
                              link_args: config_host['ICONV_LIBS'].split())
 endif
-gio = not_found
-if 'CONFIG_GIO' in config_host
-  gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-                           link_args: config_host['GIO_LIBS'].split())
-endif
 vnc = not_found
 png = not_found
 jpeg = not_found
-- 
2.28.0.windows.1


