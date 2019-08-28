Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518DA0C3B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 23:14:41 +0200 (CEST)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i35H6-0008GD-8E
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 17:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i35FU-0007DL-HW
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 17:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i35FS-00035O-K8
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 17:12:59 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32824)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i35FS-00034h-Ef
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 17:12:58 -0400
Received: by mail-pg1-x542.google.com with SMTP id n190so389092pgn.0
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rKg5uXu8xVYHwbJTrSTfbot+TrzOrLJBO14nAQBRBPs=;
 b=XoRxVD6/UzTFVlmyy1uF3BOmr1HIU2yoFREJ7sEe9PP1fL4fpCLtpNPQ7qMoFZf7KB
 KWyTR65l+q1azqRPfWwE9ZAdi2QkGrSz33clrEZ8tbqeuqCABFvwZCf723c3kf6QYC/1
 RA/D5jFl+dTl8MffnjpaQzKKz2ti6+Gjn1CieEX98/+y6qbfM5cvfBe4EBcHUxuqkW3O
 LDu2QOGEQPEgAcw5nUKIftXwkABlCf3EOB0eD6GDBpSB72Tjm9KnHqbRgzuZiso5yWAN
 gL2UaVihehEMvI3f0q3SuFkpZntM7AmTYw9YV43kURs2YK6K4WORUKojrT0YwyrMKpVH
 UjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rKg5uXu8xVYHwbJTrSTfbot+TrzOrLJBO14nAQBRBPs=;
 b=uPjoqOs0AusDdvQeFR+BmJfl3tud/MtJzLh1Bco2xyD0A/PDUyJ2kVc4SJSsHjSmAf
 1j0cuG99/hCxfGNorbtLkC4YWwdNySBgnaEH4rvQxcnqcJbSSygD22GXZuUNBOYO4O17
 HricBS1s4h0rf22ciYl78d98e9AuJbvTgF+uYMSYSZRNvttRbv7ejLgtgY2RhTRdRgP0
 JwbCSYJrc1FzKupSPldoBnvVppmirdEudaWFgzNt8yRW5Kb3xKa62nbsbc1fkUH/GzIf
 5aH9zuxQPcljOH9aic1yymEv070lqH++e5bS8YKtsPdfQ8nIuLDDyu7KOibZ7OUEcGhh
 PJag==
X-Gm-Message-State: APjAAAUVJsgfTp9syz/Vu+9ujwr1iQKd/3BEjv2JyN+rFSRndG1Fmuvt
 akIhVAsh5QpGeJmzFn7lW9QyRIKKDO0=
X-Google-Smtp-Source: APXvYqyxdt1nkfCu+5wWUThXCV3fDTg/VTK3OUJNYmWLQmEqgG7h4ZEHCviBFMJhbrOOCEqvz+2rQw==
X-Received: by 2002:a63:484a:: with SMTP id x10mr5149800pgk.430.1567026777486; 
 Wed, 28 Aug 2019 14:12:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n24sm84535pjq.21.2019.08.28.14.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 14:12:56 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190828165307.18321-1-alex.bennee@linaro.org>
 <20190828165307.18321-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <99368f25-5b29-8b6e-a0e6-245efa24cdb4@linaro.org>
Date: Wed, 28 Aug 2019 14:12:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828165307.18321-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v1 5/9] includes: remove stale
 [smp|max]_cpus externs
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
Cc: Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/19 9:53 AM, Alex Bennée wrote:
> Commit a5e0b3311 removed these in favour of querying machine
> properties. Remove the extern declarations as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Like Xu <like.xu@linux.intel.com>
> Message-Id: <20190711130546.18578-1-alex.bennee@linaro.org>
> ---
>  include/sysemu/sysemu.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


