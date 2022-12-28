Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006B6586A8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 21:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAcvM-0005kQ-HS; Wed, 28 Dec 2022 15:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAcvG-0005iD-SR
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 15:21:10 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAcvB-0001ea-O7
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 15:21:10 -0500
Received: by mail-ej1-x62f.google.com with SMTP id t17so40662568eju.1
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 12:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKDjRCd00nSibsOSpbrf1WqYx/H5OYADSeyyHSiGTB0=;
 b=xk65EChAXPlCHafGNnpz8rnNqdIRaabn3DfdDrMZ7/YZrpYhM8mC2fSJjhPGKM/UXv
 eg2njxDiJY83IGqaXwrDvug5aY2KGeSEUF9JZa7uQfB0zuMahUUlz3phw70vxQoC1cf/
 wFo6wKbaLeiJgD2WhSjgQiDjGZ9RjOQaWtFtFkXut9nS8rB85Thb5czMiiDC/bfJpgVi
 ZPLoFdNZeaNbfpY8zvtdMBm95d5MKUFar/2wRAO4KoIwI/XZtPIRYXivTSGgcEWJbB/9
 WfJril05ylohPzY8PDHCtz+uscc1waFhUPxvYmAepOMo10YgVVtT758Zo4EYlK9vc6yr
 nYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKDjRCd00nSibsOSpbrf1WqYx/H5OYADSeyyHSiGTB0=;
 b=HrwqdqG6RhmdfEefXp+M8yJl/CMzDsZ2QYH6WvT0cTw2pW8lu9183YMW8elYcX0qOp
 5Mn3KbUkn3C3un+WgK7UX0U2LPx2EfoiQKDLmMYc5HgBeAQHhD+XK2S8mjmxh7hkybw2
 YdYNKfslXpG1uBL4x5SlEeWcdghNJcphhNQmMEur6w/+241fUmFvfMBh7d5NHZ2mthXU
 BMkAC9NJQoubYTLagZeBk62f+wWCs81D322jQ+WXm/2M5FBu1FzZWMAsXIqKiO81KGro
 I9tdvbsTQPLPkkQJd7vj9uqClwJytC92GuwFXKD6+YKFsFmH28lWAnAj3qP8ndlDDB8n
 I6Ew==
X-Gm-Message-State: AFqh2kr/VVThgJ3fB8qOgxbBL+20gZ9GUYc8yJ/8X3qJNKYhsWMn6sOm
 dC9Oae8lhU+QIyYyigwQ7ggHCIaXty0v85/7
X-Google-Smtp-Source: AMrXdXs118fHSQ/ggAHrItSccPzFEDzr0xlGw1u+RjNicET+NjI0yJNGCAI3Pw3b38RQomHF6ktAmw==
X-Received: by 2002:a17:906:958:b0:7c0:be4d:46d6 with SMTP id
 j24-20020a170906095800b007c0be4d46d6mr20023434ejd.59.1672258863647; 
 Wed, 28 Dec 2022 12:21:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a1709066a9b00b0077a1dd3e7b7sm7824288ejr.102.2022.12.28.12.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 12:21:02 -0800 (PST)
Message-ID: <2a07105f-249d-5842-ae5c-a52be6b0dae6@linaro.org>
Date: Wed, 28 Dec 2022 21:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] linux-user/syscall: Endian-swap [res]uid/gid
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Zach van Rijn <me@zv.io>
References: <20221228153553.83773-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228153553.83773-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 28/12/22 16:35, Philippe Mathieu-Daudé wrote:
> Various syscalls miss swapping the endiannes of the [res]uid/gid
> values. Use the tswapid() helper meant to do exactly that.
> 
> Fixes: b03c60f351 ("more syscalls")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394

This is not the correct fix, simply an API cleanup.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/syscall.c | 55 ++++++++++++++++++++++++--------------------
>   1 file changed, 30 insertions(+), 25 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1f8c10f8ef..2aa19e33ca 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c

>   #ifdef TARGET_NR_getuid
>       case TARGET_NR_getuid:
> -        return get_errno(high2lowuid(getuid()));
> +        return get_errno(tswapid(high2lowuid(getuid())));
>   #endif


