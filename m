Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4D5B6B2F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:51:43 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2Zx-0006lW-LF
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2Si-0002AZ-DE
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:44:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2Sg-0006oB-DB
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:44:12 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e16so19841051wrx.7
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vnXosAy98FEqsvOJP0BJhSMmnlNoI/hi15EtV2Oio/A=;
 b=l8Bucu+LxQ0BuhRY6C0CGnRoZlXZiH/9MgF7R2ZOQ5pBjxQHgNPhd5Umqn17vsX0nV
 LG5bR1ZypKVsegyPw164XCEHpfLerdzBuxZtx3Dn+Knj4J0GIugRiZr5JZ0fEuZqxF1z
 LkRL3a5BNuLjzxzPeqUTwtX9+UoM7nskjPqzMYgHXRd//M1Tp322IZTFPxF7orM1MgLD
 j+subSM02izx7Y3ZUCm3GRA77mXZPxZGRGGB80SAJo0OFEDiB8sAhVSjedpTNkkdFBpg
 +48OKcTIy9sWQ6vOPfRNdWvnXuVBw0wcjpsEvBvMHaHLsU0ij1C3UNHnOQuqyBDwqueH
 OJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vnXosAy98FEqsvOJP0BJhSMmnlNoI/hi15EtV2Oio/A=;
 b=zGe/lgGEXZ0h9mvYj/+dIfnTrxwssQQQb5S2tN/Ue9HSz83f5Jx6bsdirW+8REFXva
 B4qmc+x+xc8TCftEiYJlYwG5X5D+Y9Az0GLEkIiqzbHxEnVhOMg8yzSssCi8vpw5vtZq
 Xgvl8cH4AdHpkkkhcXUlA0aULb0xaSmbn5MWaOf6BgXwbwJOO3+L2rvuvFCsh+BWP/2w
 lsOIKuZMrxLtRH5LeAMzWstrvJorEiy1CUEH6HQ60NKzdzvvy113skYhK9qjWSDPYu44
 y033XMZQcKUuhd1X7Sx6PX3lycHTBOxWTQWJGetWZiFoxaG/aq51GBcETn7/Dt5HOE59
 hTbw==
X-Gm-Message-State: ACgBeo2b35PE/pBnYU8+PbhQ6kHM2x+PIJC+1fatAZhiX4fsW0N/LdKl
 Vaovr6cYRSydxNXmTHD4U0nv4A==
X-Google-Smtp-Source: AA6agR7FpqaDkKkFqI/1j0RMRPOfjHjq/IRTnww+fKM2miix6nlR+wO0WGk2empdb85l0pRcv8xhhQ==
X-Received: by 2002:a05:6000:184c:b0:223:2c8b:c43c with SMTP id
 c12-20020a056000184c00b002232c8bc43cmr18428061wri.16.1663062248181; 
 Tue, 13 Sep 2022 02:44:08 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c2cda00b003a3442f1229sm13746573wmc.29.2022.09.13.02.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:44:07 -0700 (PDT)
Message-ID: <cd4be1e2-9b00-eb1c-2873-9b520a436ce7@linaro.org>
Date: Tue, 13 Sep 2022 10:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 29/37] target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add
 AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-30-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-30-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> Nothing special going on here, for once.

Hooray!

> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  5 +++
>   target/i386/tcg/emit.c.inc       | 76 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |  1 +
>   3 files changed, 82 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

