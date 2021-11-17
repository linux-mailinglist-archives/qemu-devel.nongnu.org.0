Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B1454B72
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:55:47 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnODq-0000uv-K9
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:55:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOAp-0006NT-2E
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:52:39 -0500
Received: from [2a00:1450:4864:20::42f] (port=40903
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOAn-0002gM-9z
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:52:38 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r8so5929040wra.7
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eqs0Qj4+GHTnj15coarmRkvkcAMSye+Ymq2S9yAumyU=;
 b=PhdCgHmSoO0R+r9ZOgBm4K6fQDNPvC63680Pam93BMTLnWaqjJiMdGpIB0CHTm2oSx
 EHYnd6Octwjsb5femguR2KoMdC6G6SuAVu9osWrKWiYxhYYDRNMJUAh65cT5NwYPO8cv
 xDfrSfQgQGpwpK0a+k4Gn+9MRdCDoWIcufz4t/Q2H9SDO6+sWeAS0gH5voPHsuf6/T1e
 2rtfi8IkW7E5e1xxvT5+GG65MkwdkTt/1fzGe73Q4RSUcQZiOhNk7+7wRU7WS/JixIp0
 RFDuimcBnBX9Z39VZAuHGa2l6CldppM8PYFtB30vBwBzzQv5DOzafG1HbcbRVFRK0tvY
 cZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eqs0Qj4+GHTnj15coarmRkvkcAMSye+Ymq2S9yAumyU=;
 b=trYSd+IY08d3OukvnXh8tEWsAMDwKd1yx5Anfo43Fp9iRGgV9sxCIzQPTpNN8kux6C
 O0+iJHZvJzqyE38eV3KvkqcnkLYO6ew5uH7K8sEe3Qd+Uk42m+V0ADgitjcdcie2UooD
 llAiQoV8Sn1kocQYz5yhBjp0RUY5/3oHivGlVQBxtV9UdYwcG6j8bQgWR3OxhxZ+Holo
 GT53JonMDsqvPa8gChZYRi5xd3DdDeVbFJvrF0v9lx2QE8nBnSf2+LyihvrGhZW3ek7z
 vJd0kuv+IlKuM5uldoPW2YxSdIBWiK+olQsAqIpDVCCrUzHj/OvfgrU4Ay3il8RGnJ26
 WI+w==
X-Gm-Message-State: AOAM533tmeJvIHlkyOCyEsSNBfkAT1d0x5CjcDEmdICTgL7YfT64twkx
 Eou+EBOvLOpeLpbn7LppI3tiR2dnx6I=
X-Google-Smtp-Source: ABdhPJznmWK0RwqHi43jwR/wqNSkehwaIk5bnX0LSpzhbdJJNW2qpCFe6ONNramgEBi8jcc3nZtLRQ==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr21606728wri.141.1637167955925; 
 Wed, 17 Nov 2021 08:52:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n32sm242564wms.42.2021.11.17.08.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:52:35 -0800 (PST)
Message-ID: <6944398a-57ad-2a84-42da-f30031b290f9@amsat.org>
Date: Wed, 17 Nov 2021 17:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 15/17] linux-user: Move thunk.c from top-level
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211117160412.71563-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 17:04, Richard Henderson wrote:
> So far, linux-user is the only user of these functions.
> Clean up the build machinery by restricting it to linux-user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                   | 1 -
>  thunk.c => linux-user/thunk.c | 0
>  linux-user/meson.build        | 1 +
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename thunk.c => linux-user/thunk.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

