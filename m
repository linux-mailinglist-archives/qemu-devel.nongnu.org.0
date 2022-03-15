Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989164DA330
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 20:17:49 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCg0-0004jl-7Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 15:17:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUCb3-0002X6-7O
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:12:41 -0400
Received: from [2607:f8b0:4864:20::42b] (port=45784
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUCb0-0001mM-6T
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:12:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s8so450820pfk.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/Nwkr4lSxOFBCA+ebItvkqSmennYfkNRPLAcYcYtR3k=;
 b=EnGZjdw2crm6AwUBdcYYp36Mum0syGd+SVJrjTekOM95Nq+A/+1oBqiBnkxqjTjLMQ
 ZoN1OdfwENYoOAn7e8m3utnuxcZ6M9+1PtL6ouF8PiFLRzv6qoPaTRR+TJ/wsBF4ck2J
 3CY/KFm428WRcwicrdmQwoRc3UoF1YRPJpmUAp5pmtQ/LuSOSZk4uyMfDpiweHMoD7Rl
 RstVyVWtlN8y37dWsusJhcOJ0CjFVPoSdn1BKG8nTRD0jIv6GPFiSl4C4J5SS5vB2Uz8
 Wl1qWeZU2Eldn1LUkpBpPa4x3lW9dtu7VMVyxw5A9YoZwZRC0Lbe6HUfP2jeiDJ20+AN
 bPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Nwkr4lSxOFBCA+ebItvkqSmennYfkNRPLAcYcYtR3k=;
 b=2dnMaUez3Sn3MhpwUgeytjAGUIZAmc6psol22J1HNm0GsN/obUl1wJAU+eJ5ESvUnB
 vsJ67wRZXfbMGe0ypnrpnBQ9RhyM9Gv7y7O2oFF1hFf1/3GyXnm714tV54r2EUQJgm5A
 HaWMM1aqDCaZOijV37pvac372o2RUNJrpfmHVTY+l1DFQDPT0KP1ahIFdjgZTtnThtcv
 U+beAlENvzFGdaXIkJ+tYo7N7GkhDxIO3NxIRz0b6qb1GrNCukBbbVc8XAs8u4a4cMzk
 Iejj/YpMI2Af917k8IS2xRUzyEEtsq3qx9dmdc3SXvC/0PJ9qZ3vh7RWg5T1utGrMJdx
 J7Gg==
X-Gm-Message-State: AOAM533j57NQx/l67voF7bFNumwHD/DOGgtpihuDPRGCVfMu6idkAyq6
 xUx1F4LglTy4tJpPMSbYb5wsYA==
X-Google-Smtp-Source: ABdhPJzbWBMRmpiJPC22PtiDMzy/4uNuG1xorp6VA8poM8m7wl1aMgmMCEiNWJl+fhOrcMJi9aTrXg==
X-Received: by 2002:a63:f315:0:b0:376:2310:ffed with SMTP id
 l21-20020a63f315000000b003762310ffedmr25069129pgh.23.1647371550596; 
 Tue, 15 Mar 2022 12:12:30 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a627b17000000b004f6cf170070sm24672169pfc.186.2022.03.15.12.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:12:30 -0700 (PDT)
Message-ID: <936f391b-6ca7-ed91-6bed-bdb778c1bd26@linaro.org>
Date: Tue, 15 Mar 2022 12:12:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 42/48] target/nios2: Implement rdprs, wrprs
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-43-richard.henderson@linaro.org>
 <PA4PR09MB4880462F87600A02A5D58629EB109@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <PA4PR09MB4880462F87600A02A5D58629EB109@PA4PR09MB4880.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 09:26, Amir Gonnen wrote:
> Something is wrong when translating rdprs in an interrupt handler when CRS is 0x1.
> I'm hitting "../tcg/tcg.c:3466: tcg_reg_alloc_mov: Assertion `ts->val_type == TEMP_VAL_REG' failed."
> 
> When stopped on that assertion I can see that :
> - ts->val_type  = TEMP_VAL_DEAD
> - op->opc = INDEX_op_mov_i32
> - ots->name = "pc"
> - cpu->ctrl[0] = 0x5f9 (that's STATUS so CRS = 1)
> - pc = 0xa2d5c
> 
> so, it looks related to an assignment to PC a little after rdprs.

Ok, thanks for the report.  Yes, it's a bug in the indirection lowering.


r~

