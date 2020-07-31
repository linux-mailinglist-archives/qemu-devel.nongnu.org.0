Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7D2349DB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 19:05:09 +0200 (CEST)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1YSy-0007sP-SD
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 13:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YRp-0007OK-24
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 13:03:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YRm-0004e2-Gx
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 13:03:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id t15so8153599pjq.5
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3qc1eOTO7U0oDuvpAwLeXRWxxvmVJayOTOKRCpLjgs=;
 b=pZaBw9tm8/RxOYym8ydiTtVza8jAKxFlWNmM48yK094HXglU67F/eB2/kz3EvSwyGX
 dIawA3Fv68Djw5m6qmbBfT0+b+E1m7Q49RcdipDYXi0Sl60JsmJN+xQr88QmtfT3CUu/
 UVI3/yufemluRjMfWD+fiakcR0Z5Hlmx+hOKESL4zx6MIbrla8RQe3IRVBeatnNvsKa+
 Z+vkdFvcs2iH1GD2FSHrGmBi7WM+M0UTc1UKU6iGl2AgKLYq+AnvvtEqMn9JpvDXZw4h
 Mv+4CQdD44o+vi6kTlbW6xKC7lCGdH8/rqrgac+OODjwwcBLomPrzxTsmOpCnfYXoF2B
 iliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3qc1eOTO7U0oDuvpAwLeXRWxxvmVJayOTOKRCpLjgs=;
 b=N1m2se4kwwpx2vF5IIhgDv3v+bXUI9sPfLQoqwYCDrvMa5ZdvXGLgZhYUFXkyLa0Dl
 A2RJzd+5DdwnL/OM/8k5AgVidnXNniaAk7dmarSbtVS45C07FuCfqdr+ULGKy8nc6oY1
 M1J5GkXtvPL5Gj3nuwDPOVFG5Gw4FnHxcG3svF22BQ1UiDdv+V39x2x9zMhQT4Vp1XAR
 7dy9m28V2G8cu1xoBUST1/+WiAwzbhd8gdHMorrUInquuee/kOKClGNO/l/ICuLZRN6B
 4uYhAjfBGwDocoJ+mU3Ou+4BiHJ2k0Ix9uDh34MAK9VAM/MbumEh+9WeLTRLhCio6cwo
 hU+w==
X-Gm-Message-State: AOAM530rxxV6vR461GsVZthElvG5CdBT0YHlemNnPpTPkjCZLELcnl/J
 0DYSuq/bE+n+JatiNgcsU3c2Aw==
X-Google-Smtp-Source: ABdhPJyPyLA4PC9uac3lKPqNebskhBQFHgINcT7FrbZ+CvbyiCzcOU/oI7KN0VlPRglipClhibGZ7w==
X-Received: by 2002:a17:902:b60d:: with SMTP id
 b13mr4298460pls.48.1596215032861; 
 Fri, 31 Jul 2020 10:03:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v3sm11310959pfb.207.2020.07.31.10.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:03:51 -0700 (PDT)
Subject: Re: [RFC v2 66/76] target/riscv: rvv-0.9: remove vmford.vv and
 vmford.vf
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-67-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3d029a8-abb6-9b20-8fe4-319d66b26100@linaro.org>
Date: Fri, 31 Jul 2020 10:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-67-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  6 ------
>  target/riscv/insn32.decode              |  2 --
>  target/riscv/insn_trans/trans_rvv.inc.c |  2 --
>  target/riscv/vector_helper.c            | 13 -------------
>  4 files changed, 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


