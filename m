Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00911510B0E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 23:13:17 +0200 (CEST)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSUl-0004EB-Ir
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 17:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njST1-00035q-Qv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:11:27 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njST0-0008Ca-6y
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:11:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t13so5427166pfg.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7J0aEwGtv082QiWjcvUElkS5vQz40bzbM3IlwaZcoxU=;
 b=PXagucT+OFYwNmsdSgCsVMZgB3KOjWsSKS0VahVIrPAmtolSMoQDQArzcevcmOrWdN
 NwjiHHh3viZdXL7lyvHe5Kkn1kHhKiofIbHvAFvzIJhpyJGFvR9uCTVrHc4dU4wOuJ1h
 JZHFd89vqscvTR2pDKe1stcik9oPs3qfE38zSj8KM6+nPtSotxjBHt5lB+2Jyg0fAsPe
 73QIMU1R3BAucdGVawfJBDV0uAc4gJFBrxXiwGuEV2vEtpjbaQBYKFkWUIt/qeuqa9Fa
 IWE4PLlTBN1XD4VP8nEbe6foZ6Kx5ZwKCEvMgmmnfoCJbBDPqk/S3pFZuz2VpitSLusC
 8X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7J0aEwGtv082QiWjcvUElkS5vQz40bzbM3IlwaZcoxU=;
 b=OO2hDvrLD5XuREnIacb3D7fnRJ4CbHR8mxnC+Hdplc35yre13zf0nRqoSN6cRgMk0W
 BrxnfI2HNo6mXLVfiUjM3otuLeRLIGinForWhoK77UJhDOam86zTPjhGzYxNZehhkrWa
 6E8fJ5kuF/32SI2xwnpXcSI7BrdSaEZw8Nsx2qtSOBecHG+Dl0SaKT5gDFNaBh/75xlv
 lcBIVqDonrEseLhpFijW4+RgNlrYUdBYaRslm4LjopkzyygVsa41txk1uQyELiLNEt3Z
 cSjQRceyX2uWVV4R7gT/lLJx8iNAMuRPfv3uUHyQBPzpqKU/A80cK8PvnrrTUas/nQI7
 TYwA==
X-Gm-Message-State: AOAM532cG4s96YHLpusOvCRvspgdNBgqRSsu32Ld0ZZAmqRJFmCtJs5P
 6/goEqNN7piJAWCPr20AcvJIqg==
X-Google-Smtp-Source: ABdhPJwTOSYz9NTkn8UrTES19On6Y+bq3sPG1XUQikxkrjUTID4Hh2/zH94F8ac+FHONjM9KHOQCng==
X-Received: by 2002:a63:2cc3:0:b0:39d:a9af:bc5b with SMTP id
 s186-20020a632cc3000000b0039da9afbc5bmr21476142pgs.3.1651007484548; 
 Tue, 26 Apr 2022 14:11:24 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm16592938pfx.81.2022.04.26.14.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 14:11:24 -0700 (PDT)
Message-ID: <0a14a9dd-1af3-e562-34b7-a19d61323b38@linaro.org>
Date: Tue, 26 Apr 2022 14:11:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/20] target/ppc: Remove fpscr_* macros from cpu.h
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422185450.107256-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 11:54, Víctor Colombo wrote:
> fpscr_* defined macros are hiding the usage of *env behind them.
> Substitute the usage of these macros with `env->fpscr & FP_*` to make
> the code cleaner.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.c        |  2 +-
>   target/ppc/cpu.h        | 29 -----------------------------
>   target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
>   3 files changed, 15 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

