Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6F392237
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:41:24 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1HH-0002yG-K9
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm12O-000449-Jx
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:26:00 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm12K-0003MZ-Ka
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:26:00 -0400
Received: by mail-pg1-x52f.google.com with SMTP id m124so2027012pgm.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vyaHEdGH+1VGR2pSUQD3cjyWlYy9Bpn3ltKL3ew7m6c=;
 b=w2z3S/3rGpgafig5WM/ifR1yraEhQLd7VT+yP9uvqHkkztFNeSvWR1Ie0MO7aU2p9H
 JYk2K0LbQtUvoGQK9ofrxDCjamtbeCQENziQd5y6619hyTtIt3vgdx7tzBMN7rYlK7Jj
 Ktnl+NSB/fgz32JakPbSyCRJRW/5ZwOsNL+DMOlZWnm/37NptXTmxz4uC1ZCEViL4jb3
 wvfllN5kKfBcNOgxc4lzCes/uOzMNrOMeUZr1MDx7ElpMFhtXpreCMN4lJboiugAayvC
 YYJuMkLHd0V2IkhnjdFDjshemwYlNtyBCv/CmPVJ2DklLc/pDmx9LP90SUjTHlx2Tq/z
 Sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vyaHEdGH+1VGR2pSUQD3cjyWlYy9Bpn3ltKL3ew7m6c=;
 b=CgpiqBjaRiMmTixSNT5Zf16RIVMMmw7OmSyXRwjzTx6sDnBoSJqFwvuBaQQqy9PTZu
 RCJaZ0djy9yADe0/g6W+6RHnqfqdADAuySsvAH6xsZa7B4OmN5Cgzk2JIPcz8v4BltCy
 3fCUYorrOTrPM+yE9UJ88G+SIsAPHxssboVYfH/n6a8wf1osTJcgSX95OSBiFYhJnVJn
 vmWp9lrKAywZUNP5ZYV53yHEMDfvnxDUHNKwpa7Ay2jJ2zDWPSjUnZfIneBYpr6Gl1SP
 HuTdEZI/otJb4BHv0RrkDe7iYJvsI3D1Bo6vrntvF2bSV9eOGyz9tSXBVyTxKnu/Ue4f
 Gj8A==
X-Gm-Message-State: AOAM532xydlyGGgCGsMaD8d7eFSwvF1yfmQZPNTjEgRx+dQh4kYMPlr+
 hlUkNZvJPg+bgnpLZi0JiNyw2g==
X-Google-Smtp-Source: ABdhPJys1TXUPHIcWH7jiz3fsn6Ea1gvlw5B5S9a1tQYFXojJDsCMDDsFOZUdCV0TxY27KlBuY1Lfg==
X-Received: by 2002:a65:5181:: with SMTP id h1mr478531pgq.330.1622064353908;
 Wed, 26 May 2021 14:25:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t141sm140935pfc.3.2021.05.26.14.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:25:53 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd05fbe2-b01f-6a4b-a3fb-c67abc0e1c62@linaro.org>
Date: Wed, 26 May 2021 14:25:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 1:21 PM, Bruno Larsen (billionai) wrote:
> This function requires surce code modification to be useful, which means
> it probably is not used often, and the move to using decodetree means
> the statistics won't even be collected anymore.
> 
> Also removed setting dump_statistics in ppc_cpu_realize, since it was
> only useful when in conjunction with ppc_cpu_dump_statistics.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu.h       |  1 -
>   target/ppc/cpu_init.c  |  3 ---
>   target/ppc/translate.c | 51 ------------------------------------------
>   3 files changed, 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

