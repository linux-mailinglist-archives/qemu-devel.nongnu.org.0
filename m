Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B853C39031A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:52:02 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXTV-0002Q7-Qy
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXRO-0000FA-6s
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:49:50 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXRL-0000HB-QW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:49:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q25so5614731pfn.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l0nHGcV3yB1pIeXKmsxSGrtS4ILGzCOqKHNnt/0outU=;
 b=EPd+M0qKi++Jy628zxdGLhlUxcKiaZWJzAvYF6JA4E35HmDa6E2pbZGTUg4O1h6SOA
 QQcLmceJt2ghieTY6tf3EqzDSYS7aH2HW+rswwkvJ3lOfUqVCEKTrHJ7bGTmptY0YZcR
 43p8NjEzVwo1JTCYtWyfF+d9GrdNwHIHXtxmzsc+aioYmHpWYxa3h3Tlo37EcGCiyjg5
 sEQe85TRODw/oasbadulj9JpiWl8XkRbifl493oRFtk8QFsILU9b8Kb3aaNGgtU9PVhW
 Uuq2r3n0A8tncTauA0iBmbh+qRI8cTcXCOWxWBvplf6TwAHjgbZ7rRUp9rc6K/fm+8NY
 idkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l0nHGcV3yB1pIeXKmsxSGrtS4ILGzCOqKHNnt/0outU=;
 b=QEy3K1/8oK3I41rATlhkmd/tMpI06NIWJufgC5rL88I4Z2aJL7VUMei4LBY7cM/DAg
 gqxROgY1pz/6iUm/RSEfxUTCSFDVl0ewOdW2dFKnGYimdRUsCQjCpaO8aD8m0bNfvVH4
 WhEqDLB3focU3oEM2fmFklNKuax9oTF7/9rTpZFKt0/qwDZMQJmS1GxFa0mBZSatarE6
 OmyUeoAms0GVp9+0WZ/IZsa5X0zbiRpb1wNiya2aWUFQeAv/i4xUEwcchjZFLXyfUVc4
 MiVOowNQPNwozWjElsF+fix251Bgyxwh9e+kOtcwdFK4j9Ws8CENHlo+1EL7/nkCqpdM
 wkkw==
X-Gm-Message-State: AOAM5323/3B8JDCKzIIDasgzsl/CF90ap3JOBVi/EKl5HLYekczG8jxr
 m++8RYXnV57NH3PeIWCQuKVMRAruI/hpSA==
X-Google-Smtp-Source: ABdhPJym5e/YH3KlAxfBQ1mnYJgk5o56VhTcjrEb+AC2oUUFruajWAjoj4wXpwkEsgNBSMHYndEAVg==
X-Received: by 2002:a62:198f:0:b029:2da:c68b:7a1b with SMTP id
 137-20020a62198f0000b02902dac68b7a1bmr30578828pfz.62.1621950586556; 
 Tue, 25 May 2021 06:49:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g8sm2204532pju.6.2021.05.25.06.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:49:46 -0700 (PDT)
Subject: Re: [PATCH 7/9] accel/tcg: Rename tlb_flush_page_bits ->
 range]_by_mmuidx_async_0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa7bbe67-09e3-e54e-a053-763dbab9fb2b@linaro.org>
Date: Tue, 25 May 2021 06:49:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/tcg/cputlb.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Rename to match tlb_flush_range_locked.


r~

