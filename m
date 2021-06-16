Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBAA3A9E92
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltX7p-0000kw-Mu
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltX6V-0008Mi-RD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:05:19 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltX6T-0002Xc-0s
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:05:19 -0400
Received: by mail-pg1-x533.google.com with SMTP id t17so2199733pga.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hu06k7g0hVVb64woqfLTrHuFhO0K25kWuVjFRa3AGrk=;
 b=kTFHkkHgiHqF2m/k9bOAsP4SH+Iz1pO3uUXnIpNuW+AfTWx4zHGzAYuDnOKvxmgWfp
 ialF536LsRyfU6VVKXMc9QzzNhi5p309m6zDwDrWtzCB3ZtrqdwDZf+2JIohiSQ4huoc
 QsUXytAYOw0Ssmsb09ILKwdxUZc46QiNyc0o267xuNXQHKX6MuT74y0zXxOmX4eXPJ3C
 2nGcLla14B7k40r3BXwpYddB3wm/0x0gCr6SvqtwRlcE283tsN9TonuPqbG4thtmHEPE
 bqodBHVEvElxHTvB9YkCaj6R5nJU+e+wx/yW+PjgJgfn/b5i/XTwXHLfvM48EyXjfQ70
 OO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hu06k7g0hVVb64woqfLTrHuFhO0K25kWuVjFRa3AGrk=;
 b=GvNl15XJsmTTUv7I77mFpDc8beHuvAvSN8TBYnWwZsnJrIG4pP0/n7Ly9KIc33pG0Z
 htc8CVPIFvj9AIkFXuDsWIessFbXyKRVjqKAqgVFMLf2LfVbgp92L030mb3o7BFLVjTr
 zBqHjUAztDhUZZ4O9R+eYH2ET95Y2HlRsyPEBD4ATjMYQ1yFuKKaxYiV/VOeqIKb3cr7
 +sw+Bah2GxwheOMZukBs81T+xK/2U3JA+3z5as+bka2aBGIfG0wLJ+TK9KXf3RFKsBLD
 kH/TM58nPIiqCgAdRwybXLxg0fXKUGgPXq4Vz2AwBjUbafxmEBfPXfBCShgo3AjeV0hf
 cnSA==
X-Gm-Message-State: AOAM533Z12fT5IMXYhm1ZDjM+ag0biG15BWgJ6C3q5BehoR4yGocp/pW
 trbf+OG3Fr8X34nEhzETwPDlhA==
X-Google-Smtp-Source: ABdhPJzOq7gAncgbfsQLkZ+h8fVCFlnUisEMFx60IYoI3hc6mnBjTKYZipL2C4PvrjAqIxziSJKwqQ==
X-Received: by 2002:a63:81c3:: with SMTP id t186mr12539pgd.123.1623855914735; 
 Wed, 16 Jun 2021 08:05:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u1sm2765045pgh.80.2021.06.16.08.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:05:14 -0700 (PDT)
Subject: Re: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-8-richard.henderson@linaro.org>
 <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43f61832-1d76-31dc-4ba4-e35007b16fe7@linaro.org>
Date: Wed, 16 Jun 2021 08:05:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 1:07 AM, Taylor Simpson wrote:
>> +    /*
>> +     * The on-stack signal trampoline is no longer executed;
>> +     * however, the libgcc signal frame unwinding code checks
>> +     * for the presence of these two numeric magic values.
>> +     */
> 
> Hexagon uses musl, not libgcc.  So, I'm not sure if this is needed.  The signals.c test passes for me without this change.  Are you seeing it fail?

I copied the comment from the kernel source.


>> +void setup_sigtramp(abi_ulong sigtramp_page) {
>> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);
>> +    assert(tramp != NULL);
>> +
>> +    default_rt_sigreturn = sigtramp_page;
>> +    install_sigtramp(tramp);
>> +
>> +    unlock_user(tramp, sigtramp_page, 4 * 2); }
> 
> Put the closing curly on a new line.

That's your mailer.  It's correct in the original.


r~

