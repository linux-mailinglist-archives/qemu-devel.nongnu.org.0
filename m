Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1243E8BF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:03:10 +0200 (CEST)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAg9-0006Ky-9C
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgAd3-000432-3d
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgAd0-0008G2-Te
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d3so11900005wrh.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Yq6yR8Cm3iUyVFRulesRNmMt19PaaCx1+wjGV0GrYM=;
 b=JH62ZHU/1JHWKw/l4PPoAdyQ4DbKyabomTEoGGCtfz/x/qJWaNUffzDRDLlfvF8w45
 3XwVD5UB6Q/48GV5dqRMWcq8fRCy+sYYX3tbDl5cdRxinyzY/HKaG3SvyC0wDAP3AqO7
 sAciLts4hzhOWT3SByNSxf70czgQG7eQ22+m+LeyafB5MUqc9BFT37Aq58S1mdx+oBRS
 tFDTQW8qLANs/2WSVrTli8N+xNZ6ng7mT5OTXRv5bsZXRkQAdmLJgFgx2Nhv/eWyC4IM
 lLS4kXrLKxiFpRSxipbTbI9Alyg5NAkm+pYxOSYMxmHqLkXfgJ+paz4mEHCXjUhgjy0D
 ZGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Yq6yR8Cm3iUyVFRulesRNmMt19PaaCx1+wjGV0GrYM=;
 b=EKtV02YKLJoKaU9agJmuEiNOulylX/Gr2WeJ+iOYjlfKpVjVa6U+/UFvdpaVjso27q
 +jt4MVUxLWZCeN4TBFr9qRnssSXff79b+woP6bk1vqkGbF+PJIEo+YXNPcRQm9+ipQZn
 gkQp1X9vjohj0NFP/Q0/d6bRT4bCUd/8RleZytxhiuXWqGLoyCIwecO2z5xoxHdkLUjr
 kov/6NpqVr3g39x0dXx0XkTyoGkc6x7BgeA7ytcOAJssEoTEtFpbphWbuVL0DH0iU9+a
 GY8zqGicTLe+nd9d8vje0vZ87C+HZZMr7GiUSHMRZfDHcQIbRCfPjcVB1uXWJDcCnZLi
 9sbg==
X-Gm-Message-State: AOAM533HaOHOiBNJTprm0qfy04msMKezNpAIQZcfZAnCfHwOtLIX51Fu
 Shturd9qek6PbUYxeuocSu0=
X-Google-Smtp-Source: ABdhPJyU0XfPn4bQ/1aNXXTNlWXUT4ky6QL1H9JmN/pNf89kQoniqdbg7xbXzHdHNTiTY0S+v46w0w==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr7914836wra.138.1635447592977; 
 Thu, 28 Oct 2021 11:59:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k14sm1727478wms.21.2021.10.28.11.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 11:59:52 -0700 (PDT)
Message-ID: <176ab49f-53f9-b698-2ecd-6284891ff805@amsat.org>
Date: Thu, 28 Oct 2021 20:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tcg: Extend call args using the correct opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211028184440.1508585-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211028184440.1508585-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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

On 10/28/21 20:44, Richard Henderson wrote:
> Pretending that the source is i64 when it is in fact i32 is
> incorrect; we have type-changing opcodes that must be used.
> This bug trips up the subsequent change to the optimizer.
> 
> Fixes: 4f2331e5b67a
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This fixes a problem found in s390x host testing, and should
> be considered patch 41.5/51 in
> 
>   [PATCH v4 00/51] tcg: optimize redundant sign extensions
> 
> just before 
> 
>   tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
> 
> 
> r~
> 
> ---
>  tcg/tcg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

