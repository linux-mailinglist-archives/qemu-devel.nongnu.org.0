Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74B33A873
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:08:36 +0100 (CET)
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYuZ-00007z-8m
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYqf-0005m8-1B
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:04:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYqd-0006rG-3w
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:04:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b9so4763149wrt.8
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 15:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r9QH/4Go8VsgzrLck603SSiKrqn8pn/w4jJznJplZRY=;
 b=MDmDBuOlypY0uBjNm0BVfmxCVox3i+KLozQXPdAUq4XUP/XfOwYUKuUqENUde0v9wX
 HlwOKsns+nbW5s8DvKZ1SDLcMClJ5qha0gpbZMpR8NkWmeoN5aFPEgAPP7MgQPDDSS2V
 kaID2cLLbDqVDRNI37MDdnEjEBVXgrW6mlug57oHLTF242KjTJJ58AJUL1KMhF/gRH6g
 1o+X9OUp8ymYmhidK0g4d0LezlgLhiZSY1VEsrIIMS2tLfxFyYs1reRni/bOl8/s+peE
 BrfvelGF1qcTIGJRLtPkdmSGctWLbr+uCsM3ueFj5ZSCmBixi+OZlFrzfKrR3SbPyaXg
 Q55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r9QH/4Go8VsgzrLck603SSiKrqn8pn/w4jJznJplZRY=;
 b=N45gyiTDwRYW3AuZtt17i390pjTxSwH89YX+C2ORy8yBSdsvBmFi8LuLsBtU/HNVmn
 0bqqL6FjHl5fmdayFSdbnuZHfEQxd9kjGvxIRlH7GVmk3D0GernVdgYFBTHuLQRKtmic
 vpYNFM7sFvtIPiQ7bu6erBbF8xc6xj6Em+KwtRscC5zYbzOzlyUk1HQXBhMzgWbpoayT
 WqfgnB8PUtzSNrYeeK13tSB/4YTurhRcSsVMa39yAsAIh7dgOR60dPJmQk4Hj4gejz4i
 QPlHfXYuHedu5E6juhhOPgf4M9DtQclBHG9SxEd2Lthadldvg3aUv2tzCfmm23f/O35Z
 B6lQ==
X-Gm-Message-State: AOAM5329vHmM+wdZLBnYaw9a12HFppYPYu1eQonBaoW+xmqs3Tf+DHpI
 szU4PkyZveCK1usaIB8NP5g=
X-Google-Smtp-Source: ABdhPJzkYr6gCuTMkIM2OPwUfDPgy/rQ837RtRjHgPtQSiEv7/xQ6EQDDP2tcpeIqdtYOXIEbZdfxg==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr24545732wrr.12.1615759469390; 
 Sun, 14 Mar 2021 15:04:29 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j203sm10984565wmj.40.2021.03.14.15.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 15:04:28 -0700 (PDT)
Subject: Re: [PATCH v2 22/29] tcg: Return the map protection from
 alloc_code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
 <20210314212724.1917075-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <511aa738-9396-aac3-f377-e610e11446ee@amsat.org>
Date: Sun, 14 Mar 2021 23:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314212724.1917075-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:27 PM, Richard Henderson wrote:
> Change the interface from a boolean error indication to a
> negative error vs a non-negative protection.  For the moment
> this is only interface change, not making use of the new data.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 63 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

