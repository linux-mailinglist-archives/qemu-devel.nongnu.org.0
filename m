Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37B34BD11
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:52:36 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXiN-0003aU-Jw
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXh3-000385-MD
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:51:13 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXh2-0007Le-3v
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:51:13 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso9909076ott.13
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lCDTejD9V6XacW70lwJ6tycHyscuUw3xgCGkT51A1Ws=;
 b=oNuLGhnrjebAk+RBmdMAguBXT/lfYYi8zayzI5btZiqsbwtO7wjvis3TYSHB0cWpsz
 tJ8OIqq4bNHqyiGR1p0G/uDb+zDkzrN1L7p8XaoLRtrehhueusktmiACPWE9oZ27NeZq
 kP8jJ49QkcSBiRhWZGW9JvWz0nDw1k6+hiLOS+1pULbsXIqf4GUETeCYi8uE/lNtEtCA
 U1NWq7yXa/to9VwHlV52Be0sXoUApwhOpUYA7+LTfBV6Vs8bfCr4S18Sr+etwP2k47bb
 10DUCnJThpEBuSVbYdjPy3oDBPU0HIkvxQw9H038CquQvYyal41kw1XcLLJgfsYzKnP5
 VU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lCDTejD9V6XacW70lwJ6tycHyscuUw3xgCGkT51A1Ws=;
 b=E4JWzfpMWEylOiVu8MElkabJDyhXhDscy+AvzJ7H9CJqJmPtaeV5EbLF7vSr1vUX28
 2zwundNB0gTk2OwZmFQ1S7xsNYD13dvLQpC1zZ6HDndEXvv4NAUujlvNzC66h6i0gBtp
 Uzotx2WMMBeplhxZF1Zq2Ma9WrD95MBzUexxQM1dA+zxEqmTumP2FaBufmiRfIgYEfoy
 3ZsFmErDlVUbDtRotkaf9v3Av+SFnV4u6autzC4jR049rIAls6qJHsJjIwB2AOdyM/SD
 win9qBSP5YGHziqvgebLotFMxIbm2UC/PHtUJuA2xphQHwszCsyvwxkicZhS/l9WoPfZ
 hLRw==
X-Gm-Message-State: AOAM532+fuJWwL//Y4a3fHLYcY8habocpYkw/kh2kh27FI6UWlxOThRR
 PfzNG6GEK4t9S0E3V5vpt+MBrw==
X-Google-Smtp-Source: ABdhPJxv08m6XzixDc25/fF+KKpkvzaGJlUdjoNQkIxhYrOW2wteS7wAo5kl3ZgyVca3Hoqb+2wSDg==
X-Received: by 2002:a05:6830:210e:: with SMTP id
 i14mr19449200otc.229.1616946670807; 
 Sun, 28 Mar 2021 08:51:10 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id m126sm3053463oig.31.2021.03.28.08.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:51:10 -0700 (PDT)
Subject: Re: [RFC v12 17/65] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa099a7a-0f98-44f4-4107-c53c224b9e3f@linaro.org>
Date: Sun, 28 Mar 2021 09:51:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> the armv7m one should go away with proper
> configuration changes (only enabling possible boards for KVM).
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/helper-stubs.c | 21 +++++++++++++++++++++
>   target/arm/tcg/meson.build    |  3 +++
>   2 files changed, 24 insertions(+)
>   create mode 100644 target/arm/tcg/helper-stubs.c

Better name might be tcg-stubs.c, and collect everything tcg related for which 
we cannot easily compile away with !tcg_enabled().

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

