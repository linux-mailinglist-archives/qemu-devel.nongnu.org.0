Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299AD438578
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:00:16 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meO7j-0002ph-7r
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meO5Z-0001Dx-J4
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:58:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meO5X-0003zz-NW
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:58:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id 187so6799242pfc.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HaV8MeHb8ghGTpuj+xnctRCWJIE2cvKHN0V3yWjVYQA=;
 b=vOWzolTUhOYaqePqL/JriYtz5KIW7Je9S6u24N4PLAmCFtL3oArzFPP8/hJnlXoi3X
 v70Ng+Q+i7Juv39WyEKG/bMdQan/qKhGuN4dOhQyIHW08fQdndsxIrbTmpiLO/qDvfh4
 9V1RMWoW8AZ0tMuXJOCPKSQ5r3lDUQJszEe9FO0JAQfZ6vwmFfKwuKn1+nRGs4vCbWOr
 IPfs93mHBdwClt45APEJLmCCRdvEc2GrU8xAAf4l1SGCdVlDxNfnzYkSX0t4GDa6oa+Q
 GeWFsbAmvByTzYq97d+qnobQAwnG1BLAvTJYsqapI43Y+tOJMD6ieBbmFy0sONCAihkW
 956w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaV8MeHb8ghGTpuj+xnctRCWJIE2cvKHN0V3yWjVYQA=;
 b=xJOl9oI4aRxp2AVGSWoHRfV60PdeA3jn8U/lnamnwS0qHWAr9NNKm1gbALiXUOvqgt
 0rdKIZ+hHt9QIdV53BuD6g5b13IbgURDQ6i5IsrVai1eHYMDgby7sBMFk8ioukHe8d6+
 L9Og4ocgi/GVjph+4x8oYtVMh/Mzk/BCg1blmGKgh1ZK5N5hbqdLTz68h/GSwKG+aChx
 VVKNvH9w1F/7atwozYGc53thd9Nw0ol+U07EG+6HopbfVPtZIDfdaWRDIM4Ntv6zml1l
 HpWJkppYc3LWu6NaD2CJOYDBzCouf2Z7mENtLHaDnrrbWTkFGqk1z2ID5knmuCrEmM9e
 oQBg==
X-Gm-Message-State: AOAM532ffUi7kNTPUCQDcs/oOOkE833IT0D158cXH/zu28eqQniDyPSb
 LQ97MnTraq1WnFyAqV0D6NkRnQ==
X-Google-Smtp-Source: ABdhPJzWv6UmNuuJB+V6Z5OfmKsk5aplsJwc7eB843UQlWheF+TkENxvaCYIaQ6ZE+9jT5XYy7N7IA==
X-Received: by 2002:a63:7405:: with SMTP id p5mr6044894pgc.426.1635022678230; 
 Sat, 23 Oct 2021 13:57:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v12sm13680216pjs.0.2021.10.23.13.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:57:57 -0700 (PDT)
Subject: Re: [PATCH 26/33] target/ppc: added the instructions PLXVP and PSTXVP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-27-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c902f57e-8db9-7ce3-5c2c-4fa0e808fd0e@linaro.org>
Date: Sat, 23 Oct 2021 13:57:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-27-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Implemented the instructions plxvp and pstxvp using decodetree
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.castro@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            | 9 +++++++++
>   target/ppc/translate/vsx-impl.c.inc | 2 ++
>   2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

