Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49250418110
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:37:22 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU53Z-0006W8-A9
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU51h-0005Fw-Go
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:35:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU51g-0004Sz-1V
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:35:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id w29so35023044wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QkkMTAc7bF//BT6atW9t6Bi7jnEWL0qgiKzFCCsbuEY=;
 b=jKOBl5xP1W6t1jl34v+M7ntBCSKtQuE7WXpadmSu04hBI7gR4Do0C/3KWV3aQaTo/r
 u2dKd930SwNAi9bVRFFn6FUZk54hVml6PnGRWpU9Bjdpw0xKKhFBvAo01CosWKT1Xx49
 n2QSSFMBmwHw+1r8Zz9rjpBPVelTHW97ZKPuvw2I7T8daGd1T54ZAY682CrbxDMwiBfF
 IKdGOu8E3uQOQuUkkyQ/Mhd2yyx1y5yeOvpr77so8aTYhdz2VJtup/VFSZPeB941DrE1
 BaIJ6Ishwvbpskg+VK+MF3xFKo/CMU6YKM0e2pq+Mjd1mGBCtnA31agEQHRQWrekweY1
 Irfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QkkMTAc7bF//BT6atW9t6Bi7jnEWL0qgiKzFCCsbuEY=;
 b=kYXNyTPWG6ECG/YkaRefP4CtkMpFT32VSpKXS4eSM43p05jQwq5R85Vob2ONLgqHe8
 SKlSC+K2NLhUkunXiJsZUvYWc+b+TBR4DGzg9uEb/tx9CEULpIpknDG2tEZt05V/SP4e
 Hh1yq3qbWrdCCp4py7qFwiTHlo3VyK0ukjUvNWOm9FxaT6T4f6ODgHEuBFTHU+qY7Xqx
 bstLx/v1RJoAUuXUEghBUoRM45Cc1QT9R2T6qs6d3cpGuD9Xkb/WJFKEOPA6uNCfKfJI
 PJFQSB8nIH6zfOTXS9dh4wMesLtCnx7nC0qIB7+2jvCTDdlk3IUTkq1cQqvEIdGejcM0
 CDOw==
X-Gm-Message-State: AOAM5329ryGMvB88x8x5NMoKWSKPO7XAOtLCHfUV4c30yWwOfo9JL/ou
 PZ1Fw3UYuZ6PmwIUhHGIAN9OgKe/9ZQ=
X-Google-Smtp-Source: ABdhPJyTC5fgThsNB7z9Ilo6+yaK77H7RSCRI3WWPPvc5YL4CXg8nZFweu3iyDoHCJ9zZWvwdTWrmw==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr16622679wrk.125.1632566121926; 
 Sat, 25 Sep 2021 03:35:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y197sm17363704wmc.18.2021.09.25.03.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:35:21 -0700 (PDT)
Message-ID: <4c026150-88f5-2e18-16a4-86dbf3f23f2f@amsat.org>
Date: Sat, 25 Sep 2021 12:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 06/14] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-7-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
> FreeBSD-wide.

"architecture agnostic (on FreeBSD)" instead?

> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h  | 3 +++
>   bsd-user/i386/target_arch_signal.h   | 2 --
>   bsd-user/x86_64/target_arch_signal.h | 2 --
>   3 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

