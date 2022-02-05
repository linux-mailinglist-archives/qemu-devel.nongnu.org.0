Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81024AAD13
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:38:42 +0100 (CET)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUde-00038T-2c
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:38:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUXm-000655-8h
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:32:38 -0500
Received: from [2607:f8b0:4864:20::62f] (port=34571
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUXk-0003Of-Ii
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:32:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 10so389403plj.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bzQSKigVv7ChxRJ079njJcI9PCD+fMkr4kkpY262cS4=;
 b=mt+Z6A6QZb5VAc6qCC3FR02bMegsvduWCviZI98wUVftX7NoXZ7XOOaEIlOT6lRdqS
 0msBG3U/gSFl212L9zC6l7KRD4qwUOT0aFQtnsFGenPXzIwwfganx9TMf4TeQuYePSB2
 mQJcM5jEcqU9Zu7fLTQ4wX10tmHjqPXFlM6bdxFTNLrSDoKTJ/R5sCHff7JWboX0AgMS
 yJNXgqgYYrP3GHFMvp4Y1elnxONWlavBrlj7TcomfRDQbedzyt5oFnlPpogpFLgQTNYF
 jLjDxFAg1UzFQlQatZVduRYdCkN7NHd0g7WLoc51co9ilqXRQk5Tuq4lv1LheSZGK/4d
 uhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bzQSKigVv7ChxRJ079njJcI9PCD+fMkr4kkpY262cS4=;
 b=qii4wwcgqsaHTRWtE45jUPLBXy0VAvh9exo5y36B+Wy69XzLVMzS9swMHoJ3ugVUQk
 3n9XfdbTV5wcY7mVNRJISex8dPDHhsQmpApKDByszENp5eLdB7T6E8dMGHqI676jUmWA
 VsVjQs9MJjhY59JaRcW2V49rs3LZIwZz5IfPQv+9flRZXbtROXAt3wixU3JY4SdjFHJl
 fRSr0SONvJdz1+b7GDHm/Jsq6Mcc1KSkR3EvxWJd7URND78CDNwJj1Cjm/WWa0Nu8ihC
 OeBwg+fKQVga/A4fzM1jw1ynqm0fOjma3pzT+C00P0CBtO2EaR3cRcYeFWkl4XIKPDO4
 /GaA==
X-Gm-Message-State: AOAM533wRGcqDGfS4skbuUJ9SgdCMAC7hL4GB4wcPqVuJGh4Zoz4GSsS
 GKwk05xQROqIqDEmgC/yKeT7Nw==
X-Google-Smtp-Source: ABdhPJwSgCpypkE1XAWtfKpRcqxsZKzvQu7O12+RABFcwdFoCzWbgewXDlp+cRSwGrkyedxAH+vgdQ==
X-Received: by 2002:a17:90b:1c0f:: with SMTP id
 oc15mr10570926pjb.17.1644103955190; 
 Sat, 05 Feb 2022 15:32:35 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id i17sm4717180pgv.8.2022.02.05.15.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:32:34 -0800 (PST)
Message-ID: <51bb38cb-617d-70ae-11c2-6607688df617@linaro.org>
Date: Sun, 6 Feb 2022 10:32:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 20/21] softmmu: Add qemu_init_arch_modules()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-21-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> module_allow_arch() is the single target-specific call in the
> whole vl.c file. Move the module initialization out to arch_init.c,
> that way we'll be able to build vl.o once for all targets (the
> next commit).
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/arch_init.h | 2 ++
>   softmmu/arch_init.c        | 9 +++++++++
>   softmmu/vl.c               | 5 +----
>   3 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

