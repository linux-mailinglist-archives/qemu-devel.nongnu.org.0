Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944604E7A53
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 19:58:28 +0100 (CET)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXp8l-0000qC-K3
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 14:58:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXp6f-0008T2-KC
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:56:17 -0400
Received: from [2001:4860:4864:20::31] (port=45119
 helo=mail-oa1-x31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXp6a-0007ZY-1b
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:56:17 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-d6ca46da48so8958590fac.12
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rwMh2RyxtSCWiXXAsWobL3j9IWygqjBruHz8rGo2lVM=;
 b=Ou6wEFMmA5VHiH685/KmTxgBf9r+5rdRZIGW+LXRolDQhhRqUc3T01uBSX9BYEVY+Y
 8wA/gfwLITZi4Ad5p1GMnIpZVDZHtE4YrmBs/xwRHduhYXXk/tfT1m3KfUOU/FYbADl4
 He+KhlyXEE0F2Drwxq/Q6dOIsUDWocTmoxkpe7dXQpadyBoYMPYmmytmrsJFTdrkU4Qq
 o5GM9Lo2KsZeFmXfr6DUlAdoTldp1K0J5E6m+0MMkSRqA4OU1a79X53LJRaR6RdSy0BC
 eGCbytcVG96NO+GLQ/IY/nI9BsRUcoo9KvMRPEWAjPvB3xeTYLWwQklB7ZIvSqW0K6Xu
 V42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rwMh2RyxtSCWiXXAsWobL3j9IWygqjBruHz8rGo2lVM=;
 b=Xf9VJCwjLoRPGJF4dHcYVmUHwbqfcs1IcTuC8dFatn4MISmWipqUYRPCereMYEWYN8
 zKiipOfdtwDeqHwT5jU1ODPNaeb7aSxZrRwq9p5qS1NXWIW3M6Tlc3ya2/DvAXSmEl6q
 tedjgzabRaYmOzquXRU6IXTjjQisqBmwaBkVYbWQj6CJj0H/2gVm/S4qD06cqrYNXKkJ
 RqK7RiVCFj6hOTR3M8j+lvYGMWN4zRfXX+20b7OWA/VYbUz5QQWdIBkzsfOfXeNQZZDg
 id9qZUafzbPqY7noj8qaLdUC3Av6Vj+cV4PFDwl4rVWpd9qj3vd0DI/5esgaYs7bIOow
 anrw==
X-Gm-Message-State: AOAM5316elrB/RdAJwB/4Zaekzz5G7TV5l1sPdY2hzKWQIxlUe5QwzzE
 ZVPQRNMaNvKedsXxSJlERmZDaw==
X-Google-Smtp-Source: ABdhPJwfKVCiHy3OigY8Jj89Wpk+awzWfDCdjoPWOztsi295o3zy89H7Ee5RF8ZH6v1teqTITEJK4A==
X-Received: by 2002:a05:6870:d0c5:b0:dd:ad86:85ee with SMTP id
 k5-20020a056870d0c500b000ddad8685eemr5533055oaa.10.1648234560693; 
 Fri, 25 Mar 2022 11:56:00 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r81-20020acaf354000000b002ecf46e8016sm3156432oih.51.2022.03.25.11.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 11:55:59 -0700 (PDT)
Message-ID: <6d5795db-036a-7b76-ff72-46fbf5a1f784@linaro.org>
Date: Fri, 25 Mar 2022 12:55:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/7] linux-user/nios2: Adjust error return
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-4-richard.henderson@linaro.org>
 <CAFEAcA-RSLe-fF+EcuoOfXnOynz8zc7_N_AnNt3uRx5PZTvq9A@mail.gmail.com>
 <CAFEAcA9fDkVZB5StxGBp=7cy02zQwtZ+ZLVzxQcH3-bJ8hv51Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9fDkVZB5StxGBp=7cy02zQwtZ+ZLVzxQcH3-bJ8hv51Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::31
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/22 07:37, Peter Maydell wrote:
> This turns out to be because in 2015 kernel commit c3525940cca5
> switched powerpc from checking against 515/516 and instead made
> them check MAX_ERRNO (4095).
> 
> (If anybody cared about seccomp on sparc hosts they'd probably
> want to fix the sparc kernel similarly, but presumably nobody
> does :-))

Indeed, thanks for the archaeology.

> The kernel commit message mentions some infrastructure in
> the form of force_successful_syscall_return() where syscall
> implementations can force that a value above -MAX_ERRNO
> is still treated as "success". In theory perhaps we should
> have something similar...

In theory, yes.  It affects 3 or 4 syscalls.
That said, nios2 doesn't define force_successful_syscall_return. :-P


r~

