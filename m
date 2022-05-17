Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53952A838
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:37:15 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0CA-0000jf-NU
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr084-0001gN-VP
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:33:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr083-0004CF-AL
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:33:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ds11so6299702pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Py716TXsvXcXycS43+gUB36WTnPz3/mQUeCn7yn4D+k=;
 b=oVZcBr4Gdg8Qq1fWH6G3P+IK5sOl28pOlvkROWsawOmKFPXeNmozut/soBQL6of8N2
 UZnnDcAVq9ydVShm+nHK46uNjm6sgBORqAkprLsXo1AXTLDTpy3oGcVZ5rmI17dBVuiW
 wCluc1Xt/7ka09WeM+cBT8lpUwDWAYMh5YAXuDnMYuTq+E5YhVjxdM5BwbSVKqmzw/LN
 lJ2zV6roNOCogAGToKKelPHTXPJKE4AmIaWANazGAOy8HrRA8fR3DBnxNjhPbjoNgkBW
 8TW+t4OZjru8fZk88xwo3YbnYsdhTGAHtV5jrpaaDSGDma7eibDmBu7repMpSx+xGmmS
 XHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Py716TXsvXcXycS43+gUB36WTnPz3/mQUeCn7yn4D+k=;
 b=7AkY/nMDrmQGAr+6pnvuuUD8KulAfn5kfMrJcnHfwU0QHo1L7BrMaWtAWyMAZUXNHh
 Oteaqsgkxdbp3iQeTvJ1aS+jvz4Xt3BKEHm/EYxI1WU7XhFvuxQznNpSCYIElKgEYvMX
 4Sanggrf2Lv4ItXrklxjxUE1xlMdOClcGj+sFSbQosoM9Ipk0CB1alsdFubjvcLl8s0o
 65/SU3wmKd2Wvw9k6srHHmWfr6pSwB05qI9D78jStn2y8C7O6kQ+ZBRtcslRhevab+AT
 dTBUzjAiL9EdJgWzTIzoDj0GchXzBPnVCZ+vCE1wdWNZpMmZEcHrK3B4uQOY1WE8/8tp
 HR3w==
X-Gm-Message-State: AOAM5312rcGApltNwgThMu69ZhORCZIvF8mFyl3ymubJiaYReTD1Mz75
 zDAlGktNtC/6+Pl0+zLWEhaA7bZ62pKM6w==
X-Google-Smtp-Source: ABdhPJw/Uip4hGcgB1DK6xm95zmHQ818v4AM90UHB8AyPO7Hf/b0ErKdn/vY4iyNDQteJC91OUjt1A==
X-Received: by 2002:a17:90a:e2ca:b0:1df:665a:70a6 with SMTP id
 fr10-20020a17090ae2ca00b001df665a70a6mr9531605pjb.217.1652805178052; 
 Tue, 17 May 2022 09:32:58 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa78195000000b0050dc76281c2sm73466pfi.156.2022.05.17.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:32:57 -0700 (PDT)
Message-ID: <604e72ba-d719-b3ca-2452-0966e8a02a44@linaro.org>
Date: Tue, 17 May 2022 09:32:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/12] target/ppc: use TCG_CALL_NO_RWG in VSX helpers
 without env
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Helpers of VSX instructions without cpu_env as an argument do not access
> globals.

Similarly, "cannot".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

