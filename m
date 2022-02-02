Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E64A7A19
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:15:57 +0100 (CET)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMyp-0001FR-GX
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:15:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFMou-0004JF-A8
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:05:41 -0500
Received: from [2607:f8b0:4864:20::432] (port=40767
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFMos-0000Il-C9
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:05:39 -0500
Received: by mail-pf1-x432.google.com with SMTP id e6so368237pfc.7
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FY43W1BqQEbNta1/LemvogZcm+nQnWPyMFInU93nZbk=;
 b=vHTJ+xeAybyz9wGzTCvVxvz5x1N1SnAz1xOMsbev+hHDugF67LHalVmoc105alwoKh
 ZEErtc6tXLYK8jKhe7JABRxOixosXfVoz8d0Nt6/lyXUNjUodNn9O53K8YfelBpIDk9N
 K3YkxThJzdxnTBrq559/QgJsJMwhEIaG0FSJcB30bmQaiRXs9sU1mk5vnuXCqG7/Wh3l
 COBrKpKpcTVUxBLDPBr0JrngfG13i2WE4UQPHk6kzAmMpHWOn21RErylJoNVH1+1nW10
 OE/wcNoxOI6mhhrk7GO3JayyhWCr6TdOIyTEzaqOLRh67GtAvtctpZF2FP9nGcCNPIWP
 kQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FY43W1BqQEbNta1/LemvogZcm+nQnWPyMFInU93nZbk=;
 b=pxkh4A05wU7Yq2NejfpTYxSXooOZTSjLZoQJu4lKPklhTHKoSQ6xSvul2vyN7dIQFZ
 ZISh9ijEFMClHQVSzljfq/x6+oMIN5w4o3ldhJcwnpUzadJvQqapnhSmGiNWs2TLl7Ru
 0K+PpSLAnNAejMhEWE4Pj5G7eS9S7baz8x6JZLhMefwc9POUrQbOgUgEz8Xu5zDC4YKm
 z2+f9GVbbmhNw5M+trknkYzmzm1iueCEp6WmFuFbcINMCxJ+BBT4FoQVALJuL1y8vDr6
 +UZnuhh91oMOsfgE7pd/2MaOVDk2IbXCYpDT+q8eUOHiVp/1gWQJ1KfrohdWoXE+jh22
 zGrg==
X-Gm-Message-State: AOAM533ITpllzWbk9v3+igqAiQCKYmj6ybqm9iqhgeNGNMlto1ueBMKZ
 3hNNN91Si/YB+N8YApK5LY3h5A==
X-Google-Smtp-Source: ABdhPJxUCcFa8phulyMw1NwVqraRTumXVyqGav2DneamLkSQL5wfA6ulnAc70+3ZlBCd/f/JFG/YJg==
X-Received: by 2002:a63:f156:: with SMTP id o22mr5877249pgk.387.1643835936770; 
 Wed, 02 Feb 2022 13:05:36 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd?
 ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
 by smtp.gmail.com with ESMTPSA id c2sm35685329pgi.55.2022.02.02.13.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:05:35 -0800 (PST)
Message-ID: <0c7e5756-8bae-da8d-5feb-a393832b5ef5@linaro.org>
Date: Thu, 3 Feb 2022 08:05:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] tests/tcg: cleanup sha1 source code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 06:12, Alex Bennée wrote:
> We have a lot of legacy mess in this imported code which makes
> figuring out what is going on harder. Clean it up:
> 
>    - delete non-SHA1HANDSOFF legs, remove symbol
>    - don't bother clearing variables at the end
>    - remove #if 0 dead code
>    - some light indentation fixes
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/sha1.c | 67 ++++++++++----------------------------
>   1 file changed, 17 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

