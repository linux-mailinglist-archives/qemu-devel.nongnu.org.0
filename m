Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956484CEAEE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:15:28 +0100 (CET)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQorH-0004QY-I2
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQop1-00023E-GY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:13:07 -0500
Received: from [2607:f8b0:4864:20::1033] (port=52760
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQop0-00089o-4X
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:13:07 -0500
Received: by mail-pj1-x1033.google.com with SMTP id v4so10905485pjh.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+jOlcHg2Ll6BD+okZFj9c7e/+jUT83RWkVPIRQg0my8=;
 b=f3bBwcAvfRl4ABVUdXwo7M3S9rJrbdhwo7wbg8RQyYOHnUTtyqB5+1xuuiEHY7zO9p
 n13PgOEX5BB/aLnH6O7aScvMjNQiarDSO0CvRD9P84XtgUPqrLQhXo/atEHn4Z8TIQr4
 zDE5LYxaz7kbyY3DaduIlVn+s5AlhpRhV8tgfEFRJ2kfg52P9l6yOqzvT15gyX1qTUvq
 kd6suYB3R2TSrbvCQiZeOO4h87frVpRJOQPcFNqwe/7zJ10rMYjIs+VCcfaQKoEZsu8a
 o4R8nFCw5PuZCPKqCzQjYmhsImkUG+8kAmbr28/9Y0RnyRJodiXxeXbQ0+Va4Fhv8qOC
 +r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+jOlcHg2Ll6BD+okZFj9c7e/+jUT83RWkVPIRQg0my8=;
 b=Tp3i32uxeAgXcHXI4SEPfqE/rj/eLdLR5KDDDbVLS5MwpW+cWQBUIMd6THIu02S1hz
 0IcnkPTHSOmV73L1Hf/83aBB0H8Nr38qO4YGvaqnESXM+kGz9yGXrCfktZgrQSYAm95+
 DlBiLEyH4tpyvf15UawjZEOxqbaK7ROllL0G3WLVz3mQIohvdEjdFgIH1ui0Yh6Phs79
 3Y6XWVeUSVRHUv+Dnj6zmFGwfYG/id89Vnh2vR1m9btu7Vuk4hdeH60LknKRWKUy+Igk
 /P1DCtw+0vRR92A/LzlPw4iJcwmqRw12GYvQbGnuC1V2y27DaqiVffLuqaswKOHZi0l+
 h8bg==
X-Gm-Message-State: AOAM530g+ruNXmttvjSg4b5a7wz1SCv6RyFXy873IzF6dVLWhwRLGdg3
 9keP092eqo/arOefQUTiyZo=
X-Google-Smtp-Source: ABdhPJyX7DNq6sA1x+Aox5Y6ZF9i7dBpl5qf1We8ebegsd1FFHcXa2IaTVTHLw4WZF4X5T17rUZwqA==
X-Received: by 2002:a17:902:7043:b0:14f:47:a455 with SMTP id
 h3-20020a170902704300b0014f0047a455mr7169954plt.44.1646565184742; 
 Sun, 06 Mar 2022 03:13:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a634a51000000b00378f9c90e66sm8925022pgl.39.2022.03.06.03.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 03:13:04 -0800 (PST)
Message-ID: <7d209981-92d3-54c5-0718-db904238eae1@gmail.com>
Date: Sun, 6 Mar 2022 12:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/2] accel|target: Remove pointless CPUArchState casts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
 <0a36ff60-2e8c-c07d-bdd4-cde247b6c9d5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <0a36ff60-2e8c-c07d-bdd4-cde247b6c9d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 05:43, Richard Henderson wrote:
> On 3/5/22 13:34, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>
>> Now than we can use the abstract CPUArchState, let's clean up.
>>
>> Based-on:<20220214183144.27402-1-f4bug@amsat.org>
>> target: Use ArchCPU & CPUArchState as abstract interface to target CPU
>>
>> Philippe Mathieu-Daudé (2):
>>    accel/tcg: Remove pointless CPUArchState casts
>>    target/i386: Remove pointless CPUArchState casts
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, queued as 'abstract-arch-cpu'.

