Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F139225A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:51:28 +0200 (CEST)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1R1-0006Qf-KI
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm15k-0002Jw-MI
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:29:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm15i-0005J6-DU
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:29:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so1277549plf.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BfgIDpTO0IL/BmMNHB6NQFLkn7cU/5TfN4s8KzhBueE=;
 b=a9dfQ7oy6qMUqL2F0sS89FR+blcxQhRiIetiIV3XeNIi1SAEOLpMMmuD4+FejNHWel
 Udv+nlulKQ4qHxWTkJwK/SDUOI1+/OJJXL6EvdRzoljIZ2AbAMqGERXfKvHVgTdtM2t/
 DZWZDie7fj8BemjREHKhdbSo9AwSoBj5XLI96uYrz67A/t/GEKfZLbhdePS9wKFKfcpf
 MDZIBcoYCK9EXqYNbuoMyOCNtZHy8dkd1jj5bMy2uVPr1aFBzy8XZDsA6e/rDibGW03y
 RJjWDHWmpI8bpeCourfwxjXw+lZS6lalDmXJwsuCAot4qTpo3JsBgGFhrdQ/cRNmMnpO
 5TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfgIDpTO0IL/BmMNHB6NQFLkn7cU/5TfN4s8KzhBueE=;
 b=O6nl/ZHLnj54l7ifDIreqeHXIJ+A1vhFhHNw5q6oqUExQ7XDdZpL6fuXyU6bFh3RoZ
 y2yB2JQeHpxaOafHDZdzZuxIrjfqzBI+PqqV4fJvx8CeQ8NMf0eTnbtaD8I3ihwhOnRE
 HJoNnAen+Xf0nMrXc59W77uuC5mndUHsEnFzkhL41XTW9OjqrzvwG/IQOHvftCb+fq28
 r6LiD5M99T2I70ljDHV9zNgdBBbPaMd+hYV5zX9qIQjxNCYC57Sna+iHVKiiP0acLPvA
 QZutUTs2InA3CwqW5ciU5W1ByarAW1MC/CJIy9vKUA7QNI632QVx+eSGa1hpJBwyhViG
 K4MA==
X-Gm-Message-State: AOAM530w2zhJGpPe+urSUBiA4Fz46GK9UdARPSYodyR3LnIKOWezhLt+
 O612rQnDjAxAspw/kmpzeQD2uw==
X-Google-Smtp-Source: ABdhPJw3hChdW8fwAi/AH4djAS+k7+S/wMQkfklX25r817qdKyah/pX7rbbPBIgQO0z4yoDkgKRoBg==
X-Received: by 2002:a17:90a:8c97:: with SMTP id
 b23mr228263pjo.74.1622064564318; 
 Wed, 26 May 2021 14:29:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ie5sm220244pjb.14.2021.05.26.14.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:29:24 -0700 (PDT)
Subject: Re: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15981d7c-5246-c37a-8306-4f7070237a32@linaro.org>
Date: Wed, 26 May 2021 14:29:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, farosas@linux.ibm.com,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 1:21 PM, Bruno Larsen (billionai) wrote:
> No more architectures set the pointer to dump_statistics, so there's no
> point in keeping it, or the related cpu_dump_statistics function.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   hw/core/cpu.c         |  9 ---------
>   include/hw/core/cpu.h | 12 ------------
>   2 files changed, 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

