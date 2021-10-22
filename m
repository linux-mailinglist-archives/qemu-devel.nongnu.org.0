Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784D4378F0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:19:10 +0200 (CEST)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvO1-0005sD-4z
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv2M-0007JB-Gy
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:56:47 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv2K-0007xr-Uo
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:56:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id o24so3039668wms.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t++ln0h1ch2ZeuDJSKtMFdkJ42jA4ZG9tLbvgxLD5r4=;
 b=C2YOZcZxT2u1bYK6/7K1tiG7kn5t8mmGHMeeIV0fntRnRMJWjYchLVYwyU6rJGtRTF
 8DmBq9ln8pE8S/fRNuBCmCVGS1AF5lQXAL6r2vKcoIRTJDP0L3LEndZxs8RO4Qr2r/pm
 bqF65ItSFVNg/NrGkO+BqVAMoer4oQkDo19Gd63oOlBV08PSBaAqUfQFx3FFagkx9QBZ
 d03JEMgX1LivQLzhayN4aRVteiiKfOvUCyfM+hr4hktTWSTC2URziq64wWzezulaGiK0
 z2kovVL4rAEazom8eObix6LOs2gbKaSt7MoXiIOcn9myOljXUvNsZaKISii0DtxJE6w6
 7XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t++ln0h1ch2ZeuDJSKtMFdkJ42jA4ZG9tLbvgxLD5r4=;
 b=Cj9VGnPyiJgYdyUeaEfN7Qv/vV+8G+7SnwLJe7oJHNyt1W7fH8jswrw9jC1IoMEs4G
 Rmz/kDdttLap7nxeWWlYQxUp+/cWfK5vcZdVd/u13SLuk/YiON9lUAC+PXWs/qOjf+Vu
 hvhkyk/pXepL7UFm180LRZO26YfEodyS8A+FJTp/rFkTIK3nBJ7LGgGWxeeFyfxGJDo9
 r58jiYzn/uiFD0m4EUnrq00/8PXTHtxWH+ZIXCS1Ok6/d5IHjrNVl0Rf7PLgdcag2uAG
 gspa9M5w2ECzktOe8Wl10PylTdNmddRVHXiHXVoBMCD7C9o+5IvSLaGj8ahUV4i7dkDw
 blEg==
X-Gm-Message-State: AOAM532aWIgRDe6GCJ74912lrodHmvG/UpsDCDMIXH5CcYq3GG08BMd6
 AuHtlmnEftBXzRsgZR5se1U=
X-Google-Smtp-Source: ABdhPJxmkjnhe4locPkNP64OZP/2dII4GxNst6twA6GytWgRE5EbtAtklsI+zOdsIgTO+7tb6LFTrA==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr33835wmc.108.1634911002305;
 Fri, 22 Oct 2021 06:56:42 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id q188sm4793568wma.1.2021.10.22.06.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 06:56:41 -0700 (PDT)
Message-ID: <b0b9e7be-5328-6d05-6070-3ce16883c866@amsat.org>
Date: Fri, 22 Oct 2021 15:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 14/48] tcg/optimize: Split out fold_mb,
 fold_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
> This puts the separate mb optimization into the same framework
> as the others.  While fold_qemu_{ld,st} are currently identical,
> that won't last as more code gets moved.
> 
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 89 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 51 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

