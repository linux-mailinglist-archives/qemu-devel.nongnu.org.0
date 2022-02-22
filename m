Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F74C018A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:43:19 +0100 (CET)
Received: from localhost ([::1]:35798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMa86-0005g2-Bf
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMa2s-000487-OM
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:37:54 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36827
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMa2r-0006Os-AD
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:37:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u5so16414284ple.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2j5oTLxBZyHBLW4vDyGRqxFzJ4Xirmejk5n4Bw3s0QI=;
 b=R5bC4Hm2iaJWPQokETnAFl+IO8rYst0HTivWsC1cA1uwyQQwIAGDPiidzPGb7qZOyg
 09YoMPl5QmHRUMTdDsldrWiUvhGm7w3S8AP65rEY/TeInLrVcOW3eCmBfcw+mlKj8/xk
 aE5IT4HHSNwa6f6ZXCPMsywUpf7z1Eu17nfvFu0YcTMncP+XwHlTKGfmNLnnaD5rQWSb
 oHjaQ3ST28+DLqgQyKQ1X5x+XbrEA1al4yWj6Q4FCbsWv9idy3vraQMzBRQ6fnNJMwgc
 dFsDgPlnOw/KErfNh5mNPVuiURcqMob9j/C/s9QUTMLCPkn6m2Nh0WIXgEkC3HN4MBSJ
 vEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2j5oTLxBZyHBLW4vDyGRqxFzJ4Xirmejk5n4Bw3s0QI=;
 b=KOVjmm4m2YsrUzPLGMrQp27AxBYrl8wr0+fDqSaTCGbsH8+ctrMZiIgokBUgIp45G/
 C9+XyA8ClhJD72QCH37Rc1OWHNEFd2G/sl28I0iJ2K+TivmWgJ/8czrUGEGKvO18AaPS
 ZPgaRmQRD/jalPsgAQF5E6miNE3G+ruiPn5TWn/DSwJjElL3Viy6F/lw8bwFwGaCavZ2
 hdrvbQG2y44PqspZIUQrn/RDbSXLE6fgYqppxtgs6jXiP6XugqoosJB1AitHs2glFQZh
 ApMePoSX9JSdNdxOTwKdh5fmCaaCdNYE6D1FAOb4XFs4vzHd91AuEBx2ELzrjMceKwh/
 YPGw==
X-Gm-Message-State: AOAM532g5MJLiA4LL8AHVvrwYVvNxigAf3QEdPxlltKAWFXWfwD/vntn
 sITq/uNm00SoGuueJRNH9b1JQQ==
X-Google-Smtp-Source: ABdhPJzAgFcoYRphwr3aqR6X1Tp+oamXyKRc6v+01AQAiGf9BXPfHC+QX9vREYdZsXB2DRzjJ8CjDA==
X-Received: by 2002:a17:90a:9204:b0:1b9:f22:e35e with SMTP id
 m4-20020a17090a920400b001b90f22e35emr5450350pjo.73.1645555071952; 
 Tue, 22 Feb 2022 10:37:51 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id z14sm19643877pfh.173.2022.02.22.10.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:37:51 -0800 (PST)
Message-ID: <0b5039b6-2dc3-c4f4-862d-f05a4ef7acf7@linaro.org>
Date: Tue, 22 Feb 2022 08:37:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 09/47] target/ppc: Move Vector Compare Equal/Not
 Equal/Greater Than to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-10-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-10-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 | 30 ----------
>   target/ppc/insn32.decode            | 24 ++++++++
>   target/ppc/int_helper.c             | 54 -----------------
>   target/ppc/translate/vmx-impl.c.inc | 89 ++++++++++++++++++++---------
>   target/ppc/translate/vmx-ops.c.inc  | 15 +----
>   5 files changed, 88 insertions(+), 124 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

