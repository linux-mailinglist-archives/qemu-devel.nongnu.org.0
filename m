Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651A4D6937
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:53:30 +0100 (CET)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlKL-0003e8-1A
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:53:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlGm-00013v-NQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:49:54 -0500
Received: from [2607:f8b0:4864:20::530] (port=43960
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlGj-0000Uf-8E
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:49:48 -0500
Received: by mail-pg1-x530.google.com with SMTP id 27so8272453pgk.10
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pqSqLWkOWbPjAz8ESexerUWDey+degxus2MJTWyo8BQ=;
 b=Wr9Vn+sb8TG8X2Rdc9PFqds0Oea0JEwS9nFDAEFgygmSaDnyzzX/zjUHzIlT4Xv1vc
 WRqScN0hVOta+mTyyGs3FEPsgUZOozUznGGgEiB1HPvqntYaI7YOgZ7/TeGeWnWAK4TK
 nxTRXXAq+UOSaVSZ4SPnKTajnMZ6jtID8LGsEptXzv/tc4fDoWezB9mstfN47Bd9WSJ7
 hc7wb5Ts7JRbESe+1CIj23/lLDLGmlnnB1A8Cazv6rKK1d7P2nOiuTpGfX6i8pO2fYKx
 WZDnbrYTFfWzisAc0x4iySanb47AaEhoGAQvAx2J+9CTeZFQkt47PqzfUqsMSdZ9CLkg
 tqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pqSqLWkOWbPjAz8ESexerUWDey+degxus2MJTWyo8BQ=;
 b=AREsrhpMjZ4hrkG4nRnjEppOGW7gshj29xh5VSIwzG3Dj7yKjkhmKBcXb4CA9j/NQI
 IIeZPywcJ90fIpxdUlZOI4KPOAnTXz4AtXfkDArdN9pEWkgp/FvYBUxVdRtwze4frHbV
 OekIZzyI/5UbPsDwOr1gke1a769atIxWahz76stalfzVNok+WZJmGDzrsmNiO0QO8pE7
 8XUFzi4hHryCk1I9yuViZw//VTNMbKg3b7BzJiXfAhCOenCG16TfQXGLqcTCVGPhHZu0
 BeoFB2ECqww8RYvqVgIhSIZeGETkfwPqc2C+vIPT85dUkJgLa4+ZcOPbNjLe4UAofFeJ
 yLMg==
X-Gm-Message-State: AOAM530pxaNupNNUghEqgPTmmlahoGu2p5WbbEygGYCom+oNuQp1stfK
 0ZY0Pimznu/mH7We4Q6Gm7gINQ==
X-Google-Smtp-Source: ABdhPJyoJ+r+JHn5aOsH+Hc+xGirc7+8PQey+msR/SsqYhkaGngQ1cVnOELC47ghDCfKOTpgm5JVtg==
X-Received: by 2002:a63:5c5b:0:b0:380:d9f:df20 with SMTP id
 n27-20020a635c5b000000b003800d9fdf20mr9872605pgm.278.1647028182144; 
 Fri, 11 Mar 2022 11:49:42 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00168100b004e0e45a39c6sm12715349pfc.181.2022.03.11.11.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:49:41 -0800 (PST)
Message-ID: <c7039a21-d2d2-3aaf-6111-402aa5cb5ce1@linaro.org>
Date: Fri, 11 Mar 2022 11:49:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/9] dump: Consolidate phdr note writes
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-8-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-8-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> There's no need to have two write functions. Let's rather have two
> functions that set the data for elf 32/64 and then write it in a
> common function.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c | 94 +++++++++++++++++++++++++++--------------------------
>   1 file changed, 48 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

