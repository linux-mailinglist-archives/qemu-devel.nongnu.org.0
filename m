Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EFF4B1D58
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:30:32 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINZn-0004nq-1R
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:30:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINXo-0003la-97
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:28:28 -0500
Received: from [2607:f8b0:4864:20::102d] (port=41567
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINXk-0003ew-Uz
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:28:27 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso7732451pjg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GvlNyW6XVOxKmcfme2gpIyfcnCK9Ht+UAWf5CsvWlQo=;
 b=pCjFNTrU1Cnm6H8EwlTU1zTEo8aCGwrRKWeMH9TPZcHyX3Y4T2EoVdYjwn7Dd0MISy
 9DdzTVEcJABj5AJyavaGgchExMBq0AkRTcFZV/FYvS1jGafV8QKYgF7pGCoqPg5ypHWB
 qhg2yiw1uq43280qHNVSnB7fJyHlt4ygEclrZt/LOOMDFs1EHqX/i3/eQUiOVz2Mu/3A
 h2fpS+9fBgdgUzdjw4Ru3uZCs6mxQGuNZNlin5vSU9kCD+BJdukSV20en08TDSXSDZ/T
 XoJVITVZa2coIRcvOEYLrz/7LiwhsRUE2wmSOO5DeTCOWy08eEQWG4JEOQe4mm55OC+c
 ZqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GvlNyW6XVOxKmcfme2gpIyfcnCK9Ht+UAWf5CsvWlQo=;
 b=uvUknbgxmyXvO02rgu9lMa/72azituGEc4lAbkBeTQDiyo9F6QAVA07Vs3Rel+6CDb
 QtzKhpr1exkzSre1HRkWuItSMYs4IoQ0K2gb4SZjIIaIUit7tCJkAsdB7Xx9UDisaipD
 y3xmXaRUstmBePa/jOWLdISe4GZTR+37LQd3WXPhV8WHfmK5uMfPtewXjX2McoZyk0fu
 J1lxZDDRl/9HBPSapmccPGWaH5/VlZizWgnGW0t49zZAod2677QT48GpzhrDWZufUGDJ
 I2gHw2cJ3DExPhNnJLfabKIc5p1dZd4C7l4LWWQ8M/IwmnfT8IT51fdOS7PM9+lFPr8J
 Rqrg==
X-Gm-Message-State: AOAM530cOEttj6+HsPdWIQORdFbQ9y/HtU2cAUsfhUsJUre0ILBWWhhB
 eIM/fmzwcB09Il2NRKGQ1I8sWw==
X-Google-Smtp-Source: ABdhPJxyxkJ0WiS5Cx5Hm3hdrg7cNQCVgnZuGzBMjm41N9gJ/xGZ/KwIyYrWM/GGK2sKPRpWtQsKPg==
X-Received: by 2002:a17:90a:e557:: with SMTP id
 ei23mr795171pjb.149.1644553703332; 
 Thu, 10 Feb 2022 20:28:23 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id mn7sm3774392pjb.8.2022.02.10.20.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 20:28:22 -0800 (PST)
Message-ID: <f267a89f-c679-84a6-a083-bc3de910ea1e@linaro.org>
Date: Fri, 11 Feb 2022 15:15:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 08/37] target/ppc: Implement vextsd2q
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-9-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-9-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, groug@kaod.org,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Lucas Coutinho<lucas.coutinho@eldorado.org.br>
> 
> Signed-off-by: Lucas Coutinho<lucas.coutinho@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 18 ++++++++++++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

