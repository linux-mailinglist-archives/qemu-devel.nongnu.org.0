Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060C5179B4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:04:33 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle9g-0004fh-Fs
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle38-0004qV-VA
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle34-0005Lv-M2
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so494242pjf.3
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=quZ/v7DpjmlmgR3sxBSvvwx+vWdgjuXq/yOcHB0awho=;
 b=r0xzDRZ2gGoVR1kiEQ+ctgTpLHl0VGOXkFpeHjIbjAEwFWou9JhMMUWtDl1+nK0ZVV
 zWQA7jecMgvwFt30LGoQYhjBbtp+eY29Xmz9ss1FQwR5FY6Q48YtD6TUjK4jSpcyUcrL
 L+AnzcVTmJtqxuY4R9HvKJgLCiZQ1EZvDriFaBTGfKH95Ec/ZKcNuONnBr/jmYs+VQ6r
 IQxKIViFygcyiBKyV5ezgVquKNoJK6BGDVovC+LAOG75DMcBN4fTDsjtdm3BAXuLQASc
 T9R8uLpdNdNuzeVmSzEARdwigZIlddHhqGUELhQeTRVWFf+sD0SxVVMiHm78HyQtKE2R
 t56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=quZ/v7DpjmlmgR3sxBSvvwx+vWdgjuXq/yOcHB0awho=;
 b=P0SFZeGJimWSAdldId8snKhh9x/8LB+W0v73PM6KobRXtXuBo+Km6EUw4xxcJSsU1m
 MQL/8g9OXsUkDAIEsAWwvYsx1yDHhRvFqrb1qo8IQmBG35537lPiAxIuXSpjGHvIBJ4e
 rxgGuEodGZBWUwgP9qSJr4s+/TCWhQX2cz98NOYxe0R/YhIZiGMvKQRp9Bol6fxRP+PO
 44BUBQdA07dF/LF9nF7xCrJ6vqcboFd0AvGXkquPTT1e8D6nPJLkuJ2nAFOhroivUQCp
 cKep8Sm7rX+4yvLb+3YA2WWudzAMC7QCCnnu0Z87hbr/NgSaaBCVJ7/5Yq0UyvwgSsBR
 qisA==
X-Gm-Message-State: AOAM533d2kWRnWW5DaqAu9B+/3FcloGKSC3AIRLD42pDuLbVjnFxySaP
 ScoC88WPsJj0ot344w8a1yQWKQ==
X-Google-Smtp-Source: ABdhPJyzI8uBhh6icguO4e+II6jqN4DBIM2qd6RpsReXcOu7xSdBfEtkS1WFzScTPJ9wNufJFhD/ig==
X-Received: by 2002:a17:902:c2d5:b0:15a:2804:259b with SMTP id
 c21-20020a170902c2d500b0015a2804259bmr13514598pla.97.1651528661276; 
 Mon, 02 May 2022 14:57:41 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a63470e000000b003c14af5061esm11468667pga.54.2022.05.02.14.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:40 -0700 (PDT)
Message-ID: <3728be5b-8c1a-0ca1-0943-2c3bfa9cb2e3@linaro.org>
Date: Mon, 2 May 2022 14:57:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 04/21] target/ppc: Remove msr_le macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-5-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-5-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_le macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> 
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

