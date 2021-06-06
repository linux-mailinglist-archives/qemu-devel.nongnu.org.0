Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACF39D085
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 20:49:49 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpxqG-0001fV-48
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 14:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxnj-0006jL-3M; Sun, 06 Jun 2021 14:47:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxnh-0004V2-Ob; Sun, 06 Jun 2021 14:47:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id c5so14854313wrq.9;
 Sun, 06 Jun 2021 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jU2+5eoGGzDM3UL6JWyyWl0RPadzYcsQmTtSNIYMRaQ=;
 b=VDIOO9G6eOy/JOguL8J+EyPI2wH9FtNWe0Vdgn1EEUFry1R4yzdjRwfKqz4a6UNCbO
 mRRC0GYrRE2hwxdth+NEvHWq5mw8bMubLUv8cxIHsd+A9W5bavFyLE3wxLDTyGgIQBDI
 PnsbJZD5r+69lGArexDmQ8W2Ybw2laerowz6HR4lLMgDP8TOSCqcbGD+BiulcvRgc+qf
 V16bObgKx0Z4qJ56jAQmUTNK5T7FDpp24tSUg+GfSiLLRf+34EIueJtanViITV9NIc5/
 Y27FppmB4M4tEw3uZowW0XMmONnWRZsCSitjW1VJU6UDVpBeCoxE9PX2nSRJFxIdg/qe
 qAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jU2+5eoGGzDM3UL6JWyyWl0RPadzYcsQmTtSNIYMRaQ=;
 b=VlF56Yytj8G1P0L7QTUcyBRjDsLWrbnlsRHPYQqF7wD1Yaff+fu8SId7SEprGgHm3e
 CspQ8C358udsEGZu9pxq9dKX7iy+XQAB577Szh2hZcfLRAYsxPBctKkowD+/oIEjeufV
 3mkBsWSVDYjjwkBVrLcgLYyeTb8rG6ZYJrcOuKOqG4fm4aCyMvafovo761W+khgSRsED
 AyatcsjlRejCseD77eb4XtanbAVPpHKZbvCHCbxMleUATR2IiKPq1gsiFk3GWbFNDqQj
 G76M/AsNZIL05ayuMG+Ec3K+Ea+FCHWBNSEGILAbOG2iJVhGHBuqOx+BY76tHVwEGIHf
 kjCg==
X-Gm-Message-State: AOAM532Eu0b/dDf+ic0arHh/bQWFBnAayOw+YK4X8DYpgiEA4J/AopUm
 7jmoaOJVPbRTKwSdSR2g6DJAz4hxW7NyRQ==
X-Google-Smtp-Source: ABdhPJyy/O6TUn7QGMQWrdwsQjstYEI2O++oze0fM6VQkDn8BLvfkOW+i9dTAi84mShbGq8IzcvtJw==
X-Received: by 2002:adf:fd4f:: with SMTP id h15mr13683618wrs.245.1623005227759; 
 Sun, 06 Jun 2021 11:47:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id d3sm12960595wrs.41.2021.06.06.11.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 11:47:07 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Diagnose UNALLOCATED in
 disas_simd_three_reg_same_fp16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210604183506.916654-1-richard.henderson@linaro.org>
 <20210604183506.916654-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0f0b290-f530-df91-3878-89e6cbaf1d5d@amsat.org>
Date: Sun, 6 Jun 2021 20:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604183506.916654-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:35 PM, Richard Henderson wrote:
> This fprintf+assert has been in place since the beginning.
> It is after to the fp_access_check, so we need to move the
> check up.  Fold that in to the pairwise filter.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 82 +++++++++++++++++++++++---------------
>  1 file changed, 50 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

