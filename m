Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3922F36BC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:12:48 +0100 (CET)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNDs-0006mS-0Q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzh-0001cz-QR
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzg-0006zd-3n
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id a6so2528432wmc.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mw2ulj6dho7s6fL0XLnahWzsGLXVuZsAno6HF3dbcXM=;
 b=CicBPbKwKM4mc2bEYt6vENr2xD2ApeRQ99K8a3hNe+gf68Xk4H21qnOHujVjv6v3zR
 afeepPnqSuRk0ENu0Yw/sx/bH7XJKOx/m69EcvhQ+AtgDlf1bkmnGz85Ow6Y6LQm9LK5
 1VIJ0PkupWLdFAPHOi7zjmzYhmTZ7jdMMx3Z8RLNCNsHsFu6x0R68V+xnvTDj1whNqH9
 rRzz/EykxtoalzAI8iqGozs0GkLPZVTnLtw1HF+AhGbkQsUlsEqNIjnJcFoneNThpfyQ
 iG16o8eQ/aHqt64TEhQWEBFc087n9S2qf9hPCH5l6PHoKS0spjLVLyyn40WDsA2brrpR
 83EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mw2ulj6dho7s6fL0XLnahWzsGLXVuZsAno6HF3dbcXM=;
 b=fuKGr1QoeJqpbnKMr1zWmNLqQDJvcqktfhMFWixT7Zvb9CSorfxYDV8rY3xe+V/vpZ
 9nCS3fEXCd2FKRcpK3P3E+elcLu/xRfNdjCn4qGXl0/Ci1NOSI4EXxfAVSNa10Z1+KUJ
 YWuFRvSyKMsmzcq79pFyiBLtkKtz94ZRdfnSVLhYPv46XOJk7L8YaHgVUopKb3/UDrfn
 Oj3bHJopQyv8MRSK3ybnehYnybpfyfEZLsRnnoS3sI6Es1C+p+h5fs/sNnXnnpX/IC/B
 yke+usueSwgwX/Ll0Gh+dWer6lTwaSDgqV9RrAyY0b3NkvYaj5slOCz8cUFDXST9HJzz
 AOhA==
X-Gm-Message-State: AOAM533T64jcitoCCw2SQoMq3sDZMhMAVuiEVIRoNYXKyuWjw0HVFAkU
 q8ko3Qj+0Cg5xPej0p7QCxWEsYU8U+I/HQ==
X-Google-Smtp-Source: ABdhPJw6zarHUF84S/bGcMiDuj/xpriK3Z/vrrMTpA5oUZo3phJjwvwfUa7qNybxLdv/Q3LT7Xm1gw==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr185005wme.11.1610470683967;
 Tue, 12 Jan 2021 08:58:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] docs: Add qemu-storage-daemon(1) manpage to meson.build
Date: Tue, 12 Jan 2021 16:57:39 +0000
Message-Id: <20210112165750.30475-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 1982e1602d15 we added a new qemu-storage-daemon(1) manpage.
At the moment new manpages have to be listed both in the conf.py for
Sphinx and also in docs/meson.build for Meson. We forgot the second
of those -- correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210108161416.21129-2-peter.maydell@linaro.org
---
 docs/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/meson.build b/docs/meson.build
index 71641b4fe07..fae9849b79b 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -62,6 +62,7 @@ if build_docs
         'qemu-img.1': (have_tools ? 'man1' : ''),
         'qemu-nbd.8': (have_tools ? 'man8' : ''),
         'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
+        'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
         'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
-- 
2.20.1


