Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BA6736E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIT8S-000695-JI; Thu, 19 Jan 2023 06:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT8I-00068U-Hn
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:31:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT8G-0004SO-Lj
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:31:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id k16so1271220wms.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aoITW6oXtX806vllKCZo/BeKK3x8Vh3clqF3jP73r+s=;
 b=lsIva1Ad2kW3QbWCPdmu+GHBRMkkNaSJjArQ1iGlavpmTPYXBndL/jk77/fbenxmvx
 kjoXlFdRxYEgSHX2Clmw7BVFf55EobRqM/2lhzFLllzy9HI+f1UH49qeUhKt+Ci80fOi
 dQ6X4aaFobsNxPvbDRln9SGTR/eHFwTW4vEpzL9P+ChkWubZgEYSHOVLBogp2IPEodDP
 KkVCu0LcU89O7c//0F2PfcavxVq9Ry6otdgussS3hZJEG+z9263RIqTxx3uKJcfnaRbD
 NL/BK6Hh7032tNuI2PuY5W7om792euURCxS0H250XbQM5iQrh7F+NHXVaIZyva0dj+PK
 Zanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoITW6oXtX806vllKCZo/BeKK3x8Vh3clqF3jP73r+s=;
 b=BkqTtDRbD5B2uWiIZ4XKQwt0VjB89UtCuNV/xYD7F5cCN6a1/bLLSujRGqz1ARbGR3
 gV9zgha4t/gaUv8OWjfRktYF0vrsJdEXfo6tQikOeEHEF/IlNevmv0Zgzw6nKNg2oaVa
 BZvpuRZxnADqigZM4QwIeEUUlZexUSQkkpypCii0qz9t2lVuYk//GiCZrSAKeokFGmX+
 r+P08d3qbe9/AZ341NGLaUCPdGq397lkSzu4048/9KUGxiVU2T6iGBreEZjx85A5uslF
 GrFgeYQKXQY5X9kw/ZEIB5a25MCQCBqA7SSPxRPWEiZE5sUAj66NJl579Mopgfp/kn9h
 GFuw==
X-Gm-Message-State: AFqh2kq+DozvCUd1OUuflyZtxkL4f1iGEkI0Jk9R5UPtF7JTkvhK9Ibw
 En3nk7CWINRXlHkbh4TT+8Kbpa+HoUfeLQcp
X-Google-Smtp-Source: AMrXdXv1pwAi57jpdq/GV+B21QPtGerz3vN+/j2apblaYo7Q0RVV+1WxAbRmoiNpYb9wkhT3koT9FA==
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id
 m10-20020a05600c4f4a00b003db05f153a5mr10136788wmq.20.1674127858643; 
 Thu, 19 Jan 2023 03:30:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c348300b003db09692364sm4702798wmq.11.2023.01.19.03.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:30:58 -0800 (PST)
Message-ID: <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
Date: Thu, 19 Jan 2023 12:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 12:24, Thomas Huth wrote:
> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC: CONFIG_HVF is poisoned.
>>
>> We could pass host config definitions to qtest using:
>>
>>    diff --git a/meson.build b/meson.build
>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>
>>       accel_kconfig = []
>>       foreach sym: accelerators
>>    +    config_host_data.set(sym + '_QTEST', '')
>>         if sym == 'CONFIG_TCG' or target in 
>> accelerator_targets.get(sym, [])
>>           config_target += { sym: 'y' }
>>           config_all += { sym: 'y' }
>>
>> Then test for CONFIG_HVF_QTEST ...
> 
> I don't think that would really work well. The qtests are build once for 
> all targets, and HVF is only available in the target that matches the 
> host architecture. It's poisoned on purpose.
> 
> The TCG accelerator is special, since we have it in either none or in 
> all targets, that's why we can use CONFIG_TCG there.
> 
> The kvm part is also rather a hack... we should maybe rather 
> additionally use the "query-kvm" QAPI command to check whether it is 
> really available...?
> 
> To fix this properly for HVF, I think you'd need a way to query the 
> available accelerators via QMP, too... Hmmm, weren't there some patches 
> for something like that in the past ... can't remember right now ...

https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ 
:(



