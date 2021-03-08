Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B816633056E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 01:44:13 +0100 (CET)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ40K-00053K-QI
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 19:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ3xY-0004OG-Pe
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:41:21 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ3xV-0001WS-Qo
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:41:20 -0500
Received: by mail-pg1-x52e.google.com with SMTP id l2so5336251pgb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 16:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yuh7hrclpQ9WzyeCFzdypj93f8BlfP7S30rgQ9lToHw=;
 b=rtxTNCmcEcwbvu8C56rtpJdiLcfqheR3Sz3xFc3UrFbghG9LtiQLMjzM+ZQm+vUOKE
 W540zttlN855pz8Luaa+weimR0G7mW2bHC3mxhk473xddKE1gkcs3f9aiXOyB8gJGGOf
 5MoLcBEU9OvEGlFWH9ncHAX2plaEPJtQYC+xnL3tT5LygSs63WnnzUAl9KoCnGzzD338
 C7/kvoR/3NeAjStY4cqNLc/c8cgIYl7nEaxcKTgJn6l2z+5RCkz/MajjwXRJVPMe+FYU
 +VNf2aX4CGtREaL8MWCgXggOzGy0ZeE3Jy0cxSGnABaLtv0HDcp4H5fEy+JaEQWnJpzK
 xT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yuh7hrclpQ9WzyeCFzdypj93f8BlfP7S30rgQ9lToHw=;
 b=ie3v42Ikm51GLfEuEPUSibltXsns0g1uVeTagUJyN3ru815EvafkdKwVRh+T5ElBgw
 lANQToOpZklNszPZHTBVMxTcQ89tWaQZWfr3GPUiL2bwwsY37R56QzIXge7VHL3BgQeJ
 DYBq0axKvvrQoOs7TmAj9HqV6cgRQNXXQlUZ78094WrWaRupMEV8wZo+xkkfpKACE8Ag
 VPvWAWMCSV91O522e13AZFkKL3TVKU+Eqo8Fn9CVoPkVvWSY6z92XO6G3m5Kyh3S+Do+
 E5y6dI0MuJcpEYJkQIS//C3lYCUZ4jJgO1ZIDMd4A0z24UKkhBWF8mmPTW5Ds1QEFJUe
 +Blg==
X-Gm-Message-State: AOAM530ziin8c4A6015960Yk6DtdsN0payOlBTcaz6Pq/yn4NeYxWa+5
 xEXDvFYTW84gWRJw8z/uFlTWiQ==
X-Google-Smtp-Source: ABdhPJyr9++oUXgqWJhC6UeCr/2GNcL46D9g834nWJp3kO8eXZJ+tJfLFmNOvvP1J6VqSGKXdbQNZg==
X-Received: by 2002:a63:1b01:: with SMTP id b1mr2914810pgb.330.1615164073351; 
 Sun, 07 Mar 2021 16:41:13 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t10sm8589042pjf.30.2021.03.07.16.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 16:41:12 -0800 (PST)
Subject: Re: [PATCH v4 1/5] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307164828.87348-1-laurent@vivier.eu>
 <20210307164828.87348-2-laurent@vivier.eu>
 <6909cb99-6058-472e-bfa2-62172c448b1d@amsat.org>
 <c823a8ae-4060-02c4-1bbd-688793c0b18f@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80f47a12-5edd-1777-5449-3f6707ae9e91@linaro.org>
Date: Sun, 7 Mar 2021 16:41:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c823a8ae-4060-02c4-1bbd-688793c0b18f@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 11:57 AM, Laurent Vivier wrote:
> Le 07/03/2021 à 20:24, Philippe Mathieu-Daudé a écrit :
>> The spec says this register is only available on 64-bit targets.
>>
>> Should we restrict this "#if TARGET_LONG_SIZE == 8"?
>> else log_mask(GUEST_ERROR)...
>>
>> This seems overkill to me but that would respect the spec.
> 
> TARGET_LONG_SIZE depends on CPU, I don't think we can use it here.

TARGET_LONG_BITS is in fact poisoned -- you can't use it here.


r~

