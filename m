Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B674406F3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 04:43:05 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgeKm-0007r6-Jj
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 22:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgeJw-00077q-S2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 22:42:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgeJu-0004YY-T9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 22:42:12 -0400
Received: by mail-pf1-x429.google.com with SMTP id x66so10855821pfx.13
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 19:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6pgO8nK40hMhYyUornuztl1+fu9c7CmVwnmTWWzRmAA=;
 b=edLwe25WDbKTvLRaWvLOCHQp6CNCicAHM1uaSPnVT3kTdJm2Sn2+TvHoReu4TFzd2R
 CiVnkxpWNbg66St2zpiex98QL10JgtPtdoWeVk97n05b9QwgtGwZ9mNYu1YYZj2hZkCg
 BStvvM5bS57n8Um63YjAaGgJQKbizeF+dRHyqpY+frPgmXb/Y1tZ+sldTNQFUg79NrLF
 AY7pk19JDtp7Vchdj/Nm0QZkf+y3k2G7g2F0nudEw9FIt3sr9xVIeHSwjebKAMFEMone
 ++m8TjwpdFaWGS+vcCRgsvQ7zRZ/b5dAz/gfUJCNPgFnXItp3u95wRmVGVVOOWZb9isR
 Ddaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pgO8nK40hMhYyUornuztl1+fu9c7CmVwnmTWWzRmAA=;
 b=GAc8fRkjDpY0hoMf+0exbvpkFoXgDmELNR5rE3mc/oqiLruCEOMSw+SOBopmk4z1d/
 VmhIABCFSJETumadjYXrNOCXz01xyIp2lea/0FEC+kfwACJyZaT6HVNM2E7Yqnr+uqj4
 Yjsr7Y7u+TlOpS8NDN7ZadN/0l9CpXg7ulp9v0yQ4UTNeFJT0Vq2H3LtiIlM6uifLw9c
 wxFRmg0PaakChdF3TJ78MrIiSo5jGnf+B/Zv8wWzpwu0bAlOCDc7b9yutAXkN9quWK8p
 14FA7xMp2N0sHVW3zzICUa3sLT6OTnmv/Fu0fOQNfHuPZ/c/kHSIMmna/QVg2f49RNMz
 I25w==
X-Gm-Message-State: AOAM531xQmh0j0LQG/CAhDNi7JD90PqURUeYUI7dC6qh7HgZkE2k3JsI
 dlDBePHh9F4IJTPpadVYB0WNUQ==
X-Google-Smtp-Source: ABdhPJwrOtZgzcvFcy/Wt6BXCtyB72ueYpBTOBLnoCvYJycC15unei74RnrK3dUKWfMEKzNIkJCBuA==
X-Received: by 2002:a05:6a00:98f:b0:47c:1116:10ec with SMTP id
 u15-20020a056a00098f00b0047c111610ecmr14498049pfg.65.1635561729055; 
 Fri, 29 Oct 2021 19:42:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id j8sm7656615pfe.105.2021.10.29.19.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 19:42:08 -0700 (PDT)
Subject: Re: [PULL 0/1] x86 CPU model queue, 2021-10-29
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211029190758.2021640-1-ehabkost@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67ac8611-f3bd-f071-add9-d4c6b5c7faa9@linaro.org>
Date: Fri, 29 Oct 2021 19:42:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029190758.2021640-1-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/29/21 12:07 PM, Eduardo Habkost wrote:
> I should have flushed the queue a long time ago.  Apologies for
> taking so long.
> 
> A single patch, by now.  Probably there are others I missed on
> the mailing list, and if necessary I will send another pull
> request.
> 
> The following changes since commit a92cecba2791cd408d2bca04ce181dc2abaf9695:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211028' into staging (2021-10-29 08:39:44 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
> 
> for you to fetch changes up to 07db29f20a9a845c8408df11936889e5411ff44f:
> 
>    target/i386: Remove core-capability in Snowridge CPU model (2021-10-29 15:02:30 -0400)
> 
> ----------------------------------------------------------------
> x86 queue, 2021-10-29
> 
> Bug fixes:
> * Remove core-capability in Snowridge CPU model
> 
> ----------------------------------------------------------------
> 
> Chenyi Qiang (1):
>    target/i386: Remove core-capability in Snowridge CPU model
> 
>   target/i386/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

r~


