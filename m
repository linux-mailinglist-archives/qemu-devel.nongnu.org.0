Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224534BE68
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:58:16 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQac3-0007nI-8O
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaZm-0005uU-SL
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:55:55 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaZl-0005Tk-3h
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:55:54 -0400
Received: by mail-oi1-x232.google.com with SMTP id f9so11112459oiw.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RfEOR9xWVfwv6DiZcAoFuyichgf5XbstFcn5t2LQyYg=;
 b=pyJ2euoizMnVsoSxDcyMAdupS1DVSnj9kxYwinihPs6ROmmbVVKjomNIgruGqSZfE3
 jJeOuaYCvDCDR4JoS2T77kYEbSfny0f4erdBQaq9XRQEUsuRfjpC4LuMW1PhsvAllcsR
 WsG50K0v8d6IQBTz9/fFMKNIUmbW4h1IyUJ3qwn2+RsNb90O/cDy6ZDfK0yzVTsanaHA
 GO4+o5Mug3s8qa78BRmnxE5MLReNK58I6zQCN3u2QhQM1tlY3tHK8zFCFvo2IpAqU/7z
 LDGxGrLqFoAf+Qk+3HI8FwsS7WF/7MNNAftveKJxKJsy1DLKqmB+2NTrXmioVb0Z2WMi
 1LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RfEOR9xWVfwv6DiZcAoFuyichgf5XbstFcn5t2LQyYg=;
 b=fJp3XswPEYfVuZ9sJjaNqcewomFcX3i7dC0c3fLSDYjzhqYnJlLTWh5IH35gZn7P++
 dEYtDpoBXmtBUL/oTxAsN6WMw4KCJJnDER12PpWwdEbUo+RuVMkmo5xZWHa8N9n3zrLc
 0vB5xfhB0qSeGI5bsL2CnnbgHyVcgyiTF9CryO+3QZXI/Bf10G4cLEB3KWoQTkuZKHXL
 EqsEiRQpuhtZqycs5EL/nDBYooA31tL1Qs3EVfK0SNgABuSpRLj7pv0OyX9dbMkS6Ygq
 AIIcAL/BaenFq71FK6/QbhVsVbYUHujYkHpr/vBHXgxwDMm52Y/rj5Uzwwa6SmDNvidn
 Zg8w==
X-Gm-Message-State: AOAM530HewVOh7IxXaI3LRdhr8m8mOhxO5Pn1rlCMRhGv7L6ESLBXXuf
 CU8cN4yjeSuKAQw82pa0aiHQWw==
X-Google-Smtp-Source: ABdhPJzXRPwZYOlU5MINxpUn3jefjMC7RjkfVAJ0HbtFyODWbmW/fWVvCvESdw/xDlwrDKyy5gHYHQ==
X-Received: by 2002:aca:d503:: with SMTP id m3mr16111672oig.50.1616957751691; 
 Sun, 28 Mar 2021 11:55:51 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id z6sm3999191otq.48.2021.03.28.11.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:55:51 -0700 (PDT)
Subject: Re: [RFC v12 58/65] target/arm: tcg-sve: rename the narrow_vq and
 change_el functions
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-59-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ac18dfb-68a0-4bb1-c11a-2b3824b36c76@linaro.org>
Date: Sun, 28 Mar 2021 12:55:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-59-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
> make them canonical for the module name.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/tcg-sve.h         | 4 ++--
>   linux-user/syscall.c             | 2 +-
>   target/arm/cpu-exceptions-aa64.c | 2 +-
>   target/arm/tcg/cpregs.c          | 2 +-
>   target/arm/tcg/helper-a64.c      | 2 +-
>   target/arm/tcg/tcg-sve.c         | 6 +++---
>   6 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

