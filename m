Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527DA652263
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dTM-0007m3-GF; Tue, 20 Dec 2022 09:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dTK-0007lZ-5M
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:19:58 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dTE-0005r3-Kl
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:19:53 -0500
Received: by mail-wm1-x335.google.com with SMTP id ay40so8866286wmb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yTKY77+Zt9v8LRL2dEpSywGQGl6gy8/AbqXFGapIC6I=;
 b=ggY9Um3TYSiuNo9SXmepjmx3LU/HhnWKx9VuNn3Sb0+NAlYITkIpdDQBuSpr+yVmPX
 8mqWvRQevKkeZzycE/phZIF/xynL9QP/k5u0X2/rGugBKg6Urz+0/Qb4qh3YL0vBfJTA
 b0471hUXn/q3nkU8bWirZ52TzhE/LfIS+7MTNBtBDhX/IKLGO2gRs7BnUPx1C7+oDP7D
 stF/VjSmEcGFuM1on8HiHxNQ0epij9oZbMKKysJ0KKz4BWNdOG6w+6XSwIxPLSxnxjBt
 B7HfVI5BetRz/oef4xOrN5XGtBVgXp5IyUB9QVKfrvA43sCHX93iUbu+MS+dN+xEd/EA
 l1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yTKY77+Zt9v8LRL2dEpSywGQGl6gy8/AbqXFGapIC6I=;
 b=iglTuDQgJT1+4hR34xbhiLkIlImMjyrlElNf6VmsJfrqymCT9YLwdG4dyAl8N9vllI
 Z1oZRSUfGWPl+dQcydENeOPAFWoBLLlp3r/NkBQt89s2vNxM9GjfMdGTFczhYEuZk4nq
 WGtwGaNGDY7U5BsgAvErL6yS1P/9SkQcsuLXXXSjr3ji6VaTKkykyX1+TnnLDp/VB7H2
 iqKI3POlaWnNi0nBJ9txAU8sLaZUdbLnYg99vl6NHxe8wavsFViAdtchKro5dXIuQNGD
 l+hYctQrb6LU24d6SFiUsyHU4ocbmPAonmG9cWa8ng9qTYnWv3COiFdqbg9XXWCWL8wD
 OM5Q==
X-Gm-Message-State: ANoB5pkeV8qOzqPqRMRLRsiF3+mEApGvEoYIGTUa8/OEKHpv1J5r5IxM
 VTpJr4sAJrZ/mdqHq6D3azsVRw==
X-Google-Smtp-Source: AA0mqf5Bz0y78V+lWRbXIh6GSRRxVZgKFK89q/cmANBPfo4zwx+yRci4hH2fTdCMTvQke9Htqe8k0w==
X-Received: by 2002:a05:600c:4e52:b0:3c7:18:b339 with SMTP id
 e18-20020a05600c4e5200b003c70018b339mr47995134wmq.37.1671545991071; 
 Tue, 20 Dec 2022 06:19:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1c790b000000b003b47b80cec3sm22499094wme.42.2022.12.20.06.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:19:50 -0800 (PST)
Message-ID: <ff4cbe8d-1aa4-3d8c-9085-29e1696f98c0@linaro.org>
Date: Tue, 20 Dec 2022 15:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Content-Language: en-US
To: Alessandro Di Federico <ale@rev.ng>
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Paolo Montesel <babush@rev.ng>, Anton Johansson <anjo@rev.ng>,
 richard.henderson@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
 <144e9b21-3bcc-4519-bdc7-4293f2c4af90@linaro.org>
 <20221220135151.1e5394b9@orange>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220135151.1e5394b9@orange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 13:51, Alessandro Di Federico wrote:
> On Tue, 20 Dec 2022 08:30:02 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> Do we really need this level? IIUC the problem with -Wextra is using a
>> newer compiler toolchain it can include warnings we haven't fixed.
>> Maybe worthwhile but it can break from times to times.
> 
> I think we just wanted to be overly zealous.
> Flags typically used by QEMU are fine.
> 
> Shall I send a patch to drop -Wextra?

Well I think so, but meanwhile I'm surprised nobody else reported that,
not even the CI.

