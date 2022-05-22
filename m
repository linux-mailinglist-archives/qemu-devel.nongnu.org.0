Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9257530697
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:43:25 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsuIG-0003yJ-RT
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsuEc-0001y9-L0; Sun, 22 May 2022 18:39:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsuEY-0008I8-Nk; Sun, 22 May 2022 18:39:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso15880167pjj.4; 
 Sun, 22 May 2022 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hIlzF2vXz8kWIiStaeHNN6uVHepC/TD8OXL/PXdF3F0=;
 b=p7kbgUkuuL18aoaJAo7lXX7h+SOu6w1mxQQP/Op5rd+++FmZZ8N0TL97wVDZPwruqI
 qRm+ovBeQcTgxnFpAoRda7bfa6GWkEWIXzX0+Ch9OUxZXgN4cKHxIV5RGFCDlk9Hjuki
 muTXUdeiYW/gb7Hyusj6zxj8MlAuovX0eSJ2x0S2HWeyzIeipqD5wnkCdnyWRxHpx/kl
 KYsXMJhBze5DoAX3joWyUylHYVYbV/DlocVYl/zzWwcGmqcBiPBK7XV4SbDRdAKWH8WN
 8VPGZbxtuKVrJKOZ7VFTCgCDfFAjH+sz0o/5ZF/qiDO9IH6LLmVI1utP2bGCzehcuvKg
 /w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hIlzF2vXz8kWIiStaeHNN6uVHepC/TD8OXL/PXdF3F0=;
 b=BsdvcIwvQbzHQeMABnNsj3z9UHoP2h4+dQiabW/kSP1J75UeS0u7wKrF7KV5IdTosD
 +4uQaR+CtKtrFkcGCnTvoUa/RVmogQNCbJQtT23OPEEchkMxXWLvQhyljCJDlcpcAXPE
 DOsKxgLBr7WHgrC4fLrO4FY/qph7yNb+jwSnSfJhDJDFwTQzynzh3kEPhpLxGqHFr2Je
 pTeZo0zevq4dgD74t7lgr4wQ9k376Th+Xait3xsyn5JoNks1JCQ5kx0gHuJwdb/MYyPh
 LMzX3i7kU5zK33mIdq1TvwJUQ+Sv9tkE+un0Z61i7lMQl9vgHrlIE3DtvEfIsYNwWsFA
 tjmw==
X-Gm-Message-State: AOAM530HyY1t5nGIHdD3JollOCaFEqEaNKJRVRiBKuFfBz/j37Ax3RZm
 nUjX+SY6xzslt3B1eLOAReN6aTc/Bh8=
X-Google-Smtp-Source: ABdhPJy5Jc9LxU3EjqQaIw35Bt1IMZcBUF322dr7wCVJVsRECVGSh+mgPHhFmi/z1P9+xieju2uUyg==
X-Received: by 2002:a17:902:8f81:b0:161:f4a7:f2fc with SMTP id
 z1-20020a1709028f8100b00161f4a7f2fcmr13297732plo.117.1653259173210; 
 Sun, 22 May 2022 15:39:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a056a001a0e00b0050dc76281bdsm5703882pfv.151.2022.05.22.15.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:39:32 -0700 (PDT)
Message-ID: <3cb9354f-1d38-e491-e803-6443102160e2@amsat.org>
Date: Mon, 23 May 2022 00:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 09/10] accel/tcg: Inline dump_opcount_info() and remove
 it
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-10-shentey@gmail.com>
In-Reply-To: <20220520180109.8224-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 20/5/22 20:01, Bernhard Beschow wrote:
> dump_opcount_info() is a one-line wrapper around tcg_dump_op_count()
> which is also exported. So use the latter directly.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   accel/tcg/cpu-exec.c      | 2 +-
>   accel/tcg/translate-all.c | 5 -----
>   include/exec/cpu-all.h    | 1 -
>   3 files changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

