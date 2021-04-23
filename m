Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9D3697FD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:09:59 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzJW-0005Ic-Ez
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzED-0000c2-EQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:04:29 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzE8-0001LY-Jl
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:04:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id u15so16969307plf.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UDkcB5dZTYSLnDKEaNfte138h3n9PavrtGA+B8260o=;
 b=T8q4hvWMSlIcFiXPAtXctqINT+pM8Z7v/DFOx57F1XfchCEzJw4Zs5RQdAxruOvaV5
 QthfdGbIYrOeJftw16xjKGYaKQn9zpEUuuwABExfrw5pq1ItqPDD/cImTzWiSIBWqh2c
 +xzfPBuejIeKkVvwHwItfYmQPF37CmHGu8v9wZ93ZsIJiYQ6wlZKeIHz6zZFv85wLlCV
 zrxbr6ZkSsisUEY6IATF0TU2Lfp+oGCZevPQnc2JwxWUxJ8KTKLzV2DFxfmK+ZRau/7w
 BOh436Zc8RQ2TB4nm3foIe39WlplVJCPVn3hsHO0iJkYZK+OC2SUABKskOnk3+A1hpEY
 G1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UDkcB5dZTYSLnDKEaNfte138h3n9PavrtGA+B8260o=;
 b=lZrLSKRoq4x423Nd8GJboZIcemBIoAfF60TwNcfSfLbUxHjRDWQqm551hKxbLsMy83
 UjZWl2+XcK0zuGFjszDZh42eQUogGdVJfAriTQc6hi7YtvvXx2zjeJFsNYJbqi2tPXlE
 dzqPsb+WBOG32ikOxTNwpaMTPP23vZMTW3vHoenC1CjA2ZesnOfRrRyxTpRhKrToUl5Z
 N1NLgseqEVnb0TZiyeIw51ua34bu0SiuTeOTIgeQEGoeLhBQeNU43IHfX5eWISP2cknQ
 VponVcwdOMybU263NcLRBgEuHz/M5PtADcjI1T6DjVzH8R5u197v8zBPqO0xiWKjOHoT
 bIFA==
X-Gm-Message-State: AOAM531487ErTUU2EjCufEKi26YsPcdm7Y8ExD/s9pYuTcGwmyG95kwQ
 kGavZG9GttqLCQVDQdh+8o3JtQ==
X-Google-Smtp-Source: ABdhPJxoAZ0womhZBUNENzDqIUk5QuDwjb/PzF5TCpTsRkaRxyp9bnbE/A61eYGBaWMZxt5SiHk5EA==
X-Received: by 2002:a17:90a:fa84:: with SMTP id
 cu4mr6944402pjb.2.1619197462501; 
 Fri, 23 Apr 2021 10:04:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k20sm5122457pfa.34.2021.04.23.10.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:04:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] linux-user/alpha: Rename the sigaction restorer
 field
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-3-richard.henderson@linaro.org>
 <87wnst711h.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86bd29d0-3718-f8a0-3e39-fdc80800596d@linaro.org>
Date: Fri, 23 Apr 2021 10:04:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87wnst711h.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 3:16 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Use ka_restorer, in line with TARGET_ARCH_HAS_KA_RESTORER
>> vs TARGET_ARCH_HAS_SA_RESTORER, since Alpha passes this
>> field as a syscall argument.
> 
> I'm still slightly confused - but that's to be expected from signals :-/
> 
> Anyway I understand that the SA_RESTORER points to the vdso trampoline
> (at least according to man sigreturn). What is ka_restorer - if this the
> in sigframe restorer?

Both sa_restorer and ka_restorer pre-date the vdso trampoline.  They allow libc 
to register a trampoline itself.

The difference is that sa_restorer is a field in struct sigaction, and 
ka_restorer is an extra argument to the sigaction syscall.  Different targets 
used different approaches.

>> -    abi_ulong sa_restorer;
>> +    abi_ulong ka_restorer;
>>   };
> 
> Maybe this is something we could expand a little on in the difference
> between the two here (or maybe in the later commit?).

Perhaps elsewhere.  This change is simply to make alpha line up with the 
generic code that will replace it.


r~

