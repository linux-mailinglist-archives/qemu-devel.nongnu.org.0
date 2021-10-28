Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BAD43E6AE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:57:07 +0200 (CEST)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8i9-0002Eh-QV
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8fj-0001Je-I4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:54:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8fh-0005e2-8n
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:54:34 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w16so4871177plg.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3OrddT/kNAFgrDtue1MI1XOnmn0MQPWEoPAWWdGw/UA=;
 b=j5xy/ykmd799iZZjQBZ4xhk1mxHYv2dQBMjbpRDYh5AIBiY9pBEQE0ZuVgh3JLmVNt
 h0MSe89mETdZwXP+i4lhb5VxE5GOVfaQqh0hA/9ooYviPGtHiekGhI+pGYgt+V5aGbSq
 44Aet9gxjDqwfNGxRHbngRYItc4v1q8+tLk5u7OtT6KHFQv3Nw7Mwep1hbukLnaF5TOl
 0eNFM9lHvKDCGgxH7a4hmqN/4hvekhI+CQ4tSFhAeDdYFrsXy8JIGLijxZho0O3ufusU
 bAdAeSxXUVzJNtcnid42O1AlYXsM4k2D+6wPxluxipF/pdHdQS/ozFl+eNNkM1WHSMCH
 4c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3OrddT/kNAFgrDtue1MI1XOnmn0MQPWEoPAWWdGw/UA=;
 b=mifarMHSXtOrYStF8KbWaSQYj1FYdly5Lq4o7XrewFudnoLgvU7z3bkoAHykQeK/zx
 boMkKApJe2uCcStwE8Db6ig44Kn4y7kgOjiFIYpKed3kaFpRObNF/OvgE/147hJn5PDD
 +yCP7nYbUrXCbsBRAtK9dG6phE8vaecYjo8FFAr/VPZNsI21TCx+OZ8Qx7ChVGWURbsA
 SsRX50H37KkdYhWShizCUYnugXp+s+ADHZW2P68qS9QdiCASjncN/ePetNFfUykPmhfK
 kQxz1p9U6CUxJX6fpjC7knHlDw4My6QyIXnTkDU6WCMEmhu9ZwCW5meA1rrKS3C8JEK0
 q7tA==
X-Gm-Message-State: AOAM530XrcHQG2E9l62vof02sWx0n8W7f7kg3Yk+OlUxczii8AtuTX2w
 ctplkbLA8r60/jBzKeFIKWexZQ==
X-Google-Smtp-Source: ABdhPJwtx9AOTAAftEampnRk8mV9/7j8IBFossxEZTcCHtJQDsISPQ0Q5KNuoorxwHyuOTh2bResUA==
X-Received: by 2002:a17:90a:530f:: with SMTP id
 x15mr5810754pjh.156.1635440071634; 
 Thu, 28 Oct 2021 09:54:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b14sm7771612pjo.44.2021.10.28.09.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:54:31 -0700 (PDT)
Subject: Re: [PULL 00/18] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2a3e189-2070-3c05-c679-12518f16c7b7@linaro.org>
Date: Thu, 28 Oct 2021 09:54:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 9:43 PM, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git  tags/pull-riscv-to-apply-20211028
> 
> for you to fetch changes up to 344b61e1478c8eb37e81b96f63d8f5071f5a38e1:
> 
>    target/riscv: remove force HS exception (2021-10-28 14:39:23 +1000)
> 
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 6.2
> 
>   - Use a shared PLIC config helper function
>   - Fixup the OpenTitan PLIC configuration
>   - Add support for the experimental J extension
>   - Update the fmin/fmax handling
>   - Fixup VS interrupt forwarding

For avoidance of doubt, I'll wait for an ack from Alistair, whether or not he wants to 
update the two min/max patches to Frank's final version.

The code appears to be the same between v4 and v5, but the commit comments are improved, 
so this is not something that could be fixed with a second patch.


r~

