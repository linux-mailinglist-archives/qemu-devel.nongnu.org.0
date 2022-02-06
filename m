Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B444AAD56
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 02:06:56 +0100 (CET)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGW11-0004LN-IU
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 20:06:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVsA-00020P-KV
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:57:49 -0500
Received: from [2607:f8b0:4864:20::62e] (port=33543
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVs8-000699-GM
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:57:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id k17so8444678plk.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2glsP+OmQ9Oj8YM9DMpKgu4GU/mf69xGBuWiEya3X/U=;
 b=N1WwbYS+/ohUPml8XVM+sn1xqaYKxY+sqENCfXWLbN9FCV+qNEM5l2iWbCyUqSzZFu
 xiwGz74yi4ApJN+sHDBU82T0mJ1TzwUzpQnoyJHALucYPmGvnwp0t8zwTTk8E/R7KFYw
 AOAKFsBm0M8SWMrL2Y123q8hgK9wydzafON1KCu6JYSDhaKazNszavMLPFc/GVOEVuXA
 AQ/9FRkcgTEoWWhA3SaWLbKG1XqQ7qVoRN8H8rhYS+0+wkONzJb/BUOxaxHGdB9X67PI
 TJwRWUVtwiknoNkwwoDHvc056RlZ0ulrF35h3J/M7soh77Lvw9gQU2PvliPNprfLJh0K
 zHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2glsP+OmQ9Oj8YM9DMpKgu4GU/mf69xGBuWiEya3X/U=;
 b=sY79kOPw6vYPmnwKqFASMluy3ja1dwLhqZJX6nfqxBz9mzK6ysBaVENCJYYLMfz+rK
 im+GZLFK6+fDAN2QFxfo7VqDItqoXtr0A5aRr4K0rgzYb0GqLCBJJmUVkbzhDb15oNBk
 nVJjcIU4Q4Xdg/XpPJJmNKvhzEkXw1og9uBlMnmzjjMkG6b9SFzDTNdL2AswfMWP9KeE
 AbcBRSllnZxJSIZnf5dRCWQBbRbsnxgkG4GxemGTN91AdWAMbfTUNzCv71Elgd9Z9H5E
 7LDRM2ItFyrTeLZKeLeYX8qDFaZk9EPVl0qoBceM27/soeJU499/hJM3gnjbIdb2/Dh8
 YKJQ==
X-Gm-Message-State: AOAM533cZlrD/8X5BQ3D8z979TJXooF/LUMA63fHKsB8+qITjrXdIkTA
 N1RU4H+lhUef8bgUP1o8qfjmyw==
X-Google-Smtp-Source: ABdhPJwxAolBaLFqvv4a3kgdHNEo1yWeVCxMfOEmHCVeFnwllQrQTRGm8zLswX4YSPymPNy7JePrZQ==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
 bi10mr10357060plb.164.1644109061859; 
 Sat, 05 Feb 2022 16:57:41 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id ot1sm18753074pjb.22.2022.02.05.16.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:57:41 -0800 (PST)
Message-ID: <80796e0e-ea28-9e4e-6a7f-3d77673a199b@linaro.org>
Date: Sun, 6 Feb 2022 11:57:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 04/26] .gitignore: add .gcov pattern
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204204335.1689602-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 07:43, Alex Bennée wrote:
> The gcovr tool is very messy and can leave a lot of crap in the source
> tree even when using build directories.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220124201608.604599-5-alex.bennee@linaro.org>
> ---
>   .gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index eb2553026c..9726a778b3 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -15,3 +15,4 @@ GTAGS
>   *.depend_raw
>   *.swp
>   *.patch
> +*.gcov

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

