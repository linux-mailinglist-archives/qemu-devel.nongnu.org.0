Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCF41C62E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVa6C-0004Jv-0E
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVZtX-00037e-TG
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:45:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVZtV-0006tj-Ri
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:45:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so5318811wmb.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wo/PgGAFEtMFn89yOPPQjd2gsYZAZ9ruUPI7sHwaYiU=;
 b=EsttBjPO+4Q2VcHpULWn/2WB9cPmFH1ImOUvJHe8C9+GTnG9rXhZ7Gn/r+ToruPUdl
 CI9y6go/8hVClFFakOdZFjLB81jh1qe4UI4klC3O5XlknAO8xqKSNL7EeSWR6cirB2Gn
 j43EE8rADsDdpszIXdGEvBfvOKP1P8SRdtEu4Q92JuAfq1SVFg7J2qdMh/6TC+DVf9Fi
 I/mjdLNM75MRDB/pb8CHIpQWnHAb58kLklxyL6678LcAoNBgOkM8d+78b7CsDcVOpRCk
 2AHI8PM7QmfHPIlfgzvGgONhT6jWYL3p4XB6KFG5mPYTFKI36wwTq41t32GPlbc5a9X5
 qPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wo/PgGAFEtMFn89yOPPQjd2gsYZAZ9ruUPI7sHwaYiU=;
 b=AMkiyg/HfeciRRaIyEIuDYPtZfS3wExuZ4AuXK3GV+hZT8Xl0kjhmrST8R/36AYb0X
 mCox1E5AKWTeq7r98cUW2bQ2v0oyISrBY7PWc3Vz3aJ8wNRIbe6cws/eUb476/osGijB
 dAdIVCfL8hW09nZ8HC5iIyymyWKtwiZl86jZVDf5UzHFfRITB9pxkNAYU9jkX79VdDwN
 9awxg26FAqIsdSVUQ6J4Cbp3jBmQmcEgR56Lgn+H9h+0rBP2QTwpEjYUW3N7Kh6TimuD
 dAIB4yRPoV0q3WAL4izxca18dL5nP7KwAhle1wBP+AC+zUdheuqJHrxTUlG4gZFTAv9B
 y6nQ==
X-Gm-Message-State: AOAM531HJkeN3I6rx6v0xpGJpIS2mGgqD4P6sYeqkR7tnPObytkf37Rb
 XxI79AKJxAZ6A4kOjTHAmD4=
X-Google-Smtp-Source: ABdhPJyiQC9/UcjtTF3HQzH84WSk377OqIzHt+BFChFxUpcM6lnnUH73jGa3X7uH9tZ/fNovFp1qGQ==
X-Received: by 2002:a1c:98d1:: with SMTP id a200mr5658529wme.86.1632923107378; 
 Wed, 29 Sep 2021 06:45:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f19sm1747749wmf.11.2021.09.29.06.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 06:45:06 -0700 (PDT)
Message-ID: <ed62f0a9-1c80-11f8-3e3d-2781d1bb47a6@amsat.org>
Date: Wed, 29 Sep 2021 15:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 26/26] tests/tcg/multiarch: Re-enable signals test for
 most guests
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210929130553.121567-1-richard.henderson@linaro.org>
 <20210929130553.121567-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210929130553.121567-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 15:05, Richard Henderson wrote:
> With signal trampolines safely off the stack for all
> guests besides hppa, we can re-enable this test.
> 
> It does show up a problem with sh4 (unrelated?),
> so leave that test disabled for now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/hppa/Makefile.target      | 7 +++++++
>  tests/tcg/i386/Makefile.target      | 3 ---
>  tests/tcg/multiarch/Makefile.target | 8 --------
>  tests/tcg/sh4/Makefile.target       | 7 +++++++
>  4 files changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

