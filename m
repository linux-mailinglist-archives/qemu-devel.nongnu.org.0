Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90564159798
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 19:02:51 +0100 (CET)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Zs2-0006YK-LD
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 13:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZqO-0005aI-Uk
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:01:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZqH-0004GB-Ju
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:01:06 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1ZqH-0004Dd-Ac
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:01:01 -0500
Received: by mail-pl1-x644.google.com with SMTP id a6so4570370plm.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1LKrGWzKOLViciAcW3pz8ORuYOa1nshyxrugJUhAKtA=;
 b=rcx2ahayxUQ83wmq9XnjoJQRLMv0/3XBFJOu01Jj+hCbDhTNK9YTVGt87ryZ4ZDPKc
 9QQhy6lk8CjZ7O+IfdTSm9lECg02DIM/HwxTcWNu37gSBQekwVjHcL2Ztt2xVOQCe9pl
 BN2cwK+M94g77dDnXGPufjms6RMxmSniSW6EsBHIz1ELJHM6xzy1w3RR/c+vldF1HUfc
 nQgXtMRxUk5Df4B5ZPwp1KHN7rLM9pMLA4pEG8uUpvEA41uPSXbmHUDSAiFPsFzGPGnY
 oxndkYCvdpPEEKKZu+FKmL4O4AYTobSYrz62biDyE0dQHZXFbc6M3/RjGAyHjDmbhQS4
 U/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1LKrGWzKOLViciAcW3pz8ORuYOa1nshyxrugJUhAKtA=;
 b=ATxJdqqrT0wfYhc+Jq9i1hoV4GfPD3Y1emchnq52w/K4+j7lcVv0oo8amWa0Nq7xJ/
 FisDFWWpNBwy3u5FGUrmuEe/DnJB5INsrBULuk7fTn6fM4PdLkg95rhAIS/CoCU9oIaI
 YRcLlsyPRLsOuG+nM3msDx96hE8YCWJr2CwQToRyT0UOclCshCnryRfmJ6/u+MJ951+F
 JjOhthfp92+XoWqaudRLdIAJIeiZiPeGJt3B58Rik+95p2k/N689Z5vIVvZpPuAahnyB
 Z92MZfWBCSPslmfR5PT8wXM0y4H2//0b1F5jyJU5S8y30Hj1LmSRZlqdX7Ywd7/BRcAF
 8ADg==
X-Gm-Message-State: APjAAAXZeb1uGmgKzBzXwFeR/uhAu//q8xFX5Aluw2Y0m5vXnk47e1Kq
 oC3hs0zCvxI88eQlSRunE4BmFA==
X-Google-Smtp-Source: APXvYqzbFmvxPXrMZChDG7QFbyrZmV0OMSXOaVEtEc5uTCaWOinaujKP//O7WeNZbLSUo0Ngqn5dHQ==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr4125871pln.225.1581444060181; 
 Tue, 11 Feb 2020 10:01:00 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c19sm5032104pgh.8.2020.02.11.10.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:00:59 -0800 (PST)
Subject: Re: [PATCH v1 4/5] target/riscv: progressively load the instruction
 during decode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200207150118.23007-1-alex.bennee@linaro.org>
 <20200207150118.23007-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5266abfc-338e-b3c9-fd98-d9de989a7266@linaro.org>
Date: Tue, 11 Feb 2020 10:00:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207150118.23007-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 robert.foley@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, peter.puhov@linaro.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 Alistair Francis <Alistair.Francis@wdc.com>, kuhn.chenqun@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 7:01 AM, Alex Bennée wrote:
> The plugin system would throw up a harmless warning when it detected
> that a disassembly of an instruction didn't use all it's bytes. Fix
> the riscv decoder to only load the instruction bytes it needs as it
> needs them.
> 
> This drops opcode from the ctx in favour if passing the appropriately
> sized opcode down a few levels of the decode.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/riscv/translate.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


