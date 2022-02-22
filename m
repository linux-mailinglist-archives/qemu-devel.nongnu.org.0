Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49244C01D6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:11:50 +0100 (CET)
Received: from localhost ([::1]:53056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMaZi-0001dl-1n
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaVh-0008OF-Ol
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:07:41 -0500
Received: from [2607:f8b0:4864:20::530] (port=41516
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaVf-0002Zm-It
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:07:41 -0500
Received: by mail-pg1-x530.google.com with SMTP id f8so17809021pgc.8
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sBcl2vSgzSv5EE/U2KE3OZy07AnmFM5R0mPPYlLM4bA=;
 b=wNGyO84wa3pGu6pKm90h7cvrspVCaYaitEOjisNrhTyeoX3O6OZFa9fzfoNUpGqBlh
 /qL1ltQ5ZNCPgL14f7rTsH5BEX7DUrzIkBSr99czepB04GhX5KfFwY/D8S4bUN9AlmkY
 bWxybUnj/s7hxbem+nIH+EEwO1+ypMofoUh3eOJTQCy4YENdeuNbr47tyXTdFMQ8Kx1c
 y1swr3LHpRyvLM9lGWGy7NdF+Ls43X5fnzrJ+G9rVDCwyU5eBQtmT1AJGS3wyOVApKLL
 0YIGGImoceU3eDdedmhJJ+so5KEULI+5ZA0aBGK47QhHmrtSZlgZ5r3KdkIU2+syCBAf
 stpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sBcl2vSgzSv5EE/U2KE3OZy07AnmFM5R0mPPYlLM4bA=;
 b=6DfhkyoA6go2fpJ4ts7Mi4MJeKE1MfgM/kQjyuYVdZbfkcPFFHh9q5q+1rvjPWeV8b
 w6shvj52EdyZDhr9dkG78JQp6CY7xNBsOhfdADVDjYwSXwWcqe2r3ZBsNCu+KUqULgWj
 Q409sy+BT8+ZxIfnObc4CMOslkDHn7lZHjgKU4g1QFm2gHUn49wYEWlFnl2m3YpaZbpL
 PiIb0wiDMbEsTt2HqjXZTv6sD/g4HZvzcdz7AHPOX/C/R2yv3uQ2xv27n8YRoevPbFmE
 1KnVxuDYvJjT1pCCnUO2Kpjpl4iVc+YIrMF1nTU/pvHW2eWFVQY4SdGqfpFgaQDmCGnK
 YD1Q==
X-Gm-Message-State: AOAM533E85/N/rpAYV9lQcYa6RJHN6WRUfKVmCmg18Z5T1WJIpEnu3Lu
 RD1BwQzonmMICw8Fkh2b5u0eYQ==
X-Google-Smtp-Source: ABdhPJxsuqMtAmh89rZZI7Wkb6shD2HzemHRaHxrDEWNoR1R/TkqAImKSOK3alX1N33blF9/M0KP3w==
X-Received: by 2002:a63:4d8:0:b0:373:cf6d:40e3 with SMTP id
 207-20020a6304d8000000b00373cf6d40e3mr18004222pge.590.1645556858301; 
 Tue, 22 Feb 2022 11:07:38 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id 69sm21847659pgc.61.2022.02.22.11.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:07:37 -0800 (PST)
Message-ID: <9f1e87cc-56ae-711f-941f-29ca4c226da7@linaro.org>
Date: Tue, 22 Feb 2022 09:07:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/47] target/ppc: Implement Vector Compare Greater
 Than Quadword
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vcmpgtsq: Vector Compare Greater Than Signed Quadword
> vcmpgtuq: Vector Compare Greater Than Unsigned Quadword
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   - Branchless implementation (rth)
> ---
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vmx-impl.c.inc | 39 +++++++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

