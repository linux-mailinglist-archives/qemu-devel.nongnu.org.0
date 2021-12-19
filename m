Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5747A066
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 12:30:35 +0100 (CET)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myuOg-0006eP-Ir
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 06:30:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myuMR-0003tO-Ev
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 06:28:15 -0500
Received: from [2a00:1450:4864:20::436] (port=42668
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myuMP-0007se-3D
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 06:28:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so13935121wrd.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gpJtYU0aT6i+mdS63y/urABrDafxHWTnGZXwPTXJEA=;
 b=iWMbp0WWFksYQfO03eN7mqK9YuP3VbpCeT4uRK626do8U/zye8JCGP+5sJ52y7L1Uz
 7b9duAcMjJbFMN+b0S8RZy5TrqzLtgfcraRXFRyDyVQFFQ2+4Fv7BL4dXK9WpDo3RW56
 IfKi/AOFxQH0P1o/Z0bNrOGZH2sc/riSfMNtpjTMpBhNqKAL6zcPbO+qcmF4FLcwBJg7
 pUElm/IArfL0OzjsssOYzVWkMF0EsJLqmKM+C1Hmnv9PFDQuH6F6eEXrc5XZzH5oV8nL
 DOezy56X8ixX2IY8o1kYl+Jnf84X2LOJBGyo9eFs+H+UKgh+4alYhtV1qm7hz8/kPB/6
 DyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gpJtYU0aT6i+mdS63y/urABrDafxHWTnGZXwPTXJEA=;
 b=KskNeamKdIFq9GuWrW7wffREtZsDRec9uOATXOCGH1VRt0ACYiTot99sCZNI7/5wy2
 HROCoccT87CvOhxLw2jM7scNb2o7SjtKKa2cSk2Ln+Hl/LAUPgLceSzklUV/jjFE/LVl
 aQiL3Zm4cCza/c+n70WE+cb8CHGsDw6A3kDSlUuNG7df9Bmj4XQRpgOdHLxRhJPy1ApZ
 zkxmRsRpVqfxIw5gplm2x3f24dW53GfwcJ7GfMD2nI2cQsXske+NILAuvw03IGraArh8
 jz2x0oK5vl0sw2z+RaaJX/rqzdiS0UDaewqAoMU022+0v1TvLiTYVKJVyqpoaO3vQ6h6
 LaLA==
X-Gm-Message-State: AOAM531t9PRk26Z8+djOxr5e6xNdt5ujPACDl1STqueiLbSroUPeKnT0
 vADa6VfryD6cFFzZuwHFMUmeSCaoEtQ=
X-Google-Smtp-Source: ABdhPJzc3Rm5nF3NogTJW4ck1zYPp/IIpJK32xP2lcs6SBcLkdeNXNT5XL5cT0kFSZT9bWTEMsRvaA==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr9240543wrc.24.1639913290879;
 Sun, 19 Dec 2021 03:28:10 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 4sm18558555wrz.90.2021.12.19.03.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 03:28:10 -0800 (PST)
Message-ID: <932b4834-9b3d-180a-3e92-64ae26e8c40f@amsat.org>
Date: Sun, 19 Dec 2021 12:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/20] tcg: Add opcodes for vector nand, nor, eqv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211218194250.247633-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 20:42, Richard Henderson wrote:
> We've had placeholders for these opcodes for a while,
> and should have support on ppc, s390x and avx512 hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h    |  3 +++
>  include/tcg/tcg.h        |  3 +++
>  tcg/aarch64/tcg-target.h |  3 +++
>  tcg/arm/tcg-target.h     |  3 +++
>  tcg/i386/tcg-target.h    |  3 +++
>  tcg/ppc/tcg-target.h     |  3 +++
>  tcg/s390x/tcg-target.h   |  3 +++
>  tcg/optimize.c           | 12 ++++++------
>  tcg/tcg-op-vec.c         | 27 ++++++++++++++++++---------
>  tcg/tcg.c                |  6 ++++++
>  10 files changed, 51 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

