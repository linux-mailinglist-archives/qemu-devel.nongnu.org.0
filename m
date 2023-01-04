Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DBD65DCE8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9Z7-0004mm-61; Wed, 04 Jan 2023 14:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD9Z5-0004mE-Uz
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:36:43 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD9Z3-00015J-7O
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:36:43 -0500
Received: by mail-ej1-x631.google.com with SMTP id vm8so78205282ejc.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 11:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFR7xn7/gWUDLuQiXkEPkHcmTfSnkrZsVCniVDoY85g=;
 b=oDwmtoUbWtwgB2AYKuNvien+ULSJpeUiTutojW/nJahOSaf/UeP3C8ZXy7sKWDt5VJ
 +E28dywiyC1W7HLC/YV8kN8Ft9/5wFceSN4StGJ1GSyZCFx3ZJw9qHYJkiL7nbHHnQr7
 9xjijWjbkKmuwW/aToyiTo3L0B4PaG3RN+KIn5ke8rLafjq+tICgduczWDMDu0xgKnGp
 dsMPS/3fFtEK5ftrpBFdq0tF20h8xTy3iYeX+a598iHM9U8+Lu0zQVDmSJQFkOFgzfSd
 N8+uEmeL+NEcJOmQInMzu/YuwwK6lBuwDBZeUGjt3QN4HQxQqM2j7AwIojyKm7qUHBRp
 upVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFR7xn7/gWUDLuQiXkEPkHcmTfSnkrZsVCniVDoY85g=;
 b=1szwBlylhIT38LJ1S/S3hjMYrGkagmueMMayMe0/3vG7euXTNa4zxlOimQCwR0IosP
 QFFYpN26D1KYpOmIZ3Vhob70edSZZdBUvY28eUIBcTUls8bMDrtypI1gYRkjlFYhef0a
 d7msyE135Mvphg59ej49KXyH04UtkAtJUYsxdD7JtyNWQSYceZ77S06JHY/7DZYb/psd
 BXUgBibRxB1UlIOKBBn70c+gADszsgeJ3uoyk3xBJdDrCEpoeq1NGFOrdtBzjR7IYK/r
 Qgbhe6Oi0AWfpksjGxuh0TDlh0kQ/7EJShqsAuLq2PO654GUezSOvENNwn0sZxzjSAvo
 Yg6w==
X-Gm-Message-State: AFqh2kpy4NinIlF+zBG+5hcteAFjkLw54ceDXMQMBuD80dfIq/Jiyi36
 v5lzo385TOqaTUlK7KzgP0BerA==
X-Google-Smtp-Source: AMrXdXu5ccocihIWTAJirpuEXx5ithExDbgSGTxCn8ZuY23a/UlnM/57ci7551Q1nixJLfIqidGFCA==
X-Received: by 2002:a17:906:c2cb:b0:842:32e9:f1e9 with SMTP id
 ch11-20020a170906c2cb00b0084232e9f1e9mr35522322ejb.69.1672860996586; 
 Wed, 04 Jan 2023 11:36:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056402139300b004642b35f89esm15212440edv.9.2023.01.04.11.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 11:36:36 -0800 (PST)
Message-ID: <a3f06abf-641a-10ac-7f93-4e9c2d0b1cd0@linaro.org>
Date: Wed, 4 Jan 2023 20:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Fix sve_probe_page
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, idan.horowitz@gmail.com, qemu-stable@nongnu.org
References: <20230104190056.305143-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104190056.305143-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 20:00, Richard Henderson wrote:
> Don't dereference CPUTLBEntryFull until we verify that
> the page is valid.  Move the other user-only info field
> updates after the valid check to match.

Easy one :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/sve_helper.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

