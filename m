Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD14C0A15
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 04:15:57 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMi8B-0002yx-UM
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 22:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi6h-000267-2T
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:14:23 -0500
Received: from [2607:f8b0:4864:20::430] (port=44892
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi6f-0005F1-91
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:14:22 -0500
Received: by mail-pf1-x430.google.com with SMTP id w2so1828751pfu.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/f7vVSQM82ld3kkuO1EKRZabH3hQa2rmljxPrDEhUfA=;
 b=FQAzn/Q6W+28cMRbGk3fCPvV6DxeuOxBcq/lbNuo8S8COIFFj/KtavH+HoJnIOfUVQ
 DfRrlE/bN0pYGwrQmtcmQpJZjIRgFnTcwcBRsXfpmfz+LMd06TUtb53Wsqc1Uzl99P8C
 8P9+57covLMS/6fHsYyOUs0SqYFbfOo7LWWNqz8awksXhsP9Icvq9g9LxsOoVXHQVVCx
 8rXgWi3gPOMcMGgX95jGkLticHygKkx/NCPHBHhB+UO1zCXT9wAOk6Mm2E0khffvrurV
 XAZg2B7dbUy6c8qu+1iY8wFR0y1ABDpZz9dL/2fEEIU7/uYJsI3AbPGHxKFnlkysiScU
 CR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/f7vVSQM82ld3kkuO1EKRZabH3hQa2rmljxPrDEhUfA=;
 b=nJDkA5rViDIxpMcyfSWmP4aaN+KDC5LQG6JlMjXbowtB9iiIaqipWb+/84LxeJ1df+
 GGAm1cp+ddwk1hsJTI5Q5/tnM5feG+IiyJswhcU4+BmI5NezMSuCc+4AV8wYEaBRg5Pr
 PIuFanm2TlHS9pfvK5mXAr7A2L0IIQSN6VIL9WoKnDAr0uSehyyuygZf9iMc0NSpkGsM
 gR7FgB8g3ZKU4PaDO6CeBDkbqz//xiK1SG/Hs7YfdEDBlYuD0zTR0w0yxoZoBgUOIMqk
 5d8rb8KGwuYAow9C65Xci9OYNsTOOi2e08h0wOhg+prB9Be5WnIPIm3O9bNv9Yji37eV
 jQzA==
X-Gm-Message-State: AOAM533URAtvLjlcnIgmYjK2TDQadXMTxEeaCy0pUAi67d9QYgQcSmMY
 8wn5/QgQUmY8UmyCQre6mBSrIg==
X-Google-Smtp-Source: ABdhPJxB22UZkBRV8qeESCJ7KITxJmoprBAYuHP+lU6OLp1fVWtvkBuvWjcTmw6IARTC0v1aeI0tPA==
X-Received: by 2002:a63:5845:0:b0:373:b73f:36cc with SMTP id
 i5-20020a635845000000b00373b73f36ccmr20929987pgm.317.1645586059683; 
 Tue, 22 Feb 2022 19:14:19 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id r185sm8468605pfc.208.2022.02.22.19.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 19:14:19 -0800 (PST)
Message-ID: <d430114b-c8b7-a9fd-3390-9af4cc48fc6c@linaro.org>
Date: Tue, 22 Feb 2022 17:14:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 45/47] target/ppc: implement plxsd/pstxsd
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-46-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-46-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Leandro Lupori<leandro.lupori@eldorado.org.br>
> 
> Implement instructions plxsd/pstxsd and port lxsd/stxsd to decode
> tree.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/insn64.decode            | 10 ++++++
>   target/ppc/translate.c              | 14 ++------
>   target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++++++++--
>   4 files changed, 67 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

