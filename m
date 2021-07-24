Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC33D468E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 11:02:13 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DXw-0007bi-T9
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 05:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQz-00033y-8Y
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:05 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQx-0002uk-Ni
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:01 -0400
Received: by mail-ej1-x636.google.com with SMTP id gt31so7100348ejc.12
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/x+lZjsGxmSIRyJXZgD1ePtnkg9iHRZ5A8ReuiRV7c=;
 b=PwCeXag/cgPbgTdGMm/hp5SelkKw5grBvxgHtFQIROi+KV3xk4VlKAEhUE9RO3cLXz
 bNwvEclkbsVKI5VpDmj0CrKCF6qqV4mk1er7/i+rjh0q5I0MkhG5YUO/xXoO+0LGxK+K
 olGfAl701JpW+r5Uln+oB+VGcWJI4sVgGfwkraDlBRwVkttKb5is0fkMsKEmUAvw3OER
 GC9JGuqG602mAlX0X/nFLcwOEXpLaIrLOGDT25i1cMTYgLcIZlODcgYJEmWbYebIU6Qq
 IdLn+vpc9A7mpfTrJZG/w04itTBw/ZeWZElheFdbwYVTgkYiC1uhDFDY84aLKSqf/62s
 zWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s/x+lZjsGxmSIRyJXZgD1ePtnkg9iHRZ5A8ReuiRV7c=;
 b=aCFqBUNB67r21vBRSFxgq1OMEp79k68DW0Oe5oZiSNVcXL3PhL5R6zSM8jLFMepH5z
 wFbmEdeFbIEOML+xIivWjvlPipMGesP/o6LKofNvVwcIfyOItTw+KyReCS9+tWQZ2g/P
 7H8d6eaYaU7HUy7pR1l61tPqNZAf9jqDp/qMR3NRTQ0BInWEEjCbuCZx7bFW1DeAkPrb
 mszG8DG/n95TtZwyKJ9KX9rnHRgwRVvb8whiymmn52xJDOP0Tg3lhZlBTQThPOiF8XCb
 RWP7KIr4G+9ycSIH0Wq3yrSFDN8wk3uFWVgRAx7QolEEc+kcYOH/qqBCmYqAW6rF0Gw8
 Nj7Q==
X-Gm-Message-State: AOAM530sHMVS3IBcd1yTsa84yUIlOlzF53zmqdvQLPrLeqnBkOJ2aUKb
 jyUrbEKvzIBgLU0fnTv4t1jsEhISsXmEiw==
X-Google-Smtp-Source: ABdhPJxsIgmOCd5cOQjM4MEjgZL6dOOa3ZANKXVQFFg7/vPdoykB+Hdv4W07kdXpokXM624NwGgqRA==
X-Received: by 2002:a17:906:a04f:: with SMTP id
 bg15mr8425651ejb.417.1627116898461; 
 Sat, 24 Jul 2021 01:54:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] MAINTAINERS: Replace Eduardo as "Host Memory Backends"
 maintainer
Date: Sat, 24 Jul 2021 10:54:48 +0200
Message-Id: <20210724085453.16791-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Edurdo asked me to take over co-maintaining "Host Memory Backends" with
Igor, as Eduardo has plenty of other things to look after.

Thanks a lot Eduardo for your excellent work in the past!

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210723100532.27353-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adb..420c8a48a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2547,7 +2547,7 @@ S: Maintained
 F: net/netmap.c
 
 Host Memory Backends
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: David Hildenbrand <david@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
 S: Maintained
 F: backends/hostmem*.c
-- 
2.31.1



