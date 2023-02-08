Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE468F487
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoFm-0007Vw-Om; Wed, 08 Feb 2023 12:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPoFd-0007VU-Kc
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:28:58 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPoFc-0002sy-2c
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:28:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id bu23so1677135wrb.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpCCesdT484WGCj1oZUtX5vQDSJuAuDtxZk+S6MEt+c=;
 b=qk7244kGfVo9eiv4rzmMyJE8FqY7USQZ0RY4ZLdzKirips5PqP7P3GaDqO15+MUFgV
 qUQCkUv8HNvb0MRa3Y+3KIv+2CWGfHvnEOTt8jIV/Q7Htdi7LF/dMl3LWbKqY6apW8yU
 dBDQdUcEsohnL9iAS5XOBWjtBBSKpwJNMwrSD6qkLKBXou93zMDhjR2D2zpjEwngdtDb
 qONMatzdRRwE6aa2zVGcf+2T7fhQ9hj8HsBBGFh5O4B0yIhtnzis7JgvHjq4b/YBXKsX
 Zi7EAtLgy7njFSvbxxFr8i5i1X5fQFbnLbuTCJ7772P86vLygD3LiHPWMaFA/WgGOszX
 ltIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpCCesdT484WGCj1oZUtX5vQDSJuAuDtxZk+S6MEt+c=;
 b=kIhwVk2eNCPhR1Rt+Zs5NFadOJceWg4T2fjYaxFOmUgg/enrVB9E67UB8vTAOV9T00
 rXbt5lFvlv+hHUxvPBiVHtm7OjdAXRvjjYgVJ1dRnPBvuFpmGP1UQmpM/NxXmPHx3fmO
 7yIn2J5BrCM480z1adgn5UvGGLypqnmu7OdydOXIoj5QvEwq8i9s52Ee0UnCa4s5cPSP
 UWEjsbHJKCFea4ZfgegDIhGg1vffgHn2pk2yoX1FX2+mvxk6/1gPeeeE1LqRWJ6faz1C
 J1AmSA7ER2bDhmRzcYT68FtT+MXKRTIzLJDwMybv9X5JOBDXOUhHh7Rf4H7+kj6LgJ3Y
 CsqA==
X-Gm-Message-State: AO0yUKW4gcqXQb1fp2BTgQp4Wc7uYdhGmpKKN+DpaW2jzORyRMmi1+XJ
 wf44/zmKbaeAu6LQvyhAzZo74w==
X-Google-Smtp-Source: AK7set8ZHo+27br9PX5e96CzjTM6Vi7rqp+fpdoTF71SNuxI/e+xr1BG/VHqnbi2poPSNpUf5JqfeA==
X-Received: by 2002:a5d:4571:0:b0:2bf:b4ca:6bac with SMTP id
 a17-20020a5d4571000000b002bfb4ca6bacmr8983264wrc.59.1675877334313; 
 Wed, 08 Feb 2023 09:28:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b002c3e9cce04csm7638387wrt.111.2023.02.08.09.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 09:28:54 -0800 (PST)
Message-ID: <bacfa515-cf8d-cfd1-9672-bf9357706a8e@linaro.org>
Date: Wed, 8 Feb 2023 18:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/hexagon: Access `pkt/insn` through `ctx`
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com
References: <20230208165034.21510-1-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208165034.21510-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 17:50, Anton Johansson via wrote:
> In code emitted by idef-parser, access insn and pkt through DisasContext
> instead of explicitly taking them as arguments.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/hexagon/gen_tcg_funcs.py             |  2 +-
>   target/hexagon/idef-parser/parser-helpers.c | 13 ++++++-------
>   2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


