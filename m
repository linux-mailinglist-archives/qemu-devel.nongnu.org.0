Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C63A5B68
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 03:38:43 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsbYo-0002bj-MW
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 21:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbXq-0001xM-GL
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:37:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbXl-00007Y-Lg
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:37:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id a127so3549342pfa.10
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5MplLcgfwSjR12XqPHZwPbx248nbgSWVjqu7bMNArw=;
 b=z7uOmmfu07qDfJPiujrY94MaITvLHBPQ/hs/4aRD/1lhFocIqbGibYQZwMnz11mckG
 VdDh0jvK1+MmxBGc6qSyN0Oix5salXJhY2Lf0agRQuUrGVQB1fcpFDeTnlqO+mh9DiSq
 pDDJS2wDRE5FDA7PqFpVgj01CBxKR8Tr/7viQBVb2Wb9iDmbOWPEIKt3TofA39zjkTcN
 Lfb19VmCZMp2Mu7fJM2z6BF96f/CeXh7jSUwqN42X9/J5eN6tQzwnLEXbovaJt0Jn1Ok
 0IkAsmjYNVaBWDmeW/5mN9zpXqfdXr2DPO9PnDsNwxTFaBdVo2dkDOOHzLRBH/9N1HC/
 lnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5MplLcgfwSjR12XqPHZwPbx248nbgSWVjqu7bMNArw=;
 b=ffnje1cOa69ODQUiTN21niFO8XlYPKcr4d7nzP88i1gS9/QkB7+QR7X834eUScy/gW
 68jICwqoIX7xShyV91weovNsSWf7g92BcQN/l6drUdAFXmzzxOzc7dC+VJC7YUH/OU6D
 jjRQmTP1SpUK9esF9utvCECWlt7P5STxQHhxYXuBkDqV2ISxZBwoioyhM38+8XJXWUsw
 pVuHJawvyVfpwjRNr3THJiPCIeTZeyZWjuVrnZwL8uYMSq5t9cbzni+bN1qd2mMsadMZ
 3xHg8ArChKfFMLqeB5K16jDOOHtHqWS9FmFDmB+sMTX9KA5etMLHU23g6+jvimIxyxe3
 sXZA==
X-Gm-Message-State: AOAM5337kYUG25TnpRxjwbQ14H2LclU7nXGpEGVB6UqrIqSph3ATsgFq
 LosZacQKOMdMC+DDjQBNNyq0mQJ8aOUiZA==
X-Google-Smtp-Source: ABdhPJxWA4+6MNBlICUW3wHNEKPAMHT5cA7Jh4Sp7XHSvfVNWXP4+VNXW0vca81F6ZR3o/3a7x4LJw==
X-Received: by 2002:a63:234f:: with SMTP id u15mr14936903pgm.257.1623634655748; 
 Sun, 13 Jun 2021 18:37:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a187sm4254221pfb.66.2021.06.13.18.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 18:37:35 -0700 (PDT)
Subject: Re: [PULL 00/34] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
 <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org>
Date: Sun, 13 Jun 2021 18:37:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.144,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 10:10 AM, Peter Maydell wrote:
> Also on x86-64 host, this failure in check-tcg:
> 
> make[2]: Leaving directory
> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> make[2]: Entering directory
> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> timeout --foreground 60
> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-hppa
>   signals >  signals.out
> timeout: the monitored command dumped core
> Illegal instruction
> ../Makefile.target:156: recipe for target 'run-signals' failed
> make[2]: *** [run-signals] Error 132
> make[2]: Leaving directory
> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> /home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:102:
> recipe for target 'run-guest-tests' failed
> 
> but I think this is a pre-existing intermittent.

Interesting.  I've never seen this one before.
Do you recall if this is only intermittent with -static?


r~

