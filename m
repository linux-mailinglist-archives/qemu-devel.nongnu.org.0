Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921916494F4
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OWU-00033Z-5Y; Sun, 11 Dec 2022 10:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OWK-000307-MW
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:45:44 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OWJ-0007jz-4K
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:45:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id x22so22291917ejs.11
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8HVSN8ocFfJz+Vre1Og9wZ26G9xKFkclN8P+7NO0IaU=;
 b=z6v+8KsmzXZay88u/bazDuPq3RmP2OXS2UpBPlGtBIQhwgbnqrkn5wGd8thSsL9fLD
 7BN1btK2GWtwOz51fqZrvGsF7CPb7L/Xy4oaEqoDADG2LU1upDlUwXpBW+zE37n+B+2P
 ib1CgXT7ZVIRjR63OpKho14MYn+Ih9SdsaLyfh5UC6Mift2biPgMlaxvFus6RndgjGWA
 SKTABJKdiYSFThYi3gy3j4Wfe3XxKNi16B8GMU0QsujB+H96CXWWjdgQskENSoXw9W4O
 ZeBWAAT8TZSOYEPKYJVJukrR054f7c1B1TtmE638GtfkDvjJmDvVfiEszgUY3n9mEk20
 F5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HVSN8ocFfJz+Vre1Og9wZ26G9xKFkclN8P+7NO0IaU=;
 b=wq8Make8MGdj80kjMVzFIGpjsCTok43vkZcVIKse0UYvWht46qi7w7wGHs/T/11J8h
 AYBmN+uFUE+2QwFQdCz8F9JdTgX/Ct5jSruhCl/qzdgwJB9i+YpdiyRw81sM2P9/4lHG
 iB2T2OeDuOrBN082Y/yj9REdS1+7NX1m8SUvCvuIr38jhPtuZ4WJDBbkIbxYE+TFdtMP
 zzODQdQqsAzPmpmpqeiHnTTbQXs1pQnp/q4DZGOt3s4U+GKamB1MDSd7JZvUjWN3vkjC
 WejWx5nUxEZa8lVoadU3m/fDKBNj7KzvbCcwmflqF2R7ZnV0yNFYtIewUSSjYnnqFSej
 ozpQ==
X-Gm-Message-State: ANoB5pnlgguNtJcOWFNu8h8RRjrmdLuxYQ3QBNwJPuUI25lI1d9LGv1E
 JSm6vUhXSAw4aXJAYsDAG0RbWA==
X-Google-Smtp-Source: AA0mqf68a0UufqDlurBIj0XPniGWTHlHEOshe9ArIGLHmolLmJ7lTEnMdeexAEnNEdpNBv7OT1LcJQ==
X-Received: by 2002:a17:906:3a59:b0:7be:e831:2b4b with SMTP id
 a25-20020a1709063a5900b007bee8312b4bmr10018458ejf.23.1670773537582; 
 Sun, 11 Dec 2022 07:45:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b007c10bb5b4b8sm2184646ejf.224.2022.12.11.07.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:45:37 -0800 (PST)
Message-ID: <85efed8b-de96-4b6a-14cf-f27783ae2c5f@linaro.org>
Date: Sun, 11 Dec 2022 16:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 04/27] target/s390x: Use tcg_constant_* in
 translate_vx.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 16:27, Richard Henderson wrote:
> In most cases, this is a simple local allocate and free
> replaced by tcg_constant_*.  In three cases, a variable
> temp was initialized with a constant value -- reorg to
> localize the constant.  In gen_acc, this fixes a leak.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate_vx.c.inc | 45 +++++++++++++----------------
>   1 file changed, 20 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


