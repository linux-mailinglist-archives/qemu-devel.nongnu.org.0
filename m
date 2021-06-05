Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017539CB65
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:11:04 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpeVU-0004wZ-27
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeUS-00048V-Mv
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:10:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeUR-0003o1-3h
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:10:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k7so7532897pjf.5
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FwwkHnr5ceh/eyVGWKBm9xruBzMXRyv6IW6isaYIGYk=;
 b=h4zcv9RkQeYg3ttjOAtaSmNeqoTW43U7X6CFBFwSRru3KIQzt3eR2V+1K8Y7phHlOi
 G7ettbBUD5oSqITEx/T+qOYNJYhkAKuO3cs3WKYOx14gYaVmttcN1vJ+QO+tMqfQQtyn
 4nLcer//JvKkE+kaWmowVFvIqlmgvBUD5ugIa9wHRpD5xfl/EiMqEzI9h+Y9RT2b+ze7
 IqRjiCJUEVk2Zh+DAmMVIxEYw0W+k9nHfko2I/DWhV4h5tlXZ+w1BS3i4VLb/Y9FDQii
 wjVZQZOEITOaOnZ4Hvjn2RsZQ8Eb3NjEvVNl/lOPorXWpE2bSw9Prttilj8sSRBBrtx+
 XJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FwwkHnr5ceh/eyVGWKBm9xruBzMXRyv6IW6isaYIGYk=;
 b=QffnvpoLPAYqcDfrLlJnLDRMKktuiqOdc4E1E1V/nh2mrfFUGoSRqNI1JVLJkw0Urg
 jObl4zK6xftjhuE1HmUCz/yPm+1qelbcTj6jyTIO3C/fYR4GUzkkWJe+QEKfZAAI4xEg
 oR7k0GlAgG7xJe5GejLJFZEiNtFOa9ckMTiF7FKXU/3mPMglYo4UrRlRHHC49daFkqjr
 Os9QsrGjjBgax7OBw12jJjpXoQsJ2aRRY2QLfE4/77kEs49wtIWpN+RP51PWQ4l20vtz
 SymKxCnkHKBqfdFCVmcvOTb0/kD9EM7uX6KRSMB9hNtTlaD/14v0mRZhwPNBH73sZn7c
 C84w==
X-Gm-Message-State: AOAM531fBYbXjCj46mcrme3znap2GazYOR3sKpmxKB9n270wcqa9dRUe
 mdbnu1xFpGbPxIJwmFzNZlJ+PA==
X-Google-Smtp-Source: ABdhPJwwLutTOyHrp3+pcNKipi8GRwRsqdoRnJbAi1Y4BGi3jkvIFtE/4VfFBIT31Df6XxrYuVbHIg==
X-Received: by 2002:a17:90b:400c:: with SMTP id
 ie12mr12253096pjb.107.1622930997655; 
 Sat, 05 Jun 2021 15:09:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p17sm7899975pjg.54.2021.06.05.15.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:09:57 -0700 (PDT)
Subject: Re: [PATCH v16 86/99] target/arm: cpu-pauth: change
 arm_cpu_pauth_finalize name and sig
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-87-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aac4d09c-fa5b-4137-7323-bb01623799ef@linaro.org>
Date: Sat, 5 Jun 2021 15:09:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-87-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> make arm_cpu_pauth_finalize return a bool,
> and make the name canonical for the module (cpu_pauth_finalize).
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/cpu-pauth.h | 2 +-
>   target/arm/cpu.c           | 3 +--
>   target/arm/tcg/cpu-pauth.c | 5 ++++-
>   3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

