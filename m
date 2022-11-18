Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98D362EEAD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwBU-0000ly-0A; Fri, 18 Nov 2022 02:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwBF-0000lE-Pv
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:52:57 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwBD-0001Jh-0o
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:52:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id i12so4126113wrb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7wtJkMXwY11wWgo57vbBxBhrCl6IGxZeUnf7ZAsaRts=;
 b=HC3AJPRgTlZYNZomR97pjryTc6ZFPXf9ki/0vxSqPQZZl3PLrvrDaSA+/9F8LW0DiY
 WCKGjGfKe/AiknwB/eQA/t23yWY6f2mCGRK2tjUsfsntlNJEZ56TDEPK2SVUC7N3Il+s
 6g4lT/4xSdciJPASRR5b9A3ER4Qn80BO9MRVMqrTiciX2JZrBq58sOte15alt/68Tm2e
 akVBSxUfvF65i9+AAT3cmgLN09dQh6L3C8vRy7xQWzWDkP9JG5rWyMb8SJb3uBjzofEY
 VaSgkOcKIEmWFi51iDFrN/MVsMQ6FuiEuGhyNBcx9HhW0sJqX55Vv6E5NecHlMh0pJTh
 uZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7wtJkMXwY11wWgo57vbBxBhrCl6IGxZeUnf7ZAsaRts=;
 b=TBoaWfxPlwogVgYo1idVwPHTC0Fyxdzd8LvXQjs1NIrIo8PK4WJYwnprB40My5gPgu
 2Heo9wiwUiDKNc55MaBlrA6UWxo15sNGm0KIPS/eUAd3v4fCAhqRFTfkXDQdt23lF17R
 FzSynx/zjtXHgDSMIxQToZrxFsl3hb/0afc30ViukF9rManc5dcLNHHsndlt1xXunSUn
 rGEh5jMiD/A0k6PYh9107IO49nfylcoMPVSv9b41ItClYo0WQD+6Nx//QKyBtYPF3xxt
 v+qK5MYGYMbqqCb4HjTK6dhXuTwmy5FV3qBxaJN58FbP/c77AnBp5P3xnxfrmy4K14cG
 O7Gg==
X-Gm-Message-State: ANoB5pnE67wTiIg7YuJfNTU6T1WRLCmSjyH8P5KOqLqF5H845S9ImZVf
 93wSnWbbcuIJrSAfBg+2pmWL3nSP2DqrnQ==
X-Google-Smtp-Source: AA0mqf5H6HNxkrXSS/qz971yTbKTairG5RgW2+wlIzpgdWLwbLQWgtHLyvQeqGSDjvvlHSB3rwHKoQ==
X-Received: by 2002:a5d:4538:0:b0:236:5270:8f17 with SMTP id
 j24-20020a5d4538000000b0023652708f17mr3774469wra.358.1668757971587; 
 Thu, 17 Nov 2022 23:52:51 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b00241b2b23cd5sm3486617wrr.54.2022.11.17.23.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:52:51 -0800 (PST)
Message-ID: <bd283273-a07f-99f1-e1a3-1cf33a734824@linaro.org>
Date: Fri, 18 Nov 2022 08:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 05/13] docs/devel: make language a little less code
 centric
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 17/11/22 18:25, Alex Bennée wrote:
> We welcome all sorts of patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20221111145529.4020801-7-alex.bennee@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index fec33ce148..9c7c4331f3 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -3,11 +3,11 @@
>   Submitting a Patch
>   ==================
>   
> -QEMU welcomes contributions of code (either fixing bugs or adding new
> -functionality). However, we get a lot of patches, and so we have some
> -guidelines about submitting patches. If you follow these, you'll help
> -make our task of code review easier and your patch is likely to be
> -committed faster.
> +QEMU welcomes contributions to fix bugs, add functionality or improve
> +the documentation. However, we get a lot of patches, and so we have
> +some guidelines about submitting them. If you follow these, you'll
> +help make our task of code review easier and your patch is likely to
> +be committed faster.

Less code centric:

"... you'll help make our task of contribution review easier and your 
change is likely to be accepted and committed faster."

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


