Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390634BD68
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:01:41 +0200 (CEST)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYnE-0004w3-Hv
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYkX-0004U6-CO
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:58:53 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:47089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYkV-0004ws-UJ
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:58:53 -0400
Received: by mail-oi1-x22e.google.com with SMTP id m13so10896200oiw.13
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LIJAVhYs7dSEFESpBeFIwDyHjVtjE7ir5rfx1BNHpWo=;
 b=XCUbAmi37u2ElawGOO3Ukb6xY8fVvZ2nXbolagEUBKVzXwMcloM+CTVwaGnm6/knOo
 4Jl0l7irv5/Yq2GMwBJKiTQGq5wv4UZkxLr+BKriu0LRFNEaP+wWx2dwXP3yG7T+sBOZ
 Fat1Rz0Ac9OIhix/VIYNtN6Bg1QnHgpwCac0HdXN1P+GT/RcUiWwXLnIXLjmkigp1tY6
 RYOoIgTZ8zqGI0C7sB7wavCmGEpHAhq4xg8/+bgzovc9/+cF5Mwx8m/C4Mg+ixFGVOup
 Hym9f371zOlHR5lU8Y2833D7H9K88JxqrHyM79XG3LN1f1FJy4p3fy7gqR4RHbWFDYL8
 ItrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LIJAVhYs7dSEFESpBeFIwDyHjVtjE7ir5rfx1BNHpWo=;
 b=gz0sRdkrVnddYthUph+RYuPotFdMAryGACs1mnsJCHLau8kB5hOm4mKjzXnii5ucDp
 3efR1SGlODqqIlCpDDS/3ypiavm1wWzjwjS1/MnwIUDjtrdODNlXkTcvrTGrpAEQYDf5
 pIwW4p+1xqsJ1kUcHO+Pva1eqwyMi0lkjZcMlOedOQlLXMWIOrAeMRGhfMS/8tnVC4vM
 xq4nZni2XJDBSJl1+x7UXRWPRlWuA4Fuxjn4oS7Dnq7jjZkgGXD6Jz0bkI9bOO+y+zV1
 z3SN9TsNKs/fJcXpdGf8cFUysd1+J5t0S3wgMc3LWvT8jIhbO4XEKw9pOE+ndOMMZprU
 o0Gw==
X-Gm-Message-State: AOAM531tILPDhX2aAxgyZtIxnID9uII1i0gX3ItJqZANi7AA0/CTnj/L
 7uAYgmD0s6Dso9yP1IWFA749pw==
X-Google-Smtp-Source: ABdhPJzRB9hvKT719wp3mc3XIPFy4Cr8PF3ZhWS/2A3UbG7xOKatWtKVD5+R1DLsGYxP1rTRR5u3TA==
X-Received: by 2002:a54:4590:: with SMTP id z16mr16437133oib.110.1616950730828; 
 Sun, 28 Mar 2021 09:58:50 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id h17sm3655600otj.38.2021.03.28.09.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:58:50 -0700 (PDT)
Subject: Re: [RFC v12 37/65] target/arm: cleanup cpu includes
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-38-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6dcb9e8-3bc7-64e3-378c-4660e5ab6635@linaro.org>
Date: Sun, 28 Mar 2021 10:58:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-38-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> cpu.c,
> cpu32.c,
> cpu64.c,
> tcg/sysemu/tcg-cpu.c,
> 
> all need a good cleanup when it comes to included header files.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.c                |  8 ++------
>   target/arm/cpu32.c              | 14 --------------
>   target/arm/cpu64.c              |  6 ------
>   target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
>   4 files changed, 3 insertions(+), 47 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

Not reviewed as such, but if it still builds it's probable that they're not 
needed.  We're not especially good at ensuring that exactly the right includes 
are present, and not via indirection.


r~

