Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A626C262C7A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 11:49:51 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFwje-0001mB-Lg
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 05:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFwhF-0007DH-Lw; Wed, 09 Sep 2020 05:47:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFwhD-0007jM-Oh; Wed, 09 Sep 2020 05:47:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id s2so1073109pjr.4;
 Wed, 09 Sep 2020 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INK+kK1nWbJF7y+rXihzR5UqDDo3HdyPVAq4bdijot0=;
 b=F+PIYi8MXTHPybJS2JY5O1vD0YT7Ij5s6a7jfa3+Noa5dpLhL/d67hS9X3avrHc7Tu
 utCFH5EMRiiK313o9mYPpEp3qmNZWOTF5cuSSlWdefK5gosOoOKIIEltsK1bgV7uEjGJ
 NwTHM3oUcBPt+vBGzHHe3AGRrk325FhwgiXqpVY4x0hpRRlW7vb/qs95k6fruHbFlste
 tBSUbc2oS2QZfaa730BGHLCjngqfZpK3zMiybjIGI6pEEQNTl9FSO4Z/kN8jdU0Lzwwj
 CVBpus7K7RIcT898ELJxZ01LvhRLtHkRAaLfuxdf679FNIeyPLEXPoYxe9Ec6cjnKJol
 nBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INK+kK1nWbJF7y+rXihzR5UqDDo3HdyPVAq4bdijot0=;
 b=gurdyu5TvNdpxGXeNHrNXstNmmwL2LY8Gp+eBya6TKMR+RNAc9Z+9HG7YySJ/L/FPO
 CHBuenfm4gfOz4G/xPOy9ZuG/T809JQEbkLKJ4dPCQMgHr00FUAZATrtJrh/sT09CpD/
 JlsPsJu5SSWvvH5V0XKxXDWMAMA+UAHur+D8TMc41y09292I/V0YtBV5YE/oX7zNt8f7
 pXCsxaTrgCnwbGZ07YRwXk/yGYQNi4mA7TOSa95FH2Z7mHEjX8TQjBYTYbVbbwdEGMNU
 VWhoLcKFJCNK0euMbPHm3fqg+VDTjQc7I9cQyJ2lhpUEcDO5QbnD/QwFycbAm+KPdKHx
 qGvQ==
X-Gm-Message-State: AOAM5334mGq2rWtrtve1HSIMeeaqvK6mcQqOiaLDJvtbnHUqp6gk29Jl
 hx4j72Il5YTC8ambW0jEopmSfVfZOS6Q1I76
X-Google-Smtp-Source: ABdhPJzDZHd6UN4xCMQIqimIPrd5LOU+9wtTB3eGc88jxGoblZKdu1vcz+W1WAZNUOVHLKa4+1t+hA==
X-Received: by 2002:a17:90a:d315:: with SMTP id
 p21mr129524pju.88.1599644836259; 
 Wed, 09 Sep 2020 02:47:16 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id 64sm1708312pgi.90.2020.09.09.02.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:47:15 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/21] meson: Use -b to ignore CR vs. CR-LF issues on
 Windows
Date: Wed,  9 Sep 2020 17:46:06 +0800
Message-Id: <20200909094617.1582-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200909094617.1582-1-luoyonggang@gmail.com>
References: <20200909094617.1582-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On windows, a difference in line endings causes testsuite failures
complaining that every single line in files such as
'tests/qapi-schemadoc-good.texi' is wrong.  Fix it by adding -b to diff.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qapi-schema/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index c87d141417..f1449298b0 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -220,6 +220,6 @@ qapi_doc = custom_target('QAPI doc',
 
 # "full_path()" needed here to work around
 # https://github.com/mesonbuild/meson/issues/7585
-test('QAPI doc', diff, args: ['-u', files('doc-good.texi'), qapi_doc[0].full_path()],
+test('QAPI doc', diff, args: ['-b', '-u', files('doc-good.texi'), qapi_doc[0].full_path()],
      depends: qapi_doc,
      suite: ['qapi-schema', 'qapi-doc'])
-- 
2.28.0.windows.1


