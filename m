Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E073D501B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 23:28:12 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7lfQ-0005yU-1P
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 17:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7leg-0005Hd-En
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:27:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7lee-0003cH-Jt
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:27:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id e2so8674776wrq.6
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X7uWQabi0QV0BVF1Jz8nzofre2bFrFPZziCOTbvZ7Lk=;
 b=RYihij6xFAhch4Rea09uXqDGVu0mJxTwZoAPwUFQeF2Vo75vuoYTJIjpu88OlsZMAT
 6MpGbBtuHKPjBE58QFmIB6uWPU21TOcZlXNEeSxWNeDtA2xLe+A5TFUESc+S/dtZ9t3r
 JS8nrXIgX1REj6AEouYcH/Uln3pE/A6JWSsnTEnOgqK14kSXtU0Z8eVQzuQR9ZSdeMnG
 UtAZzsILqnT3lnGDDAxuRCPCnAKdjca0RYslUuSwhuAaqIuVQwrhn5iqOMzv5QXLPDJG
 kna0BxQ+RgR2EXFkDjI4dm8xSzI5pdDhbDwh9ufIGrTeB+J+HmtJiCXRKQOPD+leQYqZ
 WfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X7uWQabi0QV0BVF1Jz8nzofre2bFrFPZziCOTbvZ7Lk=;
 b=KHcvvPD1ZhsFjhTVi3gSUlJq0rEwNGtcdCjRfUu0y6jcs+zhgyGcQNS6wTrP6w1kUl
 d7+uaRuiuQF6IaQvtGTQbEKldFgwdDDj60m0KAg1IHYTyhKKddy3ph1qQ3mLRIomQoxr
 kjuyiettS7xWpEauiyG/A6pX349Nbo3BDtOPwtrsCZQ9RSfUPapAuLVxC3WQGQ9c4+69
 CKsRZFQlmMIuQ9LIewyTcrXXUc31GI8f3GPiRvzspiAMgni9hcoF9NeqAVf7lPJkPscm
 aEtnQLKsXZTGyzmPYktkavA1ZWm72065CGqYKjfgTQ/j9uMcGUTzSjQz43H8MG3W5x6n
 qv+g==
X-Gm-Message-State: AOAM531PADjdQWSztFBgibP5q7QWtOJjk44M0BdDjRWD15Rp+y8ZuO+B
 8CMAgHF3Y/VqxOaqIXRK+2A=
X-Google-Smtp-Source: ABdhPJxvLqSpQN2yBHSqaeWoSRmpsMPq4FaWsTBpJNyE1//4K971E7XB3fGluZWGA5ukcRLWnV6C4Q==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr3233698wrv.243.1627248442212; 
 Sun, 25 Jul 2021 14:27:22 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id k186sm3871438wme.45.2021.07.25.14.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 14:27:21 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 7/9] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ddbabd5d-9dba-6f3e-b0b2-d770730fa427@amsat.org>
Date: Sun, 25 Jul 2021 23:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725122416.1391332-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.091,
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Cédric/Benjamin

On 7/25/21 2:24 PM, Richard Henderson wrote:
> From clang-13:
> hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> It's pretty clear that we meant to write back 'v' after
> all that computation and not 'val'.
> 

Fixes: 4f9924c4d4c ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")

> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/pci-host/pnv_phb4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 54f57c660a..5c375a9f28 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
>              v &= 0xffffffffffff0000ull;
>              v |= 0x000000000000cfffull & val;
>          }
> -        *tptr = val;
> +        *tptr = v;
>          break;
>      }
>      case IODA3_TBL_MBT:
> 


