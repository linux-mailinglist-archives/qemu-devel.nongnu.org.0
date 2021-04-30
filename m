Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3836FEC0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:39:36 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWAx-0003J0-Dd
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcW03-0004cG-A4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:28:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcW01-0005Um-Ov
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:28:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so1998611wmq.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N/iCpIloddZcmo7M81/SYtO+doA5SALtCG6/F42TUjs=;
 b=QkKC7K+kcJK3DqId/tYMa8U5Lii1Q1kAIE5Z58SH29Aoav02kOZJcGRVmVm8G7VyJ4
 s91FJB8XYyRr4v9tL5PfwWNVexDIA9Gx2OkI+JCzViOQsTXAMrLwNcf4luyWTalxhqxy
 yvETrY6taZlLT679XqsenBKkDe+Q/4+M8iMthMTmkQ5k2102Jv6o5B7oVoi0VEa0QoOe
 TzM/fwZZ9SslyGl11GZkMCsahuMEzr6nGLww9lIG3PMGTjW23i8EOnhexVHHYKlb9YmB
 Eo7Sw5nLL2DxznvmOatisRp9qaR/WvmPNRVLT27FWrNiaWrqrMd2Sk74MoNVtmRtelCV
 eWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/iCpIloddZcmo7M81/SYtO+doA5SALtCG6/F42TUjs=;
 b=PvvML2RdvoyjkBr8g46MhAEdQi6uAfJitlu1iI41rieoV5wvWqnwWI6LeX0B+uP8qO
 wlV1lYgofaWy9cxhlq0elgU5gCSYUo+pLMrhtkgIaRzQ7h2cCkY87MCGJ2AMc7C++rLk
 Tr40TtEtaUzDCd2kuLJiXui/DTH9YVftWBL0z5BOKece6if6xwcOJ8v5to8M1hX7qLC9
 rblo4Itc37krpOdWfJoPtd6H9okdTC9/36GgQ2lFT/f7Isu3aslY5ka1Hjfgsx0TePiF
 ZvlJ3PjoEyJGwo4K4JQt1nt3gfqpHVW4fj7SZrs8Gs4MUhevrCr9bGuGvFrMrOrmuYaS
 iF2g==
X-Gm-Message-State: AOAM530520fISnjjIp35A6XAXen8mULg1EkokBWnzRGdvZ45YMak5XaY
 q2+XHdZrP7BQq85Ej9M82aDxYatmsDvZ+L76
X-Google-Smtp-Source: ABdhPJyk6qnwyVj9XWAkZBZz6PEg/48wUKDKD7FFSOHTm4BvUKi2etVhlB8M03G6mg996Ga8aJ8UCw==
X-Received: by 2002:a1c:1f4f:: with SMTP id f76mr7057670wmf.14.1619800095216; 
 Fri, 30 Apr 2021 09:28:15 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x8sm2756820wrs.25.2021.04.30.09.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 09:28:14 -0700 (PDT)
Subject: Re: [PATCH v2 11/13] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210430132740.10391-1-peter.maydell@linaro.org>
 <20210430132740.10391-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5900ea67-02ec-9646-bf40-20786e15bd8c@amsat.org>
Date: Fri, 30 Apr 2021 18:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430132740.10391-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:27 PM, Peter Maydell wrote:
> Move the NeonGenThreeOpEnvFn typedef to translate.h together
> with the other similar typedefs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 2 ++
>  target/arm/translate.c | 3 ---
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

