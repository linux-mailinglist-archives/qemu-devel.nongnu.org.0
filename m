Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3775152D807
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:42:59 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriIj-00022a-7y
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nriAn-0001ca-Kb
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:53 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nriAj-0007qO-HF
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id v10so5380139pgl.11
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OS6yMoXZFvAkpTKTQmTopK4HO6E+QRWoxWyaz90ay00=;
 b=sAKMzN9wGxaE/Izg0gYDkI5kNDDjMb+jhVcPl9sHN7Oc12xPvobZ4CScyeVdw5CHvS
 fUZ3mk4K/f2chHEDyTvIRbPBnsduVRZrizD3L4a9EQJ62lIivt8m3ltbtWFxH4Ky2k2G
 4H8V4Rbxk9aQ2IwRB8tZQrqn4lBcLND6QhW3T0emFxRXCfqtk8QnLbzjWBMTdMp9djGl
 nnrz1Ba7L3CTbJLH15i0UAcnaWO+4ug5rDSnMi/2+wsCkCoF1cNa3AVYjzVW8auhZ/JA
 xYici5PPpM6dNOCpBtkyK4k6npnnE8c+//shGbKKYNmQMOfhqFtVyFN2GomByo6PJl5j
 nqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OS6yMoXZFvAkpTKTQmTopK4HO6E+QRWoxWyaz90ay00=;
 b=t8M9IqHs7MjH9TS1KIAF6Jlra6srXMTs4/ZSVA+tqTQjomJaa4EygnMYdqrcCJbYEf
 LKfSi2wC2c3foq6203tTQUHz7feeZ16OkRURg8yMbsAMDnzqeJI5al42t/os5rmI6mnN
 E14cerPVRgiOd9wd7TvYBcbY1Smhn9xINf+SIr9tKPnt5eMaFdWGMzJ0/+7lhM9spkcM
 dVfaaFybRPZIEWcTdnSbl90ViERqUFzBxyOfpv1T3MNaVWsBlMBrzH/fwE8ncYXB/4l4
 MTVrE3yltWtaQ10ZGqUY4DqumbQCsyKcWBm+p7xMQ6SaSmDSzGv1WRt+S+lI824ADHlE
 hR2Q==
X-Gm-Message-State: AOAM5317QQVjYifxLOkBZWjruyuUeizFxyf5SAF6FXGCfj/uHyqIMu3P
 fpnTgZ9C8hbYN03dYZiKp50y3w==
X-Google-Smtp-Source: ABdhPJx5lhTKbzMbkIGTPMojlv/8gLXmVLvKmZhfdXhcKkVh0ADcthi46XZewsHAtJMRWeEKOM9omw==
X-Received: by 2002:a63:dd09:0:b0:3f2:804a:cf11 with SMTP id
 t9-20020a63dd09000000b003f2804acf11mr4388645pgg.621.1652974479035; 
 Thu, 19 May 2022 08:34:39 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a62c711000000b0050dc7628166sm4230796pfg.64.2022.05.19.08.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:34:38 -0700 (PDT)
Message-ID: <a37df5cf-64b4-4b12-1ffd-83cab46698e5@linaro.org>
Date: Thu, 19 May 2022 08:34:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] target/ppc: Implement lwsync with weaker memory
 ordering
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220519135908.21282-1-npiggin@gmail.com>
 <20220519135908.21282-5-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519135908.21282-5-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/19/22 06:59, Nicholas Piggin wrote:
> This allows an x86 host to no-op lwsyncs, and ppc host can use lwsync
> rather than sync.
> 
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>
> ---
>   target/ppc/cpu.h       |  4 +++-
>   target/ppc/cpu_init.c  | 13 +++++++------
>   target/ppc/machine.c   |  3 ++-
>   target/ppc/translate.c |  8 +++++++-
>   4 files changed, 19 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

to the translate part, and I'll trust you on the set of cpus adjusted.


r~

