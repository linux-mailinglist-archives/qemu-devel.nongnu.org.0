Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C5571171
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:28:16 +0200 (CEST)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7VQ-0006ik-45
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7S8-0002ua-FK
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:24:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7S6-00050m-Qj
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:24:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id s21so6552951pjq.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DyY3n/L8tMhSBaqugZwyiKCax9/3aJi8Jbva5ddSJgk=;
 b=peLf+KCIgshxYiAxY4MmBMER4r/RcbZTKy/U3LN+zYtSooUrdh32Fx2v88gtGj8Ert
 +wwVgGKOKwjh11CSFxLk74Z1YBfnmx6wxPCkaxhyOMzB/Ea+0aPIHkjMfdYwvMJnLPZN
 goZWWRAIoRkaYnF466UbhOzbq2OweU9aVXQ4MRT2JHqD9Ku2XZWKQUGp4PKyZZziOTml
 d4S1xJLzEHZGGDQMmrUI8MLFAGJt+DbpEGz12aAqv9Vp2KlQFN3/Le4xMZKq5co1XIII
 12fr1vSjvm3Rk/6SkzzZukV9FAMmRq9rs9b3D9/mLlIjRLJg3ErrH3vWF2m+LCfTAkyI
 uHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DyY3n/L8tMhSBaqugZwyiKCax9/3aJi8Jbva5ddSJgk=;
 b=wHeRIOePD+lHMs7PIcWQeg9XeO5T4Jptgh/GdOoOLND1zUZOcDYSHdjYfo2hDR5vMh
 VzMghDCPzRiSWvqUWH5LH1pA6aCPado74g3DoQ1f4yKeHz1NpylY8mlSGD7z9SFnJbjX
 Z2YoKDNLty2UXOAlfvgmJWIsTYgQLnO7n0d4FZ+81TgEITkjo73XncQvjEmj+CDy4btp
 nVCa7PPmzlG8uTOd46XEyH33Eib8TOP1AJkCGBDMMChv4UfdXAYeJeJjgpWW4eqGV7ml
 xaDYxXkX3d709ZaM75fR7xbcNmtdzISS7tW+C+pIadN7UkbBSP9OjpWR6631msvdayB+
 By+Q==
X-Gm-Message-State: AJIora+cJdIA4kOoT78BppZ4Bd7Zr1luHzpbK+RdsDK0Br27e/P/NwE8
 OOOTz5vjDd67DJ+BV3ldXP3skw==
X-Google-Smtp-Source: AGRyM1vqBIdPLKs8n0WYZCU91Lxa2Y3KUYVK8YPQpXn+ZxLLOQDDDzXI5Sm+No2NmxfR6clsAxQAHA==
X-Received: by 2002:a17:90b:38cd:b0:1ef:b4c2:3624 with SMTP id
 nn13-20020a17090b38cd00b001efb4c23624mr2097828pjb.168.1657599889468; 
 Mon, 11 Jul 2022 21:24:49 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79e48000000b0051bc5f4df1csm5649105pfq.154.2022.07.11.21.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:24:48 -0700 (PDT)
Message-ID: <5a0d3d96-1171-8c6c-0074-d5534568f26e@linaro.org>
Date: Tue, 12 Jul 2022 09:54:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] target/s390x: fix NaN propagation rules
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712015717.3602602-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 07:27, Ilya Leoshkevich wrote:
> s390x has the same NaN propagation rules as ARM, and not as x86.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   fpu/softfloat-specialize.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Yes, I think no one has those x86 rules, including x86.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

