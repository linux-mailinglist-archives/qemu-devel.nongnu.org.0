Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FB3CC816
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:43:05 +0200 (CEST)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51S3-0008L5-NN
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Qg-0007FX-D1
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:41:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51Qe-00073b-R8
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:41:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l7so17452079wrv.7
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lVA0GvlPlcE513Ye/zszlFVTPJxn4npOZZcnmqBdXRQ=;
 b=qYRcURr9E0KOS8SxBEGAn/NVt0CqAB+n9jJiuRKq3JZHeAbTbSsMkonI97vYVOHC1X
 RMEKIrrhnamVKk2p0k7KH/iPo1unxVBzjp4p1U8ETzOQHvj/NTRst02ccHHK8Gll5KK0
 TjEXELH/+U2+2QQ0PDHc2txCbEU0ZeGycSprAt11Z5ehZWc48nARoILFkUbWD8Cm0WEd
 XSMIbe9QhDb+/adhXZ1Heezjnlhaj9ENoM3IWznam/lAorGiIZPyq9NnZMQGDxUN1OAk
 O1E6OWB6FG4hj9i85zPWV3a+vo9pEtsC6L7nCAGTYbaKSRjU5rYk/VKpW3u9sYXJm0TP
 W62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lVA0GvlPlcE513Ye/zszlFVTPJxn4npOZZcnmqBdXRQ=;
 b=fFUUZlYx70mjKH1SBU9TxMRWKdARTZMKxaXoDOid90Cv8un4sAoiVa0RNPF44xsiJu
 WQcrf8dkEJuwdopgeYGZRnSMGMvxoRdr5ybCFas3mWb8fpuhw/n61YTjZVc+vxJViLvO
 bSDLQWYeE8C6sLa1Ih4n3kzZ56sSQnQIaXkP5QGQ2OZVje0T3gRJO75Pr0QlV0gyQYdE
 AJ50/qhcZwa/EsJReMV+tyVYw+lFqD8HeKTJOcPL1/hZvgzejpsKKNOXpCaebKEyYTNC
 eNyfguOfxnObOwh7bhDf9TljTN4NKhmCOpisYepzgkW0zxNgu6YCYWqxEn+KqXX1rlej
 4nlQ==
X-Gm-Message-State: AOAM53118yifbD2OxOCyeVm0SZp2xsrB5SoziHNzw3Ygc49KbiR7AO7T
 PkB6SJvShSE7LlOOopLS7jw=
X-Google-Smtp-Source: ABdhPJxDgQC0O8PeA+tmLU5djMmpa7+45NptBoo6lhW96m/doodsvTfmzZFPlXiP/xhNCVudZx/T3A==
X-Received: by 2002:adf:82f1:: with SMTP id 104mr23123525wrc.306.1626594095343; 
 Sun, 18 Jul 2021 00:41:35 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id f15sm15357638wmj.15.2021.07.18.00.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:41:34 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/10] linux-user: Fix coding style nits in qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8eca9806-d446-dcd0-f29a-57db714b0b2a@amsat.org>
Date: Sun, 18 Jul 2021 09:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:20 AM, Peter Maydell wrote:
> We're about to move a lot of the code in qemu.h out into different
> header files; fix the coding style nits first so that checkpatch
> is happy with the pure code-movement patches. This is mostly
> block-comment style but also a few whitespace issues.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I didn't clean the whole file; some parts I know I don't need
> to move (the user-access functions and macros) I left alone.
> ---
>  linux-user/qemu.h | 47 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

