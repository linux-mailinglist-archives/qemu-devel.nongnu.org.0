Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336536C8137
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfd1h-00016V-Dk; Fri, 24 Mar 2023 04:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfd1e-00015o-Qa
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:43:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfd1Z-0000e4-8k
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:43:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so950534wrq.4
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679647420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHT/j5RkynfM77d4Q0JeiVOAkydggAZz65kkcpzXfl8=;
 b=SD6qSSZ3HXUGK3bBij9PSmSnRC4vLNMdDHZYmkR29QoPAYEqYibig3ItmCx0uT6p6h
 w37+vtSGfKRJcQ2CMLJIS0/nGogJGoLB7lmXa8sN6LGc4wLsbpC1aEncB47nuHoc8GOh
 O8j7jYFcRqppda7q/sLbdcs7RZDfpTNkeDZxDSCZlY7hcxtOnDZZCqOh310TT3UcpYWp
 GRH50HX6Oxze1FT6QJffY90UgznrMTUkLhT8xu0bNU0Z5U+3LdfvHgZF4mqHJYfBfkDi
 +OkiFLk/gNkfKOo/uX1snGjy3QYTFiL4BeJAbHw0TOec94sh+qgqs5J7OpIGnTANlYk0
 HIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679647420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHT/j5RkynfM77d4Q0JeiVOAkydggAZz65kkcpzXfl8=;
 b=8NdGCHSSI7Kh456ntuK9G/G/6zZMDtcdJhLHIG6Zm193A6Rlkbe9Dq5ag8vKcvgnsI
 5/C5B+akamFnTbDm4xg2io+VDRtas8oi6ROMg1xKULuYjTgD5wRLK+ac2I1Tk09Q9vgn
 9cr/YM9iBeqmpdjSpQKwnhd1N7BWKjLO9aU6fCoE5zledft2I6MZP4UgLxTAJB1b5VLI
 dvGlNkGtVUoWBCXaH4hvOyq5eSHVgW92BwlQcOqLAAPIfTeHFyads5687A3zNpBmbCpI
 JxgDTMJJCKgxSJAGVrV+GYOOjMB7c7x6R7NvP/hDl+LBvsbgCKKm7t9zwokHLSMg9ASm
 XpFg==
X-Gm-Message-State: AAQBX9cOH/AaVX8ek3YxXyznlffomtRlPaSeFZp+we1FniVcjyuywMvr
 lP43PM8PhSDOBsk2dXG4uQy10w==
X-Google-Smtp-Source: AKy350YyupmmfXR9dqCB607i9aDpsYvbTXbJNuHS3fCZO6ckXqnwsX++y4P1hDrh/phng4KyzkvomA==
X-Received: by 2002:adf:ec0b:0:b0:2c7:7b3:36c6 with SMTP id
 x11-20020adfec0b000000b002c707b336c6mr1296982wrn.52.1679647419921; 
 Fri, 24 Mar 2023 01:43:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a1c7c04000000b003ee0d191539sm4228510wmc.10.2023.03.24.01.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 01:43:39 -0700 (PDT)
Message-ID: <30389414-2646-63ab-52eb-5ce08b3ab3b4@linaro.org>
Date: Fri, 24 Mar 2023 09:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] Change the default for Mixed declarations.
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZByhueDO9J9MLuSJ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 23/3/23 20:00, Daniel P. Berrangé wrote:
> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
>> Hi
>>
>> I want to enter a discussion about changing the default of the style
>> guide.
>>
>> There are several reasons for that:
>> - they exist since C99 (i.e. all supported compilers support them)
>> - they eliminate the posibility of an unitialized variable.
> 
> Actually they don't do that reliably. In fact, when combined
> with usage of 'goto', they introduce uninitialized variables,
> despite the declaration having an initialization present, and
> thus actively mislead reviewers into thinking their code is
> safe.


> IMHO the status quo is bad because it is actively dangerous when
> combined with goto and we aren't using any compiler warnings to
> help us.

Thanks, TIL this, interesting.

> Either we allow it, but use -Wjump-misses-init to prevent mixing
> delayed declarations with gotos, and just avoid this when it triggers
> a false positive.
> 
> Or we forbid it, rewrite current cases that use it, and then add
> -Wdeclaration-after-statement to enforce it.

I guess various macros (Q/LIST/FOO_FOREACH_BAR i.e.) already abuse that.

> IMHO if we are concerned about uninitialized variables then I think
> a better approach is to add -ftrivial-auto-var-init=zero, which will
> make the compiler initialize all variables to 0 if they lack an
> explicit initializer.
But we need to be aware of:

      With the option '-ftrivial-auto-var-init', all the automatic
      variables that do not have explicit initializers will be
      initialized by the compiler.  These additional compiler
      initializations might incur run-time overhead, sometimes
      dramatically.

Also:

     ‘pattern’ Initialize automatic variables with values which will
     likely transform logic bugs into crashes down the line, are easily
     recognized in a crash dump and without being values that programmers
     can rely on for useful program semantics. The current value is
     byte-repeatable pattern with byte "0xFE". The values used for
     pattern initialization might be changed in the future.

If we use -ftrivial-auto-var-init, could the
-ftrivial-auto-var-init=pattern form could be more beneficial to us?

