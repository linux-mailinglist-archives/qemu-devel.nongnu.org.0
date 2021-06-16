Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB853AA1EF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:59:46 +0200 (CEST)
Received: from localhost ([::1]:44546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYtF-0008UH-QR
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYoI-0003LD-R0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:54:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYoH-0006A1-DO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:54:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m18so3471194wrv.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0OzBnk9flNtBu1mTTIUr1S/HpHElbaghBu5NTRxEyU=;
 b=YY42ffDktbpGtf9AVupWVwOVdjR2UKz9s5jxup/bS9PXzDN7X/0fZRSQtTqltkuUYQ
 bo9oTUU7wWQUNwGE2cKHO4oz4kTzafak7YUF1KwLISFpsoU7Acsk3VIfRtE8KVDSm2Fe
 +NDG7jIOYtodhfenaxPyuFai3mn5r2xfcJKyQRRx0Wj2JCIkZCygf/e+3C6BqJYUy7wV
 yuCkekEvW1lSsHrNpt7hEEFEJjfem13j5hrHZ0cYXZ5j+CURwQNek9QYb44sR3EKe7rB
 kIRzux7Aso3TWGrUbYB0hNO3f8tEMRRU4DIT0r4EceIvIbWmMVmo+yoviGDe6oyAR4B6
 0+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0OzBnk9flNtBu1mTTIUr1S/HpHElbaghBu5NTRxEyU=;
 b=SwDYK82cp9+qcO1Ci6zz+BpESBWjIJ6VN7GrXhuIwp4JjH6NNLTs9medaorbAL1l9A
 uOBb4lR3g//Krv+v/YVVDnRTJljmqju4tluWu/LCDv3zoGx922ymdYCHWB+bL1+AVWm6
 Vbjx2mm7HJ4vWuAtmdXvFm7humwLCtNNNjVDKOJ60CknMY6Cw/BnJAuQTxncfuIL/N0O
 2j9ySJfo5sYnvZ5TSXnzUCiZwk2boElA3FP1Q/95a5MCDAiOTlGIBia1jipa/AqO5cAo
 kmHZ15032eqHgMIfGqnnpkS27t5jzOMRftg1Ruzc1ocdBlRo85djAoHi2hlncyKByB4M
 NrQg==
X-Gm-Message-State: AOAM5336LwaX9KERn5CBpVH3cWoh/nPEx1uWBNhRvblmH4hpJ4weJReI
 4Qj+0j5t0eVyOETWZQlcHOY=
X-Google-Smtp-Source: ABdhPJyOrNqCEQ9B9bO/qBWCoRLGjA3+vgFfL8bMuY8h1J1KBFfD5fPplA4izcl5NLo0KxZaNvKzHQ==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr409949wrf.351.1623862475458; 
 Wed, 16 Jun 2021 09:54:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x14sm2000127wrq.78.2021.06.16.09.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:54:34 -0700 (PDT)
Subject: Re: [PATCH 21/21] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a133c81c-6558-8406-c7c9-2e882d0b65af@amsat.org>
Date: Wed, 16 Jun 2021 18:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:12 AM, Richard Henderson wrote:
> All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

