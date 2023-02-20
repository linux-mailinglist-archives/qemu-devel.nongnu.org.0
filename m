Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8DB69D41B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBsD-0001zF-TA; Mon, 20 Feb 2023 14:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBro-0001uB-Fo
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:30:31 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBrm-0005t1-Bh
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:30:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id c5so2964732wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+gJxp+dHV0y2DL2TEGVlJYcKQ6kGWQofcnFnzdVVKw=;
 b=kEiF4jRJ2rSmpeJh3hPIIb5tKA+aqHPaeKSbmp3nx9atpg0c5uK1W3evXdlkDTb1d3
 tVjbKfD0cDWLN6VY3s/5bwEs03pUqjiha/FajUYEGHe/oNo07S18FkbG9h5+vIagpI2I
 eMjrWkpNRj4YXp55eWAWxRB4xkfnEFTNKLiAJaSzBxDutE38Dwm83CDm1m5mq3feFAoi
 uJ4rhlNT/LZrefJPbr1vVmkx2Kh0zJyXOLemkFZMWzh27ZQiDe2xQLecxyGyFj6seZAW
 zZw9cocpZPns4QnpqKbYlz7lPXb118mr/sdJ0h8HZNZwNJ7OY0ZmGSm7HTFEgIC/WYZq
 nM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+gJxp+dHV0y2DL2TEGVlJYcKQ6kGWQofcnFnzdVVKw=;
 b=yCJsf2t6sA7qv/AteDbrChxqdjcucdfwFt8EEYIQZtpuD/yf55lngcfGq2u7W5d+Jy
 8ytt7Ol9jeULCB2w7XQHYUdlZiK18/b9SSFUtx2EAL60CU6DBF3C5wL85c9lr14Vgqu9
 /QvL58+0qaj3xuDtSxCmp3xJ31zC7cDZqCAIP30Jqmy+cbGkiRdlwPox1FLsSmpQI4Hk
 lkmb+Vbzp6XoRaZny8KrEh21N42GjHT5Nj5WRJkbtsdTQfbBhbh/HqYmrRe9pf6JKrJh
 5milpKEzpVY/HWP2UyLO9XD4LD4jtZVUHsV04o0pvUHLemCT2IpK0RpUy38Y0gPcM3q0
 5k9g==
X-Gm-Message-State: AO0yUKXO9WkAfBuCXoxAGdNL05whjZm14G/0zBVcaXq3qh16I2f0JnYw
 Uqgqrmo+Es4k4EJwf1IYOogISQ==
X-Google-Smtp-Source: AK7set98f2Ro2VdqiinPvklc4G1Ek4ySp7Q6Klyba+KwazkInKHk5RylE/ocOy0NRHWkFMHTdVpAnQ==
X-Received: by 2002:a5d:4acb:0:b0:2c5:9a0d:709f with SMTP id
 y11-20020a5d4acb000000b002c59a0d709fmr2772304wrs.15.1676921424506; 
 Mon, 20 Feb 2023 11:30:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d698b000000b002c5a1bd5280sm3439309wru.95.2023.02.20.11.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:30:24 -0800 (PST)
Message-ID: <7d1224f9-d83a-59f6-8577-f942e399502c@linaro.org>
Date: Mon, 20 Feb 2023 20:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] qga/vss-win32: fix warning for clang++-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Basil Salman <bsalman@redhat.com>
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-4-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216134911.6803-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 16/2/23 14:49, Pierrick Bouvier wrote:
> Reported when compiling with clang-windows-arm64.
> 
> ../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
>      return hr;
>             ^~

Fixes: 917ebcb170 ("qga-win: Fix QGA VSS Provider service stop failure")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(please also carry the 'Fixes:' tags when respining patches)

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


