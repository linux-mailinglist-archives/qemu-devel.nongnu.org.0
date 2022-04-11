Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0504FC6E7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 23:46:01 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne1rE-00042q-FM
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 17:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ne1pi-0003KB-4z
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:44:27 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ne1pf-0001fG-QF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:44:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id f10so15005832plr.6
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XaYJ6mgcl4rB3hWDCQ85waJ70LRN262XexoHFlOUgWw=;
 b=A8/k6rvI4c6rV/nBMMp+9SCGtk35pqbg22j3NyUeKV/x+GTHRBWGAw+iyv7nqkjHsM
 BXwVBvez0FqTGH8V6GInBM1iH9hxlP/XQo+bcrQz7Bo+PxuOwb/LMCA4hHZfthPjHG64
 86pDvbKZeXbKK1i9sUzN9MdLw1eWWdw4J+HNIVUnvgstOTdlqiWuWPjARe4quzrrDUgy
 JLeaGlOnBO3WP5IN7RrPHXeioxu1hexfeiS6J8E7Ox9DqczSCkkbV37mSUdib3+124GP
 Bmrgr8E9LdjvsmGXRUdX4jV/+1YEAuXbiyRlMGut8wSNf/TdtRV+vcJXtXIOuXI1VydE
 x0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XaYJ6mgcl4rB3hWDCQ85waJ70LRN262XexoHFlOUgWw=;
 b=cpA4IadFl9qy1oA7jmwULcDWNhf5RVFn7YPqDP/5YxJQeHG0ItCXy42ejbqCHz8qAC
 dRXsnR9/pll/DbUVjMlkJ6c7Dalkr8FUF9lWh77Ai/XKgARJ8HjzKU497fpHzGyfRQcZ
 2HvJl2ZiYPYz+DaCs+yHYkFSyDA43XsaJExFftSUWs/ej09593a+WXrC9J+K1I6MqBjk
 aCY6kimhff7gh1QeB7DaZp5/xvmUB8Q1lhDlufiFmpeVhHzvOxSyQexbKEKJt3hBz9Lx
 oUbCqLZJSITF2QOnSDjm+j4pZfUPKLKNL2emCpB3kNbTOojpW4iVKfA2nET7PljShhB8
 JM5Q==
X-Gm-Message-State: AOAM531dFfyylx5lBK666QjWUTDilnU7Q8f6bxdkpNE/8o6FiQLvd9Gz
 xjP6+XQU7mfyHqFPLboNm3I=
X-Google-Smtp-Source: ABdhPJxk7+hI+sw1QU2idcTr8cOZicLnfyMG4qMX7VOkYDkhunDQTWKt7u9FotBTS+y1Af45bIOtJg==
X-Received: by 2002:a17:902:be18:b0:153:2444:9c1a with SMTP id
 r24-20020a170902be1800b0015324449c1amr34902138pls.152.1649713460829; 
 Mon, 11 Apr 2022 14:44:20 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:eda5:df4f:f351:d13f?
 ([2600:70ff:f07f:0:eda5:df4f:f351:d13f])
 by smtp.gmail.com with ESMTPSA id
 w92-20020a17090a6be500b001cb9ff8dfbcsm413119pjj.33.2022.04.11.14.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 14:44:20 -0700 (PDT)
Message-ID: <32abbd92-8cce-dffd-6bc3-df9ae83de64c@gmail.com>
Date: Mon, 11 Apr 2022 23:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] migration/dirtyrate: Replace malloc with g_new
Content-Language: en-US
To: jianchunfu <jianchunfu@cmss.chinamobile.com>, richard.henderson@linaro.org
References: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/22 11:47, jianchunfu wrote:
> Using macro g_new() to handling potential memory allocation failures
> in dirtyrate.
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>   migration/dirtyrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index aace12a787..0e59aacbb0 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -522,10 +522,10 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
>           nvcpu++;
>       }
>   
> -    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
> +    dirty_pages = g_new(DirtyPageRecord, nvcpu);
>   
>       DirtyStat.dirty_ring.nvcpu = nvcpu;
> -    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
> +    DirtyStat.dirty_ring.rates = g_new(DirtyRateVcpu, nvcpu);
>   
>       dirtyrate_global_dirty_log_start();
>   

While malloc() resources are released with free(), g_malloc/g_new()
ones with g_free().

So to match the API, this hunk is missing:

-- >8 --
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index aace12a787..e49db7ca4c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -159,3 +159,3 @@ static void cleanup_dirtyrate_stat(struct 
DirtyRateConfig config)
      if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
-        free(DirtyStat.dirty_ring.rates);
+        g_free(DirtyStat.dirty_ring.rates);
          DirtyStat.dirty_ring.rates = NULL;
@@ -558,3 +558,3 @@ static void calculate_dirtyrate_dirty_ring(struct 
DirtyRateConfig config)
      DirtyStat.dirty_rate = dirtyrate_sum;
-    free(dirty_pages);
+    g_free(dirty_pages);
  }
---

