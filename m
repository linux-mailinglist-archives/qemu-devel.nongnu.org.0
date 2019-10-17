Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2ADB166
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:46:19 +0200 (CEST)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7yj-0006Lw-O8
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL7BJ-0002WF-SO
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL7BI-0002IA-7T
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:55:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL7BH-0002Hr-Vx
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:55:12 -0400
Received: by mail-pf1-x443.google.com with SMTP id a2so1812311pfo.10
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LGYcvBdR/wXILe00F3w8p84K7ORKU5ZCwRHpZel5ezQ=;
 b=LBEDUk/ly3invh7v2BMP7fDb+Yn/68qnBWIIDPUcYGBrQOp9yWvyrjXzZzFJx/X3vF
 ZQHN5+jPlePHGlS7/5OETE1t32s+mL3Ulubd4Ix+BcH+CvxlrC0BSJ3QPlAjrHUIpb8t
 IhO7nPtMK17idR12E3KonDeWBBFLTBZVuGxbLdhY4FdME1AO/5T/gUA1eHu9h8JB1ZtU
 mEiZoIaUi4o3Sl76nw7dLk6oHkZRLwGK906QWWHfWQbIf0OT3pKVM+H0Z97fen8MEGl6
 Oq6oGRlwq73LvhvoV1my3Vdc1/IFUcBCrDuNyyBLn0bQYZN2MUD2E2m369TpjXeUX0uZ
 dBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LGYcvBdR/wXILe00F3w8p84K7ORKU5ZCwRHpZel5ezQ=;
 b=FKnn+99SpF4hBjhZF5vNB/gmv7ZJu/NZU/uyK97zmtgA7053R43FCi0WOAT+NgkuM6
 6FYWVTUsdbV3/f3O9nvxsQOL1RU20Cwu/gvQPdDe5kcS9UQl2pRyas99TJNiZDW0ChdJ
 SpczAegT3qysJm6wPL2vMGTNyq1vHPftjkpTGmpCs4zkLXTNiss32BUm4Q/MGcLGfEBc
 /GUIEQ3puCHuwxvmXgLERXyyXUpPILUiBaSu8hEhyHq3Uio92JfH0tFiyDfCj8O2soRc
 zlKhJXoRKchCEObkiNMZ8DGWOkd2pexazEF5RoEGTOu/foUkkTzEIUUh4ahur6R6Nnev
 jWpQ==
X-Gm-Message-State: APjAAAXnj+i+WQPxtgkBpb9duqBYHcQaUfzCzomq/791VNoRH6rqzaxy
 FRzEa3ZdPk06m+a7C8l7QkvArw==
X-Google-Smtp-Source: APXvYqzrw5MNgyUNBWRFQYQi8q77xxgjA3Yrcqo5wxLKPXogs4V0gvR3R9ujH/+veky2KrXoYBfPGA==
X-Received: by 2002:a17:90a:21ef:: with SMTP id
 q102mr4769688pjc.19.1571324110845; 
 Thu, 17 Oct 2019 07:55:10 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id l24sm2982003pff.151.2019.10.17.07.55.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:55:10 -0700 (PDT)
Subject: Re: [PULL 00/23] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20191013222544.3679-1-richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3df6b52a-45d4-5e33-437a-a57f5a17e008@linaro.org>
Date: Thu, 17 Oct 2019 07:55:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191013222544.3679-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/19 3:25 PM, Richard Henderson wrote:
> The following changes since commit 9e5319ca52a5b9e84d55ad9c36e2c0b317a122bb:
> 
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-10-04 18:32:34 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20191013


I have regenerated the pull with the same tag, including
the r-b and t-b that Aleksandar requested.


r~

> 
> for you to fetch changes up to d2f86bba6931388e275e8eb4ccd1dbcc7cae6328:
> 
>   cpus: kick all vCPUs when running thread=single (2019-10-07 14:08:58 -0400)
> 
> ----------------------------------------------------------------
> Host vector support for tcg/ppc.
> Fix thread=single cpu kicking.
> 
> ----------------------------------------------------------------
> Alex Bennée (1):
>       cpus: kick all vCPUs when running thread=single
> 
> Richard Henderson (22):
>       tcg/ppc: Introduce Altivec registers
>       tcg/ppc: Introduce macro VX4()
>       tcg/ppc: Introduce macros VRT(), VRA(), VRB(), VRC()
>       tcg/ppc: Create TCGPowerISA and have_isa
>       tcg/ppc: Replace HAVE_ISA_2_06
>       tcg/ppc: Replace HAVE_ISEL macro with a variable
>       tcg/ppc: Enable tcg backend vector compilation
>       tcg/ppc: Add support for load/store/logic/comparison
>       tcg/ppc: Add support for vector maximum/minimum
>       tcg/ppc: Add support for vector add/subtract
>       tcg/ppc: Add support for vector saturated add/subtract
>       tcg/ppc: Support vector shift by immediate
>       tcg/ppc: Support vector multiply
>       tcg/ppc: Support vector dup2
>       tcg/ppc: Enable Altivec detection
>       tcg/ppc: Update vector support for VSX
>       tcg/ppc: Update vector support for v2.07 Altivec
>       tcg/ppc: Update vector support for v2.07 VSX
>       tcg/ppc: Update vector support for v2.07 FP
>       tcg/ppc: Update vector support for v3.00 Altivec
>       tcg/ppc: Update vector support for v3.00 load/store
>       tcg/ppc: Update vector support for v3.00 dup/dupi
> 
>  tcg/ppc/tcg-target.h     |   51 ++-
>  tcg/ppc/tcg-target.opc.h |   13 +
>  cpus.c                   |   24 +-
>  tcg/ppc/tcg-target.inc.c | 1118 ++++++++++++++++++++++++++++++++++++++++++----
>  4 files changed, 1119 insertions(+), 87 deletions(-)
>  create mode 100644 tcg/ppc/tcg-target.opc.h
> 


