Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6584D9BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:15:43 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU71a-00069t-85
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:15:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ik-0005km-C6
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:14 -0400
Received: from [2607:f8b0:4864:20::102b] (port=40460
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ii-0008Da-S6
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mv14-20020a17090b198e00b001c64b23f5b0so712836pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMyzk5TbfTma9V9T5wnA+JkeOowwITQ4Gqp93IqPrDk=;
 b=Uxo8gSyvxbJO2lZOlRbMpKtZTCG60N1+r7nNZcsy0c2MFjTN0FdcOjPlUjYjUgxMVz
 YKRbNOkNk52ATyNamIKTLij2JDXcNI5Z+Xpfx5P8WuwkiYUJ9oC6V8+gf46R49mom9xR
 UJXRW+CEqWoZY1bOlYSxPfzSOJEoJqOUcnUhpaimNmVPDHthRvTKY2Pz4J38Y4xjiz5D
 AbcyfPaQJTLEIQBcrCnAzfHM/8hch5yrf7tZ2cvL71SKR4iN9kjrXavVQopEThRUPmHP
 9lzeLQJvCUqVbUSQFggUUTFD2ysnEB0/Pdqhciy8A3yCzB9q1PtDh4NYYxh56P0GAXyU
 eQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMyzk5TbfTma9V9T5wnA+JkeOowwITQ4Gqp93IqPrDk=;
 b=IMAG6VP2OfRYN/VqSCsdVxm/SzIrE6uyUZSbuDc26vakQFklMYqo6DYeARn404MTid
 3L82So4cetUJk4GFqpcnclM6NuyG0hBTKn1QDXMUn+N9rhvF+FPe7023FYKcE85NNTuR
 25/Q1GqS+3vGIAhU7uvSHVanYnWVRee+8Qco36e3LQYa5uCGAURs8xvVdyPE0sv2frad
 ZjKlvJthWC5twN1sFu+ViqB75FOKUlbC9bYyB7TdwGfpqxd1RQabbZnFIeTFTAFsP+Z/
 vXLFC6uMAhiERQI+udV6TIcHTNDzMvce01SqwGOLh0R8Ni3WjtiBl+0eH7winta4N80W
 DfPw==
X-Gm-Message-State: AOAM532fBSyA86idcVSIY2j5yZnaye8syjh5YHEiOiwvfHWcPOKo0ARp
 pFuFkwRr/pFFyYAZFMDqkE6Hh5a3lek=
X-Google-Smtp-Source: ABdhPJzOFcu/dTHpCEjZqTWmwxGnPbLeADXeGARFTJADzu7lvOkGsyGZH57vTHWJgsMPYJVXqJXaEg==
X-Received: by 2002:a17:90b:250f:b0:1b8:f257:c39 with SMTP id
 ns15-20020a17090b250f00b001b8f2570c39mr4375597pjb.135.1647348957177; 
 Tue, 15 Mar 2022 05:55:57 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b0038085c0a9d7sm19601367pgo.49.2022.03.15.05.55.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] meson: Log QEMU_CXXFLAGS content in summary
Date: Tue, 15 Mar 2022 13:53:43 +0100
Message-Id: <20220315125350.82452-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 6e8fa4ab31..5fed23847b 100644
--- a/meson.build
+++ b/meson.build
@@ -3480,6 +3480,7 @@ if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
+summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


