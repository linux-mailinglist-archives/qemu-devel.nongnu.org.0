Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838382DB726
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:34:15 +0100 (CET)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJpc-0002PE-UT
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJix-0003O9-OQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:27:19 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJio-0000U7-2c
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:27:16 -0500
Received: by mail-ot1-x330.google.com with SMTP id a109so21130078otc.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XDfoxJCCpDbacQkWnloypj9F6s2lXWwcFcK4re2HepI=;
 b=q8wH064EpTkJzoKWQzMSQwmzsM65PGf8escpU6wgiAU9CVaiA4TV1kavjCj+J3K53L
 CBQD1x7h1R0UvE0OMf6lq5si57r4RzNhUsQrnFknQ6eMdIfE8UqPZKdXrml8hD/cwO9x
 RCXSy5JRsVoPQ0QH2cFx7wkiu2HbJZzoTOuEk1FcAkIgciwr34SFdB1QkpEn0Y8dOcIX
 keRMdETquCmzdbxJvUkxzMGPQ03FNURl5XBUmALpRFdBYFPRm5pC6vKbUDCl8khvd1ww
 XKo8EZfM5KQwVFMjAhniZGj8qxkTrsNkujm5p7rgqnyDW08UO9uim+RHJmhhKE/uh9xS
 Ouuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XDfoxJCCpDbacQkWnloypj9F6s2lXWwcFcK4re2HepI=;
 b=Yx0nbHz1K4XvY7s7eXESvg7b9rRcPqo/4sIGxFn5CHgFKQUgxACN9v6I08/z59EYPW
 k8UG87XtpXIb6UBOfw7qDn3X2AIyp7AsimzbCsXVjYXC3VXnR8peSoA7t0kldqajHZU4
 pwJPsGaczzS2wjuNWKDq26Qms3nCGbIZoN1XiPEyjOrgCaoz+iVPTKqlTTRC0PZckPob
 g+dPEMqeD4VjQhrRkm3QaEOURLbXHwymvt9OlUcKD16AFcU2WDf/2S32H+8qT6SZZz21
 jnAqhuuAxrDUVORRMTODf22GFvw573Np7Mm333IacSUbBvrKJr6nGLfOdI+ufedc61Et
 TOXg==
X-Gm-Message-State: AOAM5339daGcFphApPN4KEZQAZDmNUOsDhMuASeD5+C5tRcrskReLsH9
 Tq2lq0tyfyhXAf+sx9O6VZozLA==
X-Google-Smtp-Source: ABdhPJzRI3fnkgdfxyjyzrdhHlG17t93aaLnhtz7zvNZO9ph+aw5cxo9ZYdM6sKY8823a+JNGEpUEQ==
X-Received: by 2002:a9d:170d:: with SMTP id i13mr24716551ota.106.1608074828660; 
 Tue, 15 Dec 2020 15:27:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm127otj.67.2020.12.15.15.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:27:08 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
Date: Tue, 15 Dec 2020 17:27:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> +bool isa_rel6_available(const CPUMIPSState *env)
> +{
> +    if (TARGET_LONG_BITS == 64) {
> +        return cpu_supports_isa(env, ISA_MIPS64R6);
> +    }
> +    return cpu_supports_isa(env, ISA_MIPS32R6);
> +}

So... does qemu-system-mips64 support 32-bit cpus?

If so, this needs to be written

  if (TARGET_LONG_BITS == 64 && cpu_supports_isa(...)) {
    return true;
  }

Otherwise, this will return false for a mips32r6 cpu.


r~

