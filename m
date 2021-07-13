Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EA3C7478
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:26:55 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LFG-0002X6-6T
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDK-0008AD-FP; Tue, 13 Jul 2021 12:24:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDI-0001q5-HO; Tue, 13 Jul 2021 12:24:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t5so17424479wrw.12;
 Tue, 13 Jul 2021 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FeFPEjksjP/DqohhB4wXQsXjzvOwDAbB73VvkxLfcq4=;
 b=p6sXwvGfHHEFyNqz9yH2/1Rpx1N/63+7N7MjktYCZtp/38Mlc2yMYtpTdYkydLDgd4
 ptiUlHjDliIoab/LxXxoXqrzvyMupnOE6PSO8vxYstKrS2UahHlsWTvYbvTs3tu0klj3
 lSlmhhr3l67oeDONdFdxH2gSBPc28T3TMeY+zgnBFrfT9FxZlYfenKzcREO1VLA5W+0T
 GX/RqhrkOPo9hfLhEhhY+6RwNbV1TZQ66K09fiJBlAU2Z6N0zCRnQfffl/pnpYB6WLXt
 UagZaga5T0HyiKt/35aD4YyDHTDGmm8OpDU0tuMW+IKIOvZuMd62B03GpJpakhAJwDIC
 jJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FeFPEjksjP/DqohhB4wXQsXjzvOwDAbB73VvkxLfcq4=;
 b=nLkr62eRo7w4lk8UwhXy8/0MtpNtX+lpW8yydlOnKGrvMu6+FT3W7P0he9VCF/scuH
 RBcrTU6Fl+piyxg7B+QkVhy0yQVJ/wErU7KMBaxNen5v7id6hid42tnplQ0kbUlNQJRW
 vVq0Cs4OJKf3PMZnKV97NHVuCEPuONSTqJEEv3sD6dDB32KZiFjubIa/3+m4/WC/x1zs
 /A1esNbDPg3z9IQaWG47d7oog4VCLDkmwxNPZgrK0xwsslDRTS9tsFysyMLJOzxzuoec
 L5uQOZ6lkQldgDzdWKTVgJJDwIFeU8Q1TeOiDN/x0CvPGbyE6leKFMLx9XcrzhFF9Xn0
 WRuw==
X-Gm-Message-State: AOAM533r0DwB93N7wPxOTtKVoICRTB9Tz1aDocrCD1v5pcg39onhhKcI
 KkQhCIguVAAsw+hPCdg91O8=
X-Google-Smtp-Source: ABdhPJx0offZrHBSEZKU+8IFL0NR10/W4S1VaifgF8S8Mn5cix9knDDW9/BGWCxuYMJFdt4FDbBYcA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr7037175wru.118.1626193491031; 
 Tue, 13 Jul 2021 09:24:51 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id t9sm17893377wrq.92.2021.07.13.09.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:24:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] docs: Add skeletal documentation of highbank and
 midway
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713142226.19155-1-peter.maydell@linaro.org>
 <20210713142226.19155-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb786a0a-c5a7-7910-e541-e16256053af1@amsat.org>
Date: Tue, 13 Jul 2021 18:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142226.19155-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 4:22 PM, Peter Maydell wrote:
> Add skeletal documentation for the highbank and midway machines.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/highbank.rst | 19 +++++++++++++++++++
>  docs/system/target-arm.rst   |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 21 insertions(+)
>  create mode 100644 docs/system/arm/highbank.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

