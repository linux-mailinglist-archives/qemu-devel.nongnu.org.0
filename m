Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D877392080
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:05:02 +0200 (CEST)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llypx-0007IW-HG
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygc-0003f6-BV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:55:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygW-0004DT-7w
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:55:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id q16so1086387pls.6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2+FNzdIXHweUq009t5oOup+bch1EbqwIE7FWu024PDc=;
 b=hrkeZ9hakxVdNyxZ9qkeMPBm1/MS1HpW9OgQxH0q4H0wSBXTymbhD7VsBKbOTIz/a1
 +FezCnSfyL25dg++Z26FD7Wvj7t3gPIgoG8wsvyJ3KK7IFxg2fdw0LKsEF1c+vVnPUeR
 qp1iGnynLw847WIxj9wfSslYHlXedfyfkBtVQt6nJK1qhXlVAG6auUE9FCypFD6M9T1+
 s2/g4ndUSd+C0rGQwzXek+bnUa4wiV7mh43WBWEsSH6gK9VM9Jy43RGlM6hwVIEgnAyq
 xClefSz3YWrxEqp1KAanaWW2s4zYaCCKm6PJL10Hrpd5u5RilQSiG2zQUMvzA74BGQBE
 QxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2+FNzdIXHweUq009t5oOup+bch1EbqwIE7FWu024PDc=;
 b=pdbpQCWWjUKtey5tpOiwz+oar67DHb1MnGewxOF10NDEz+EcEZ4lAG/Gue3TsVWste
 BttDCIozMCRV5wpN5UdWoPM395kETdAgruF3knYZhtC8ZW/OZoqKqM+rL2U4q4OCKaFF
 oMVc/6PJbVPanjx0arxEngV/cnlBt1cSgT9O1GgwXh1wnsrCHjtCv9HUq5E+nT62wAjk
 1r2H49Foagps2ULDAzM529qk5WQRg3YkaLc4Z1Zhj8qdqJpPQx1NolzbDjxB6Y3Gw/A/
 PPoLi5CQJAoUOBVplg0equhKnw4Sr60lkybGrsqUSe5GpCzjtMsCzZ9cXsrG2HPL08dq
 1Wwg==
X-Gm-Message-State: AOAM533WosPw3jiQoTW7GJJ9p3aI9jBPVOvO0MA9sXHfRmPT2KRvQimi
 nzxWAUwW+R8FzXKXvEsxu7aAkQ==
X-Google-Smtp-Source: ABdhPJwFBUwRl3+o3ZEccQxCIw2qds2z9a7855gpcfkAYiWzREu5CKNkskE6hqPSV4AiF/hSQzrEyw==
X-Received: by 2002:a17:902:8c82:b029:fc:e4ed:4958 with SMTP id
 t2-20020a1709028c82b02900fce4ed4958mr6733270plo.0.1622055314243; 
 Wed, 26 May 2021 11:55:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s1sm14461521pfc.6.2021.05.26.11.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:55:14 -0700 (PDT)
Subject: Re: [RFC PATCH 08/15] softmmu/cpu-timers: Remove unused
 'exec/exec-all.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <efec36cc-abdb-25f1-a7e5-a7c20f07b171@linaro.org>
Date: Wed, 26 May 2021 11:55:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpu-timers.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

