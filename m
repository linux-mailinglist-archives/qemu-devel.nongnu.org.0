Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A215D484916
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:03:51 +0100 (CET)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4q2A-00047V-3O
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4q1H-0003Rh-L5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:02:55 -0500
Received: from [2607:f8b0:4864:20::1033] (port=38440
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4q1F-0001tk-Vj
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:02:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so719750pjf.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 12:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v/En5T7R9oSBf4wmNvryZeBMJZKK6Mvh4vWCZXCd/cM=;
 b=Ua6TXUCHi93lUNkPG/vIJR8PsH/QpdcfPckGDn0SaT2lbAYfG/IntQWe7yJBkN/djk
 CIQZ8XdjsiRy/N5t/Xww7qJLH1BzsWXA5WepQTTq9S/kDptbdW5bFev83Sn6NV/hJtsl
 Vxjmirmz2j7OpYNNx2fLAFIWLO6ZXZ0v9qmzNFgiK8sqmy1sjLoPJLZS6Wqsts8THdxN
 WWX6zJztgWWk8P2hDCwF0abN9J/rupPrYvM+v5QKy8lU0j3RSC3eEh3+JECAH/etwGfX
 PrukW8N+36v7qmroShpHnOl7DN6uRByOTxwgCX4bX9zYVe0BKSMX/JhmCoQodo4Di2x0
 7/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v/En5T7R9oSBf4wmNvryZeBMJZKK6Mvh4vWCZXCd/cM=;
 b=MbpfZSrOVbOia1vLlFVDcQ5/ZN+zYNGp0BbFTtRbKjdHa1m1XNBGrUvYeHJL3dk/ta
 GDzNAcTaKB9dBPOU/d8wYfIvHCArOdvoc0N5qzr02NZdMCI10zL3xey0199UUvfsr5w5
 dVUp9b2ZViOahKx6od80zH0vkBFYamXC2MSPboWPvVTwYW4UPM0H+qPYWeJolDmydR6K
 EYKQcZ4SFZxsC0IuwBP2PT7Slm0wbBSIui2I+d/aHzdUPJYD7LSYyF1RBHqUzWv0O08D
 m8dZG9BbJ9lvBENNgYGRptHxUxH4+zTO3ffB9aSSLrFV6UW/6AitdrUib2ERJ4xkj5L2
 ZX0Q==
X-Gm-Message-State: AOAM530JX/J4IQS0S3mc0zVKowegOBDEKPhIQUI7x/sFCv9SY0Fpu/22
 L0PIOq8aniSzdbZXz/mvcUHTlA==
X-Google-Smtp-Source: ABdhPJx9ebN/z+KEmVaYJ/MsRtX/RSqVNcIDDxDXfY8LTo+xVqPujWV3q0URabcMG4nn5Jv/YQCMqA==
X-Received: by 2002:a17:902:eb44:b0:148:b1ed:1a33 with SMTP id
 i4-20020a170902eb4400b00148b1ed1a33mr50490678pli.149.1641326571788; 
 Tue, 04 Jan 2022 12:02:51 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g12sm44037786pfv.136.2022.01.04.12.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 12:02:51 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: don't adjust base of found hole
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220104113202.766884-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eab13fa0-8642-cd73-4946-c60a841ffd8e@linaro.org>
Date: Tue, 4 Jan 2022 12:02:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104113202.766884-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 3:32 AM, Alex Bennée wrote:
> The pgb_find_hole function goes to the trouble of taking account of
> both mmap_min_addr and any offset we've applied to decide the starting
> address of a potential hole. This is especially important for
> emulating 32bit ARM in a 32bit build as we have applied the offset to
> ensure there will be space to map the ARM_COMMPAGE bellow the main
> guest map (using wrapped arithmetic).
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/690
> 
> ---
> v2
>    - also make same adjustment to fallback
> ---
>   linux-user/elfload.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

