Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD86D2E4B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:08:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTSi-0000Pe-TW; Sat, 01 Apr 2023 01:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTSg-0000PV-Qn
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:07:34 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTSe-0006C2-QB
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:07:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id fb38so16093498pfb.7
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680325651;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hVFobDYQP/pzVqDPcIkhzJL/t0jIbI5Niwn1Nx/pyTU=;
 b=YNYNNVOYqqzbK/dGvH19EslD2H5tQJ1Latd54cMFwnyGO+C2Sc9SYjdLCsg2D2aDhM
 0v0qXr4kdmlcBQOARu1BPnCyT2l8myisPIwH/88ibZzU8ShhtuqrFJmrvvIV6Y4FPOZG
 1QI3/N8pMRx6bN88J89mNofaUWZWyrKsBwimlNuMX/2MgF1tdkbdW7Jyv0BTJ26jB1cQ
 CT0mE6Qg05tz0GhanV7z6cOGaniqdo+vnxGAnbbtnDbKiFsntEQMPC0NPILqWaYuxtYD
 DwEv/3GPPrMsKyt8VZU6otRBGhMC4I4lucSyueCmRO+LYKjoUe61GFbTXyuhIWeP6lcq
 waaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680325651;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVFobDYQP/pzVqDPcIkhzJL/t0jIbI5Niwn1Nx/pyTU=;
 b=emSMp3fBNYpMEYSZ2vgERXx4uwFz3IuWQaBB0RICdJD54LlSgyWNIKJd8j3PutVbvb
 2c8GsMoPFfmlcY1CsG7n9NoqREl3wJeReYujWhCuiiNTCNWXqDfaeYj4GYZ/q/7Kz0yd
 eOISMFQ+eQWzkl4DyzkllQumIqLHz6sqyhxGX4zqtowTKr7xV8Ts5+FdZ5oKDnTic+aP
 CyskMWe2annA4aizHAf0QSuQZ72iZSHzRBmXpmcFrB5DfOCF3yXBztMWz7erfTUnp6IM
 qjttDwFkIpPka5O7xl8qfc2RvSwgfZarzizWCkR4BnoPBMM8ls0zYFZ/ZCRDKQT2ITTx
 0HyA==
X-Gm-Message-State: AAQBX9ecDcWM9QV6OHhR8jBZauj6Z48CqQ6K4O0QLXgvecII6uCVNTir
 aj+OlYWI9wMpBPxE97icoe+r1Q==
X-Google-Smtp-Source: AKy350axpd4uOYeLnUuGigtkPP1SEP3jCLAYHJonCAX+dw7aXNOux4/he3nTc8hYq0+EzTyWmfUAAA==
X-Received: by 2002:a62:1c04:0:b0:625:d697:c386 with SMTP id
 c4-20020a621c04000000b00625d697c386mr27223203pfc.22.1680325651295; 
 Fri, 31 Mar 2023 22:07:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a056a00408b00b0056283e2bdbdsm2615636pfb.138.2023.03.31.22.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:07:30 -0700 (PDT)
Message-ID: <31f313dd-e44a-fae3-453e-f6365e2e908d@linaro.org>
Date: Fri, 31 Mar 2023 22:07:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 19/44] target/loongarch: Implement vexth
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-20-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-20-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VEXTH.{H.B/W.H/D.W/Q.D};
> - VEXTH.{HU.BU/WU.HU/DU.WU/QU.DU}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  9 ++++++
>   target/loongarch/helper.h                   |  9 ++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 20 ++++++++++++
>   target/loongarch/insns.decode               |  9 ++++++
>   target/loongarch/lsx_helper.c               | 35 +++++++++++++++++++++
>   5 files changed, 82 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

