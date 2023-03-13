Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA06B823A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:08:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboSw-0006DR-SZ; Mon, 13 Mar 2023 16:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pboSu-0006D4-Et
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:08:16 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pboSs-0005ge-V9
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:08:16 -0400
Received: by mail-oi1-x22f.google.com with SMTP id bp19so10331689oib.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678738093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcNbHfzfjwgj4WAAB9HDgad/3nvdd38KZlpl06VEq68=;
 b=BG0rPpXjXXYnyJxCokumlwePN+gJSkbHS4RVdb2Qoqcd1SdoVXWnAB5dzIPNJm6Kn5
 ggJ9idQkhnPhhuB2CcaW8ujeMVbUu3ZKhzcpvLDj5aWoqXfoXSLvF6QnHegOTw9umj5e
 Dn2IOgW1sCZM7munNVo+22g1EmzZQlFuo9SICj8L3Qh31dE9DrXkmXgfUAR9LHMuRnFQ
 UJpbW5A0Vm4CtNiqNUKFEO7VVXk88xtjzWelD41XbOOXved6cRLFQyWRa+VPYeCdWdWC
 moGGD/P6ygeXTQnNRJJmd1UQ6gxRlfu3mTyKGje4OqlyxHWz1G4zqqN9DfdUbKfLM2Ty
 wnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678738093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcNbHfzfjwgj4WAAB9HDgad/3nvdd38KZlpl06VEq68=;
 b=E613alic7O3gNsEiSd1VuTc3wXsUJlGX7f8rDKhX03VDgjn31kS4Eahr7/Isa28iCO
 8KcJv7uSgDHXRlecf0zgMnP9LPAAduNMMBn8cIaRirXN1b/EjbBWGmgTWoCakQOxJiQO
 8vQCUKUsJ5Uq49XgNsUai1KhVBFQCTNctlXNKnNUQzrN5fcm7hQ48gdF9DLIi/69AC6m
 0a7RJMNLNwTQao8VyCXz8AgSWZD2nmTkWmAubXkxJzkjFahz4kp/yTUA+DsuzAbgXqKt
 1iZ0878qEV6Libey8r1zquErF/6329/tAn95XmqfeGwq8n0GlHdjtmQ8WmqYxLFktOnj
 D6Jw==
X-Gm-Message-State: AO0yUKU4j6jujgl2T6Al+qBWhxZ5di+O+ORiOF3uc3r87ayeSlC/KI7I
 80PrExBOnVYVrf/OSqANhV1ktQ==
X-Google-Smtp-Source: AK7set8puSvdQqOxta4Ht0s0kcgDDg8XOJ7UAvwSwEVvlZ6dGNuNwIxWLctXLXcRy8i2vH9AQOFBAw==
X-Received: by 2002:a05:6808:4041:b0:386:8c30:6e92 with SMTP id
 cz1-20020a056808404100b003868c306e92mr200249oib.14.1678738093661; 
 Mon, 13 Mar 2023 13:08:13 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 w130-20020aca6288000000b00383bfd8a184sm180886oib.25.2023.03.13.13.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 13:08:13 -0700 (PDT)
Message-ID: <02479679-c3e7-3239-f4d7-5b02e28451e5@linaro.org>
Date: Mon, 13 Mar 2023 13:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 05/10] target/arm: gdbstub: Guard pauth code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230313151058.19645-1-farosas@suse.de>
 <20230313151058.19645-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313151058.19645-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/13/23 08:10, Fabiano Rosas wrote:
> We currently don't have the reading of pauth regs implemented for KVM
> so wrap the pauth registration with CONFIG_TCG.
> 
> This avoids the build error when using --disable-tcg:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
> `aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
> reference to `pauth_ptr_mask'
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/gdbstub.c   | 4 +++-
>   target/arm/gdbstub64.c | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

