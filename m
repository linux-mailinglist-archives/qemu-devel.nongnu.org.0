Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369A3AD54C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:36:23 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luN66-0000x7-G2
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN4n-0000Fu-9s
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:35:01 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN4i-0002KU-Fb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:35:01 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e20so9062975pgg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8a9uDT+ml6wMNdSxRAbjJ5dn61U2LpPJH56ppEZci/s=;
 b=Z97a+Raum2asRiuM7by0/v0HobhSBwQS4f+ZC4cXRrd7wjliC+1l5QGiDsdp9xaVD7
 5jQDQeVu946/7MULN+QBBtlcdf+GHheEVGrQEKkLkkbxLDMabg6mHzmnCLs91787APK8
 a2ea/JwoOwMb5OT6g+C5PlPtbi2RUGg2vGajzd2cKLEdMMdTM4mWWiXxQy46lKM6HgDW
 blGlMhr/2phbiqFPqN4kSM4DOu7UcQ7MaOksC57YU0Hs5E/RxIDGmPjZgV79pvpgiXFW
 JSsiHQJOC/+/lEbKpWzFUuUP25c3CPrUBPg2qilXmoCg7CTToO3NNzPTpawwviGrccvj
 dzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8a9uDT+ml6wMNdSxRAbjJ5dn61U2LpPJH56ppEZci/s=;
 b=qbVkpwtR6VRLYVGEOb0VrVTV6M5nI0xm6eiCqwZ2yZGqeoSvbvi47a6uvajKCY3MPs
 DtvWao9v0RPF0SOEnNjdhYzzzFE9rSonn3Nb+dD+tDahZIELkRSKyb5KBBFRvNKt3VG0
 ZEoUytz1tLu1iqF1bxCWOc5rieWBoqMQRi4U8fxoEdabu5mPF12eB6hSIDroXCtRZ33h
 3EMwGv9a/ejIN+BaYwGf6UEcNkhZYa2faZrkcnSWbae99Y+QiJ6uyPAz+Sg8H16XKYK4
 UkfI9w0fjCNwORaKQVEL6wmY5RzASDKDdKxgpmTLA6ZCLlt0MM9QmQzOAJy6Y4v4zHPi
 EANA==
X-Gm-Message-State: AOAM530aRhlHzNCgCJL31B2nJ6JmpDrN81Pm77OJuKaJieiTvNkYY268
 CIpg4iMH//CH7xNxR9L4VD5lMQ==
X-Google-Smtp-Source: ABdhPJzNOh8NkXoGQ8+IB8qNSdwaFIELeLGfmNQPvnKVh1P20dpOf8yPOSOnkqq8lcGq1Ii7LBbYEw==
X-Received: by 2002:a63:5c21:: with SMTP id q33mr3877276pgb.208.1624055695088; 
 Fri, 18 Jun 2021 15:34:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id em22sm13191866pjb.27.2021.06.18.15.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:34:54 -0700 (PDT)
Subject: Re: [PATCH 4/9] target/mips: Move translate.h to tcg/ sub directory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4e38df2-8660-90c3-8886-c5f022e57e6f@linaro.org>
Date: Fri, 18 Jun 2021 15:34:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index ae6587edf69..b3b06352bf2 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -13,7 +13,7 @@
>   #include "qemu/osdep.h"
>   #include "tcg/tcg-op.h"
>   #include "exec/helper-gen.h"
> -#include "translate.h"
> +#include "tcg/translate.h"
>   #include "fpu_helper.h"
>   #include "internal.h"

You shouldn't need to make include changes, because the search path for "" begins in the 
$cwd.  But I guess it works.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

