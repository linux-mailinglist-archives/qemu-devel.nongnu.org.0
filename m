Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5CD60741F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:32:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloOC-0002ud-Ch
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:32:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloJr-00060X-Sf
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloJg-0005gt-11
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:27:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloJe-0005WL-2v
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:27:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 186-20020a1c02c3000000b003c6c154d528so4560937wmc.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XUXwM+y94t+6aa+HG3YriDKzvTDw3Nf7ute3pCKUr8U=;
 b=qeLI6Ek3N27ryOWgc8ulM/BXjqfPqRcASdMmE6yMiAdIOzHJjv7nDA3hj0EYTeHio4
 1+JeIsJhsT3sRlkDnEOd3UKU46MXh8SxLTphHyUWGeJNZMBEQTDHKdbD1GI1BZ9R7JKh
 OW3twzRPPD+RG2BFsk0VouLwx9GGBNrA37VNLVJrE80IGQ0Yo/RpzGuD7Q68ck/p1+1R
 Ppa4lETQ9Iyqj0G9YvIF8cPuzWE95ARcyefW8VekxL0TzqBWFWob3RgbhLrRZQM+nFq3
 lL6Oz/tGvh0UtP+gIZrRIQIJp6+jLmCO+ggDI+YemmpeHSqK0vfcnOHnBRmteERsDFhD
 i6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUXwM+y94t+6aa+HG3YriDKzvTDw3Nf7ute3pCKUr8U=;
 b=dfvcXFVx+mLhXbdVGRJmlIN8K5co/5TihogQyWP58VuW6AVfPGuPFKAyFs3xb+dC8n
 DMY66k0IM+UPIzWaJscU6ZPVfVf5F+kLY8Ksv1JZD6KQUGXe3h6LAAkHf05kQje27lCt
 UXaKILqX2tSZuJposInuyYPbSVGt9jnyK9+G+XStswc26xxZfFCqRBbkmRGLkE6I+wNK
 iRKmVlbUTdKlm5sYcPMj93/Ot4M78oheU1ppvot+MvO3imkI7aN5Sa31f0MLh8ArvkJ7
 bLwFkAEFGUUdnroCUX362IlC6Pf+26sjCIptHQNd28wkAm8nU5/waJD1biE9/kmTqhyl
 V1pg==
X-Gm-Message-State: ACrzQf3CzzYb4fg1CpkEUABeTX9mg/nj5eXM/ZoM9FQO5O9mtyS/PVzA
 yLbAx0j9TU6fu+qpOdjC0YtbCw==
X-Google-Smtp-Source: AMsMyM5rdC8We3j/9YX4DRMcFtRL1uVh21o75ojwRjfrg2ZXiF6FVCKKI9+6EDQ1BlOy9pddzHdpcQ==
X-Received: by 2002:a05:600c:6003:b0:3c6:f6e8:25fc with SMTP id
 az3-20020a05600c600300b003c6f6e825fcmr12280374wmb.50.1666344464228; 
 Fri, 21 Oct 2022 02:27:44 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfd208000000b00235da296623sm3797758wrh.31.2022.10.21.02.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:27:43 -0700 (PDT)
Message-ID: <1eda418c-61e1-a00a-1217-0ab2eaff0ae0@linaro.org>
Date: Fri, 21 Oct 2022 11:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 09/14] target/arm: Don't shift attrs in
 get_phys_addr_lpae
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020223548.2310496-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 00:35, Richard Henderson wrote:
> Leave the upper and lower attributes in the place they originate
> from in the descriptor.  Shifting them around is confusing, since
> one cannot read the bit numbers out of the manual.  Also, new
> attributes have been added which would alter the shifts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)

>       if (regime_is_stage2(mmu_idx)) {
>           ns = mmu_idx == ARMMMUIdx_Stage2;
> -        xn = extract32(attrs, 11, 2);
> +        xn = extract64(attrs, 54, 2);

54 -> 53?

