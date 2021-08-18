Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DBE3F0D36
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:18:02 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSwj-0005Hi-NI
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSvv-0004d7-0t
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:17:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSvt-0004Un-QB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:17:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id q11so5606320wrr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e4OQABjXoAEU4wRin8trrN/kcww5m2RiAN7nqi5hEm0=;
 b=Bw4skPxQVnnkcb2RIdbOIASfFEa32zCy78FTxwxAWKwBoUmgh4oRZZy4v8gowQIk//
 ScvHjBnNyZDDsUsM+cZ53dH3PqJTlkvvzgpnJEH7VFweecBZa8OfsBeBekl9ALyT+Xgi
 OcG8+l+36eVPNPznjYnYHD2czqSUgpMwv0Fzeel8H1g7h7VmdXTUCmTATSVu5IUyL0N1
 oRyBH6/MdPimEo4gJgZSWN4Z26bMeckjjecRi/g4Y2m98++3KqEwe4jiwSJIr1lUTcbw
 G0V9Cmq4WBPmwJrGwCCwdn7pJSj7OLhDPkYbCk9M1+vaiCVrYP2AhlnfxTCDjgzFep41
 pc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4OQABjXoAEU4wRin8trrN/kcww5m2RiAN7nqi5hEm0=;
 b=T9eYJUlsAJuXSHFYJ/6qtdf0yfx2v3arMqCxVueQUYIZREN+wXXD44Gk6vndlf6TO/
 9t++NQjso11a5sMb9B38R8nK9gyJvWwo7rNZmq0SroUUBw3S/w9/nxytobkMv8DxFhKF
 H5mn0uaVPuZEYiteA/Amtn+7D9M9UYU1Xwe7yvfYYjL0lYEl8A7pViOad2Q1mSJLRtxx
 BDFydvihOMPiWqiJsYVFm5/htt1vgxFxBBrDNbyqxYVz99s6ubAZFiBIfJo9gqAMK+j3
 o2siGjhTXsqnKOqCDIItklR2jyzSXK5Y/fIWgh8POqBpu+CfqajUD7DppcaMPWlsEFZ4
 RlRg==
X-Gm-Message-State: AOAM531m0gJL4U4tCVKV1pUmWOpmaCh5Yau9Bhk4CXFg18d+s3CPw7hO
 uyLhIP6A4bShy+IrKPvuPbvbBYit/7A=
X-Google-Smtp-Source: ABdhPJxSr7dRASuM9EvkoIFUV0tC+CjpkqpB1i780XfKmdUtTU6+YWqSVsSP1CC3QWmvc2uSpLD8qg==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr12766383wro.69.1629321427877; 
 Wed, 18 Aug 2021 14:17:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s10sm1075456wrv.54.2021.08.18.14.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:17:07 -0700 (PDT)
Subject: Re: [PATCH v3 48/66] hw/core/cpu: Re-sort the non-pointers to the end
 of CPUClass
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7dca4884-94c7-260a-0ce3-9eb1d9e80142@amsat.org>
Date: Wed, 18 Aug 2021 23:17:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:19 PM, Richard Henderson wrote:
> Despite the comment, the members were not kept at the end.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

