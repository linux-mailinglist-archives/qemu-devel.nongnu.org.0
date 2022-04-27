Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4C510EB8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:26:06 +0200 (CEST)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXNV-0007WN-Lh
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXMV-0006r5-Q0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:25:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXMU-0005JH-0I
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:25:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso596452pjj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pjBvEiKBz7DIRmnDTaB4fUGefbI506LTScAE73LjfGs=;
 b=WRuPwwfQNLNnqIJW/Z9hK0Fujd0Xih8qwm3S3qO7eirKrZRLG4wONa9wRct6o5aEIA
 Yswg0q1O7SE3/uXBrRPrhC8q20swaJ+cxL2xiZ+YXwKrpMRniR3ej7iIY1Me6xJXkpkv
 O3agWgg0C2jB7ERs/FlATPkMX5A6yGx72d3MApLf3kZ9LTbiwRneAbBj5etNStv5HRJK
 xyYJnLOR5vUnTwBjU4JLknbKgkNylHH7rXSooczd4A+JwyVJ4Vljy7LYiOst03qK2h2u
 eYOPsT2frluw+eKMjxLZlzGWVUiL3JJYDaDpCL1VOXMvW6PKHoMWleU5dyUqdMFcPAJg
 Ye4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pjBvEiKBz7DIRmnDTaB4fUGefbI506LTScAE73LjfGs=;
 b=2I/xKoYHyRMkxOY3F6GICmXThtcozIxA4o8gLL2HWj6IsoJf2+yqTPgN6vMFqUyUZi
 sow39SkynRnq72bHuf7UX4FOyDO8AP6h78IbWa/PnksbrS8hFY6fP2qu9kVExFUQSogk
 g0knLkRwmrBIO3oEfss/jcpt153SsCE6EGFAXyeUnEQ4+9b4UFBLEZjaXSZdi3BjNF67
 qCyuPvytHisv2krd66fKVJJ83JcHH3uu/6Jbfs0kJ3JEHq9mCc/+djV1hDEH8canGbW5
 mjj+XHPr041Cltfwa2SWOzmXlEt/fFRjQ6cQj39Ba9gR1rizOVRef7K8CDtUYD/LfkUt
 14BQ==
X-Gm-Message-State: AOAM532QKSlhhrWKAoCl4fmYshFpHPsZ3ISPN36HHFRdY+d84/6NTJa+
 S4stp0G24/PNfXwJI9kw87jmMg==
X-Google-Smtp-Source: ABdhPJzYMYbYqZMyoNhN6Wep0U4oiY2awIF392J+deFdeM6cXJwmJafLUwJwy/fLQQaP1l9fBSRjug==
X-Received: by 2002:a17:902:c2c3:b0:15c:fd3c:7a9b with SMTP id
 c3-20020a170902c2c300b0015cfd3c7a9bmr16223221pla.31.1651026300484; 
 Tue, 26 Apr 2022 19:25:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056a0016c200b004f7e3181a41sm17498891pfc.98.2022.04.26.19.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:25:00 -0700 (PDT)
Message-ID: <12b18e02-7f32-c3b4-c9d7-37d0ad9ac02f@linaro.org>
Date: Tue, 26 Apr 2022 19:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 41/43] target/loongarch: Add gdb support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-42-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-42-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS                             |  1 +
>   configs/targets/loongarch64-softmmu.mak |  1 +
>   gdb-xml/loongarch-base64.xml            | 44 ++++++++++++++
>   gdb-xml/loongarch-fpu64.xml             | 57 +++++++++++++++++
>   target/loongarch/cpu.c                  |  9 +++
>   target/loongarch/gdbstub.c              | 81 +++++++++++++++++++++++++
>   target/loongarch/internals.h            |  4 ++
>   target/loongarch/meson.build            |  1 +
>   8 files changed, 198 insertions(+)
>   create mode 100644 gdb-xml/loongarch-base64.xml
>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>   create mode 100644 target/loongarch/gdbstub.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

