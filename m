Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCC43BA6F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:12:04 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRrf-000551-PF
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfRql-0004Of-7d
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:11:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfRqi-0001rF-Di
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:11:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id d13so727wrf.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bvYB2KZzWc0X7Wfe8VNgfi6fm8RD8a1if4tX2K/MsUA=;
 b=eNMLQ5e8aWrztNtqLbc1CRDB9VolfACwmJ8XEn5G5h1YinbNHXbZAA7i4u4HSaxIrZ
 u+HsIeZJxsSo+dqDSpR1rA56K1LnzFVQv+p6K5ynsW7GYd1S9rmUAdCRNwjR9f4Nk8dd
 cXouGQD6v9n6tbQdJ8pESaTRN2Q1lSP/xFsZ27jhnby08HuMm/m4w27w4sPNJCpitDXx
 Lf/73k+/kG2i/j4qYAC//xbIPPv/hGAO2G7uoMasKzOBBQmOpA4bKLTK4lYss+m0TKEy
 HG36JzDU0qoQdKI+WfsqSlCdonkct+DATif25vTZ8B7VE1t9nzIOkTZONDYKGLL8E6c+
 D5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bvYB2KZzWc0X7Wfe8VNgfi6fm8RD8a1if4tX2K/MsUA=;
 b=kRSmY38IcmRcRXJqlm/hcS2nnX/qJ4IrClw2dK1rTL3Xlk1e8Wa8GMz3mvGlSSEq8n
 C8kdJ/B85/rcnXeGa8uZ2/Twjaj3hIOpNv8mDZarHteROmC76aBPxTqNGV/9Cw9dRBmQ
 fKdEscRUmrB54RpQv0wmjO2FbTr3fz2Fd6kkFbFtJwLnkCuv8lNc0NJZDd+2LFRFLdjT
 YaRzceCb+ttbGGdEErfetd6GfMryYuTeY+3mkmCZFUTt8p2qnKJhuQLgzYtzic4CsfN+
 yiJ3EOof7frytL/JIjDDnN3EOEcyTNLvYmIrvZ1gSTAabrFH2OTQvUiX/yVYYXVn1IXz
 HrQg==
X-Gm-Message-State: AOAM532yqrGwsYCOcfz0cSuObmx1+MffJHNicGHa6Zh3v1Yy+uFBOIwg
 IlqoLDzBgQnTNKzWAsNqdCU=
X-Google-Smtp-Source: ABdhPJzhPMwEIys6tSkBihClTIaO2a8R4+fit/fqMHkXraQlJnGM/FmDn0m0QBDEaEqMVWf0M5VarA==
X-Received: by 2002:adf:f902:: with SMTP id b2mr34681128wrr.265.1635275462908; 
 Tue, 26 Oct 2021 12:11:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x6sm2063470wro.63.2021.10.26.12.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:11:02 -0700 (PDT)
Message-ID: <b8538023-d9fc-4409-3552-05f2bf0e71e9@amsat.org>
Date: Tue, 26 Oct 2021 21:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 37/48] tcg/optimize: Split out fold_ix_to_i
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Pull the "op r, 0, b => movi r, 0" optimization into a function,
> and use it in fold_shift.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

