Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A446C1BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:29:56 +0100 (CET)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueHr-0005y4-D0
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mueFN-0003D4-Ue
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:27:21 -0500
Received: from [2607:f8b0:4864:20::1035] (port=36537
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mueFI-0003JM-NE
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:27:19 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so2443330pja.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 09:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4H/YAg+UPcJQ0CWFsvzYkd7cLwseatlwF+t/FglP97Y=;
 b=YS0udSnxB+JyLLR9z56Qmia7NWaD3Z60eUBowhKiDU+oIxKAAFUJZAyPyYNEkTSIiO
 Uur9vFWY+JML9k0TYbgDlYO4qqkT+pk/ksLpLHdQyAYl1ay4lJdyYuXdovAXub6jLVVU
 yrMHtHRQx5a8Zo0yhnT+9XRNsuCktNJ7g1jGcAAaikrmDpGaUrgl9C3G29GfFrD7jFTA
 0M5JmySq2a6Ngd7EsCpSKWfoYiIjIj1B0JT5IusbAyPAXsoRgfKe2gNq8xYHIDS4/I+/
 nVSPWFnyVccgt9RUBgjMfcGZlVkKTvT5r/FGn5Qc9qC57xUUJCnNHfCtVsTJdSf/FtvX
 mz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4H/YAg+UPcJQ0CWFsvzYkd7cLwseatlwF+t/FglP97Y=;
 b=43MOg+oRCS6uP5qdy8EdEWSs3/klenEP/lVHiKLeMG+RDyDWQwLXEJcwYEUb5MQVhB
 5YRYB7uQUrxru5GXmV69vUOkpODFQ8BzgZ6doDxREZSxYMgbzrt4zhxew8hDxvPj5TWd
 rGXpGzNMMxBhxT6q5a+c4KHOSRPcYZih6TmC7zx0xjLmDLPhJqOf3RBh1kjOhW8IKA0w
 g/lp/dc0uLQiGW7vuqVUxuFqA5MyD5vJNXald9bJV8fPJD78KSWNgWlSkfQ++YYZpWln
 J0ntmh4VO1+MH2mNqGM2qWEfoOb592Mpq2w3zvlrlmwI1vz4btBG1pqDtWDkrxzzk1E8
 w/Cw==
X-Gm-Message-State: AOAM531UsNCRW9wVGGF/5PVT84YivdHiFqf7VPvRig9rWojXTr/MONj0
 5ytZdBzYlz/N35BNfdq9b+22p2kYrGUJaQ==
X-Google-Smtp-Source: ABdhPJxS66n7VRcB5+z7ssQQBsP5Vg5YmnnbJl+bL9Za9mzPfV/xpVUTfZEJEt8iXoivMLWdQV2jyQ==
X-Received: by 2002:a17:90b:1806:: with SMTP id
 lw6mr420144pjb.53.1638898035190; 
 Tue, 07 Dec 2021 09:27:15 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h15sm292128pfc.134.2021.12.07.09.27.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 09:27:14 -0800 (PST)
Subject: Re: [PULL 0/1] tcg patch queue for 6.2
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211207143936.258418-1-richard.henderson@linaro.org>
Message-ID: <42ee7732-5e0c-93bb-8745-b831e4fd3a59@linaro.org>
Date: Tue, 7 Dec 2021 09:27:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207143936.258418-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 6:39 AM, Richard Henderson wrote:
> The following changes since commit 7635eff97104242d618400e4b6746d0a5c97af82:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-06 11:18:06 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211207
> 
> for you to fetch changes up to b9537d5904f6e3df896264a6144883ab07db9608:
> 
>    tcg/arm: Reduce vector alignment requirement for NEON (2021-12-07 06:32:09 -0800)
> 
> ----------------------------------------------------------------
> Fix stack spills for arm neon.
> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        tcg/arm: Reduce vector alignment requirement for NEON
> 
>   tcg/tcg.c                |  8 +++++++-
>   tcg/arm/tcg-target.c.inc | 13 +++++++++----
>   2 files changed, 16 insertions(+), 5 deletions(-)

Applied, thanks.

r~

