Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3E32F36F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:05:15 +0100 (CET)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFlC-0000Wq-AN
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFix-00083R-Um
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:02:55 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFiw-0005fG-Fi
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:02:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bj7so2661625pjb.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDCucv2iMtNYVhajKnsANwMYALDBcAKpoTZBiIfmPiU=;
 b=dRlOTqnCv6ZmdjwJKH+sZ9i/8Fyv9koE9ZOjfC0VRagcay3lwDlmv2YegbMlnKmgpY
 2TSTLAGQZkdx83w726o4rffxtDGoF3eBuZe8kB4XA1NLB/ZOhctoj80c8Ar8zXhP/42X
 tz/C1JExwV9WfdGVUDT9BP2GfhHU3Qioh68qfAV+JBbPQ76h1er4XQGqzi8e4qHL8+Ng
 W8GDkD/B2rW/k+nagHHGP6y3be2c2zWLlnc3lrrVirm97rEenHF6iw2nyVy2Bvf9HOFD
 esX0iKe6hWe2JvNa2Gh069tVkAhGsYpfGb4dSpD9wP8DBJBL99WcFBtO9VX+FLAfDUwP
 UPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDCucv2iMtNYVhajKnsANwMYALDBcAKpoTZBiIfmPiU=;
 b=DLCeUckOzfUrY7+3i3BR6ArdPL8e5SUHqqhSzUwGNIyo+20IelOXbtl0QM6flruU5R
 SxN/tany2a5gBYcKUf9ZgOt2FhFMxrvL6c/fEEDJGaW3vDVdiHV6GVAiLRa0ijlBIBpY
 9iGLgYoIjf17SjY64umiz/fdiMT1QOqsONj9xQC45gA6qbYazC1NOKLEkmphNR5relvY
 HBoUWBvbli1ulcNtkPpTmc5SD8caocCD8efKbKb+YL5zAbNlxIxd5Juwk5voNlFmT4cn
 ISiy2uV5a+DhxnIaadK65MgdBFpSQDTr66putXq1qRl7vpmpJTRZzKKm8TcMhzXzgGD6
 QvaA==
X-Gm-Message-State: AOAM532MzdXozB/6QW3Y5GpNDPhwC7/gSw/RWVqYuql+OCruKQ9pg8gX
 aPORpS6w7dncY6dMge0SEHjCJQ==
X-Google-Smtp-Source: ABdhPJyFvIYT/nzejNpa1XVygAjKeJcX4pmE5aAjOfE/X33pweUJdZMn0lk1tvrXvHtoJ5v8/jBSdw==
X-Received: by 2002:a17:90b:4d05:: with SMTP id
 mw5mr11746867pjb.217.1614970973010; 
 Fri, 05 Mar 2021 11:02:53 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 35sm3106675pgm.64.2021.03.05.11.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 11:02:52 -0800 (PST)
Subject: Re: [PATCH] exec: Poison Hexagon target-specific definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210219135754.1968100-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <135cb2b4-bedd-0591-4b63-fe6054075917@linaro.org>
Date: Fri, 5 Mar 2021 11:02:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219135754.1968100-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 5:57 AM, Philippe Mathieu-Daudé wrote:
> Commit 3e7a84eeccc ("Hexagon build infrastructure") added Hexagon
> definitions that should be poisoned on target independent device
> code, but forgot to update "exec/poison.h". Do it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/poison.h | 2 ++
>   1 file changed, 2 insertions(+)

Queued to hexagon-next.

r~

