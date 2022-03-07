Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B04D0573
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:43:32 +0100 (CET)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHOM-0000he-Lk
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHMS-0008S2-O1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:41:32 -0500
Received: from [2607:f8b0:4864:20::433] (port=40468
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHMR-0008Fr-4O
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:41:32 -0500
Received: by mail-pf1-x433.google.com with SMTP id z15so14623111pfe.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zp7+9/mftR1xCD8G8RzN34v4LUFFf5S3GBg1hVGw7CU=;
 b=aNDmcu5jBr8pd+k1vDFidn3KxDkD5Ece3JSmurZ3CK0BDnTStK/OvGFvnXzHh6QscA
 Y4ykm3m4dmX6GqX5z00v9M6PD7/yo6sW3Pz6+tO7RpXcWvwIPRB9HigJDEUUVM7u9Ndz
 HVtU2UPPlfc/YwE22WazW2nWSJMMEmjMbGdqLocEWNUMMgyR4mx8Kb/FPxYyCloJ96HN
 EKGwFXTxcsNW6FaWD3YKrndu1vvkW3uUsgKnMaJodXHjwlKbx2IPjhwECM3twtHo44+K
 v/0bvGxrLsTuJWrc+07wgAOBkpAJf7TCij6FRtDTECAi60mL04z6uNWkPImuTvNYJ0wj
 abZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zp7+9/mftR1xCD8G8RzN34v4LUFFf5S3GBg1hVGw7CU=;
 b=YY99+eCNATzGVzPd8pGIRutjVN64er0xRCkWB/uCrnRU8fM5Flhi+v/cOjIwUIp7Qn
 0YV9YWroLaNpuwE6j8c3HSfqPBVYLEjYA7jzMm2NVuIw9iOU7YilWJigekXMRPRIPVvq
 AtUWPMYckhyinjhvippT/i2e3YyfisssPqfWiGq2rpaCKGPk6K54qydYrlfSvv18ITkn
 fCHvHnETdLFmhtmOVvX/aKh35UWn5ef8+48oNVJIRHNRuyKTk1n/WrhFj8ERVZ0TGS3T
 fyj0T5g9ASkvOi98Z7B9cLmJ8wZYZmWG7TlvnagfIqRPSPA15ykKp89iHyafxJha/9Ck
 vNYA==
X-Gm-Message-State: AOAM530CTgc6O3sqUfahNuxZX1K4U8IMDGhx7U0A0jPSjdVk4ieJH3bQ
 bKEra0d3rFMturGLIXsgplR3YA==
X-Google-Smtp-Source: ABdhPJy8oyryDGs08ahudY7HE2ani88vXiBo4O28G7bLzTZzR+xgCMar4e+ziMIVAtYtF1mgJ7Z8Uw==
X-Received: by 2002:a63:90c7:0:b0:37c:7a8c:c2d3 with SMTP id
 a190-20020a6390c7000000b0037c7a8cc2d3mr10803305pge.473.1646674889137; 
 Mon, 07 Mar 2022 09:41:29 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056a00228900b004f3ba7d177csm16177513pfe.54.2022.03.07.09.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:41:28 -0800 (PST)
Message-ID: <fedbc4bc-c5de-4320-4103-f46730680dbe@linaro.org>
Date: Mon, 7 Mar 2022 07:41:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] RFC: replace qemu_real_host_page variables with inlined
 functions
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220301144611.1299277-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301144611.1299277-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 04:46, marcandre.lureau@redhat.com wrote:
> Replace the global variables with inlined helper functions. getpagesize() is very
> likely annotated with a "const" function attribute (at least with glibc), and thus
> optimization should apply even better.
> 
> This avoids the need for a constructor initialization too.

What's the change in the size of the qemu text section with this change?


r~

