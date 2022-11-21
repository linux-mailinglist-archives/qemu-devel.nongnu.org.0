Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D3631EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:57:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4TQ-00051x-1Y; Mon, 21 Nov 2022 05:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4TO-00051o-DB
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:56:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4TK-00059i-Om
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:56:21 -0500
Received: by mail-wr1-x430.google.com with SMTP id b12so5451999wrn.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hjTW1xISx89sPQZWFlcfpdLxC9P7d7+l0iYSmR4wlA4=;
 b=YDcvXpcEKS65/txlk5gzrgrZUg981QCpT2JsyPEuX5R3XeQHQyGMOx0rfUzZIIQgHO
 qhQLOcetVGRRMgd4Gga2F4qtNU7/+hJ+sybMtdiDGRSbVPYLLPQSyCKvH667QaLRlPGg
 LLN+O4xTJRHWB45vYCFUBzcUC1+RaHTd56PE6Xwl0bi6Gu+DQQvovv8VwqGz6gTQXP0t
 M1HPbH2SpAVPMporZJGCWlZ7cDAw98oQtmzsRyR/NHImampiLn8USpmjGK9sfN2iZw1+
 mbPiQGQ+KCIdF/BYEK+zzmBLwcjN3JZKriHOaGvHYEXY+DYDOwsCbyiQOYzjfnIt9MHL
 Zmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hjTW1xISx89sPQZWFlcfpdLxC9P7d7+l0iYSmR4wlA4=;
 b=eGSr+cjuHGh8OXt6RLD2D1fd7283w6gHfN07tvPM8Q0+Wf7wld7IDwsICjZZQGGeuX
 QXZ4hLGs29I4eEfGuTBs2qGuoRhQTd6Elwm0fJ3C2kABwDkK42CaCbMBE44alH5URR3h
 lPCrjEb3hCeee9Ji/bjLzwLocFFrlc69YBDgYTpiFEPujnUGVFUZ/0TcTMUFR5oI1AjV
 I54U1T2PTD/CveVJyB4VRhvo9KaGOu6Qzk6KFUuO9kK2eT8A3bveQ+uCjrZPhgOCgULP
 Cn5uYAO76pfieteiCBEyd9pGFgEopgOyBD2SUDNAsxCRA+n3uRXfsLVElOT5aG3CL6/R
 Atkw==
X-Gm-Message-State: ANoB5pnZf628CIXLwS0dL0ibOOSOl87KE1rJZSJZ+HrquPCQ7PUOyMJw
 UQ4mBSe9f9QqyPTsoPJnE3fKhA==
X-Google-Smtp-Source: AA0mqf5YkHPUy8Ka2pr+/HJ9LUJE7qN17lwyziEwqfTw/QIE6PleMM6cy3H6x+Re4pyB81OMbP1Y2Q==
X-Received: by 2002:a05:6000:234:b0:236:60c6:6e59 with SMTP id
 l20-20020a056000023400b0023660c66e59mr10301363wrz.102.1669028177124; 
 Mon, 21 Nov 2022 02:56:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a5d4d8e000000b0022cbf4cda62sm12910343wru.27.2022.11.21.02.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:56:16 -0800 (PST)
Message-ID: <f630dc33-6d33-8e04-209c-ba6e91cc378b@linaro.org>
Date: Mon, 21 Nov 2022 11:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 3/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 18/11/22 10:18, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/excp_helper.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

