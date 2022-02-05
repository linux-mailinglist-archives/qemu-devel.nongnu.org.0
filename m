Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE754AAD10
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:34:46 +0100 (CET)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUZo-0007bx-BJ
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUX3-000524-8j
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:31:53 -0500
Received: from [2607:f8b0:4864:20::629] (port=38751
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUX0-0003Jb-Ct
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:31:52 -0500
Received: by mail-pl1-x629.google.com with SMTP id c3so8314712pls.5
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RYO4+CnSXdnAGaWdpgf/hDFa4VPxBizfDN/xRMv4+OA=;
 b=ScyYs48ujzZgE1xYk0QZ284n7dgUsPm3iiWzuPzvLPfNELF0eEWxg37bA5J0ylH+YN
 txQgoZtdb035jJewUnwwpGq3FFfSDQlHQQvgqJCkTw3gJEWneMpZgGSg4yMZiDl/HxsS
 dBfl1J3Sso2yVcTHXSjHQFdCGMwoF1x3EST5LUGge54ExKWJ1WHHArTi3fmdVxpGvnUq
 BwFoXeFnWUvFVw1LiEprtdZcZJdUQlBVWOf7X6sUMkLTCocy4BQ2BwwFL6xsS35lxVV1
 51+UAAZQSRMnPk/DsiVWgQAo0ORFuUIQ+mIDZLnrnBLYCF78yAQ6tNLBbxmQnOKy7r2k
 GGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RYO4+CnSXdnAGaWdpgf/hDFa4VPxBizfDN/xRMv4+OA=;
 b=PrYfKdfZOD3NcFfdF1zGTzTfFmmLeAah+aKH4j2n22Z7uLQ+krbMvCw5jwXhfx5sNy
 3MFvTDTdMvlH/D8yRasW5regHiYIav5ONBtmV8fL2an+0g9IXee/U/WT5fE3U9z7Mozi
 neKdfrCwc0GZdzZH2R2IDln1noPQGifTRWLb10HQVSDUBAlIoSOI+iJA2EHOfZEFZ8c7
 93ZKYS83EDYvp5uDGqoJdAGg1ZMA1qAYwgMCxFdJkZpJ2u/jXBA7c5LFFWCfZLOwPXSH
 QGHWicEW8gakVcu3G5KBjvZsGHexqzF4vcFCnywMpC/LfUuFHPYw4jk56i8GWw5fNBdN
 /lMw==
X-Gm-Message-State: AOAM5326jppbS1iu6T2BENIjDyYFZ2ma2ZnXNBdZrpO2EmlppMjqztiK
 9dwCc7CYOvZhRrrIKquERIKqUA==
X-Google-Smtp-Source: ABdhPJx7gdy8Nfo5uDgiRhrH1eO6BikvK5Se2/u5j+9/Nms+KyJr5Ct72O7YzPu1dIkWfRu1kdc/Ug==
X-Received: by 2002:a17:903:249:: with SMTP id
 j9mr10040779plh.145.1644103908325; 
 Sat, 05 Feb 2022 15:31:48 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id pf4sm19136342pjb.35.2022.02.05.15.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:31:48 -0800 (PST)
Message-ID: <245795ac-d28f-6db0-59f6-f5e6984a0470@linaro.org>
Date: Sun, 6 Feb 2022 10:31:43 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 19/21] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-20-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> cpu_address_space_init() and cpu_reloading_memory_map() are
> target-agnostic, but are declared in "exec/exec-all.h" which
> contains target-specific declarations. Any target-agnostic
> source including "exec/exec-all.h" becomes target-specific and
> we have to compile it N times for the N targets built.  In order
> to avoid that, move the declarations to "exec/cpu-common.h" which
> only contains target-agnostic declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/cpu-common.h | 23 +++++++++++++++++++++++
>   include/exec/exec-all.h   | 25 -------------------------
>   2 files changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

