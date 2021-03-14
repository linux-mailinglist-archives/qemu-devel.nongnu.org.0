Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9333A86F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:04:42 +0100 (CET)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYqn-0004kC-1E
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYmw-00038S-Su
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:00:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYmv-0005Uv-0q
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:00:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e18so4754511wrt.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8mHlPlblSSnOYQG9adwaC4W17jzMxslz5iv8K58HCj4=;
 b=Tqc30AwwBnhCT666FHBzo0qiisjoyC9Ood6vWX/1fonOWwhTcbFPXOetiZL1oM5xda
 TxfSxofMzxdGaGad3w0HHs+Nl87rj/vgcZO5fBlH/2XQHFHNQvMU/sknfkksfNblP8fF
 ZoV7ua16T/Nu11VntVKQ3q1lwO6FV/nPlhFuhpjhZv36B0LY8yKShu/CKAXRKmp/mJmt
 +H/jqFMUOx2z7VbMDf63H8Iz2SqkgtSK5pQKiYc2CNEWedq173eZNwWsfyGuU5tZf5qH
 F2/W9cz+aFu7ItktDhbaTO4WFwePw3Vsd9JAw7dnHHQVQXwxb/bZ5vFWtzoyAb52mJ8N
 bopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8mHlPlblSSnOYQG9adwaC4W17jzMxslz5iv8K58HCj4=;
 b=T/M5iHRqaRPSm6/oGQSGbW9S237/xJOPyMDb6ZRvH75DaNQc3Tpgq7HIFvsJeY4bMI
 za/IXR9LI6RNA4fcYP3EjaK/58Ba3ufVIjw4KdYIn9xnJQxADIHS4fReuyji0BOgFPKz
 P2QGVpJZ0/phaUpQtp0CM9MWzuIpW8YxZb5MSyIkeXtJrHLGwq7lYBdRBTYAvE3xibas
 fsZ7qOoZNztMR/984341hYilb7CimwEYj7jgHpQlvFmyaviF5SiANJXUSbOVETOGqq/F
 dCQhGD7K8gjSUXXmqFRkcmviME4ivJUeFWwuUIe0K18bnNp9meBxFpOywkXXSi+kmH2l
 tQLg==
X-Gm-Message-State: AOAM533dEzyCLEmr4Tz2O9S3VOsQ+FEmfvXh14PZ8dJ+JoSmlYbkANK7
 8a9YUfn/mAyuRXjPwPrAUkc=
X-Google-Smtp-Source: ABdhPJwbCBpLb6xnXOsZuDm/y9JBb19oHEC6SzqEECNqcrNKSZ7EaBXlD/xvlNd51hth5Cx2dMJioA==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr24786479wrn.6.1615759239645; 
 Sun, 14 Mar 2021 15:00:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n66sm10231727wmn.25.2021.03.14.15.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 15:00:39 -0700 (PDT)
Subject: Re: [PATCH v2 29/29] tcg: Move tcg_init_ctx and tcg_ctx from
 accel/tcg/
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
 <20210314212724.1917075-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ebb6bdc-6fed-dcc8-1581-545b81cd14ed@amsat.org>
Date: Sun, 14 Mar 2021 23:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314212724.1917075-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:27 PM, Richard Henderson wrote:
> These variables belong to the jit side, not the user side.
> 
> Since tcg_init_ctx is no longer used outside of tcg/, move
> the declaration to tcg/internal.h.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         | 1 -
>  tcg/internal.h            | 1 +
>  accel/tcg/translate-all.c | 3 ---
>  tcg/tcg.c                 | 3 +++
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

