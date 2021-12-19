Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2C47A06C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 12:39:01 +0100 (CET)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myuWq-0000Vs-7e
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 06:39:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myuVr-0008Fg-07
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 06:37:59 -0500
Received: from [2a00:1450:4864:20::430] (port=41680
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myuVp-0001Fm-FH
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 06:37:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id a9so13955092wrr.8
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LijIURDpM7lsspSGGav7ctkSnuaBDEV2vikDcxetug0=;
 b=MAcCY0RqFem/boHA0rwe8QkpdE1Euj0JwUZG5xRFfFZHBwlWcDfw4VCPV/2HZ83iZc
 9nvXMfl5FOHgqhxXqIZggVLLfzS4WiGLUysAzM4kJFqFFtYRx2Sn5s1CesOm8tVBFfpW
 ZurFWRxcM7zROa/rxo4P6ayf0bD6goWuoqeXfO7ixt7HraSRLngge5qsu21T9NXxpvVo
 w+mX08yzduYHW2g5rbBSIB3cbMh9Z1iqKSYvPs8jpKwnbAzi0D7TNFmG33zarEdOr1rq
 i/meJMPPEC6E7gXk2DoXM5nN4vlXAkEw9g+Rr5a0JPuZvkY8r9lT9sTJC5+mOttiQM5J
 nGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LijIURDpM7lsspSGGav7ctkSnuaBDEV2vikDcxetug0=;
 b=Tl2/nRFxiiKuiZYeYuOBTup6Gtbsax9g5JASZQViHFSdrJrdKDnvpes22Si4WJvnDU
 BJRF/HMy2eo6/WKn2iqx3xT6LtyyK6GDFOBuKXgzpvOlYBJipJ8cjxA8n1LFKRuHpfUp
 DqLzACZZKhA2jafkSTDUle1Uli5HGdYMBiEc7cE0No859DEtrc5moB4EwJAvqS+yFGLB
 X/mFDKJzBlaeh+eGUUXKxH8wU5goZltDiA0sGzpZ+ci6dgg5tm4IGxVqpeowaXlwPwMp
 Yhg0hHCJ5Am1MESfhafnuS0/dsxRCsknrzJ55bVOiIu5qdXwky5TfYS0AbVEUBi1HhoS
 uZSA==
X-Gm-Message-State: AOAM531tpXGnmtHM+7bO2icQoefTEJMsGmUlD5WM8IaLNiJ4M21uHr1S
 NgeSc5yPm5pP2MHJSqB5vlw=
X-Google-Smtp-Source: ABdhPJz2mbKrsnkiYxM6AWTzrkBRMioXCs4yK5t+NZMo4RF3Ct4ZIXsaKCyocRKfn+I0rT2lYCPKbA==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr9582146wrv.115.1639913876320; 
 Sun, 19 Dec 2021 03:37:56 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j16sm4008157wms.12.2021.12.19.03.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 03:37:55 -0800 (PST)
Message-ID: <37175802-c8ae-01a4-1550-7bb15aab37a0@amsat.org>
Date: Sun, 19 Dec 2021 12:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/20] tcg/optimize: Fix folding of vector ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211218194250.247633-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
> Bitwise operations are easy to fold, because the operation is
> identical regardess of element size.  But add and sub need

Typo "regardless".

> extra element size info that is not currently propagated.
> 
> Fixes: 2f9f08ba43d
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

