Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74967359D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISFb-0002Ix-5y; Thu, 19 Jan 2023 05:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFW-0002DT-7J
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:34:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFT-0002lc-Jr
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:34:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id e3so1366335wru.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=od1ORYdOyp1RsntQoDLF4XlKlrMR+p/AXJpMinewJcA=;
 b=imI2WQZhnWNiHCZX5iKkXy6rAxFIy8S7V1isVUMIsz0RLMfMm/6Vc+KIfHOhSK/8OK
 z480Il3KwYtZzLvXCDSjAY6oG9TGy8DzqbxHcDLc+gGrtWAdt5GFzb87RxUgnmBSk8Zr
 432kiW/GJqYK5QP5L1NHNNuk1pGBF1cX+wEMSmOWA6obJZnT5iugJiMetROdxB5MzqaW
 567P5em5G1ntirONWSo2zrEg0KhMDH2JNCD9lNM2YEVKXYgFZfDxn7Yp8i0ExEapYzxN
 /OoP8iKSaJ4r3nBRAe0LOHjn6c6SHtfDYBJYXD5IYopqzXmugzYei4E16pRbR/8Sla5m
 zcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=od1ORYdOyp1RsntQoDLF4XlKlrMR+p/AXJpMinewJcA=;
 b=LYvYWYumjdAiCHgzg/lChfijTGv5yt8QPbucgvCZNmOag/Vjhr3wjNkPzRaft5J+hY
 pE5gm7b+ON6sWiq3HPg6Q/XfC6BFbvXgISfTwrVJWVJ7RS5Ws0wW/5aK3imeGbD0iTzC
 ADStc4npYV3oCb8tVVcvNjbffw6MI7ySCofzLuo7E5kKsFxEJG1nrHFu7DqtldNcsKYR
 jlUNpOiSDxUQ+VTgtlWfgCCSe6IEhnxnhOqChoPg3p863zK8PPNhnvXfSjc6uE13iUDL
 UHCmh33P/Dl9Emz52Lt7dfQ4mqXW6ADkrmZKAY9/GYZ3S/SiFBfoOSXHPxcO/3xEI7IQ
 HE2A==
X-Gm-Message-State: AFqh2kqNDpVr9DqEx4pQB238ei2hDdAJV/AzZs9biNYptnJB2UU35hOI
 VS7TNJLZPwQfKnu4aC7IE6ZnFw==
X-Google-Smtp-Source: AMrXdXvQrhXZ26uo7B+0a+vqB6OPE+KUWIPeTbsuks0hVdBAt/l/5BZckaK4nOAtneNHjl//iqexLg==
X-Received: by 2002:adf:c7cb:0:b0:2bc:48b3:f6de with SMTP id
 y11-20020adfc7cb000000b002bc48b3f6demr11108372wrg.0.1674124460831; 
 Thu, 19 Jan 2023 02:34:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r10-20020adfda4a000000b0029a06f11022sm33560858wrl.112.2023.01.19.02.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:34:19 -0800 (PST)
Message-ID: <e988e602-4099-287c-7c30-507468e67457@linaro.org>
Date: Thu, 19 Jan 2023 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/19] hw/tricore: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-9-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-9-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/tricore/triboard.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


