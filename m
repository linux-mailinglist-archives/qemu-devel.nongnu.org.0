Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA46729F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 22:06:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIFcP-0002a8-Kq; Wed, 18 Jan 2023 16:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIFcN-0002ZF-Gr
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 16:05:11 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIFcL-0004nV-Kq
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 16:05:11 -0500
Received: by mail-ej1-x632.google.com with SMTP id hw16so391221ejc.10
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=710spzrLZOeRQTIExtr4HPibXxiq7aGlcMwfASk6A3Y=;
 b=oiCwWWe5qNsTLYq3O5XCI51vI9HQ2sH2ivHlNFq28pn+IFZ69Yif56SbP9uDKkTZto
 2rf9UyX+7NXqwPla/yubm1Yr8vvXTdugIy4vDuwxAtUinq4zVSTx2bcK7g3bg0X3hEoo
 V0I4qr1EcNoENmtImwvoY7KE6MrV7Sq3VGogc0ny4/ogF4xV4VesG/jd2cXmN6Pau6Gw
 Fv5sZwlQLhdDBy7plaW9/29aCHYKZy3EY2NWrV55LjXzh74sOiX3JrN0GwZYyQ6RIh3C
 HxL9HRyMI1Ui54ohfsW/VzZuT1NAePN+mPOMEl+TKCiFT9SknZzGLKVFdfQyCJT82rYj
 wCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=710spzrLZOeRQTIExtr4HPibXxiq7aGlcMwfASk6A3Y=;
 b=3sF2eT0EA519tS+sJj0wAPOFyCSJdQ8VY+N1PAvaAwy8eDwwCHqfjVWrL9mFY9vCxw
 TsP0zmJ68NF/lcR00kJKe80EeEASGXf7TeMlLYV2jFQFlsLtMyQAyWjPrnMLX7BLZCym
 JM3l36S/F5ETJjR60TQzoTeF2j9hdi7FeOnVExR8JlCaPaupVY15erdTARaKutPAdPzB
 8mG7QZYw2glIN8dv0vtwsFI4ZMAU6xhNzPDc82yvyirueRg42cIfRu4bChdeiWSdVV7U
 CPIP9Sf7ezAT9VfDcAwEhBWAFoCM9ng3xj1OWeqEjO7bOMxA5dvjAUC+S6rLz8bgjGFz
 Abug==
X-Gm-Message-State: AFqh2kpj0r1pbxA3CF0AKitud8t3Zgq/hvvhR6yyW+AuxrM7I8G5MtAV
 6ayocXb5WXmugrpSsFvq5WlK/w==
X-Google-Smtp-Source: AMrXdXvGqxpHzggyp/2gTEgtZ/wCTSbeowfO11Hxzv2y12CidDQbZYJMpTL2+fPID5TZeVZUWTeLpA==
X-Received: by 2002:a17:906:7f8c:b0:86c:360:3dad with SMTP id
 f12-20020a1709067f8c00b0086c03603dadmr20288509ejr.53.1674075907936; 
 Wed, 18 Jan 2023 13:05:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a1709063ec900b0084c2065b388sm15079179ejj.128.2023.01.18.13.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 13:05:07 -0800 (PST)
Message-ID: <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
Date: Wed, 18 Jan 2023 22:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Fabiano,

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

$ git am 
20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
Applying: target/arm: Introduce aarch64_set_svcr
$ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
Applying: target/arm: wrap psci call with tcg_enabled
Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Applying: target/arm: Move PC alignment check
Applying: target/arm: Move cpregs code out of cpu.h
Applying: target/arm: Move define_debug_regs() to cpregs.c
error: target/arm/cpregs.c: does not exist in index
Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c

I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of 
https://github.com/stefanberger/qemu-tpm into staging"), what am I missing?

