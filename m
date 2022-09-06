Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C265AED74
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:38:00 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZiB-00070E-9D
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZdq-0000a7-Nt; Tue, 06 Sep 2022 10:33:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZdp-00045m-61; Tue, 06 Sep 2022 10:33:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso2375557pjq.1; 
 Tue, 06 Sep 2022 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ybIwzqan1hXD1AMgQfivTigOVBhx2yh+I432NRkL7QY=;
 b=ZU2dSfhURst7JuLTZp+cf6S0BhyH7PDMVESqlfRSYcwhTUOqBTL1E0IZjesLnj+Vz/
 kwwyTxfRI0x17S7wEXOx84SmFO4BMZLZgDIFBLiUmxD1SRLIwgRsoHkoONoPcu/Ved3g
 3InrmctQv9BmQhXO7EWRy9Zw1aFB78maN+2/5PEbeupf3eA/cwo7NFazcixCZwzzW76i
 sAsekc6EpN6I1I33TDQ3gd3ztDkvbaVl/uorSx6hquT0RzIidqrCQkkKzsY8QC70rqkI
 F+OgxKwH2c/Zx7sqtH5WZZMt3wE5Gz1hRw4+t0K5Sy8h4A8qCU4Tu7hFLiczz5xKl+na
 yjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ybIwzqan1hXD1AMgQfivTigOVBhx2yh+I432NRkL7QY=;
 b=fh2sXzNXMFVu4cuTp1T7wIRoslNkwiVwEBrqQ+jjZoQOg9YEQrO3jsPL0s/kAIS6H4
 h43MhXcY/+gSUwTXbzZmKPfA7xLq5pcF1COa4HqyGVuyvnEMndiiQ+QGsnwcTLcEzBF3
 3S764epbbYpXueesM9ELpYywm1ERjk/KT11ady25pWLhBQbVAh7M81xDpNwNQk+zPM5z
 ramfxT162/diutZXEWE6hSDQ2xPjme0G3mNbKYjIgMoy2fN1xU8/yQQVxmqSj4xCVdxg
 rPVlLcGAYhneUogt/USCE4OCDAVkVuAkRAklh3NKabEJ+06+s/rAIxUaqXmUySwAQn/6
 yR2A==
X-Gm-Message-State: ACgBeo0+Ko3xI4d5uBZTkAppmNwwO99hbIkzFlmRakrMTypDKqcr+BFs
 hiSBvDCb/i2y4t7cBKnPk08=
X-Google-Smtp-Source: AA6agR64M64UdjJr7asywKI8B9HeoHTMlMsTkQ/Hkoo6DZPK7cRJGQkbLC8fh8ILvmJSmy2Mf02poQ==
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr24673682pjb.220.1662474807466; 
 Tue, 06 Sep 2022 07:33:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090aa58800b0020063e7d63asm4262488pjq.30.2022.09.06.07.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:33:27 -0700 (PDT)
Message-ID: <fe7aa078-89b6-0565-1f03-22f5662fe1a5@amsat.org>
Date: Tue, 6 Sep 2022 16:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 25/26] tcg: Introduce tcg_temp_is_normal_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220906101747.344559-1-richard.henderson@linaro.org>
 <20220906101747.344559-26-richard.henderson@linaro.org>
In-Reply-To: <20220906101747.344559-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:17, Richard Henderson wrote:
> Allow targets to determine if a given temp will die across a branch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |  2 ++
>   include/tcg/tcg.h    | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

