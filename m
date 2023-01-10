Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E686649E4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6X-0003WW-Lh; Tue, 10 Jan 2023 11:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5q-00033n-Hv
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5n-00051o-Fs
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5geKxrZ9SVaENVV+7JQNCEHlK7JI4nrgTkAwQRpZSRM=;
 b=dYkyqhKeeCef8lCk/eZgqbsKgXsQgLWtB4V6KEJA6A0iFQagrSarK9PKjkvTz1WTK3y9GU
 J7sH+hEGeeQMviLPAv92TKWTloNa40NhaOyDsDORb5WyITC6PAOA3+pb6JrqdACQO88es0
 wOPlKHC1zz1Ftt9EW44lOX6kEaSZaaI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-dYnFyoLGMxq47duC8tIkZw-1; Tue, 10 Jan 2023 11:03:13 -0500
X-MC-Unique: dYnFyoLGMxq47duC8tIkZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q3-20020adfab03000000b002b32e25058dso2123397wrc.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5geKxrZ9SVaENVV+7JQNCEHlK7JI4nrgTkAwQRpZSRM=;
 b=vwvh1XsKGKA1mNWy4qZsct9z1yAc6+6yEgwoUmwOQST6rDWI/ta8U+a0GQb2aQUDAl
 IsOJmhH3PQBvHBC2rQTYAeF5zzoaAiO6km5u1ZPLq8t3CrbGNcjcEVpGzZ58KuyvwojM
 lQZPQaR5FwEbiQnT19eDDKuVoW7aJHn9y7f4pT+MkYIKJaQzQpf6itR0bzpxQRispzvb
 1HgobW8mBlPc23elkiWB2JdOL0jbiRt65Dprr56oSQDWw4ohn209h4tt/2m5QZRfMnrP
 ifVafjybcRuGY2yW2pfKf0J7WnO49ilvXnk5PHN+JA6LMMhz0nQDBN9rEncISbeilumf
 vKJw==
X-Gm-Message-State: AFqh2kqHoA94zAqnKSVz+tRuA//gL3ilY/weh17ZJpeLQM3QFor1+EDq
 UOUCYb6FKC9FLgL/SFAIaTVWaoX28CNtxtr1mRebEKmLDhFEQ5nt2LF2Djdw0mUnozpcmKPinOK
 yEKS++QNDBrMdoadeHt85jEkqTCPj+DdWo6HdhUZRGfeZj7TvEFt9rqZ1AWfHEHnd1SQ=
X-Received: by 2002:adf:f482:0:b0:2bb:f4bf:e758 with SMTP id
 l2-20020adff482000000b002bbf4bfe758mr4996055wro.48.1673366588307; 
 Tue, 10 Jan 2023 08:03:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSeoZcxa6jkDgCoWRyBXzUVoHUX0Giex3z49otRDKv/R0OOo80g184kSK9QdqyFQCsw5iCDw==
X-Received: by 2002:adf:f482:0:b0:2bb:f4bf:e758 with SMTP id
 l2-20020adff482000000b002bbf4bfe758mr4996010wro.48.1673366587654; 
 Tue, 10 Jan 2023 08:03:07 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm11623480wrq.70.2023.01.10.08.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/29] util/error: add G_GNUC_PRINTF for various functions
Date: Tue, 10 Jan 2023 17:02:16 +0100
Message-Id: <20230110160233.339771-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221219130205.687815-5-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/error-report.c | 1 +
 util/error.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/util/error-report.c b/util/error-report.c
index 5edb2e604061..6e44a5573217 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -193,6 +193,7 @@ real_time_iso8601(void)
  * a single phrase, with no newline or trailing punctuation.
  * Prepend the current location and append a newline.
  */
+G_GNUC_PRINTF(2, 0)
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
     gchar *timestr;
diff --git a/util/error.c b/util/error.c
index b6c89d141208..1e7af665b838 100644
--- a/util/error.c
+++ b/util/error.c
@@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
     }
 }
 
+G_GNUC_PRINTF(6, 0)
 static void error_setv(Error **errp,
                        const char *src, int line, const char *func,
                        ErrorClass err_class, const char *fmt, va_list ap,
-- 
2.38.1


