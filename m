Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4069DDCA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPpD-0000bE-NN; Tue, 21 Feb 2023 05:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPp8-0000ZV-BT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:24:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPp5-0004vB-8k
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:24:37 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l25so3430840wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v8i8QQljQecasVKuxYPb9UacN7dAEu3AdsS3s/D4Bfk=;
 b=I4Qej5MyypF9ENzZNiMrugjV0uOgjeppetRh8ZTQEJOi1Uj5Mn00K/U38lOkFV883p
 f/t+RPxV0FJIq0LyRhwjPlTh9aYOJP6y6jepnzCxUkf8mgAKXGqKJeh5lio7rwl0+ovH
 curW7nJ56x9KZmp8nv+IV0cDi0zEOFNJvLwfUu2S4y1Ju/E7dsoMrgSmj4FezvZhRA2m
 s5FYPGLjIdeyz8xANmQblRc6xJWYHapj9YpdSTulaEZCe9IHrevkMhTuqxOtrP3Tqlbb
 4WBcBbzKVxtsyCUdZOHKaH2X1yZDXx/JdF4MYNVbtRmN3b4iw34cO/ytg6/3B7IY+YnD
 RtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v8i8QQljQecasVKuxYPb9UacN7dAEu3AdsS3s/D4Bfk=;
 b=zwZMuhUA5G56/+qKko5Lyt++WJRvpGlxHkfCRckDD62ne+mtiZgt+P9rdulZJD7R9d
 QU52IATKpGIES7l3lnIFsjGOrMRag3MItJ6x1eT3QhioO0ifaedAFTy9BdeW7iN55aDl
 VIeAQQ/CprHyeh5PJCtgZ4ZLsIla1nfeqHMN48XTDq2fU3utQdfpYCwsddFLXAxSPapC
 Tlt+vKqQe/3U+0O0SCq+/hUDHPjIWTABLnpIBDsP+Uy1NhJC2NE0zxr7U4mtdTOLnMVS
 i0Fz/I0BZpSw8zI2m9gkvZRPgoaewhDzACZOz4r0VpMubz5nHHei+y1SUfVFvb55fNIE
 S3wA==
X-Gm-Message-State: AO0yUKUVlvPxWCMrOXs7XgFvICTzDzRhJsZ6X9s2hQjjCm2NkOUyYVXP
 FjhVBXLCgx6dYJx2xH6eK3WfkA==
X-Google-Smtp-Source: AK7set8snQ4rlBOds5MbPYeFlidzFOZWF9+B3gac8OneZH2wHn97Lh3dGDH3KGEvyRMJXkQAeJrUYg==
X-Received: by 2002:a5d:6888:0:b0:2c6:ee7a:ed21 with SMTP id
 h8-20020a5d6888000000b002c6ee7aed21mr3876029wru.41.1676975067403; 
 Tue, 21 Feb 2023 02:24:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c550eb062fsm2814170wrt.14.2023.02.21.02.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:24:26 -0800 (PST)
Message-ID: <193a285a-f0da-1118-6ab7-29cd4472eb48@linaro.org>
Date: Tue, 21 Feb 2023 11:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] qga/vss-win32: fix warning for clang++-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-4-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220111215.27471-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 12:12, Pierrick Bouvier wrote:
> Reported when compiling with clang-windows-arm64.
> 
> ../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
>      return hr;
>             ^~
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   qga/vss-win32/install.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index b57508fbe0..b8087e5baa 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -518,7 +518,7 @@ namespace _com_util
>   /* Stop QGA VSS provider service using Winsvc API  */
>   STDAPI StopService(void)
>   {
> -    HRESULT hr;
> +    HRESULT hr = S_OK;
>       SC_HANDLE manager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
>       SC_HANDLE service = NULL;
>   

Fixes: 917ebcb170 ("qga-win: Fix QGA VSS Provider service stop failure")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

