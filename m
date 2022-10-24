Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A235360BE42
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:12:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6bp-0003SF-OJ; Mon, 24 Oct 2022 19:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6bg-0000r6-QE
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:11:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6be-0006Yl-KG
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:11:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id b5so9931348pgb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UCd6H85wtTfP8eTwhGiLooWahNEXBPUV9UqtXQAC4Nc=;
 b=aYbGQmsX0VUBtV/a77ufRKDLsMIO8Rf2yLM/Ig1UzWvO7YKHfdjxpu4Ntr8XZKtPxK
 xjRyIcV3odUr5IVjw8z4X0F2QsDrgrUDhKzUFh/vHGZOXWr9tY47r/dRpk3sQPR/dTZM
 R6JD7SGU8v/2LesNH0/InuNdHuTNUvYfwpoJcWZlppUIPTSzMkbgrVBXjU+9R70K2Irn
 7+NubHfGBlHKMOBYQ98wIJPZKyEN3MdudDW/aLAYumHuxoHdTPFRxVQoUiolk6H+nhLf
 08e7ofYwRglgBka1I1cjHzm1auFU6apYq/sDV2QC9j+G7+rFULXArbSclk6JNCDuvPRS
 3rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UCd6H85wtTfP8eTwhGiLooWahNEXBPUV9UqtXQAC4Nc=;
 b=kYpBRQ7kLc7Pe4OIzBos0R2yZzQhsDczgybNIqyc6JSiALjhuHfcM2LHnFg/1GDv6x
 goGNm4UYxKkYSOruf+XUEe1BFdDfspkvr2pKgWzj7g/Zl7ryYm8nsBBCerdtGVVjgb4Y
 imROqWheimU9eLdE0mDN1jdxrqv3u9/v5OM8pTAqC3oGeLBqe7jYZZXukVUzZtbXWSxG
 dOK3UdriZ3qmjE9NjYnwgNDCPPrKD7CH6qQqDHi5AmxwXWsh93jDdfN/dvJ+MMEeiGL2
 IxxwnHCwomw1FF1b5tXKX+Gof0fLbEb2mR/yW9zvkIsT13gfK3addfnNhXqW73bTxOki
 Gg7Q==
X-Gm-Message-State: ACrzQf3TCX03JCAUuVSfmJ4clj3Gr07PO2pO9cAo7xLid+Vs3cDZiuX/
 vaXvKPA82RuuTN85NjnKYdwuEQ==
X-Google-Smtp-Source: AMsMyM6rUKd5MR8upttG3b8wOj+2R/h8Udt274lKUG2hsemQHFr+50Xw3L+47JcJYq//6fGapADFfA==
X-Received: by 2002:a05:6a00:1947:b0:565:c337:c53b with SMTP id
 s7-20020a056a00194700b00565c337c53bmr36214354pfk.10.1666653100758; 
 Mon, 24 Oct 2022 16:11:40 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 194-20020a6219cb000000b005625d5ae760sm314169pfz.11.2022.10.24.16.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:11:40 -0700 (PDT)
Message-ID: <e41470f7-ed1c-0df1-0bdf-7cea162f039d@linaro.org>
Date: Tue, 25 Oct 2022 09:11:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 01/11] chardev/baum: Replace magic values by X_MAX /
 Y_MAX definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Replace '84' magic value by the X_MAX definition, and '1' by Y_MAX.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Samuel Thibault<samuel.thibault@ens-lyon.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   chardev/baum.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

