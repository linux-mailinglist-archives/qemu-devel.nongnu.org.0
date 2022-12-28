Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274F657399
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 08:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAQj1-0003Jj-Hr; Wed, 28 Dec 2022 02:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAQix-0003Io-CD
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 02:19:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAQiv-0007OJ-TJ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 02:19:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so10739893wms.2
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+vnfpTIyMM2zSGhuXvtjMHg3xkPN0wdZ1/mT7O6wnUI=;
 b=CjMq2LohdEQOryM8cFSpJ+PyI7VchOM6jF9kuWUimtPLMnwE7N6f7TZCpMd5FXyN+b
 G9+6Dk0I5BYouTPTqfOxwLbWlXGNq4NCyVM90bn2gxVyeLUI/mKUbr8EzJYnx6GmWtlx
 ZJQJYx9TWn2vtuF078rJNghD+pvmLkGqFm5qPdv45pH/3vhDPbvr5aSDYT9CLe4hV8Ti
 fdm/utIgPrwjofjCxv04V6/E9LGgP6F5nOizHBSw+6SxwyrpoVcrjLciXfrM7tbvOZY/
 xSAUfJAfdkbEv+uNrezi7mYKJKC/hwwu6hOmUqHeMYopJaqi3/tfNvowPKRegQvfyZqU
 w12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vnfpTIyMM2zSGhuXvtjMHg3xkPN0wdZ1/mT7O6wnUI=;
 b=khmTKBHPjQfyGwPPKtdVGUtGyaz7ifBwz6hE4+1OzUr6ezQSLPkjrhWGeZq9iEsj2J
 4VIYUNyL1SmWNwdM8O/SwN2mVOi71rc8+wTO2lqo6gneK/VLINb8WGBYJlSFGUds0foQ
 QU3i1b78bOa/QwzwppdkJwN7E3DrfnSXE39vYCMtNZrmOTC54SbnL8Epie2mNrQjsPBh
 H6SAz0GJTLRi51N6rLeE6nk8WqaXbowQ7UicSxJJYdS3QA7wWiSZ2ykKyYPIjKRgJ3q6
 ZpHddExgjV62x2TCGHWFpWfJRuKJuTs9ijvYwAPhTQUsHF5tHZUF/8ebi0HovpK8oUHf
 HbjA==
X-Gm-Message-State: AFqh2korUZfsX2MyOF5rYDzwFiT6nStXjUVPsyTS7GL5FHIVYoIZrR3a
 E/hrFw+KjNNMJg4HyMulfE/xEQ==
X-Google-Smtp-Source: AMrXdXsEJ6a1J5ybOhxiqLlEiKNjQqw82h5baRG/D8BVBNtt8drxNy0gTNsEFZ0pSozfbfKWfYyppQ==
X-Received: by 2002:a05:600c:1c27:b0:3cf:a83c:184a with SMTP id
 j39-20020a05600c1c2700b003cfa83c184amr17223731wms.24.1672211976051; 
 Tue, 27 Dec 2022 23:19:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d237d60318sm21497774wmo.2.2022.12.27.23.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 23:19:35 -0800 (PST)
Message-ID: <a38be29f-1ae3-1e10-6f56-2d1b4ca77bf5@linaro.org>
Date: Wed, 28 Dec 2022 08:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] accel/tcg: Use g_free_rcu for user-exec interval trees
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221224151821.464455-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/12/22 16:18, Richard Henderson wrote:
> Because we allow lockless lookups, we have to be careful
> when it is freed.  Use rcu to delay the free until safe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


