Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE0A36A260
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:27:42 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM4D-0005cx-KB
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM2d-0004NP-1h
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:26:03 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM2X-0003sM-Uj
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:26:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nk8so11520961pjb.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ONq4uqvBYHLv+RPUiqCnXbh0KV1SikwmIt5KRV21yMQ=;
 b=TgmJdjMdAOEmoPIaGgFAtL2SIHkF1EaM8wiSxJlNvqKdc0aJ20LQopmdio0oFzPgmg
 G/Sp0ke/HOk8ivH4tdE5ymiJ3fFtVWMdMpfDtnVfwp13ClUQuL4aW+mKkwAnJF9rYsWp
 eQ4lM4Ja7GJF85iJoKmMBjN9g4UAvmmJEnbdi1Nu2UsHGIFWrMByB/jp5HvNip+BXSTE
 t2c0AXL0smU5bNd8+c1wWw5G0h3SOOsR8FkXg26MG3wMEbCSxkmS8HLPguZvU5REt5Hn
 8FSNope7oWToExMtEkiob0pFyJegMzlZogh2nYC2YEyOWKECaHbA7ao4BKeqqpqb/XnS
 06Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ONq4uqvBYHLv+RPUiqCnXbh0KV1SikwmIt5KRV21yMQ=;
 b=Q3Ev3cRjaUpZWxONH2W8XXoXXCobkw7SveIjgb31uD5rOtYNEb97MyXkKBaMBsrtLh
 QNdNmXmZgdxSgekDLX4Gz8o2bFvYLdCXyQQI9qSEEJIvN3P8QUJzei4rADySpXSiY3XB
 2N9R4mJW0FgHL3DszT0WRV5F9mZLCVGmAlf1JoSs4N9xcG8WRETyLnwxaetBVwjH0YSi
 lne0sCQ0gvxlDMhP4lzWn378qa8KP4vsNljYZp5/FOF+HmTrlxgKjlKbB50pmu8uflXE
 bx8xJLegBk5OKWxe2868eKjxVTIvT28gYTfNl5D0lPTxCOdlnd4yKU7uCbefBK9/bh1K
 VP4w==
X-Gm-Message-State: AOAM531gP18gJmYvZ8Q42LZGjCU865zJ3X/ZvRNwNihfaT+Mx67nTSgO
 4LFhj7xntZL7VTdE4ahf0CLmsg==
X-Google-Smtp-Source: ABdhPJyCGS5GlIj/uLzI0phFV6N0iC3tGF5cQqPvtPEtbbhi7mdSH1NvKQyn2BtVYD0x5pWz7dzQsw==
X-Received: by 2002:a17:903:2285:b029:eb:d7b:7687 with SMTP id
 b5-20020a1709032285b02900eb0d7b7687mr9392814plh.82.1619285155224; 
 Sat, 24 Apr 2021 10:25:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id x1sm7346944pfj.209.2021.04.24.10.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:25:54 -0700 (PDT)
Subject: Re: [PATCH v2 16/48] bsd-user: style tweak: Put {} around all
 if/else/for statements
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <834bec0f-0c59-7214-a84c-e8771b46d769@linaro.org>
Date: Sat, 24 Apr 2021 10:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-17-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


