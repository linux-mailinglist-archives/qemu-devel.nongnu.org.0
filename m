Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7251399F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:20:34 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6sb-0001LT-51
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5wI-0007Dx-Om
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:20:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5wH-0004qJ-B4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:20:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id k4so4641016plk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DjQahCnKnurCjL+vkD+QytyQntPpfi+StRg70IwqLTA=;
 b=v8ghd1wsMNx25cFUwXiUAD9bbMU8YQGOcAtu55OMTw0FLFbLTS8rbaD4T91W2eYlzN
 vn8Ks99q4gPLb40/4fQdeUs7jMUjB2OctOgTpfKFZsERKJi0eAGpM792MNI4jcPNGVCd
 n1q+3zG6L6nAGTwtD5TpH/XNmJ2EdRiR5tdhVUg/4f7vuxhBDFHRA8ctrW3s/uX8+9AR
 TFp1XmeYk2WuFCUsw11uWd3DfOibVnx4p3wJ4iYBFOo4VQ88Fj+9gD3dXFFo6mgKtkdd
 +bzwcLHSPmK4CXIuipq1wiA3QNdJ5MxSabUbsdnESubPPnBvwJsD/PxlsYob+sa5FJrP
 CqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DjQahCnKnurCjL+vkD+QytyQntPpfi+StRg70IwqLTA=;
 b=2BkH+0aifKrmMm0cjgvnkaXr/xGnOEUazPAVelQH/IfjFzbeXjMsDSUH7WJI6kpp5X
 /H77DSw1UyGKHexIm2r3H9UCOGAw/7uh2eeVPByM9eHi1MSfx6NMX9ygh0zEEB+EF+/4
 PbwpIJKnrMBkEeFjuWZ/J4qo7NO2dt9C1MGWXhPhXtU7RhbgKjoJzwSv92Uh9xYIuBie
 nxXBRWZ6jj9DTHjPVjjkpPKuiQ5GSW/aR0RBlvkTtJmoanuy8IL51AP31KlTZRCUHEWH
 4r6ko8xWcxJFOShG67lJC/UCiQ8nOfn8PbahIy9sRKZH65LpU0DMixy/AxAbUyCiKnN0
 lThg==
X-Gm-Message-State: AOAM533jEPq6hddsU2+I5x85QEEEh/z8JdTTAGzEk6vWGr4J2uANF9AN
 CcSCw16SkD6oVbxRPg/+9FGx+w==
X-Google-Smtp-Source: ABdhPJw2mwL0qtoMk0PA7qBYQeTfdSem1aNPb8Ed85EXNvAVQGhfZxBj5M9FPQR6CfYrzAHL2sBiCg==
X-Received: by 2002:a17:90b:f03:b0:1d9:a8e9:9e35 with SMTP id
 br3-20020a17090b0f0300b001d9a8e99e35mr17095884pjb.48.1651159215236; 
 Thu, 28 Apr 2022 08:20:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a62a202000000b0050ce7925e1esm200610pff.35.2022.04.28.08.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:20:14 -0700 (PDT)
Message-ID: <3ece010e-b84b-9b0b-df38-4961cf71f568@linaro.org>
Date: Thu, 28 Apr 2022 08:20:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/47] target/arm: Use tcg_constant
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 05:38, Peter Maydell wrote:
> On Tue, 26 Apr 2022 at 17:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Split the tcg_constant patches out of my larger v3 cleanups
>> patch set, and then split the 5 patches into tiny bites.
> 
> Since there was only one issue with this patchset (in patch 17),
> I'm going to fix that and apply this series to target-arm.next.

Thanks for the careful eye.


r~

