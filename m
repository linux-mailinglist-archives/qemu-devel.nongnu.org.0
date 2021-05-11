Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438B37ACAC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:07:34 +0200 (CEST)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVr3-0006Id-8G
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVps-0004ug-AO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:06:21 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVpm-0001pH-N5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:06:19 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so18091098otf.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DjFhBAckUTEs19yXhIbpfm8JP/0ss7bQdXGj88VxZL4=;
 b=k6F/1FWIljmbu40WkUUvJCjttINaPgkVFJ6w8u2nYhTzYyeInoBSAwWJiei7kKMVxf
 0ubOr+D2e/pqN7mGrLdIiutZs9wVB/8KGcZr9kQxPgGj+o7bc02/QBPhB5xXS7Lfqipm
 AlS4ncXlwuKjGPWO2eWclqJyHF55bSQ0kJz/cYD4SFRft4Ig5+EyqC4NlkWb8+J2vjQQ
 jfAgs67srQhNzYhvnQwAuIE/WsB2RIENn74yd+iSnO/7qGRnqkRTEbWK+pheFkkKLxHT
 Gtd/nluq/Ttde8TUscPd0wr7sN51l1ZdLW7qesXQp5ZdBBSGkKp1SkTiNKxMh49brgy7
 XF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjFhBAckUTEs19yXhIbpfm8JP/0ss7bQdXGj88VxZL4=;
 b=pvRplYiZIfSj0Dapj/v6NqpSOAK0H9strFJJlTcx1UJkpZdh/cCcPEBCNTtH+lDF0d
 EAiw5UykRF12hSh5b+1LSYJTP+DVhrB63OpCgaPdtDOrJbENKK/G3Xx3Rmj5YDDTypLO
 sV9tBtS/1IyyGmUVtj8t21YDiWloHCIXmqag+ngNbBHbfG+fC49wq7p5Nb7Gyx0qFFvZ
 FLcCDkFWI5qgi+9JHGJhLxzapQyCYyF3DHRtcgVH0cUrgXs6Ybt8npWwEcBUjnDPjyZk
 YShvMtu3qj4qiD87F7lATZuZxFo08U+5BBTFH1ZJr0L4V8+5UYMupHJCFjqv5dC623Yx
 k7iw==
X-Gm-Message-State: AOAM532kZA55gKg8KUMRxhJytA87RHl2smVG5qZ4cO5hBUJpxsZRF4lY
 ItHnt3ZVtyIuz8QnpikOtdKk5Q==
X-Google-Smtp-Source: ABdhPJx3mQ9Ro77tNJDnX0maHwAIAQh3NJm4Ycbfs53kbDdc5nwMWj+FID0237RHWzSaCBu5AlS2hQ==
X-Received: by 2002:a05:6830:1c31:: with SMTP id
 f17mr26906726ote.332.1620752772967; 
 Tue, 11 May 2021 10:06:12 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id f38sm3916463otf.72.2021.05.11.10.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 10:06:12 -0700 (PDT)
Subject: Re: [PATCH 0/3] bsd-user cleanup
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210510221511.14205-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec1952f4-50b0-8782-7141-1f55cd0193d5@linaro.org>
Date: Tue, 11 May 2021 12:06:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510221511.14205-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 5:15 PM, Warner Losh wrote:
> Warner Losh (3):
>    bsd-user: remove target_signal.h, it's unused
>    bsd-user: Stop building the sparc platforms
>    bsd-user: rename linux_binprm to bsd_binprm

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

