Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB032CA77
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:28:30 +0100 (CET)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdj3-00052Z-CK
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdhj-0003vW-8U
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:27:07 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdhg-0001A1-8z
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:27:06 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 18so2966735pfo.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BybwGU/42trw+TzG1KD5ROWieVKsLXoWH5hwyXcHGiA=;
 b=V3anvyb5briLsnfsupzCXqtqZ4Lv353VuJPHJlSyHnBu2RCnFNF1Aq/Y+I8jBoOtot
 qtFSDhOQb3rNm5rmokpiNeLwc6aM5w11rm4GGTuCQzI+5RpRCQb0h3JRNQ1V72zhNF72
 g37mOodEh6gZOB0s+yygv8qWNAJ5Snue1MWHit3mgLyyUwHk8/Lq6LcEgvCfy4FuH/pR
 YR2H7aqLrpOwUmk0Nac7vE71IHvLhSZpFX4v2c1e1Xxaair9E2dQd8UAvdjLu6q0Z/Yv
 FbaGcda1oM0uPapSyBy0rvAYJh9kh9i0/ZJbixcXhlMorsQNebWmNJ/STCBPcnkMWCu8
 57iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BybwGU/42trw+TzG1KD5ROWieVKsLXoWH5hwyXcHGiA=;
 b=KxWAznJG2pmtXZCuIn4dbTYLUtgbhFsN/0fuSL2+XE7LY61NDRV16vn5Hk/AYrTW9s
 MbNEwT8L0K5YFSx/fOznUH5zr3NGyTKrCl54ovodTEMtQFwzW3QUxmeesJ2oZ47SR/R0
 p7MpjirB4b1ncCQsYwc3hRLShHHV4FlWwzpjscpjRBiy6LYOSOfpI7H4we+H/EIIwjM7
 eQycxpvEEMWdKYg/k6I/m5B210DzFXkPqy3YPC8gAIWcCGY0d7fzbCBnJvk+HptLlhTv
 tLFi4oPIReOE8UXVAxRt7r9oAAlkZnFZQB2zaSSf9Zf+OfNdw5fSUpnHvy7PEb8zTsZK
 CqrA==
X-Gm-Message-State: AOAM530lwyTf9esVX0tP0AdOLMvFwmvCdweXyA6d7doTQkuMrs4aowQQ
 zEuBs7t1NEMcv0tGcn9Xv97dwBKuNAncWw==
X-Google-Smtp-Source: ABdhPJwZ/gXla3+0oPEBArLycgX9hJ26PXmgoD8N/4U7A2Arq2eNSJgK9XChRNkCfCjwLeU3Y3BoUg==
X-Received: by 2002:a63:f055:: with SMTP id s21mr1720925pgj.293.1614824822783; 
 Wed, 03 Mar 2021 18:27:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 14sm26062042pfy.55.2021.03.03.18.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:27:02 -0800 (PST)
Subject: Re: [PATCH v2 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da74dcb7-17af-89f8-c3ca-3bb17e2e3983@linaro.org>
Date: Wed, 3 Mar 2021 18:27:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Update old infocenter.arm.com URLs to the equivalent developer.arm.com
> ones (the old URLs should redirect, but we might as well avoid the
> redirection notice, and the new URLs are pleasantly shorter).
> 
> This commit covers the links to the MPS2 board TRM, the various
> Application Notes, the IoTKit and SSE-200 documents.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


