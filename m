Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAF22CCB2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 19:57:26 +0200 (CEST)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz1wj-0005yg-Rm
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 13:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jz1vt-0005Bn-Ir
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 13:56:34 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jz1vr-0005ju-JI
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 13:56:33 -0400
Received: by mail-pf1-x444.google.com with SMTP id a23so5603235pfk.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6GL7CHjVCi6+Cjl/CP8IgZgs518ZlIvQR/8YfJso4t0=;
 b=H6yFdTMxY+4l3R2RWyDt8nbt98kRzcKzZ6QBSObx5ab+EWO4pvg+iSEbYq01ouSc0B
 dZguS7OJFL8f3bvfqafYwWmHyeV8nHilXzlBEI5vzZDPEEW7N6uKDH7BIcmqGyinZvWa
 uqdSf52ZUbuK/cAXZRm8l6uupV5WWEG7j8goqm1Ub5pes+T/4wmc/8+VOW/gBMvWIM04
 b4DGKA4mK7g5cqpKn5bf3FNDudvRTbXJiZDkXmsZFiflBetGxSy/CXEuHmNXF6QUB49Z
 cZSWXQI2ctjfu9KpU+2EVvO/AsqPeKEjl/0amT4iKF/SnENKyeQ2IaRuvbz5eiPoqdEL
 eGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GL7CHjVCi6+Cjl/CP8IgZgs518ZlIvQR/8YfJso4t0=;
 b=JclnxDqYljF5yO8+N0QOaJVUwZiJFKGFUMkxD7xiyfSvPNqlLUeKJTZ6JAFS75J+Mm
 wdM95bE5RDjCu97r9r3lP7SHdbe+GkNqOibiw708nh56S52Y+MhMVdF3pXrY+0nLtK6i
 jK7ZZ2CfUoqiTbpSxVlZ+8rjD2ee1Loun5UyXdJcnvyv8UclKlhr0aoVyf4xbSN8g3yW
 5UxzXUeqZk/FuaNhV3wc7IsLn1fZPMhsatFaWdoGtFFe25eWAQJVkwpelJPXXCj48G9z
 5LhN8aoEWMORnD0UVSXi1VUVu0ykd05bz3S0+YtRlf2UxYz3NQLIL+lAVSnqCxwTcoEe
 qo4g==
X-Gm-Message-State: AOAM5322Vcjbd3Bdb2WDwQcJxb6VgWA2SEOR1WqkhJreMiqw03iQEXLI
 REWxZVe8ah+IfHp9c1Gqmwv/iQ==
X-Google-Smtp-Source: ABdhPJxhP1o1FQP88Alk8U2SYdz+5Pggdk2aUJNW3yESb4B8kQ92xxJjckdv36SagyqTE4RfZsUUkg==
X-Received: by 2002:a63:8f51:: with SMTP id r17mr9541512pgn.124.1595613390146; 
 Fri, 24 Jul 2020 10:56:30 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 i7sm6646918pgh.58.2020.07.24.10.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 10:56:29 -0700 (PDT)
Subject: Re: [PATCH v5 2/6] target/ppc: add vmulld to INDEX_op_mul_vec case
To: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
References: <20200724045845.89976-1-ljp@linux.ibm.com>
 <20200724045845.89976-3-ljp@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f65c0b9-2406-30a4-440b-b6a635ceb5e6@linaro.org>
Date: Fri, 24 Jul 2020 10:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724045845.89976-3-ljp@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/20 9:58 PM, Lijun Pan wrote:
> Group vmuluwm and vmulld. Make vmulld-specific
> changes since it belongs to new ISA 3.1.
> 
> Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> ---
> v5: no change
> v4: add missing changes, and split to 5/11, 6/11, 7/11
> v3: use tcg_gen_gvec_mul()
> v2: fix coding style
>     use Power ISA 3.1 flag
> 
>  tcg/ppc/tcg-target.h     |  2 ++
>  tcg/ppc/tcg-target.inc.c | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

