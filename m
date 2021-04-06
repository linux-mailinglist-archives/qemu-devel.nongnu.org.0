Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93783557C4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:28:34 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnd3-0005yo-RK
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTnVh-0001FJ-IG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:20:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTnVW-0006kV-Lu
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:20:57 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso9850534pji.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x6JTHlFMYq7hhxDozYFxjVOgn4JRhCyrozKiUEfwSu8=;
 b=NDKgeB5K2rysP9gIztnpi+76bXohoNKBa7y0V0SOMXkCaCEZpZQAVvXAiLEMSnZIB+
 Pvau2XBor9jXIC1DxKWNzCUX2YIs230T6l2C37mvHEpcLBfim24ReReHMveb3O1lb97L
 TWlrBT3m6RuqOlWg/Fu6ROVpnHTJ0/48Xgn+od/qE1Wo/PnJ9+Cw71VA3quRWE/7N5R7
 IJ9odcGXjeWdzAOmZs+eaJ81sWUewfSli3ArEiz7AvcmAoKF/bVs/X7XtcjGyLrdd1EB
 4DjouZcnzPb18LhBKN0isDaO9ck++QicktZjXrv6eHApKZBYII4RSRtKbj6KdRPUkkLj
 q+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x6JTHlFMYq7hhxDozYFxjVOgn4JRhCyrozKiUEfwSu8=;
 b=CMA6WHT4EnpWyEnlcXmT+zlK0G45IKcB4zgrjML5xwkieytdIFyHZyHm5lSFh3apmX
 rm3lIiZ1TjQn2HHoZK5ZS3PZ8qWw/lXSjf8tPs46L9eZ7kXuDJCTYf+HfQtAx9hwUIVm
 gfTgsrcH1k5dtg1wyAUQtWW8GnSGfd7Kc6OsWEGwCDXPbk3s6qkBPOucXE5ETXVGaKpa
 Y33p2hl9rhvelyydT8E9akMBXYbNfKS8UB+A5CygxOV4MFrg3poqr/yjfiTZA4xA+WCy
 B1NkB4CCUujgnX0u/tRdTglnbrD2WNpcSya1i/qkfMOXK+6FL0LRPHymufrd8XATO3Ev
 yHBw==
X-Gm-Message-State: AOAM530wqBIwS9Ri460eG93mig5XVPGsglg+ZpfzG7nP/RtvnVdScsQ3
 2SnrEuj9MK5z3t6GC7+HITE8aQ==
X-Google-Smtp-Source: ABdhPJyrgwpx5JqC0xokxNMnGrmcugB23zea8xIV3U73EP7PFF7bHBLY+tMNMbPhfWSQxs9Dtzpolg==
X-Received: by 2002:a17:902:a585:b029:e7:3d46:660d with SMTP id
 az5-20020a170902a585b02900e73d46660dmr28541269plb.12.1617722443956; 
 Tue, 06 Apr 2021 08:20:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c24sm18716198pfi.193.2021.04.06.08.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 08:20:43 -0700 (PDT)
Subject: Re: [PATCH] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>, f4bug@amsat.org,
 qemu-devel@nongnu.org
References: <20210406132344.21476-1-Filip.Vidojevic@Syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7809edb1-42b3-1a17-ee7e-6a756d05987e@linaro.org>
Date: Tue, 6 Apr 2021 08:20:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406132344.21476-1-Filip.Vidojevic@Syrmia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, aurelien@aurel32.net,
 paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 6:23 AM, Filip Vidojevic wrote:
> NanoMIPS ISA is supported again, since mediaTek is taking over
> nanoMIPS toolchain development (confirmed at
> https://www.spinics.net/linux/fedora/libvir/msg217107.html).
> 
> New release of the toolchain can be found at
> (https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01).
> 
> Reverting deprecation of nanoMIPS ISA requires following changes:
> 	MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs
> 	deprecated.rst: remove nanoMIPS ISA from deprecated ISAs
> 
> Signed-off-by: Filip Vidojevic<Filip.Vidojevic@Syrmia.com>
> ---
>   MAINTAINERS                |   4 -
>   docs/system/deprecated.rst | 251 ++++++++++++++++++++++++++++++++++---
>   2 files changed, 235 insertions(+), 20 deletions(-)

I think we should retain the deprecation until you actually follow through with 
any of the upstreaming.

You didn't even bother to commit your changes to a code repository -- merely 
uploaded tarballs.  There have been no posts to the gcc mailing lists about 
nanomips.

A mere code dump is not active development.


r~

