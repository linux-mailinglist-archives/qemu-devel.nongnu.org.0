Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF761962D8
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 02:25:01 +0100 (CET)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI0Dc-0006Ue-Fl
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 21:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0CT-0005fG-6s
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0CS-00025y-6t
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:23:49 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:47063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0CR-00024g-OT
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:23:48 -0400
Received: by mail-pl1-x642.google.com with SMTP id s23so4133825plq.13
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 18:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sHUfkc2Eq4QJBTui5n/7pAYATtsU+IdtGtpWWVZHv6E=;
 b=XikUvToIBTf4eWz2HgoFpMXRPOzDts/MfWfgySiPGpdNAWR8WwZ534HyUH4w968uiZ
 epWt7Y9TMmQ1uJ/5/u9m3aqfIYeRcx7Sci7vmtMOl+uffS4KIi1KUhSkhrbvVwZr9szH
 3Iv4wMrKtsfn6utXvK4J42YfEGn/8ACvk2bT0Ys1xVC8FgHYk1B7u6t7wDsEQ1FwnPlW
 NUhUxoJBq4sfYsYWkXge6u/O6/Cq8Rx+XGwd97DLTWVb+aDIRJm+kOE0xs1wW9K/V5zx
 okwHnnYRVNExgKGX9jMuJL0O0lsOFaQi/B9f3zUOFrXFuxt8SLuT4IvmyOPj5vRSnpTA
 HA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sHUfkc2Eq4QJBTui5n/7pAYATtsU+IdtGtpWWVZHv6E=;
 b=Tc5CRbHH5bLjEkI+v2nATAifh/WQ6Qq+CisiUtRF7uAkvyTEGGlnnY1E2Yq8iwnkeU
 LWDtyzq9Qvc2GPMVCTfRneZ4zx9srykIMDkE+7xEXtS/A5T6dpgpSnmie3clhvcGsjJe
 Si4mJhH5Ml4l8EdRUfAtlBOBe/ZELadTltdAV0Y2x77vh4PbDjWxyIUZWLn4g5aJWkVz
 SuprFjypC1/qv+D/Y4p1xKyjl7zt3Difv70WBqxEbMGkMcDldbx/0+yrEv7OgQcTa8hd
 FxtN4xYAPnYvQIrRqHEi9wjb9QH9/4dpO7xOgwUDabN/pMyJsw9FdQD+l3UWxSfvZdn9
 l4SA==
X-Gm-Message-State: ANhLgQ2SH2ZlTi+jx1wysiwQqEd1Xorr1YWR3cx/KzHsXCApPm3+6LNf
 RV24Ow0QNy+WUp1nwu7KJHufXA==
X-Google-Smtp-Source: ADFU+vsWtnVeJxHDLSwYmEXaNsruWyC4DBP1N9a7c2wADkhO3VOtc08/s/Mn5DuoNcqQzMpb6UmtEA==
X-Received: by 2002:a17:90a:c583:: with SMTP id
 l3mr2423213pjt.84.1585358626647; 
 Fri, 27 Mar 2020 18:23:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id z11sm5023408pfa.149.2020.03.27.18.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 18:23:45 -0700 (PDT)
Subject: Re: [PATCH v6 27/61] target/riscv: vector widening saturating scaled
 multiply-add
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-28-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a122966c-28af-a9d7-3fd8-e9abdd9d6994@linaro.org>
Date: Fri, 27 Mar 2020 18:23:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-28-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  22 +++
>  target/riscv/insn32.decode              |   7 +
>  target/riscv/insn_trans/trans_rvv.inc.c |   9 ++
>  target/riscv/vector_helper.c            | 205 ++++++++++++++++++++++++
>  4 files changed, 243 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

