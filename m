Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFD35BC3D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:32:31 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrzj-0004Ee-0E
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruX-0006Cv-8d
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:09 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruV-000236-ND
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:08 -0400
Received: by mail-lf1-x12d.google.com with SMTP id v140so20029377lfa.4
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQ4PwGm7b1HmzTUzRjHbSVSgagu88LJC3RtxjgjfRcY=;
 b=c57XCDb3eKfCPSmcy66ut0/M8BvAfosM2NlE5uOJhmhwenpRiM962XTgKP3OxFcFmk
 rWavjacxIhNdKLfB/QwR7B1KuR+5ZC2MpAG7dQu1BQkGv50eWdAgNZvve0XTWI56vK1B
 KgRmA56/KE3jBVTod6MyFTZkavOtymXfJH4Bf2QZjGluM4NfsECefyAESU+ju9LEiEXH
 eXLPPcQOnudhItW4NnU/hFtPPNDYiHma9VUFEUYOMK5J0ddPEcRUivAzrqI5Tn2rbjQy
 ew4LhfXhm5owWXdZo6ZwMRI/y7uvqUgBA+OeQ7WG3QOdIoTrYNxnl18ic6L3svHdEswM
 GAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQ4PwGm7b1HmzTUzRjHbSVSgagu88LJC3RtxjgjfRcY=;
 b=iSF3E/m+zfJKkGtjrJfpZXinGxPFzXS7hEKUguo5QopkQl8EWVZV8Pn8D4b5YLIVEa
 IFCm0WWG2iA5UAWbRTrNJYWPwl5AkJu3p3J7ERSxN7lQ3+fKsGw0Jsw4rM/nSU0E5Yo3
 /VM9xlNfxGdM9diEQB0MadmOM4SqTF1msfQeyJsWsAXuBFK53ubSip4r+H+dCtu1SdnV
 PeNTOpvankBqVK4Lm9/vcpEsTQ3bayB5f1BEklZE7k7lbJeiGB3RFcXaERMlDFVwEENE
 xz5xKqEIA1Q4rvIw2CWr6DdRgqXyUXSTrmQNQiMP78dmoY4W3SGG+bv8VuLw3APwwtGf
 +BqQ==
X-Gm-Message-State: AOAM530pO6/LRIfhJdQ4UJBy4vDyYEgWyf1ocXkYwERX3/TuHT5zf2Jz
 tqLLyEdYZgXy/bKGre+3pxCmOaigXsM4zQ==
X-Google-Smtp-Source: ABdhPJzBhuszFuDC5mOCZZ1ygvFhI3N8HQs9qY3AKcl3HtpU3ox2rc7vCeivcl0+l7lBv2In8LrwnQ==
X-Received: by 2002:a19:7d02:: with SMTP id y2mr19633112lfc.187.1618216026037; 
 Mon, 12 Apr 2021 01:27:06 -0700 (PDT)
Received: from localhost.localdomain (128-124-64-30.mobile.vf-ua.net.
 [128.124.64.30])
 by smtp.gmail.com with ESMTPSA id n22sm2679702ljc.23.2021.04.12.01.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 01:27:05 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v6 7/7] MAINTAINERS: Added eBPF maintainers information.
Date: Mon, 12 Apr 2021 11:25:12 +0300
Message-Id: <20210412082512.14998-8-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210412082512.14998-1-andrew@daynix.com>
References: <20210412082512.14998-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58f342108e..e05a9fd9f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3311,6 +3311,14 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+F: tools/ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation, general continuous integration
-- 
2.31.0


