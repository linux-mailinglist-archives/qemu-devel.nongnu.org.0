Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC64A7EAB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:28:13 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTjA-00035t-1e
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTfa-0007Ge-HC
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:24:30 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55271
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTfY-0001vv-TL
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:24:30 -0500
Received: by mail-pj1-x102a.google.com with SMTP id r59so1294068pjg.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J3WWggaqs2cslW7md4LjRz2oJZ3NxXGp9dbfD5rxGAs=;
 b=Yl7dIeQzyS9rlV3YVbBmfDtD9St28iS2JcoeNhO9u8uBa+wAb03c3UV2YmcXnwLIrf
 +sCEp/Z1b7RlHEdRC53U/2ABcRQ3jZGVZQYUB0pOM7v4hc9FhT4PPHw4XPTzHxkXt6Km
 7C2fdyDVHlpUNNebSH7Mdiq8GN+NWS7E1JWH/x70IoPue789soDUBfcR5LkyZU1io7LZ
 EGTQwCCxFfrh3MKE/ff0uyqKP1/UoSLP4OOQj2n4eNJPPUzyT4rNvZeeek+79KA0zMv0
 YiKN2YWPsdS7u/AO6Kz/OMEf19RycnRebYvXzW9C5du1JGpE8SsgRZjQUDNSaowqro/h
 Pi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J3WWggaqs2cslW7md4LjRz2oJZ3NxXGp9dbfD5rxGAs=;
 b=AUT0+wTvayWvAThlx4JBjV9TIAP73Y0VoIcQoSoQ9aAsSyCOut0O4nPc9Pxz9vM4TZ
 i5bwK4ogqgLtZG/Ma4DpLYXM/Yk3NuSWBmYaJgAyPK2ZVE5kn2ZJfbcqqXzCDdpioK2b
 9U8d1xqQGZ5vnNcSvNcXyckQGWEoCl1ipwQvQuJD9cCoSJeg43vlxNvVWLVSlBM5lw4K
 1mJfmivb96h1VuE6BwzSyv4z3FpnN6rhkfUyGhBSchM+NEXi3AM0HvegaCH+Uc24u0AV
 C52eeAN3rtp+QXfyjd6DrO8Rg/SHLW0X5fc5Afh8Ai3sGDZnEhBFVeINcNBMh7N4jE+1
 8UWA==
X-Gm-Message-State: AOAM5308A/fNOqXGT5wq2WGDzq/+Jduk2jaA39RWTJPg8wJofsHu/G/7
 LRhf2lIa5KJNteoU92bslBMxpg==
X-Google-Smtp-Source: ABdhPJzI5WkUewWYvBH3G0q7MlyXq++VVVWRuLEEOc+mjiMvXO0BrrzrravyoWQcpa1H2KarIywvpQ==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr11963410pjb.213.1643862267427; 
 Wed, 02 Feb 2022 20:24:27 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id ne23sm4643630pjb.57.2022.02.02.20.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:24:27 -0800 (PST)
Message-ID: <221f3e4b-20f9-a8cd-5999-038f8e68ab1c@linaro.org>
Date: Thu, 3 Feb 2022 15:24:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/13] hw/intc/arm_gicv3_its: In MAPC with V=0, don't
 check rdbase field
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> In the MAPC command, if V=0 this is a request to delete a collection
> table entry and the rdbase field of the command packet will not be
> used.  In particular, the specification says that the "UNPREDICTABLE
> if rdbase is not valid" only applies for V=1.
> 
> We were doing a check-and-log-guest-error on rdbase regardless of
> whether the V bit was set, and also (harmlessly but confusingly)
> storing the contents of the rdbase field into the updated collection
> table entry.  Update the code so that if V=0 we don't check or use
> the rdbase field value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

