Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1243B957
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:19:54 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfR3B-0005r9-J9
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQvC-00050L-Ew
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:11:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQv8-0006ma-Q5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:11:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id j205so290471wmj.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A2tbc9rkrrjlOInAljrzgvKVJKv97nJ+B6+wz8E74kQ=;
 b=nivs9ZFUGmV4S8lksr9PO8Cx4S2hJW3gBnHq7xBXJ8peXbNWjX0PUS8zfAIRbUd1WE
 NSJEH/0HAvyIB/AGpTMSwfeu+cxRuOZL+c3Udm2HxhTYs66taoQjc11B7kIaKSuHqe8F
 cU7J+zwTu2SRJQkkD56s5CmjKvpboF0jqn/IJo/aAPV12Du/ZQwJSP+Z1gGpaSy4tIjl
 nhOoV6ESOo1oyvLkD9tI/9maPXFx0OQw0GBZAUg8K6kdkVCYEUEmiU52eoS6riXrpase
 vbPqGhxOCnYCQPoZZl1fWc0763xqAI/BiJam+BXrMRmfVv4fDzxW+75KsFkuecIuM66+
 DjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A2tbc9rkrrjlOInAljrzgvKVJKv97nJ+B6+wz8E74kQ=;
 b=rXuK/lJPOJ5wh1tLXiD9SSPjhcjwjjpZKYJhIdoGPzDpslBPkoA1KrfgIs+m5BfetP
 1gwA7rLGrbxdshzOTeIFvZTrFZqiXsmaDJDoguheuhTWm8Obbn/CKsZxQY3GI7Jk0hoE
 8JMM7nk6eykat4PKxckpPW2cW+D7cSd7UdPVE9eBupipWXEKHmPA0fPQbwWyDKDWPjsl
 nk2l6Wf/xncaVPOWR4jl45W9P0OSHPpPWB0f3PKBQ9okaWdaYVZwc2kcbZv35OoxBj5Q
 s6yGRR6CUiIiaqsneWBQAHE6X80AaghepH4tCTiXECEkqLMzjbs5yJ3UZZzVPdZPlm45
 lzqQ==
X-Gm-Message-State: AOAM533ldBiStDFY660ZSXwmsfim9BQWEdpSmWQ5L4uVPwSg7ZomfOv6
 CFw2UqG7sqw9tSEaFla1FbI=
X-Google-Smtp-Source: ABdhPJz9+MTMAMqPprCxyjC3mQyNxemHbawMGkZEaCwp4bEUJ/VJ7+XFHFFFrMeMHvETUhlm2rMu9Q==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr290300wml.100.1635271893258; 
 Tue, 26 Oct 2021 11:11:33 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 3sm1238933wms.5.2021.10.26.11.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 11:11:32 -0700 (PDT)
Message-ID: <1779653c-c3f5-a7eb-cb5c-f9ade5a058ac@amsat.org>
Date: Tue, 26 Oct 2021 20:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/tcg: remove debug polluting make output
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026173914.79377-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026173914.79377-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 19:39, Alex Bennée wrote:
> Fixes: 5343a837cd ("tests/tcg: move some multiarch files and make conditional")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/multiarch/Makefile.target | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

