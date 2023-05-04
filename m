Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDA6F684A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:30:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVGl-0000Xa-Q8; Thu, 04 May 2023 05:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVGj-0000Wz-Mo
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVGi-0001Xr-DP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683192535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Emdv5sg3+4EmePlgNlIalGBCZu0cJxG5LJhlwrFNeo=;
 b=fQhW5UWVJqiEPdQmHie7hk0a/7jiF4Rc0YoYYgG8DLQ7yCSDsz9qZwj82FfrHZhx0htq1l
 NVpzZF8i1BDVPGRrvwKZIg8ZOe5b6QZ5/+KxIbjLl5uqPHov+5sqrJzBkC0J0D+3eWFqRK
 dNMaU7Z9p5aaCD09UImglOrbnXt3LXU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Rvgf9aMBMX2GDgjtWXZwHA-1; Thu, 04 May 2023 05:28:54 -0400
X-MC-Unique: Rvgf9aMBMX2GDgjtWXZwHA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30640be4fd0so64641f8f.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683192533; x=1685784533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Emdv5sg3+4EmePlgNlIalGBCZu0cJxG5LJhlwrFNeo=;
 b=XYj/xlhPIpNOVt7gIQUtBOlRZR787yGuD+5B7XBgnjf5sVBGWxpxgB1l3kB6UEQtLX
 7QUWqDNDNeOlsFHMhHc+Huvwh/SjBjYAyS/Bzu4DNuBYkNn+KlFWZz2WGaRhbYbfjEv8
 V8SQdz9zZiY0cfLRK1UEFiycHkS65W0ZIvFVBPv39DKIc7pcCG9HlX1vsrV2qs2Fmi2S
 240c1cxSC3Y0GnqvuEMG3cESHT6ILCpAsjhMNpeoqNf8N4l/LokuSARwwSZvL9f/Pgec
 6YBSuEFktxt84+VzZAdixiqxQfP7REIpUCfHjnnV2dhKt+bAxcqUONfwBe10RPgCMDfU
 AVcg==
X-Gm-Message-State: AC+VfDx7kCKBlW//1vwKBwxYsSOdjKHod0tim8jZ5QDCsNPFxXIaTNdf
 eMIh70VEtV5KYdodD/p+UBpvBPb/cS4ZveVUdGII9ln4yJt3ZRc8SN/Cr1eqfo5ugi8KW6sOSbr
 +1c9Yc5bSa1xQizr9lJZCiK/wAtuvHDtJKhASczdlnm0Uac8+V/I+HriLL0LrE2aP9sGscaHbqe
 w=
X-Received: by 2002:a5d:6648:0:b0:306:368d:8a1c with SMTP id
 f8-20020a5d6648000000b00306368d8a1cmr1951293wrw.45.1683192533017; 
 Thu, 04 May 2023 02:28:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lnEua7UUrMpAKxN07Get+3YADPNjDSVU4lbyfwGQGipI3Ig4KJnZH3EkiFKPFSey6gs2qZA==
X-Received: by 2002:a5d:6648:0:b0:306:368d:8a1c with SMTP id
 f8-20020a5d6648000000b00306368d8a1cmr1951269wrw.45.1683192532630; 
 Thu, 04 May 2023 02:28:52 -0700 (PDT)
Received: from step1.redhat.com ([5.179.186.0])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002d6f285c0a2sm36193792wrt.42.2023.05.04.02.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 02:28:51 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jjongsma@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 1/2] stubs/monitor: add monitor_fd_param()
Date: Thu,  4 May 2023 11:28:42 +0200
Message-Id: <20230504092843.62493-2-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504092843.62493-1-sgarzare@redhat.com>
References: <20230504092843.62493-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The blkio block driver will use monitor_fd_param() to support
file descriptor passing. This is possible in builds (e.g. softmmu)
where the monitor API is available.

Add the monitor_fd_param() stub so tools and tests that link the
block layer can build successfully.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Notes:
    v2:
    - added this patch to use monitor_fd_param() in the blkio module

 stubs/monitor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/stubs/monitor.c b/stubs/monitor.c
index 20786ac4ff..0bcd49e41e 100644
--- a/stubs/monitor.c
+++ b/stubs/monitor.c
@@ -9,6 +9,12 @@ int monitor_get_fd(Monitor *mon, const char *name, Error **errp)
     return -1;
 }
 
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
+{
+    error_setg(errp, "only QEMU supports file descriptor passing");
+    return -1;
+}
+
 void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
 {
 }
-- 
2.40.1


