Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B5139F7E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 03:25:03 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irBt8-00062i-SB
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 21:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irBsN-0005XV-3k
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:24:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irBsL-0006fY-Uz
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:24:15 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irBsL-0006ex-Or
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:24:13 -0500
Received: by mail-pj1-x1044.google.com with SMTP id d15so3642062pjw.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z31S/nb6htj+5TUlFmOwqu5Soel9KqYiiMbI+lCx7bM=;
 b=GS+Y0yXG43sCPaIoXiekmUyMtzXjqqESp6kUvIllIqr+RvYNtDB/8c+ubdU4GPYK7J
 MvQL/xEzjRX/S1q/xldpK7x6sQMfd8E9O6MBrpUg+Ofl823ISEGu3jK2c17+VveQIDde
 bRtBM8G+ed/IdHSs0bpVGREYyJ5AGN4XFAT8msLnGzoqN3/Ay50s7RniZwUpAMtxgWjN
 WZdDn2HsDLKdvvxSkJzAcrNahM8rHL8DLkr8fvr9Tl2Nm1+m0vd9VVSDUD/MBwuSik8w
 lOrS65ETMQmTilc+aLITre69SSnsGTF7TLgQKKO2aogi1o+jY6pugT7bCZG62Db6P7du
 GUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z31S/nb6htj+5TUlFmOwqu5Soel9KqYiiMbI+lCx7bM=;
 b=iB/jZEYnJ7Z6wIjqLsggD2J/H/8lzNEEUG0BU2XhtMKD/Hpsan3/OO3obVQnU8/S6m
 4vA1zDPc4D3xOfBslArehLgRpCbghTVOI2b2z/4oPi7FKNdDwo8HXlWqHu82fg88KX7b
 TpW5uUSdTxlmGM92xEhw3zxKTxw6fecVz2Xxx4pT1NGrw4X8wuqUur/lQ91QP6vSUKcJ
 bhwKTXbMzQHfvVL/eHKevt51MYbWmPNWZyhTedmvGCX4LAZSmYYQ7DL52e1loOkERUGb
 B9lFRcGnf7jtMvmlLVtfV4rNBtko9tn1Il6rX3+qQWeFqISlwY5sDApQL4EZloudTAF1
 PNxg==
X-Gm-Message-State: APjAAAXUqk2E1Un+k5Q1pPS2vnR0U/uQf3FuP/ozkK0wC58KD5x8+30X
 19no7vr2pkBoIUsJkf0Wv0LnNA==
X-Google-Smtp-Source: APXvYqzlkjpG5hngRWPehXwbVxwLJCl0lV7lPzMe09BUZz2hGts2sDOu9/cpDo2hdsNGZSD4fwCmcg==
X-Received: by 2002:a17:90a:17e3:: with SMTP id
 q90mr25479314pja.139.1578968652767; 
 Mon, 13 Jan 2020 18:24:12 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id z26sm14648245pgu.80.2020.01.13.18.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:24:12 -0800 (PST)
Subject: Re: [PATCH 3/3] remove redundant check for fpu csr read and write
 interface
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, chihmin.chao@sifive.com, jimw@sifive.com,
 bmeng.cn@gmail.com
References: <20200110081220.891-1-zhiwei_liu@c-sky.com>
 <20200110081220.891-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fff313b8-766e-f7e9-4044-837261d38def@linaro.org>
Date: Mon, 13 Jan 2020 16:24:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110081220.891-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/20 10:12 PM, LIU Zhiwei wrote:
> The read or write interface must be called after the predicate fs return 0.
> And the predicate will check (!env->debugger && !riscv_cpu_fp_enabled(env)),
> S0 no need to check again.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 24 ------------------------
>  1 file changed, 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

