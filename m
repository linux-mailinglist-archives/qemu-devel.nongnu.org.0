Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B943CCDB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:57:25 +0200 (CEST)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkMm-00006M-6n
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjLO-0004oi-8X
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:51:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjLM-0007ST-SO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:51:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id e12so4333023wra.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PFF+TY8oxA7goWt6FbIFndIOc0WOXq7l9i7HOHx0SMA=;
 b=crdDmve6Xf2uJL0AMHGwJlL1mpdX2+VtaA7Ce95s+atEu8VikgLxHVE3uM0UsLw9qq
 zcF8ppEauVVIdswM6P0jqe4HpJRPloJUoctC7f+6kVe4DQdHriT9EUBGHzqjARbpdMrk
 qXdMT9kZCYI+4VQYLd5Jqc5AD8WK/0bmxVBD85te/FhmzQttPVySPxzCDUivmWpi6oJ9
 D5hpREXMS7y+1nlKCK7owAvlDh/aZ6VDAFb1I5WpKSSIJzpZQZHHGzcDcOvoof6haiFR
 l4HQpWXzqc0Q5ZR0fqPdsbi1uVckfCIKLfYNCUsM6qWwRv07fJLxunjMoju8fxhhUX3h
 gB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PFF+TY8oxA7goWt6FbIFndIOc0WOXq7l9i7HOHx0SMA=;
 b=DGz/yjBSSLRYUTc/3cWf0EgDN3fh4e8dn9liEfYRQVT69WgIasXNOzK3w4ZRKdrC1U
 PUzvKc736L5Ox8hDObX01/ToyNbmtJVKe3Yy+t+mSC1JtmW48G6l0n8evXiMaqBWFzx6
 cQ7I6dJsslO/MHTs3mFuU4P5FJzp0Kz/ui+sf2TRk0pjv1mNLJLNAiuFIMi07oSZmQ4f
 S1rvv0x48TocuJvxH7FTVq+6wNwFY/d9VrJvA94ChbRQ+s3Qh6bNYLqIz7F+7sXm46z5
 EFKfpYW9k18r8RfxQTT/r2aCzScFQXfqRb+3BpnGzlvddSNIyjxvDGzYkrQ3ne1nKe6U
 x/0w==
X-Gm-Message-State: AOAM532PCvjZ+l5dmXfzEBhpMCpN7tSRvKNgjm3NCAQOf7Jc81yRSkbx
 IjSakZCOxXXTVKIgykBgM4g=
X-Google-Smtp-Source: ABdhPJxIVGLSrRGSnclKpxDMR3bNeJ82JSV8m20A5LlCu4qiz4xzohExkOe1tT6LcPjxFzTgq90jbg==
X-Received: by 2002:adf:959a:: with SMTP id p26mr39378882wrp.342.1635342711645; 
 Wed, 27 Oct 2021 06:51:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o1sm12990751wru.91.2021.10.27.06.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:51:51 -0700 (PDT)
Message-ID: <ab17a2b5-ed8a-76bb-640a-2c90c7dc3e3e@amsat.org>
Date: Wed, 27 Oct 2021 15:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 46/51] tcg/optimize: Use fold_xx_to_i for rem
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026230943.1225890-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 01:09, Richard Henderson wrote:
> Recognize the constant function for remainder.
> 
> Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

