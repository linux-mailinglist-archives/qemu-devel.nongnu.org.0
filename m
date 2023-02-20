Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411B69D3B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBRE-0000rN-1g; Mon, 20 Feb 2023 14:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBRB-0000r4-UV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:02:57 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBR9-00008s-2s
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:02:57 -0500
Received: by mail-wr1-x434.google.com with SMTP id bo30so1660746wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RdyAnpW8GeJDNuRDRNZqyjfymD7KE05XIkQzv6/Oplw=;
 b=sudE/uMRF66MHebA/Z1F4TOMvTMjOSxE/BXlanMszKekpjP4TaPDjcObON6+L6Hdqh
 A7D5Thc6GXgFZtPL/25c+czP8Rq9EIF7W+fS77tgGx+mn9NiH58zZY7cUxuhG1kiKDdQ
 vPr2kL1R0dc8lIBuR3TSpubKuc0F6VzgcZBWN1ztfSujQdsFWq0rmRabXu+3J0CNQcd1
 WsDob0SeKXKypfOtsMseWV3s7lhWi1iZcYewWc6pBdQH8bqhzG9Po/0MtoQLPNAYGhgF
 k0qep9lIKvr3T2P/ehwT5NEE1HXN3I94YNRpy+fUerD30YRyqybLLBuaCDZ5k2os2qQk
 bYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RdyAnpW8GeJDNuRDRNZqyjfymD7KE05XIkQzv6/Oplw=;
 b=axI8t3kwlj1yFk7G051+Q7i1PMFxYEkdeGWilzz4QbSI2Lpj0cyxSSJOczYJeKssrZ
 GOP5AEakj8UlNMtpMEbfqVzGMn94zkEcOtHx+dlGKv4NoR194ytPPLtQqiX/RhmvQS79
 AERp6j8eMX2aM5Fy4YQXKd1/4U02V39iE/Up5V9VVnrhPBnO9Nnm9PT+EnGFfto12Ms0
 tl2OO/lqOYcNzMejt4erDOjBJ7j7d/k8vtwhARLqbXDTJ/cUV5JR4LdYS9SCKzxEDWq9
 knTxAEpH93BmAqCCcSC1PKg2Eq3Oi2bHYnXHZz/ObNCP9KJM7OE5L8P2cjhk0F4nGKC9
 aaSA==
X-Gm-Message-State: AO0yUKWsCrIpKkCK9rK3sh8IE0xngDetJqrDIEbzxFCQjo4jwE1tgQKL
 Ckqz6CPvZ8YgYtUoIxIdODllfQ==
X-Google-Smtp-Source: AK7set/yk3h38uYrNHlIDCr3dWmUcnwje+SknA9GhQpD+KgUPQ5mOuAS2jdLwxVbfjB0NW+K2dMOmA==
X-Received: by 2002:adf:df08:0:b0:2c6:85ef:3cd2 with SMTP id
 y8-20020adfdf08000000b002c685ef3cd2mr1008864wrl.33.1676919769359; 
 Mon, 20 Feb 2023 11:02:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcc15000000b003dfdeb57027sm945666wmh.38.2023.02.20.11.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:02:48 -0800 (PST)
Message-ID: <0624a2c5-aee8-4466-939f-76e602331e2f@linaro.org>
Date: Mon, 20 Feb 2023 20:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/22] Block layer patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20230217150829.283583-1-kwolf@redhat.com>
 <CAFEAcA-6hq=70fQvWXEU4D0_9g6p4rrSxiXZ2-+yZa3fgb9jxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-6hq=70fQvWXEU4D0_9g6p4rrSxiXZ2-+yZa3fgb9jxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 18:01, Peter Maydell wrote:
> On Fri, 17 Feb 2023 at 15:08, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:
>>
>>    Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
>>
>> for you to fetch changes up to a4d5224c2cb650b5a401d626d3f36e42e6987aa7:
>>
>>    hbitmap: fix hbitmap_status() return value for first dirty bit case (2023-02-17 14:34:24 +0100)
>>
>> ----------------------------------------------------------------
>> Block layer patches
>>
>> - configure: Enable -Wthread-safety if present
>> - no_co_wrapper to fix bdrv_open*() calls from coroutine context
>> - curl fixes, including enablement of newer libcurl versions
>> - MAINTAINERS: drop Vladimir from parallels block driver
>> - hbitmap: fix hbitmap_status() return value for first dirty bit case
>> - file-posix: Fix assertion failure in write_zeroes after moving
>>    bdrv_getlength() to co_wrapper
>>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied as commit 2d89cb1fe5 ;)


