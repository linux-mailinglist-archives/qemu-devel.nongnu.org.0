Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6654378E4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:17:08 +0200 (CEST)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvM3-0002wf-O9
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv5j-0005Tt-3s
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:00:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv5f-0000xF-6t
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:00:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r7so2418961wrc.10
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EjdYBxf9t6Q5CD5Kp4EeJZGiGH1oLIfBdJcTaq2LJXA=;
 b=HajiW+PU6FTv+P8R0sf7VFjfNph+niWt1vOX5KNxxW4eUt8iSayJPgRplGmCQ0ve/v
 oIl/7rjhZpl1KzXwwRkThYhX7rLzuMjikjQNvIuz2RcJcuZIItKBCzMxXhfPqCoEbHpp
 3ajCBgsHYiezD0uTfPPznh67Kp7Ve2fvHtsF6MBeZ2qzH75qTm5JMfC4iFVoa7z/pb48
 ZbXzK9oCcCNvCS03Kgxx/V2n+McY5+sujX2z457GUNptSVFbwgZRGDdBV5V+/MvE8tuo
 aY82oTyBdSt8N3B+IRn+yifJBIjt3c86TBNGcG2GP0vtywxTQFWfZlH8ABFePXB2stVz
 eOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EjdYBxf9t6Q5CD5Kp4EeJZGiGH1oLIfBdJcTaq2LJXA=;
 b=HbzX68JtYxXtgt+3D9JmjHKSsB+lveRfW7jMhA/b2E052aUApG51QF702BSg9ebCAa
 zbHkfFPjzAwbcnk5W0UaadRryuHNaYck71yZL7sOXznJxEj1SqXq2d0GsHIFhK2feXPd
 TFF4yAGr9MALrBweilecYdPSNCMjYmAO3adWr+oq460EekGoor5om3DN2K3o6TqmqlUW
 dQJ7iOtlv3P04af092xzbQXq6OIycBluyA/MkrKgAcLvwkaWUjrUzjP1x0FjY//PQ7g7
 5Hw2QXCveOCu6QRH9O5LLOtuOuemw6W44C9QAK0ryFtYK1vVbIGMmG6rODVjgQJRDB5w
 V23w==
X-Gm-Message-State: AOAM532WpEN1dc9aUHE13hIp2UWEWQxSLtJV43q709L8ydawFMh4PYJ+
 Nc4/7Ok6xSXtVaRz48B2Aqw=
X-Google-Smtp-Source: ABdhPJyw4EK/PB1HZdMONhGN011VR4awU5rVTWPeP6CudxoaZHwSfcfPVgC9whlj6WlsMDHEyTuhvA==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr83707wrp.100.1634911209905;
 Fri, 22 Oct 2021 07:00:09 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l20sm12719036wmq.42.2021.10.22.07.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:00:06 -0700 (PDT)
Message-ID: <8a0b543e-592f-f22c-28a8-432fe3da744e@amsat.org>
Date: Fri, 22 Oct 2021 16:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 20/48] tcg/optimize: Split out fold_mulu2_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

